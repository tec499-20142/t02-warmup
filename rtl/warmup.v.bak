module warmup(
input clk,
input rst,
input rx,
output [7:0] result_data,
output overflow

);

wire _rx_ready;
wire [7:0]_rx_data;
wire [7:0]_data_a;
wire [7:0]_data_b;
wire [7:0]_operation;

uart BLOCO1 (
  .clk (clk),
  .rst (rst),
  .rx (rx),
  .rx_ready (_rx_ready),
  .rx_data (_rx_data) 
  );
  
  
 Interface_Control BLOCO2 (
 
.clock(clk),
.reset(rst),
.rx_data_ready(_rx_ready),
.rx_data(_rx_data),
.rx_dataOperation(_operation),
.rx_dataA (_data_a),
.rx_dataB(_data_b)
 );
 
 ula_k BLOCO3 (
 
.operator1 (_data_a),
.operator2(_data_b),
.operation_alu(_operation),
.result_alu(result_data),
.overflow(overflow)
 );
 endmodule