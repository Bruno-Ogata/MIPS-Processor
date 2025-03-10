
module Unidade_Controle
(
input [5:0] OpCode,
input enter,
input saida_ff,
input exec_quantum,
input quantum_end,
output reg [2:0] Reg_Dst,
output reg ALU_Op,
output reg Mem_Read,
output reg Mem_Write,
output reg Mem_To_Reg,
output reg Reg_Write,
output reg ALU_Src,
output reg PC_Src,
output reg Print,
output reg [1:0] Jump_Register,
output reg [1:0] Entrada,
output reg Set_LCD,
output reg Set_Offset,
output reg Load_from_HD,
output reg Change_Offset,
//output reg Change_Context,
//output reg Executando_SO,
output reg Quantum,
output reg Quantum_flag,
//output reg [1:0] Preempcao,
output reg Halt,
output reg Ativa_PC,
output reg Conta_Halt,
//output reg [31:0] Counter_Halt,
output reg entrada_ff,
output reg LED_Input_Ativa,
output reg LED_Input_Ativa2,
output reg [5:0] Sinal
);

initial begin
	entrada_ff <= 1;
	Set_Offset <= 0;
	Quantum <= 0;
	Quantum_flag <= 0;
	Change_Offset <= 0;
	//Executando_SO = 1;
	//Change_Context = 0;
	Halt <= 0;
	Conta_Halt <= 0;
end

always @ (OpCode)

begin

	if (quantum_end == 1) begin
		  Reg_Dst <= 3'b100; 
		  Reg_Write <= 1;
		  Jump_Register <= 2'b10;
		  Entrada <= 2'b11;
		  Halt <= 1;
		  Ativa_PC <= 1; // teste
		  Conta_Halt <= 0;
		  Quantum_flag <= 0;
		  Quantum <= 1;
   end else begin
		//Quantum_flag <= 0;
		case (OpCode)
		
			6'b000000: begin //instruções do tipo R 
				Reg_Dst <= 3'b001;
				ALU_Op <= 1;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;	
				Reg_Write <= 1;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
			end
			
			6'b000001: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//addi
				Reg_Write <= 1;
				ALU_Src <= 1;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b000010: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//subi
				Reg_Write <= 1;
				ALU_Src <= 1;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000001;
			end
			
			6'b000011: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 1;
				Mem_Write <= 0;
				Mem_To_Reg <= 1;		//lw
				Reg_Write <= 1;
				ALU_Src <= 1;
				PC_Src <= 0;
				Print <=0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b000100: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 1;
				Mem_To_Reg <= 0;		//sw
				Reg_Write <= 0;
				ALU_Src <= 1;
				PC_Src <= 0;
				Print <=0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b000101: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//beq
				Reg_Write <= 0;
				ALU_Src <= 0;
				PC_Src <= 1;
				Print <=0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000001;
			end
			
			6'b000110: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//bne
				Reg_Write <= 0;
				ALU_Src <= 0;
				PC_Src <= 1; //testando 
				Print <=0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b100011;
			end
			
			6'b000111: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//j
				Reg_Write <= 0;
				ALU_Src <= 0;
				PC_Src <= 1;
				Print <=0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b001000: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//ji
				Reg_Write <= 0;
				ALU_Src <= 0;
				PC_Src <= 1;
				Print <=0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000001;
			end
			
			6'b001001: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//jr
				Reg_Write <= 0;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b01;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b001010: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//output
				Reg_Write <= 0;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 1;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b001011: begin // EM TESTE
				if (enter == saida_ff) begin
					Ativa_PC <= 1;
					entrada_ff <= ~saida_ff;
					//cont <= cont + 1;
					LED_Input_Ativa <= 0;
					LED_Input_Ativa2 <= 0;
				end 
				else begin
					Ativa_PC <= 0;
					entrada_ff <= saida_ff;
					LED_Input_Ativa <= enter;
					LED_Input_Ativa2 <= ~enter;
				end 
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//input
				Reg_Write <= 1;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b01;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Conta_Halt <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b001111: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//set LCD
				Reg_Write <= 0;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 1;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b010000: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//Load from HD
				Reg_Write <= 0;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 1;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b010001: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//Set Offset
				Reg_Write <= 0;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 1;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 1;
				//Executando_SO <= 0;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b10;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b010010: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//Change Offset
				Reg_Write <= 0;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 1;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b010011: begin
				Reg_Dst <= 3'b011;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//jalr
				Reg_Write <= 1;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b01;
				Entrada <= 2'b10;
				Set_LCD <= 0;
				Set_Offset <= 1;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b010100: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//Set Quantum
				Reg_Write <= 0;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 1;
				//Executando_SO <= user_program;
				Quantum <= 1;
				Quantum_flag <= 1;
				//Preempcao <= 2'b10;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b001100: begin
				Reg_Dst <= 3'b010; //teste
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//jal
				Reg_Write <= 1;
				ALU_Src <= 0;
				PC_Src <= 1;
				Print <= 0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b10; //teste
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b100000;
			end
			
			6'b001101: begin
				Reg_Dst <= 3'b000; 
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//nop
				Reg_Write <= 0;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b111110: begin
				Reg_Dst <= 3'b100; 
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//halt
				Reg_Write <= 1;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b10;
				Entrada <= 2'b10;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= 1;
				Quantum <= 0;
				Quantum_flag <= 0;
				//Preempcao <= 2'b01;
				Halt <= 1;
				Ativa_PC <= 1; // teste
				Conta_Halt <= 1;
				//Counter_Halt <= Counter_Halt + 1;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			6'b111111: begin
				Reg_Dst <= 3'b001;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		//li
				Reg_Write <= 1;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
			default: begin
				Reg_Dst <= 3'b000;
				ALU_Op <= 0;
				Mem_Read <= 0;
				Mem_Write <= 0;
				Mem_To_Reg <= 0;		
				Reg_Write <= 0;
				ALU_Src <= 0;
				PC_Src <= 0;
				Print <= 0;
				Jump_Register <= 2'b00;
				Entrada <= 2'b00;
				Set_LCD <= 0;
				Set_Offset <= 0;
				Load_from_HD <= 0;
				Change_Offset <= 0;
				//Change_Context <= 0;
				//Executando_SO <= user_program;
				Quantum <= 0;
				Quantum_flag <= exec_quantum;
				//Preempcao <= 2'b00;
				Halt <= 0;
				Ativa_PC <= 1;
				Conta_Halt <= 0;
				entrada_ff <= saida_ff;
				LED_Input_Ativa <= 0;
				LED_Input_Ativa2 <= 0;
				Sinal <= 6'b000000;
			end
			
		endcase
		
	end 

end


endmodule

