
module Memoria_Instrucoes
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=8)
(
	input [(ADDR_WIDTH-1):0] PC,
	input Clock, 
	output reg [(DATA_WIDTH-1):0] Instrucao
);

	reg [DATA_WIDTH-1:0] rom [2**ADDR_WIDTH-1:0];

	initial
	begin
		$readmemb("C:\\Users\\BrunoOgata\\Documents\\Compilador v1.9\\teste_processador.txt", rom);
	end

	always @ (posedge Clock) //testando
	begin
		Instrucao <= rom[PC];
	end

endmodule

