
/****************************************************************************
 * sigmoid.v
 ****************************************************************************/

  
/**
 * Module: sigmoid
 * 
 * TODO: Add module documentation
 */
module sigmoid
(
i_rst,
i_clk,

i_req,
i_dat,

o_rdy,
o_dat
);

input			i_rst;
input			i_clk;

input			i_req;
input	signed	[15:0]	i_dat;

output			o_rdy;
output	signed	[15:0]	o_dat;
//==================================
//X>=7.5
reg	signed	[15:0]	result_ge750;
always @(posedge i_clk or negedge i_rst)
	if(!i_rst)	result_ge750	<= 16'H0;
	else		result_ge750	<= 16'H7FFF;

//X>=5.6
reg	signed	[15:0]	result_ge560;
reg	signed	[31:0]	result_ge560_p1;
always @(posedge i_clk or negedge i_rst)
	if(!i_rst)	begin
		result_ge560	<= 16'H0;
		result_ge560_p1	<= 31'H0;
	end else begin
		result_ge560_p1	<= i_dat * $signed(16'H45);
		result_ge560	<= $signed(result_ge560_a[31:16]) + $signed(16'H7E85);
	end
//x>=4

reg	signed	[31:0]	result_sq_p1;
wire signed	[15:0]	result_sq;
assign	result_sq = result_sq_p1[31:15];
always @(posedge i_clk)	result_sq_p1 <= i_dat*i_dat;

reg	signed	[15:0]	result_ge560;
reg	signed	[31:0]	result_ge560_p1;
reg	signed	[15:0]	result_ge560_p2_add;
reg	signed	[31:0]	result_ge560_p2_mult;
always @(posedge i_clk or negedge i_rst)
	if(!i_rst)	begin
		result_ge560	<= 16'H0;
		result_ge560_p1	<= 31'H0;
	end else begin
		result_ge560_p1		<= i_dat * $signed(16'D1573);
		result_ge560_p2_add	<= $signed(result_ge560_p1[31:15])+$signed(16'D28049);
		
		result_ge560		<= result_ge560_a + $signed(16'H7E85);
	end


endmodule


