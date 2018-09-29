
    
/****************************************************************************
 * sfp_conv_test.v
 ****************************************************************************/

  
  
/**
 * Module: sfp_conv_test
 * 
 * TODO: Add module documentation
 */
module sfp_conv_test();

initial begin
    $fsdbDumpfile("sfp_conv_test");
    $fsdbDumpvars(0, sfp_conv_test);
end

reg clk;
initial clk	= 1'B0;
always #5 clk = ~clk;

reg rst;
initial begin
	rst = 1'B0;
	#23 rst = 1'B1;
end

reg			req;
reg[31:0]	dat;

wire		s2d_vld;
wire[25:0]	s2d_dat;

sfp_std2slf std2slf
(
	.i_clk(clk),
	.i_rst(rst),
	.i_req(req),
	.i_dat(dat),

	.o_vld(s2d_vld),
	.o_dat(s2d_dat)
);
	
sfp_slf2std slf2std
(
	.i_clk(clk),
	.i_rst(rst),
	.i_req(s2d_vld),
	.i_dat(s2d_dat),

	.o_vld(),
	.o_dat()
);

always @(posedge clk or negedge rst)
	if(!rst) begin
		req	<= 1'B0;
		dat	<= 32'H0;
	end else begin
		req	<= 1'B1;
		
		dat	<= $random;
	end


endmodule


