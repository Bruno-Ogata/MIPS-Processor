module Flip_Flop_Input
(
input clk,
input enter,
input entrada_ff,
output reg out_ff
);

reg toggle;  // Variável de controle para alternância

always @(posedge clk) begin
    // Alterna o estado do 'out_ff' a cada instrução de entrada
    if (enter == entrada_ff) begin
        out_ff <= toggle ? 1 : 0;  // Alterna entre 1 e 0 conforme o estado de 'toggle'
        toggle <= ~toggle;          // Inverte o estado de 'toggle' para a próxima vez
    end
end

endmodule
