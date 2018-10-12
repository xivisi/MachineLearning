/*
文件：	conv_pe.v
作者：	Li Yong
电邮：	xivisi@126.com
时间：	星期五, 十月 12, 2018	16:38:55
*/


module conv_pe #(parameter	ADDER_WIDTH = 32)
(
i_rst,
i_clk,

i_row,	//行边界属性：上/下
i_col,	//列边界属性：左/右

i_vld,	//输入有效

i_dl,	//左PE数据
i_du,	//右PE数据

i_wd,	//权重值

i_al,	//左PE，行加法器输出
i_du,	//上PE，列加法器输出

o_vld,	//输出有效

o_dr,	//向右PE传输原始数据
o_dd,	//向下PE传输原始数据

o_ar,	//向右传输行加法器输出
o_ad	//向下输出列加法器输出
);
input	wire							i_rst;
input	wire							i_clk;

input	wire							i_vld;
input	wire signed [7:0]				i_da;
input	wire signed [7:0]				i_db;

input	wire							i_ce;
input	wire signed [ADDER_WIDTH-1:0]	i_dc;

output	wire							o_vld;
output	wire signed [ADDER_WIDTH:0]		o_dat;
//=============================================================================
initial begin
end
//=============================================================================
//P1
reg	p1_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p1_vld <= 1'B0; else p1_vld <= i_vld;

reg signed[ADDER_WIDTH-1:0]	p1_sel;
always @(posedge i_clk) if(i_ce) p1_sel	<= 32'H0; else p1_sel <= i_dc;
//=============================================================================
//P2

//=============================================================================
wire signed[15:0]	p3_mult;
ip_mult_s8 mult(.clock(i_clk),	.dataa(i_da),	.datab(i_db),	.result(p3_mult));
//=============================================================================

always @(posedge i_clk or negedge i_rst)
	if(!i_rst) begin
		
	end else begin
		
	end
//=============================================================================
endmodule