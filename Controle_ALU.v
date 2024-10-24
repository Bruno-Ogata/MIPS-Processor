
module Controle_ALU (input ALU_Op, output reg [5:0] ALU_Ctrl, input [5:0] Funct, input [5:0] Sinal);

always @ (ALU_Op, Funct, Sinal)

begin

	if (ALU_Op == 1)
		begin
			case (Funct)
				
				6'b000000: begin //add
					ALU_Ctrl = 6'b000000;
				end
				
				6'b000001: begin //sub
					ALU_Ctrl = 6'b000001;
				end
				
				6'b000010: begin //mult
					ALU_Ctrl = 6'b000010;
				end
				
				6'b000011: begin //div
					ALU_Ctrl = 6'b000011;
				end
				
				6'b000100: begin //or
					ALU_Ctrl = 6'b000100;
				end
				
				6'b000101: begin //and
					ALU_Ctrl = 6'b000101;
				end
				
				6'b000110: begin //not
					ALU_Ctrl = 6'b000110;
				end
				
				6'b000111: begin //slt
					ALU_Ctrl = 6'b000111;
				end
				
				default: begin
					ALU_Ctrl = 6'b000000;
				end
				
			endcase
		end
		
	if (ALU_Op == 0)
		begin
			ALU_Ctrl = Sinal;
		end

end

endmodule 

