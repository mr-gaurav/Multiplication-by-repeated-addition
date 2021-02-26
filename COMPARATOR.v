module COMP (eqz, count);
	output reg eqz;
	input `WORD_SIZE count;
	always@(count) begin
		eqz=~|count;  // bitwise NOR operation
	end
endmodule