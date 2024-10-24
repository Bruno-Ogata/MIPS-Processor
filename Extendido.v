
module Extendido ( input [15:0] entrada, output reg [31:0] saida );

always @(entrada)
begin
    saida = {{15{1'b0}}, entrada};
end

endmodule
