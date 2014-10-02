module Interface_Control(clock, reset, rx_data_ready, rx_data, rx_dataOperation, rx_dataA, rx_dataB);
	
	input clock;
	input reset;
	input rx_data_ready;
	input[7:0] rx_data;
	
	reg[1:0] counter;
	reg[7:0] dataA;
	reg[7:0] operation;

	output reg[7:0] rx_dataA;
	output reg[7:0] rx_dataB;
	output reg[7:0] rx_dataOperation;
	
	initial begin
		counter <= 2'b01;
	end
	
	always@(posedge clock) begin

		if(rx_data_ready) begin
			counter <= counter + 1;
		
			if(counter == 2'b11) begin
				rx_dataA <= dataA;
				rx_dataB <= rx_data;
				rx_dataOperation <= operation;
				counter <= 2'b00;
			end
			
			if(counter == 2'b10) begin
				dataA <= rx_data;
				counter <= 2'b11;
			end
			
			if(counter == 2'b01) begin
				operation <= rx_data;
				counter <= 2'b10;
			end
			
		end
		
		if(!reset) begin
			rx_dataOperation <= 8'b0000000;
			rx_dataA <= 8'b0000000;
			rx_dataB <= 8'b0000000;
			counter <= 2'b01;
		end
	end
endmodule	
