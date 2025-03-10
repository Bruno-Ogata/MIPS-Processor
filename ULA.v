
module ULA(zero, dados1, ALU_Ctrl, dados2, resultado);
input [31:0] dados1;
input [31:0] dados2;
input [5:0] ALU_Ctrl;

output zero;
output reg [31:0] resultado;

always @(ALU_Ctrl, dados1, dados2)

	begin
		 case(ALU_Ctrl[5:0])
		 
		 6'b000000: resultado = dados1 + dados2; //add
		 6'b000001:	resultado = dados1 - dados2; //sub	  
		 6'b000010: resultado = dados1 * dados2; //mult
		 6'b000011:	resultado = dados1 / dados2; //div		  	 
		 6'b000100: resultado = dados1 | dados2; //or	 
		 6'b000101: resultado = dados1 & dados2; //and	
		 6'b000110: resultado = ~(dados1); //not	
		 6'b001000: resultado = dados1 ^ dados1; //xor
		 6'b001001: resultado = ~(dados1 | dados2); //nor
		 6'b001010: resultado = dados1 ~^ dados2; //xnor
		 6'b000111: begin //slt
					if (dados1 < dados2)
					begin
						resultado = 1;
					end
					else
					begin
						resultado = 0;
					end
				end
		 6'b100000: resultado = 0; //jal
		 6'b100001: resultado = (dados1 == dados2) ? 0 : 1; // beq (não usa o valor de resultado para salto)
		 6'b100011: resultado = (dados1 != dados2) ? 0 : 1; // bne (não usa o valor de resultado para salto)
		 6'b100100: resultado = ((dados1 < dados2) || (dados1 == dados2)) ? 1 : 0; // sle (não usa o valor de resultado para salto)
		 6'b100101: resultado = ((dados1 > dados2) || (dados1 == dados2)) ? 1 : 0; // sge (não usa o valor de resultado para salto)
		
		default: resultado = 0;
		
		endcase
	
	end
	
	assign zero = (resultado == 0);
	
	/*if (resultado == 0)
		begin
			assign zero = 1;
		end 
	else
		begin
			assign zero = 0;
		end 
	end*/
endmodule
