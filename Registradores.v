
module Registradores
(
    input Clock,
	 input Reset,
    input Reg_Write,
    input [4:0] Reg_1,
    input [4:0] Reg_2,
    input [4:0] Reg_escrita,
    input [31:0] Reg_dados,
	 input [31:0] Counter_Halt,
    output [31:0] Rs,
    output [31:0] Rt,
    output [31:0] Rd,
	 output [31:0] Rpc,
	 output [31:0] Rspc
	 //output [31:0] jal_debbug
);

	reg [31:0] registradores [31:0];
	
	integer i;

	always @ (posedge Clock)
	begin
		 /*if (Reset == 1) begin
			  for (i=0; i<32; i=i+1) begin
					registradores[i] = 0;
			  end
		 end */
		 
		 if (Reg_Write == 1) begin
			  registradores[Reg_escrita] = Reg_dados;
		 end 
		 
		 registradores[5'b11000] = Counter_Halt;
	end
	
	assign Rs = registradores[Reg_1];
	assign Rt = registradores[Reg_2];
	assign Rd = registradores[Reg_escrita];
	assign Rpc = registradores[5'b11001];
	assign Rspc = registradores[5'b11010];
	//assign jal_debbug = registradores[31];

endmodule
