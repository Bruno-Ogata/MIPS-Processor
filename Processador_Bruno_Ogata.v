module Processador_Bruno_Ogata
(
input Clock,
input [15:0] Entrada_lida,
input Confirma_Entrada,
output [31:0] PC,
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
output [1:0] Reg_Dst,
output Print_Out,
output Jump_Register,
output [1:0] Entrada,
//output Jump_Link,
output branch_key,
output [5:0] ALU_Ctrl,
output [4:0] mux2_out,
output sys_clock,
output zero,
output [13:0] saida_display,
output LED_Wait,
output Esperar_Entrada,
output [31:0] PC_mais_1,
output [31:0] PC_entrada,
output [31:0] ALU_dados2
);

//wire [31:0] PC_mais_1;
wire clock_aux;
/*wire sys_clock;
wire [31:0] Instrucao;
wire [31:0] Rs;
wire [31:0] Rt;
wire [31:0] Rd;*/
//wire [4:0] mux1_out;
//wire [4:0] mux2_out;
wire [31:0] Sinal_extendido;
/*wire [31:0] novo_escrever_dados;
wire zero;
wire [5:0] ALU_Ctrl;*/
//wire [31:0] ALU_dados2;
/*wire [31:0] ALU_resultado;
wire [31:0] Read_Data;
wire [31:0] Dado_Da_Memoria;
wire [31:0] escrever_dados_final;
wire branch_key;*/
wire [31:0] prox_PC;
//wire [31:0] PC_entrada;
wire [31:0] entrada_extendida;
/*wire [31:0] PC;
wire [31:0] Imprimir_Saida;*/

//flags
/*wire Mem_To_Reg;
wire ALU_Src;
wire Mem_Write;
wire Mem_Read;
wire ALU_Op;
wire Reg_Write;
wire PC_Src;
wire [1:0] Reg_Dst;
wire Print_Out;
wire Jump_Register;
wire [1:0] Entrada;
//wire Jump_Link;
wire Esperar_Entrada;
wire [5:0] Sinal;*/

//reg esperar_entrada_reg; 
//reg confirma_entrada_reg;
//reg entrada_processada_reg;
//wire key_entrada;
//wire [31:0] prox_PC_branch;  
//wire [31:0] prox_PC_jump;   

// Sinal de Enable para o Program Counter
//wire PC_enable = (~esperar_entrada_reg & ~confirma_entrada_reg);

// Atualização dos registros de espera e processada
    /*always @(posedge Clock) begin // teste
        esperar_entrada_reg <= Esperar_Entrada;
        confirma_entrada_reg <= Confirma_Entrada;
        
        if (Entrada & entrada_disponivel) begin
            entrada_processada_reg <= 1;
        end else if (Confirma_Entrada) begin
            entrada_processada_reg <= 0;
        end
    end */

// Sinal de Disponibilidade de Entrada
//wire entrada_disponivel = (Entrada_lida != 16'b0) & ~entrada_processada_reg;
//wire entrada_disponivel = Entrada & ~Confirma_Entrada; // Ajuste conforme necessário

//ATRASANDO O CLOCK
Divisor_Frequencia div_freq (.clock_in(Clock), .clock_out(clock_aux));

//testando 


//testes
assign sys_clock = clock_aux & (~Esperar_Entrada | ~Confirma_Entrada); //para segurar o clock e ficar esperando pela entrada
// Utilize o clock principal diretamente para as operações críticas de controle
//assign sys_clock = Clock & (~esperar_entrada_reg | ~confirma_entrada_reg);

