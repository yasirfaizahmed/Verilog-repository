module INSTRUCTION_reg(data_in, Ii, Io, clk, opt, addt, rst);
	input [7:0]data_in;
	input Ii, Io, clk, rst;
	output reg[3:0]opt;
	output reg[3:0]addt;
	wire [3:0]op_codeo;
	wire [3:0]addresso;
	
	always@(posedge clk)begin
		if(rst)begin
			opt = 4'b0000;
			addt = 4'b0000;
		end
		else if(Ii) begin
			opt <= data_in[7:4];
			addt <= data_in[3:0];
		end
	end
	
	assign op_codeo = (Io) ? opt
							: 4'b0000;
	assign addresso = (Io) ? addt
							: 4'b0000;
endmodule
