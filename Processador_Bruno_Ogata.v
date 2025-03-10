module Processador_Bruno_Ogata
(
input Clock,
input [15:0] Entrada_lida,
input Confirma_Entrada,
input Reset,
/*output [31:0] PC,
output [31:0] Instrucao,
output [31:0] Rs,
output [31:0] Rt,
output [31:0] Rd,
output [31:0] ALU_resultado,
output [31:0] Dado_Da_Memoria,
output [31:0] Read_Data,
output [31:0] Imprimir_Saida,
output [31:0] novo_escrever_dados,
output Mem_To_Reg,
output ALU_Src,
output Mem_Write,
output Mem_Read,
output ALU_Op,
output Reg_Write,
output PC_Src,
output [2:0] Reg_Dst,
output Print_Out,
output [1:0] Jump_Register,
output [1:0] Entrada,
output Set_LCD,
output Set_Offset,
output Load_from_HD,
output Change_Offset,
output Quantum,
output Quantum_flag,
output Halt,
output Ativa_PC,*/
//output branch_key,
//output [5:0] ALU_Ctrl,
/*output [4:0] mux2_out,
output sys_clock,
output zero,*/
output [55:0] saida_display,
output LED_Input,
output LED_Input2,
output teste1,
output teste2,
output LED_Reset,
inout [7:0] LCD_DATA,
output LCD_RS,
output LCD_RW,
output LCD_Enable,
output LCD_ON,
output LCD_BLON
/*output Esperar_Entrada,
output [31:0] ALU_dados2*/
//output enter
);

wire clock_aux;
wire sys_clock;
wire [31:0] Instrucao;
wire [31:0] Rs;
wire [31:0] Rt;
wire [31:0] Rd;
wire [31:0] Rpc;
wire [31:0] Rspc;
wire [4:0] mux2_out;
wire branch_key;
wire change_context_key;
wire [31:0] PC;
wire [31:0] Imprimir_Saida;
wire [31:0] novo_escrever_dados;
wire zero;
wire [5:0] ALU_Ctrl;
wire [31:0] ALU_dados2;
wire [31:0] ALU_resultado;
wire [31:0] Read_Data;
wire [31:0] Dado_Da_Memoria;
wire [31:0] Sinal_extendido;
wire [31:0] escrever_dados_final;
wire [31:0] PC_mais_1;
wire [31:0] prox_PC;
wire [31:0] PC_entrada;
wire [31:0] entrada_extendida;


//flags
wire Mem_To_Reg;
wire ALU_Src;
wire Mem_Write;
wire Mem_Read;
wire ALU_Op;
wire Reg_Write;
wire PC_Src;
wire [2:0] Reg_Dst;
wire Print_Out;
wire [1:0] Jump_Register;
wire [1:0] Entrada;
wire Set_LCD;
wire Set_Offset;
wire Load_from_HD;
wire Change_Offset;
//wire Executando_SO;
wire Quantum;
wire Quantum_flag;
//wire [1:0] Preempcao;
wire Halt;
wire Ativa_PC;
wire Conta_Halt;
wire [31:0] Counter_Halt;
wire LED_Input_Ativa;
wire LED_Input_Ativa2;
wire [5:0] Sinal;

wire saida_ff;
wire entrada_ff;
wire enter;

wire carregando;
wire [31:0] dado_HD;
wire [11:0] endereco_HD;
wire [11:0] endereco_RAM;
wire [31:0] Endereco_Calculado;

wire quantum_end;
wire teste;
//wire [31:0] debug_contador;

wire [31:0] PC_entrada1;
wire [31:0] PC_entrada2;
wire [31:0] PC_salvo;

