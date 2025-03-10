module Controle_Endereco_Memoria
(
    input Clock, 							// Clock
	 //input [31:0] ALU_resultado,
    input [3:0] Indice_Processo,           // Índice do processo (0 para SO, 1-10 para processos)
    input Change_Offset,                         // Flag indicando se está no SO
    output reg [31:0] Offset // Endereço final calculado
);

    //localparam TAM_PARTICAO = 150; // Tamanho de cada partição
	 /*reg [31:0] Offset;

	 initial begin 
		  Offset = 0;
	 end */
	 
    always @(posedge Clock) begin
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

/*module Controle_Endereco_Memoria
#(parameter TAM_PARTICAO = 150) // Tamanho de cada partição
(
    input Clock,                     // Clock do sistema
    input Reset,                     // Reset do sistema
    input [3:0] Indice_Processo,     // Índice do processo (0 para SO, 1-10 para processos)
    input Change_Offset,             // Sinal para atualizar o offset
    output reg [16:0] Offset         // Offset calculado
);

    always @(posedge Clock or posedge Reset) begin
        if (Reset) begin
            Offset <= 0; // Inicializa Offset no reset
        end else if (Change_Offset) begin
            if (Indice_Processo <= 4'd10) begin // Apenas índices válidos
                Offset <= Indice_Processo * TAM_PARTICAO; // Calcula offset com base no índice
            end else begin
                Offset <= 0; // Valor padrão para índices inválidos
            end
        end
    end

endmodule*/