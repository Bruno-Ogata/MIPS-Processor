module Mux_5bits_8entradas (input [4:0] entrada1, input [4:0] entrada2, input [4:0] entrada3, input [4:0] entrada4, input [4:0] entrada5, input [4:0] entrada6, input [4:0] entrada7, input [4:0] entrada8, 
							
							input [2:0] key, output reg [4:0] saida);

	
	always @ (key or entrada1 or entrada2 or entrada3 or entrada4 or entrada5 or entrada6 or entrada7 or entrada8)
	begin
		case (key)
		
			0: saida = entrada1;
			1: saida = entrada2;
			2: saida = entrada3;
			3: saida = entrada4;
			4: saida = entrada5;
			5: saida = entrada6;
			6: saida = entrada7;
			7: saida = entrada8;
			default: saida = entrada1;		
			
		endcase
	end



endmodule