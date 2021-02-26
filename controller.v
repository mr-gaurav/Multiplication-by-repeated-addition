`timescale 1ns / 1ps

module mul_controller(done,ldA, ldB, ldP, ldC, clearP, decB, start, eqz, clk);
	output reg done,ldA, ldB, ldP, ldC, clearP, decB;
	input start, eqz, clk;
	reg [2:0] state;
	parameter s0=0, s1=1, s2=2, s3=3,s4=4, s5=5;
	
	always@(posedge clk) begin
		case (state)
			s0: if(start) state<=s1;
			s1: state<=s2;
			s2: state<=s3;
			s3: #1 if(eqz) state<=s4;
			s4: state<=s4;
			default: state<=s0;
		endcase
	end
	
	always@(state) begin
		case(state)
			s0: begin done=0; ldA=0; ldB=0; ldP=0; clearP=0; decB=0; end
			s1: begin ldA=1; end
			s2: begin ldA=0; ldB=1; ldC=1; clearP=1; end
			s3: begin ldB=0; ldC=0; clearP=0; decB=1; ldP=1; end
			s4: begin ldP=0; decB=0; done=1; end
			default: begin done=1'bx; ldA=1'bx; ldB=1'bx; ldP=1'bx; clearP=1'bx; decB=1'bx; end
		endcase
	end
endmodule 