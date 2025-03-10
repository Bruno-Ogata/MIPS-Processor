module Adder (
    //input [31:0] PC,
	 input Clock,
    input Set_Offset,
	 //input Quantum,
    input Halt,
	 input quantum_end,
    output reg [31:0] saida
);

    /*reg [31:0] OffsetAdd; // Registrador para armazenar o Offset

    initial begin 
        OffsetAdd = 0; // Inicialização
    end */
	 
	 initial begin 
		  saida = 0;
	 end 

    // Atualiza OffsetAdd quando Set_Offset é ativado
    always @(posedge Clock) begin
        if (Set_Offset /*|| Quantum*/) begin
            saida <= 550; 
		  end
		  else begin
				if (Halt || quantum_end) begin
					saida <= 0;
				end
			end
    end

    // Calcula o próximo PC com Offset
    /*always @(PC or OffsetAdd) begin
        saida = PC + OffsetAdd;
    end */

endmodule
	