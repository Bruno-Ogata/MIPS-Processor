module Salva_PC_Preemp (
    input [31:0] PC_mais_um,
    input quantum_end,
    input clk,  // Supondo que tenha um sinal de clock
    output reg [31:0] saved_pc
);

    always @(negedge clk) begin //testando 
        if (quantum_end == 1) begin
				//print_dados <= {28'b0, Rs}; // Zero-extension: 28 zeros + 4 bits de Rs
            saved_pc <= PC_mais_um;
        end
        // Caso contrário, mantém o valor anterior
    end

endmodule