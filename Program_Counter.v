
module Program_Counter(
    input Clock,
	 input Reset,
    input [31:0] PC_entrada,
	 input Ativa_PC,
	 input carregando,
	 //input trava_pc,
	 /*input Halt,
	 input Set_Offset,*/
	 //input Quantum_end,
	 input Halt,
	 input [31:0] Offset,
    output reg [31:0] PC,
    output reg [31:0] PC_mais_1
);
	
	/*initial begin 
		PC = 199;
		PC_mais_1 = PC + 1;
	end*/
	
	initial begin 
		PC = 0;
		PC_mais_1 = 1;
	end
   
   always @(posedge Clock) begin
		if (Reset == 1) /*|| (Halt == 1)*/ begin
			PC = 0;
			PC_mais_1 = PC + 1 - Offset;	
		end
		else begin
			/*if (Halt == 1) begin 
				PC = 111;
				PC_mais_1 = PC + 1;
			end */
			
			/*if (Set_Offset == 1) begin
				PC = 0;
				PC_mais_1 = PC + 1;
			end else begin*/
			
			if ((Ativa_PC == 1) && (carregando == 0) /*&& (Halt == 0)*/) begin
				PC = PC_entrada;
				PC_mais_1 = PC + 1 - Offset;	
			end
			else begin
				PC = PC;
				PC_mais_1 = PC + 1 - Offset;
			end
			/*end */
		end
   end
	
	//assign PC_mais_1 = PC + 1;
	
endmodule