module counter(clk, J, CE, out, in);
	input clk, J, CE;  //clk as input, J to jump, CE for counter enable
	input [3:0]in;  //in to jump to the value
	output [3:0]out; //4bit register
	reg[3:0]count;
	integer flag = 0;
	
	initial begin count = 4'b0000;end  //initializes count to 4'b0000
	always @(posedge clk)begin
			count <= count + 1;
			if(flag == 0)begin
				if(J == 1'b1)begin
					count <= in;
					flag = 1;
				end
			end
			if(J == 1'b0) flag = 0;
	end
	assign out = (CE == 1'b1)? count
					 : 4'b0000;
endmodule

