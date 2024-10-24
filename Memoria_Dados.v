
module Memoria_Dados

#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=16)
(
	input [(DATA_WIDTH-1):0] Write_Data,
	input [(ADDR_WIDTH-1):0] Endereco_escrita, Endereco_leitura,
	input Mem_Write, Mem_Read, read_Clock, write_Clock,
	output reg [(DATA_WIDTH-1):0] Read_Data
);
	
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
	
	always @ (posedge write_Clock)
	begin
		if (Mem_Write)
			ram[Endereco_escrita] <= Write_Data;
	end
	
	always @ (posedge read_Clock)
	begin
		if (Mem_Read)
			Read_Data <= ram[Endereco_leitura];
	end
	
endmodule

