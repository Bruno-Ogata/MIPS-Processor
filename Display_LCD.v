module Display_LCD(
    // Host Side
    input clk,
	 input sys_clock,
	 input Set_LCD,
	 input [31:0] Rs,
    // LCD Side
    output [7:0] LCD_DATA,
    output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS    
);

	wire DLY_RST;
	reg [31:0] Msg = 32'b0;  // Inicializa Msg
	
	assign LCD_ON = 1'b1;
	assign LCD_BLON = 1'b1;
	
	always@(posedge sys_clock) 
	begin
		if(Set_LCD)
		begin 
			Msg <= Rs;	
		end
	end
	
	Reset_Delay r0(.iCLK(clk),.oRESET(DLY_RST) );
	
	LCD LCD1(
	// Host Side
		.iCLK(clk),
		.iRST_N(DLY_RST),
		.Msg(Msg),
	// LCD Side
		.LCD_DATA(LCD_DATA),
		.LCD_RW(LCD_RW),
		.LCD_EN(LCD_EN),
		.LCD_RS(LCD_RS)
	);
	
endmodule