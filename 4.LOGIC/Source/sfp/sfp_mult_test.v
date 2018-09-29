  
/**
 * Module: sfp_add_sub_test
 * 
 * TODO: Add module documentation
 */
module sfp_mult_test();

reg clk;
initial clk	= 1'B0;
always #5 clk = ~clk;

reg rst;
initial begin
		rst = 1'B0;
	#23 rst = 1'B1;
end

reg			i_req;
reg[31:0]	i_da,
			i_db;
	
	
wire		s2fa_vld;
wire[25:0]	s2fa_dat;
sfp_std2slf std2slf_a
(
	.i_clk(clk),
	.i_rst(rst),
	.i_req(i_req),
	.i_dat(i_da),

	.o_vld(s2fa_vld),
	.o_dat(s2fa_dat)
);

wire		s2fb_vld;
wire[25:0]	s2fb_dat;
sfp_std2slf std2slf_b
(
	.i_clk(clk),
	.i_rst(rst),
	.i_req(i_req),
	.i_dat(i_db),

	.o_vld(s2fb_vld),
	.o_dat(s2fb_dat)
);

wire		mult_vld;
wire[25:0]	mult_dat;

sfp_mult mult
(
.i_rst(rst),
.i_clk(clk),

.i_req(s2fa_vld&s2fb_vld),
.i_da(s2fa_dat),
.i_db(s2fb_dat),

.o_vld(mult_vld),
.o_do(mult_dat)
);

sfp_slf2std f2s
(
	.i_clk(clk),
	.i_rst(rst),
	.i_req(mult_vld),
	.i_dat(mult_dat),

	.o_vld(),
	.o_dat()
);

always @(posedge clk or negedge rst)
	if(!rst) begin
		i_da	<=26'H0;
		i_db	<=26'H0;
		i_req	<= 1'B0;
	end else begin
		i_req	<= 1'B1;
		i_da	<= $random;
		i_db	<= $random;
	end

endmodule


