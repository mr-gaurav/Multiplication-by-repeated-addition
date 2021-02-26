module LOAD1 (out, data_in, ldA, clk);
	output reg `WORD_SIZE out;
	input `WORD_SIZE data_in;
	input ldA, clk;
	
	 always @(posedge clk) begin
		if(ldA)
			out<=data_in;
	 end
endmodule

module LOAD2 (out, in, load, clear, clk);
	output reg `RESULT_SIZE out;
	input `RESULT_SIZE in;
	input load, clear, clk;
	
	 always @(posedge clk) begin
		if(clear)
			out<=0;
		else if(load)
			out<= in;
	 end
	 
endmodule