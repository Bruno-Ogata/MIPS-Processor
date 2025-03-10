module Controlador_HD
#(parameter ADDR_WIDTH = 12, parameter PROG_SIZE = 150, parameter RAM_SIZE = 700)
(
    input Clock,                 // Clock do sistema
    input Reset,                 // Sinal de reset
    input Load_from_HD,				// Sinal para controle do Load do HD
    input [ADDR_WIDTH-1:0] indice_programa, // Índice do programa a ser carregado
    output reg carregando,       // Sinal indicando se o carregamento está em andamento
    output reg [ADDR_WIDTH-1:0] endereco_HD, // Endereço no HD para leitura
    output reg [ADDR_WIDTH-1:0] endereco_RAM // Endereço na RAM para escrita
);
	
	 /*integer count;
	 initial begin
			count <= 0;
			carregando <= 0;
	 end */

    // Lógica de controle
    always @(posedge Clock) begin
        if (Reset) begin
            carregando <= 0;
            endereco_HD <= 0;
            endereco_RAM <= 0;
        end else if (carregando == 1) begin
            if (endereco_RAM < RAM_SIZE) begin
                endereco_HD <= endereco_HD + 1;
                endereco_RAM <= endereco_RAM + 1;
            end else begin
                carregando <= 0; // Finalizou o carregamento
					 //count <= 0;
            end
        end else if (Load_from_HD == 1) begin
            carregando <= 1;
				//count <= 1;
            endereco_HD <= (indice_programa * PROG_SIZE) + 200; // Offset do programa no HD
            endereco_RAM <= 550; // Carregar a partir do índice 550 na RAM
		  end
    end
endmodule