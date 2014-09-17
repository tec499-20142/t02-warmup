
module warmup(
	output reg[7:0] rx_data,
	output wire rx_ready,
	input clk,
	input rx);

	uart rs232(
		// Control
		clk,		//Main clock
		rst,	// Main reset
		// External Interface
		rx,	// RS232 received serial data
		tx,	// RS232 transmitted serial data
		// RS232/UART Configuration
		0,//par_en,		// Parity bit enable
		// uPC Interface
		tx_req,					// Request SEND of data
		tx_end,					// Data SENDED
		tx_data,					// Data to transmit
		rx_ready,				// Received data ready to uPC read
		rx_data					// Received data 
	);
	
	/*always @(posedge clk)
		begin
		
		end*/
endmodule