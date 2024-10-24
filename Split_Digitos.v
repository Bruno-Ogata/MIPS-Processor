module Split_Digitos(
		input      [7:0] value,
		output reg [3:0] tens,
		output reg [3:0] ones
	);
	
	integer i;
	always @( value ) begin
		
		tens = 0;
		ones = 0;
		for( i=7; i>=0; i=i-1 ) begin
				
			if( tens >= 5 )
				tens = tens + 3;
				
			if( ones >= 5 )
				ones = ones + 3;
				
			tens = tens << 1;
			tens[0] = ones[3];
			ones = ones << 1;
			ones[0] = value[i];
		end
	end
endmodule