
module Unidade_Controle
(
input [5:0] OpCode,
output reg [1:0] Reg_Dst,
output reg ALU_Op,
output reg Mem_Read,
output reg Mem_Write,
output reg Mem_To_Reg,
output reg Reg_Write,
output reg ALU_Src,
output reg PC_Src,
output reg Print,
output reg Jump_Register,
output reg [1:0] Entrada,
//output reg Jump_Link,
output reg Esperar_Entrada,
output reg [5:0] Sinal
);

always @ (OpCode)

begin
	case (OpCode)
	
		6'b000000: begin //instruções do tipo R 
			Reg_Dst <= 2'b01;
			ALU_Op <= 1;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;	
			Reg_Write <= 1;
			ALU_Src <= 0;
			PC_Src <= 0;
			Print <= 0;
			Jump_Register <= 0;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
		end
		
		6'b000001: begin
			Reg_Dst <= 2'b00;
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;		//addi
			Reg_Write <= 1;
			ALU_Src <= 1;
			PC_Src <= 0;
			Print <= 0;
			Jump_Register <= 0;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
			Sinal <= 6'b000000;
		end
		
		6'b000010: begin
			Reg_Dst <= 2'b00;
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;		//subi
			Reg_Write <= 1;
			ALU_Src <= 1;
			PC_Src <= 0;
			Print <= 0;
			Jump_Register <= 0;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
			Sinal <= 6'b000001;
		end
		
		6'b000011: begin
			Reg_Dst <= 2'b00;
			ALU_Op <= 0;
			Mem_Read <= 1;
			Mem_Write <= 0;
			Mem_To_Reg <= 1;		//lw
			Reg_Write <= 1;
			ALU_Src <= 1;
			PC_Src <= 0;
			Print <=0;
			Jump_Register <= 0;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
			Sinal <= 6'b000000;
		end
		
		6'b000100: begin
			Reg_Dst <= 2'b00;
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 1;
			Mem_To_Reg <= 0;		//sw
			Reg_Write <= 0;
			ALU_Src <= 1;
			PC_Src <= 0;
			Print <=0;
			Jump_Register <= 0;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
			Sinal <= 6'b000000;
		end
		
		6'b000101: begin
			Reg_Dst <= 2'b00;
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;		//beq
			Reg_Write <= 0;
			ALU_Src <= 0;
			PC_Src <= 1;
			Print <=0;
			Jump_Register <= 0;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
			Sinal <= 6'b100001;
		end
		
		6'b000110: begin
			Reg_Dst <= 2'b00;
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;		//bne
			Reg_Write <= 0;
			ALU_Src <= 0;
			PC_Src <= 1; //testando 
			Print <=0;
			Jump_Register <= 0;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
			Sinal <= 6'b100011;
		end
		
		6'b000111: begin
			Reg_Dst <= 2'b00;
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;		//j
			Reg_Write <= 0;
			ALU_Src <= 0;
			PC_Src <= 1;
			Print <=0;
			Jump_Register <= 0;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
			Sinal <= 6'b000000;
		end
		
		6'b001000: begin
			Reg_Dst <= 2'b00;
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;		//ji
			Reg_Write <= 0;
			ALU_Src <= 0;
			PC_Src <= 1;
			Print <=0;
			Jump_Register <= 0;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
			Sinal <= 6'b000001;
		end
		
		6'b001001: begin
			Reg_Dst <= 2'b00;
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;		//jr
			Reg_Write <= 0;
			ALU_Src <= 0;
			PC_Src <= 0;
			Print <= 0;
			Jump_Register <= 1;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
			Sinal <= 6'b000000;
		end
		
		6'b001010: begin
			Reg_Dst <= 2'b00;
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;		//output
			Reg_Write <= 0;
			ALU_Src <= 0;
			PC_Src <= 0;
			Print <= 1;
			Jump_Register <= 0;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
			Sinal <= 6'b000000;
		end
		
		6'b001011: begin
			Reg_Dst <= 2'b00;
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;		//input
			Reg_Write <= 1;
			ALU_Src <= 0;
			PC_Src <= 0;
			Print <= 0;
			Jump_Register <= 0;
			Entrada <= 2'b01;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
			Sinal <= 6'b000000;
		end
		
		6'b001100: begin
			Reg_Dst <= 2'b10; //teste
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;		//jal
			Reg_Write <= 1;
			ALU_Src <= 0;
			PC_Src <= 1;
			Print <= 0;
			Jump_Register <= 0;
			Entrada <= 2'b10; //teste
			//Jump_Link <= 1;
			Esperar_Entrada <= 0;
			Sinal <= 6'b100000;
		end
		
		6'b001101: begin
			Reg_Dst <= 2'b00; 
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;		//wait
			Reg_Write <= 0;
			ALU_Src <= 0;
			PC_Src <= 0;
			Print <= 0;
			Jump_Register <= 0;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 1;
			Sinal <= 6'b000000;
		end
		
		6'b111111: begin
			Reg_Dst <= 2'b01;
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;		//li
			Reg_Write <= 1;
			ALU_Src <= 0;
			PC_Src <= 0;
			Print <= 0;
			Jump_Register <= 0;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
			Sinal <= 6'b000000;
		end
		
		default: begin
			Reg_Dst <= 2'b00;
			ALU_Op <= 0;
			Mem_Read <= 0;
			Mem_Write <= 0;
			Mem_To_Reg <= 0;		
			Reg_Write <= 0;
			ALU_Src <= 0;
			PC_Src <= 0;
			Print <= 0;
			Jump_Register <= 0;
			Entrada <= 2'b00;
			//Jump_Link <= 0;
			Esperar_Entrada <= 0;
			Sinal <= 6'b000000;
		end
		
	endcase

end


endmodule

