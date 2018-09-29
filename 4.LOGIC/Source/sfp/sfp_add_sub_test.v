
/**
 * Module: sfp_add_sub_test
 * 
 * TODO: Add module documentation
 */
module sfp_add_sub_test();

reg clk;
initial clk	= 1'B0;
always #5 clk = ~clk;

reg rst;
initial begin
		rst = 1'B0;
	#23 rst = 1'B1;
end

reg	i_mode, i_req;
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

wire		as_vld;
wire[25:0]	as_dat;
sfp_add_sub add_sub
(
.i_rst(rst),
.i_clk(clk),

.i_req(s2fa_vld&s2fb_vld),
.i_mode(i_mode),	//运算模式 :0 da+db; 1:da-db
.i_da(s2fa_dat),
.i_db(s2fb_dat),

.o_vld(as_vld),
.o_do(as_dat)
);

sfp_slf2std f2s
(
	.i_clk(clk),
	.i_rst(rst),
	.i_req(as_vld),
	.i_dat(as_dat),

	.o_vld(),
	.o_dat()
);

always @(posedge clk or negedge rst)
	if(!rst) begin
		i_da	<= 31'H0;
		i_db	<= 31'H0;
		i_mode	<= 1'H0;
		i_req	<= 1'B0;
	end else begin
		i_req	<= 1'B1;
		i_da	<= 32'H41D8FF00;
		i_db	<= 32'H41D8FC00;
		i_mode	<= 1;
	end

endmodule


