module Salva_Saida (
    input [31:0] Rs,
    input print_out,
    input clk,  // Supondo que tenha um sinal de clock
    output reg [31:0] print_dados
);

    always @(posedge clk) begin //testando 
        if (print_out) begin
				//print_dados <= {28'b0, Rs}; // Zero-extension: 28 zeros + 4 bits de Rs
            print_dados <= Rs;
        end
        // Caso contrário, mantém o valor anterior
    end

endmodule 