
/*module Temporizador (
    input Clock,                // Clock do sistema
    input Reset,                // Reset do sistema
    input Ativa_Quantum,        // Sinal para iniciar o quantum
	 input Quantum_flag,
    output reg quantum_end,     // Indica quando o quantum termina
    output reg teste
);

	 parameter LIMITE_QUANTUM = 8'b00010000; // Define o limite do quantum

    reg [7:0] contador;
    reg contagem;
    
    initial begin 
        quantum_end = 0;
        contagem = 0;
        teste = 0;
    end

    always @(posedge Clock) begin
        if (Reset) begin
            contador <= 0;
            contagem <= 0;
            quantum_end <= 0;
            teste <= 0;
        end 
		  else begin 
			  if (Ativa_Quantum) begin
					contador <= 8'b00000000;     // Reinicia o contador
					contagem <= 1;     // Ativa a contagem
					quantum_end <= 0;  // Certifica-se de que não termina antes de contar
					teste <= 0;
			  end else if (contagem) begin
					if (contador < LIMITE_QUANTUM) begin
						 contador <= contador + 8'b00000001; // Incrementa o contador
					end else begin
						 quantum_end <= 1; // Marca que o quantum terminou
						 contagem <= 0;    // Desativa a contagem
						 teste <= 1;
					end
			  end else if (Quantum_flag) begin
					quantum_end <= 0;
			  end
		  end
	 end

endmodule*/

module Temporizador (
    input Clock,            // Clock do sistema
    input Reset,            // Reset do sistema
    input Desativa_Quantum,    // Sinal para iniciar o quantum
    input Quantum_flag,     // Sinal externo para reset do quantum_end
	 input [1:0] Entrada,
	 input Halt,
    output reg quantum_end, // Indica quando o quantum termina
    output reg teste        // Sinal de saída para indicar término do quantum
);

    parameter LIMITE_QUANTUM = 16; // Limite do quantum

    reg [7:0] contador;  // Contador para o quantum

    // Bloco de inicialização
    initial begin
        contador <= 0;
        quantum_end <= 0;
        teste <= 0;
    end

    // Bloco síncrono (em resposta ao clock e reset)
    always @(posedge Clock) begin
        if (Reset || Halt) begin
            // Resetando variáveis
            contador <= 0;
            quantum_end <= 0;
            teste <= 0;
        end else 
        if (Quantum_flag == 1 && Entrada != 2'b01 /*&& teste == 1*/) begin
            if (contador < LIMITE_QUANTUM - 1) begin
                // Incrementa o contador enquanto não atingir o limite do quantum
                contador <= contador + 1;
                quantum_end <= 0; // Continuamos contando, então quantum_end está desativado
                teste <= 1;
            end else begin
                // Quando o limite do quantum é atingido
                contador <= 0;     // Reseta o contador
                quantum_end <= 1;  // Sinaliza que o quantum terminou
                teste <= 0;        // Ativa o sinal de teste (sinal de término do quantum)
            end
        end /*else if (Halt == 1) begin
            // Reseta o sinal de término do quantum ao receber o sinal Quantum_flag
            contador <= 0;
            quantum_end <= 0;
            teste <= 0;
		  end */
    end

endmodule