wire [31:0] Offset;
wire [31:0] Offset_MD;


	//ATRASANDO O CLOCK
	Divisor_Frequencia div_freq (
		 .clock_in(Clock), 
		 .clock_out(sys_clock)
	);

	//testes

	//Debounce do switch
	Debounce_Switch Switch_entrada(
		 .clk(sys_clock),           
		 .switch_in(Confirma_Entrada),     
		 .switch_out(enter),
	);


	// Instanciação do Program Counter
	Program_Counter Program_Counter1 (
		 .Clock(sys_clock), // Usando Clock diretamente
		 .Reset(Reset),
		 .PC_entrada(PC_entrada),
		 .Ativa_PC(Ativa_PC),
		 .carregando(carregando),
		 //.Quantum_end(quantum_end),
		 .Halt(Halt),
		 .Offset(Offset),
		 .PC(PC),
		 .PC_mais_1(PC_mais_1)
	);
	
	
	//	Instanciação do HD 
	Hard_Disk Hard_Disk1 (
		 .Clock(Clock),
       .addr(endereco_HD),
       .instrucao(dado_HD)
	);
	
	
	//Controle do HD
	Controlador_HD controlador_hd_inst (
       .Clock(sys_clock),
       .Reset(Reset),
       .Load_from_HD(Load_from_HD),
       .indice_programa(Rs[11:0]),
       .carregando(carregando),
       .endereco_HD(endereco_HD),
       .endereco_RAM(endereco_RAM)
	); 
	
	//MEMÓRIA DE INSTRUÇÕES
	
	Memoria_Instrucoes Memoria_Instrucoes1 (
		 .PC(PC[9:0]),
		 .Endereco(endereco_RAM[9:0]),
		 .Dado(dado_HD),
		 .Clock(sys_clock),
		 //.Read_Clock(Clock),
		 .Write_Enable(carregando),
		 .Instrucao(Instrucao)
	);
	
	
	Temporizador Temporizador1 (
		 .Clock(sys_clock),
		 //.PC(PC),
		 .Reset(Reset),
		 //.Quantum(Rs),
		 .Desativa_Quantum(Quantum),
		 .Quantum_flag(Quantum_flag),
		 .Entrada(Entrada),
		 .Halt(Halt),
		 .quantum_end(quantum_end),
		 .teste(teste)
		 //.debug_contador(debug_contador)
	);
	
	
	// UNIDADE DE CONTROLE
	
   Unidade_Controle Unidade_Controle1 (
       .OpCode(Instrucao[31:26]),
		 .enter(enter),
		 .saida_ff(saida_ff),
		 //.user_program(Executando_SO),
		 .exec_quantum(teste),
		 .quantum_end(quantum_end),
       .Reg_Dst(Reg_Dst),
       .ALU_Op(ALU_Op),
       .Mem_Read(Mem_Read),
       .Mem_Write(Mem_Write),
       .Mem_To_Reg(Mem_To_Reg),
       .Reg_Write(Reg_Write),
       .ALU_Src(ALU_Src),
       .PC_Src(PC_Src),
       .Print(Print_Out),
       .Jump_Register(Jump_Register),
       .Entrada(Entrada),
		 .Set_LCD(Set_LCD),
		 .Set_Offset(Set_Offset),
		 .Load_from_HD(Load_from_HD),
		 .Change_Offset(Change_Offset),
		 //.Change_Context(Change_Context),
		 //.Executando_SO(Executando_SO),
		 .Quantum(Quantum),
		 .Quantum_flag(Quantum_flag),
		 //.Preempcao(Preempcao),
		 .Halt(Halt),
		 .Ativa_PC(Ativa_PC),
		 .Conta_Halt(Conta_Halt),
		 //.Counter_Halt(Counter_Halt),
		 .entrada_ff(entrada_ff),
		 .LED_Input_Ativa(LED_Input_Ativa),
		 .LED_Input_Ativa2(LED_Input_Ativa2),
       .Sinal(Sinal)
   );
	
	
	Controle_Halt Controle_Halt1 (
		  .Clock(sys_clock),
		  .Reset(Reset),
		  .Conta_Halt(Conta_Halt),
		  .saida(Counter_Halt)
	);
	
	
	//FLIP FLOP para controle de inputs
	Flip_Flop_Input Flip_Flop_Input1 (
		 .clk(sys_clock),
		 .enter(enter),
		 .entrada_ff(entrada_ff),
		 .out_ff(saida_ff)
	);
	
	Mux_5bits_8entradas Mux_Reg (  
       .entrada1(Instrucao[20:16]), 
       .entrada2(Instrucao[15:11]),
	    .entrada3(5'b11111),
		 .entrada4(5'b11001),
		 .entrada5(5'b11010),
       .key(Reg_Dst), 
       .saida(mux2_out)
   );
    
   Registradores Registradores1 (
       .Clock(sys_clock), // Usando Clock diretamente
		 .Reset(Reset),
       .Reg_Write(Reg_Write),
       .Reg_1(Instrucao[25:21]),
       .Reg_2(Instrucao[20:16]),
       .Reg_escrita(mux2_out),
       .Reg_dados(novo_escrever_dados),
		 .Counter_Halt(Counter_Halt),
       .Rs(Rs),
       .Rt(Rt),
       .Rd(Rd),
		 .Rpc(Rpc),
		 .Rspc(Rspc)
   );
	
	
   // FINAL BANCO DE REGISTRADORES
	
	
	Extendido Extendido1 (
       .entrada(Instrucao[15:0]), 
       .saida(Sinal_extendido)
   );
	
   
   // ULA 
   Mux_32bits Mux_ALU (
       .entrada1(Rt), 
       .entrada2(Sinal_extendido), 
       .key(ALU_Src), 
       .saida(ALU_dados2)
   );
    
   Controle_ALU Controle_ALU1 (
       .ALU_Op(ALU_Op), 
       .ALU_Ctrl(ALU_Ctrl), 
       .Funct(Instrucao[5:0]), 
       .Sinal(Sinal)
   );
	
	ULA ULA1 (
       .zero(zero), 
       .dados1(Rs), 
       .ALU_Ctrl(ALU_Ctrl), 
       .dados2(ALU_dados2), 
       .resultado(ALU_resultado)
   );
   // FIM ULA
	
	
	// MEMÓRIA DE DADOS
	
	Controle_Endereco_Memoria Controle_Endereco_Memoria1 (
		 .Clock(sys_clock), // Endereço original
		 //.Reset(Reset),
		 //.ALU_resultado(ALU_resultado),
		 .Indice_Processo(Rs[3:0]),      			// Índice salvo no contexto
		 .Change_Offset(Change_Offset),           // Flag para contexto SO
		 .Offset(Offset_MD)  // Endereço final calculado
	);
	
	//assign Endereco_Calculado = ALU_resultado + Offset_MD;
	assign Endereco_Calculado = ALU_resultado + Offset_MD;
	
	Memoria_Dados Memoria_Dados1 (
       .Write_Data(Rt),
       .Endereco_escrita(Endereco_Calculado[15:0]),
       .Endereco_leitura(Endereco_Calculado[15:0]),
       .Mem_Write(Mem_Write),
       .Mem_Read(Mem_Read),
       .read_Clock(Clock),
       .write_Clock(sys_clock),
       .Read_Data(Read_Data)
    );
    
    Mux_32bits Mux_Mem (
       .entrada1(ALU_resultado), 
       .entrada2(Read_Data), 
       .key(Mem_To_Reg), 
       .saida(Dado_Da_Memoria)
    );
	 // FIM MEMÓRIA DE DADOS


///////////////////////////// Lógica combinacional para seleção do próximo PC //////////////////////////////////


	assign branch_key = PC_Src & zero;

	// MUX de Desvio de Jump
	Mux_32bits Mux_Jump_Ou_PC (
		 .entrada1(PC_mais_1), 
		 .entrada2(Sinal_extendido), 
		 .key(branch_key), 
		 .saida(prox_PC)
	);

	// MUX para Jump Register
	Mux_32bits_4entradas mux_Jump_register (
		 .entrada1(prox_PC), 
		 .entrada2(Rs),
		 .entrada3(Rpc),
		 .key(Jump_Register), 
		 .saida(PC_entrada1)
	);

	
	Adder Adder1 (
		 //.PC(PC_entrada1),
		 .Clock(sys_clock),
		 .Set_Offset(Set_Offset),
		 //.Quantum(Quantum),
		 .Halt(Halt),
		 .quantum_end(quantum_end),
		 //.Offset(Rs),
		 .saida(Offset)
	);
	
	/*Mux_32bits teste_PC (
		 .entrada1(PC_entrada1), 
		 //.entrada2(32'b00000000000000000000000010111010), // 186 (halt)
		 .entrada2(32'b00000000000000000000000010111010), // 186 (halt)
		 .key(quantum_end), 
		 .saida(PC_entrada2)
	);*/
	
	assign PC_entrada = PC_entrada1 + Offset;
	assign PC_salvo = PC - Offset - 1;
	
	
	/*Mux_32bits teste_PC (
		 .entrada1(PC_entrada), 
		 //.entrada2(32'b00000000000000000000000010111010), // 186 (halt)
		 .entrada2(32'b00000000000000000000000010111010),
		 .key(quantum_end), 
		 .saida(PC_entrada2)
	);*/

// ======================     FAZENDO A SAIDA     ====================


	Salva_Saida Saida (
       .Rs(Rs), //testando
       .print_out(Print_Out), 
		 .clk(sys_clock),
       .print_dados(Imprimir_Saida)
   );
    
    // Instanciação do módulo Gerenciador_Saidas
   Gerenciador_De_Saidas Gerenciador_De_Saidas (
       .entrada(Imprimir_Saida[31:0]),
		 .clk(sys_clock), 
       .saida(saida_display)
   );


// ======================     FAZENDO A ENTRADA     ====================


	Extendido Extendido_entrada (
       .entrada(Entrada_lida), 
       .saida(entrada_extendida)
   );
	
	/*Salva_PC_Preemp Salva_PC(
		 .PC_mais_um(PC_mais_1),
		 .quantum_end(quantum_end),
       .clk(sys_clock),  
		 .saved_pc(saved_pc)
	);*/
	
   //assign key_entrada = Confirma_Entrada & Entrada; // testes
	Mux_32bits_4entradas mux_escrita_Banco_regs (
		 .entrada1(Dado_Da_Memoria), 
		 .entrada2(entrada_extendida), 
		 .entrada3(PC_mais_1),
		 .entrada4(PC_salvo),
		 //.entrada4(saved_pc), 
		 .key(Entrada), 
		 .saida(novo_escrever_dados)
	);
	

// ======================     DISPLAY LCD     ====================
	
	
	Display_LCD Display_LCD1(
		 .clk(Clock),
		 .sys_clock(sys_clock),
		 .Set_LCD(Set_LCD),
		 .Rs(Rs),
		 .LCD_DATA(LCD_DATA),
		 .LCD_ON(LCD_ON),
		 .LCD_BLON(LCD_BLON),
		 .LCD_RW(LCD_RW),
		 .LCD_EN(LCD_Enable),
		 .LCD_RS(LCD_RS)
	);
	
assign teste1 = teste;
assign teste2 = quantum_end;
//assign teste2 = Change_Context;
assign LED_Reset = Reset;
assign LED_Input = LED_Input_Ativa;
assign LED_Input2 = LED_Input_Ativa2;

endmodule 