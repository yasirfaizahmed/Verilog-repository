module regA(clk, AI, AO, rst, d_in, d_out);
	input clk, rst, AO, AI;
	output [7:0]d_out;
	reg [7:0]d;
	input [7:0]d_in;
	
	always@(posedge clk)begin //synchronous rst 
		if(rst) d = 8'b00000000;
		else begin
			if(AI) d <= d_in; 
		end
	end
	assign d_out = (AO==1) ? d:
									8'b00000000;
endmodule
