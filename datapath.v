`timescale 1ns / 1ps
`define WORD_SIZE [7:0]
`define RESULT_SIZE [15:0]

module mul_datapath (eqz, data_in, ldA, ldP, ldC, clearP, ldB, dec, clk);
	output eqz;
	input clk, ldA, ldB, ldP, ldC, clearP, dec;
	input `WORD_SIZE data_in;	
	wire `WORD_SIZE x, bout, count;
	wire `RESULT_SIZE  y, z;
	
	LOAD1 A(x, data_in, ldA, clk);
	LOAD1 B(bout, data_in, ldB, clk);
	LOAD2 P(y, z, ldP, clearP, clk);
	COUNTER C(count, data_in, dec, ldC, clk);
	ADD add(z, x, y);
	COMP comp(eqz, count);

endmodule