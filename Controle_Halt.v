module Controle_Halt
(
	 input Clock,
	 input Reset,
    input Conta_Halt, 
    output reg [31:0] saida // Contador de halts
);

	initial begin
		saida <= 0;
	end
	 
    always @(posedge Clock) begin
		  if (Reset) begin
				saida <= 0;
		  end 
		  if (Conta_Halt) begin
				saida <= saida + 1;
		  end
    end

endmodule