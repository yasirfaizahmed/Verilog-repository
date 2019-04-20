//A standard 74ls161 IC verilog code by me, please do comment if any bug are found:)
//21-4-2019 12:48AM

module counter(clk, c_out, out, c_in, J, CE, CO);
	input clk, J, CE, CO;
	input [0:3]c_in;
	output [0:3]out;
	output reg[0:3]c_out;
	integer flag = 0;
	
	always @(posedge clk)begin
		if(J&&CE) begin
			if(flag==1'b0)begin
				c_out = c_in;
				flag = 1;
			end
		end
		
		else if(CE)begin
			c_out = c_out+1;
		end
	
		else begin
			c_out = 4'b0000;
		end
	end
	assign out = CO ? c_out:
			4'b0000;
endmodule
