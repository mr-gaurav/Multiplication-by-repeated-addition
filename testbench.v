`timescale 1ns / 1ps

module mul_test;
	
	reg start, clk;
	reg [7:0] data_in;
	wire done;
	
	mul_datapath dut1 (eqz, data_in, ldA, ldP, ldC, clearP, ldB, decB, clk);
	mul_controller dut2 (done, ldA, ldB, ldP, ldC, clearP, decB, start, eqz, clk);
	
	always #1 clk=~clk;
	
	initial begin
		clk=0;
		$dumpfile("mul_test.vcd");
		$dumpvars(0,mul_test);
		$monitor("time=%g, A=%d, B=%d, result=%d, done=%b",$time, dut1.x, dut1.bout, dut1.y, dut2.done);
		#1 start=1;
		#2 data_in=255;
		#3 data_in=200;		
		#1000 $finish;
	end
endmodule

