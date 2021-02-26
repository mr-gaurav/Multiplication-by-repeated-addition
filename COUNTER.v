module COUNTER(out, in, dec, ldC, clk);
	output reg `WORD_SIZE out;
	input `WORD_SIZE in;
	input dec, ldC, clk;
	
	always @(posedge clk) begin
	   if(ldC)
	       out<=in;
	   else if(dec)
			out<= out-1;
	end
endmodule