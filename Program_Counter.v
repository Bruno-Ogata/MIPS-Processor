
module Program_Counter(
    input Clock,
    input [31:0] PC_entrada,
    output reg [31:0] PC,
    output [31:0] PC_mais_1
);

	assign PC_mais_1 = PC + 1;
   
   always @(posedge Clock) begin
		 PC <= PC_entrada;    
   end
endmodule