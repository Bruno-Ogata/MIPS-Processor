/*module Memoria_Instrucoes
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=8)
(
	input [(ADDR_WIDTH-1):0] PC,
	input Clock, 
	output reg [(DATA_WIDTH-1):0] Instrucao
);

	reg [DATA_WIDTH-1:0] rom [2**ADDR_WIDTH-1:0];

	initial
	begin
		$readmemb("C:\\Users\\BrunoOgata\\Documents\\Compilador v2.0\\teste_processador.txt", rom);
	end

	always @ (PC) //testando
	begin
		Instrucao <= rom[PC];
	end

endmodule*/

module Memoria_Instrucoes
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=10)
(
    input [(ADDR_WIDTH-1):0] PC,         // Endereço do Program Counter
    input [(ADDR_WIDTH-1):0] Endereco,  // Endereço para escrita (quando ativado)
    input [(DATA_WIDTH-1):0] Dado,      // Dado a ser escrito na RAM
    input Clock,
	 //input Read_Clock,
    input Write_Enable,                 // Sinal para permitir escrita
    output reg [(DATA_WIDTH-1):0] Instrucao // Instrução lida
);

    reg [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0]; // RAM para memória de instruções

    // Inicializa memória com valores padrão (se necessário)
    initial begin
        $readmemb("C:\\Users\\BrunoOgata\\Documents\\Compilador v2.2\\teste_processador.txt", ram);
    end

    // Lógica para leitura de instruções
    always @(PC) begin
        Instrucao <= ram[PC];
    end

    // Lógica para escrita na RAM
    always @(posedge Clock) begin
        if (Write_Enable == 1) begin
            ram[Endereco] <= Dado;
        end 
    end
endmodule

