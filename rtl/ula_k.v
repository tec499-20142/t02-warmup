module ula_k(
	input [7:0] operator1,
	input [7:0] operator2,
	input [7:0] operation_alu,
	output reg [7:0] result_alu,
	output reg overflow
);


always @(operator1 or operator2)

begin
	
	case(operation_alu)
	
	8'b00000000: result_alu = operator1 + operator2;
	8'b00000001: result_alu = operator1 - operator2;
	8'b00000010: result_alu = operator1 & operator2;
	8'b00000011: result_alu = operator1 | operator2;
	8'b00000100: result_alu = operator1 * operator2;
	8'b00000101: result_alu = operator1 / operator2;
	
	endcase
	
	//Verifica a opera��o adi��o
	if ((operation_alu == 0 && ((operator1 + operator2) > 255)) || 
	//Verifica a opera��o de subtra��o
	(operation_alu == 1 && ((operator1 - operator2) < 0)) ||
	//Verifica a opera��o de multiplica��o
	(operation_alu == 4 && ((operator1 * operator2) > 255)) ||
	//Verifica se o denominador da divis�o � 0 tamb�m, se for .. dar� overflow.
	(operation_alu == 5 && (operator2 == 0||((operator1 / operator2) < 0) 
	|| (operator1 / operator2) > 255))) overflow =1;
	
	
	else 
		begin

			overflow =0;

		end
	

end
	
endmodule

