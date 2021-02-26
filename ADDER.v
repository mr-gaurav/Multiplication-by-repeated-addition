`define WORD_SIZE [7:0]
`define RESULT_SIZE [15:0]

module ADD (out, in1, in2);
    output reg `RESULT_SIZE out;
	input `WORD_SIZE in1;
	input `RESULT_SIZE in2;
	always @(*) begin
		out= in1 +in2;
	end
endmodule