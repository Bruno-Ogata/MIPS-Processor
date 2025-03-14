module Mux_5bits_4entradas (input [4:0] entrada1, input [4:0] entrada2, input [4:0] entrada3, input [4:0] entrada4, 
							
							input [1:0] key, output reg [4:0] saida);

	
	always @ (key or entrada1 or entrada2 or entrada3 or entrada4)
	begin
		case (key)
		
			0: saida = entrada1;
			1: saida = entrada2;
			2: saida = entrada3;
			3: saida = entrada4;
			default: saida = entrada1;		
			
		endcase
	end



endmodule