//assign LED_wait = (Esperar_Entrada == 1'b1) ? 1'b1 : 1'b0;

	// Instanciação do Program Counter
	Program_Counter Program_Counter1 (
		.Clock(sys_clock), // Usando Clock diretamente
		.PC_entrada(PC_entrada),
		.PC(PC),
		.PC_mais_1(PC_mais_1)
	);

	
	//MEMÓRIA DE INSTRUÇÕES
	Memoria_Instrucoes Memoria_Instrucoes1 (
		.PC(PC[7:0]),
		.Clock(sys_clock),
		.Instrucao(Instrucao)
	);
	
	
	// UNIDADE DE CONTROLE
   Unidade_Controle Unidade_Controle1 (
       .OpCode(Instrucao[31:26]),
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
       //.Jump_Link(Jump_Link),
       .Esperar_Entrada(Esperar_Entrada),
       .Sinal(Sinal)
   );
	
	
	// BANCO DE REGISTRADORES
   /*Mux_5bits Mux_Reg (
       .entrada1(Instrucao[20:16]), 
       .entrada2(Instrucao[15:11]), 
       .key(Reg_Dst), 
       .saida(mux1_out)
   );
    
   // SELECIONA ENTRE REG_DST E REG 31
   Mux_5bits Mux1_JumpLink (
       .entrada1(mux1_out), 
       .entrada2(5'b11111), 
       .key(Jump_Link), 
       .saida(mux2_out)
   );*/
	
	Mux_5bits_4entradas Mux_Reg (  //testando 
       .entrada1(Instrucao[20:16]), 
       .entrada2(Instrucao[15:11]),
	    .entrada3(5'b11111),
       .key(Reg_Dst), 
       .saida(mux2_out)
   );
    
   /*Mux_32bits Mux2_JumpLink (
       .entrada1(novo_escrever_dados), 
       .entrada2(PC_mais_1), 
       .key(Jump_Link), 
       .saida(escrever_dados_final)
   );*/
    
   Registradores Registradores1 (
       .Clock(sys_clock), // Usando Clock diretamente
       .Reg_Write(Reg_Write),
       .Reg_1(Instrucao[25:21]),
       .Reg_2(Instrucao[20:16]),
       .Reg_escrita(mux2_out),
       .Reg_dados(novo_escrever_dados),
       .Rs(Rs),
       .Rt(Rt),
       .Rd(Rd)
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
	
	ULA ULA1(
       .zero(zero), 
       .dados1(Rs), 
       .ALU_Ctrl(ALU_Ctrl), 
       .dados2(ALU_dados2), 
       .resultado(ALU_resultado)
   );
   // FIM ULA
	
	
	// MEMÓRIA DE DADOS
	Memoria_Dados Memoria_Dados1 (
       .Write_Data(Rt),
       .Endereco_escrita(ALU_resultado[15:0]),
       .Endereco_leitura(ALU_resultado[15:0]),
       .Mem_Write(Mem_Write),
       .Mem_Read(Mem_Read),
       .read_Clock(Clock),
       .write_Clock(Clock),
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
	Mux_32bits mux_Jump_register (
		 .entrada1(prox_PC), 
		 .entrada2(Rs),
		 .key(Jump_Register), 
		 .saida(PC_entrada)
	);
	
	/*
	// Lógica combinada para branch ou PC + 1
	assign prox_PC_branch = (PC_Src & zero) ? (PC + Sinal_extendido) : PC_mais_1;

	// Lógica combinada para Jump ou Jump Register
	assign prox_PC_jump = Jump_Register ? Rs : prox_PC_branch;

	// Definição final do próximo PC
	assign PC_entrada = Jump_Link ? PC_mais_1 : prox_PC_jump;*/
	

// ======================     FAZENDO A SAIDA     ====================


	Salva_Saida Saida (
       .Rs(Rs), 
       .print_out(Print_Out), 
       .print_dados(Imprimir_Saida)
   );
    
    // Instanciação do módulo Gerenciador_Saidas
   Gerenciador_Saidas Gerenciador_Saidas (
       .entrada(Imprimir_Saida[7:0]), 
       .saida(saida_display)
   );


// ======================     FAZENDO A ENTRADA     ====================


	Extendido Extendido_entrada (
       .entrada(Entrada_lida), 
       .saida(entrada_extendida)
   );
	
   //assign key_entrada = Confirma_Entrada & Entrada; // testes
	Mux_32bits_4entradas mux_escrita_Banco_regs (
		 .entrada1(Dado_Da_Memoria), 
		 .entrada2(entrada_extendida), 
		 .entrada3(PC_mais_1),
		 .key(Entrada), 
		 .saida(novo_escrever_dados)
	);


assign LED_Wait = Esperar_Entrada;

endmodule 