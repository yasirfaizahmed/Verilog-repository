//16 bytes(16*8 bits) RAM 

module RAM(d_in, d_out, adr, WE, CE, clk, OE);
	input [7:0]d_in;
	output [7:0]d_out;
	input CE, WE, clk, OE;
	input [4:0]adr;
	
	reg [7:0] d_mem[15:0]; //array of sixteen 8bit registers
	
	always @ (posedge clk)begin
		if(CE)begin
			if(WE)begin
				d_mem[adr] <= d_in;
			end
		end
	end
	if(OE)begin
		assign d_out = d_mem[adr];
	end
endmodule
