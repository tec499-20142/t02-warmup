module ula_k(
	input [7:0] operator1,
	input [7:0] operator2,
	input [7:0] operation_alu,
	output reg overflow,
	output reg[7:0] result_alu
);

always @(operator1 or operator2)

begin
	overflow = 0;
	case(operation_alu)
	
	8'b00000000: result_alu = operator1 + operator2;
	8'b00000001: result_alu = operator1 - operator2;
	8'b00000010: result_alu = operator1 & operator2;
	8'b00000011: result_alu = operator1 | operator2;
	8'b00000100: result_alu = operator1 * operator2;
	8'b00000101: result_alu = operator1 / operator2;
	
	endcase
	if((operator1 + operator2) > 255) begin
	overflow = 1;
	end
	//|| (operation_alu == 1 && (((operator1 - operator2) < -127) 
	//|| ((operator1 - operator2) > 128)))
	//|| (operation_alu == 4 && (((operator1 * operator2) < -127) 
	//|| ((operator1 * operator2) > 128)))
	//|| (operation_alu == 5 && (((operator1 / operator2) < -127) 
	//|| ((operator1 / operator2) > 128)))? 1 : 0;
	
end
	
endmodule

