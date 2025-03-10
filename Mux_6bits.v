module Mux_6bits (input [5:0] entrada1, input [5:0] entrada2, input key, output reg [5:0] saida);

always @(key or entrada1 or entrada2)

begin
	if (key)
		saida = entrada2;
	else 
		saida = entrada1;
end

endmodule