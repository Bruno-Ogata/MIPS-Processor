
module Registradores
(
    input Clock,
    input Reg_Write,
    input [4:0] Reg_1,
    input [4:0] Reg_2,
    input [4:0] Reg_escrita,
    input [31:0] Reg_dados,
    output [31:0] Rs,
    output [31:0] Rt,
    output [31:0] Rd
);

	reg [31:0] registradores [31:0];

	always @ (posedge Clock)
	begin
		 if (Reg_Write == 1)
			  registradores[Reg_escrita] = Reg_dados;
	end
	
	assign Rs = registradores[Reg_1];
	assign Rt = registradores[Reg_2];
	assign Rd = registradores[Reg_escrita];

endmodule
