module Contador_Halt
(
    input Conta_Halt, 						
    output reg [31:0] saida // Endereço final calculado
);

	 
    always @(negedge Clock) begin
		  if (Change_Offset == 1) begin
				case (Indice_Processo)
					4'b0000: Offset = 0;
					4'b0001: Offset = 150;
					4'b0010: Offset = 300;
					4'b0011: Offset = 450;
					4'b0100: Offset = 600;
					4'b0101: Offset = 750;
					4'b0110: Offset = 900;
					4'b0111: Offset = 1050;
					4'b1000: Offset = 1200;
					4'b1001: Offset = 1350;
					4'b1010: Offset = 1500;
					4'b1011: Offset = 1650;
					4'b1100: Offset = 1800;
					4'b1101: Offset = 1950;
					default: Offset = 0;
				endcase
		  end 
    end
	 
	 //assign Endereco_Calculado = ALU_resultado + Offset;

endmodule