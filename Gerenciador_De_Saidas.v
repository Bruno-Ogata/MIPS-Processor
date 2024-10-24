module Gerenciador_De_Saidas (input [7:0] entrada, output [13:0] saida);

	//wire [3:0] mils;
	//wire [3:0] cents;
	wire [3:0] tens;
	wire [3:0] ones;


	Split_Digitos split(.value(entrada), .tens(tens), .ones(ones));
    
    // Instanciando os módulos de display de 7 segmentos para cada dígito
    //display_7_seg milhares(.inp(mils), .saida_7s(saida[27:21]));
    
    //display_7_seg centenas(.inp(cents), .saida_7s(saida[20:14]));

    display_7_seg dezenas(.inp(tens), .saida_7s(saida[13:7]));

    display_7_seg unidades(.inp(ones), .saida_7s(saida[6:0]));

endmodule



