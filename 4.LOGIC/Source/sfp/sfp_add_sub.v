

/*
自定格式
1	符号位
8	指数位，带符号数 -127 ～ 127 定义为实际级数 0～254，-128 为特殊值
17	有效数字，不带符号位的，有符号数，取整个数的符号位， BIT16 为整数位
*/

`include "config.vh"

module sfp_add_sub
(
i_rst,
i_clk,

i_req,
i_mode,	//运算模式 :0 da+db; 1:da-db
i_da,
i_db,

o_vld,
o_do
);

input				i_rst;
input				i_clk;
input				i_req;
input				i_mode;
input	[25:0]		i_da;
input	[25:0]		i_db;

output				o_vld;
output	[25:0]		o_do;
//=============================================================================
wire [7:0]	p1_exp_a_pre,
			p1_exp_b_pre;
assign		p1_exp_a_pre = i_da[24:17];
assign		p1_exp_b_pre = i_db[24:17];

wire signed[17:0]	p1_fra_a_pre,
					p1_fra_b_pre;
assign	p1_fra_a_pre = $signed({i_da[25],i_da[16:0]});
assign	p1_fra_b_pre = $signed({i_db[25],i_db[16:0]});

reg signed	[17:0]	p1_fra_a, p1_fra_b;
reg	[7:0]			p1_exp_a, p1_exp_b, p1_exp_shift;
reg					p1_mode,  p1_vld, p1_ge;

always @(posedge i_clk or negedge i_rst) if(!i_rst) p1_vld<=1'B0; else p1_vld<=i_req;
always @(posedge i_clk)
	if(i_req) begin
		p1_fra_a 		<= p1_fra_a_pre;
		p1_exp_a 		<= p1_exp_a_pre;
		p1_fra_b 		<= p1_fra_b_pre;
		p1_exp_b 		<= p1_exp_b_pre;
		p1_mode			<= i_mode;
		p1_ge			<= p1_exp_a_pre > p1_exp_b_pre;
	end

//指数差
reg p2_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p2_vld<=1'B0; else p2_vld<=p1_vld;

reg			[7:0]	p2_exp_val;
reg			[7:0]	p2_exp_shift;
reg signed	[17:0]	p2_fra_a,
					p2_fra_b;
reg					p2_mode,
					p2_ge;
always @(posedge i_clk) begin
	p2_fra_a		<= p1_fra_a;
	p2_fra_b		<= p1_fra_b;
	p2_mode			<= p1_mode;
	p2_ge			<= p1_ge;
	if(p1_ge) begin
		p2_exp_shift<= p1_exp_a - p1_exp_b;
		p2_exp_val	<= p1_exp_a;
	end else begin
		p2_exp_shift<= p1_exp_b - p1_exp_a;
		p2_exp_val	<= p1_exp_b;
	end
end
//有效位移位
reg	signed	[17:0]	p3_fra_a,
					p3_fra_b;
reg	[7:0]			p3_exp_val;
reg					p3_vld,
					p3_mode;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p3_vld<=1'B0; else p3_vld<=p2_vld;
always @(posedge i_clk)
begin
	p3_mode			<= p2_mode;
	if(p2_ge) begin
		p3_fra_a	<= p2_fra_a;
		p3_fra_b	<= p2_fra_b>>>p2_exp_shift;
	end else begin
		p3_fra_a	<= p2_fra_a>>>p2_exp_shift;
		p3_fra_b	<= p2_fra_b;
	end
	p3_exp_val		<= p2_exp_val;
end

//有效位计算
reg	signed [18:0]	p4_fra_val;
reg [7:0]			p4_exp_val;
reg					p4_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p4_vld<=1'B0; else p4_vld<=p3_vld;
always @(posedge i_clk) begin
	p4_exp_val				<= p3_exp_val;
	if(p3_mode)	p4_fra_val	<= $signed(p3_fra_a) - $signed(p3_fra_b);
	else		p4_fra_val	<= $signed(p3_fra_a) + $signed(p3_fra_b);
end
//小数点重新定位1
reg	signed	[17:0]	p5_fra_val;
reg			[4:0]	p5_clv;
reg 		[7:0]	p5_exp_val;
reg					p5_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p5_vld<=1'B0; else p5_vld<=p4_vld;
always @(posedge i_clk) begin
	
	if(p4_fra_val[18] == p4_fra_val[17]) begin
		p5_fra_val	<= p4_fra_val[17:0];
		p5_exp_val	<= p4_exp_val;
	end else begin
		p5_fra_val	<= p4_fra_val[18:1];
		p5_exp_val	<= p4_exp_val + 1'B1;
	end
	casex(p4_fra_val[18:9])//先判断高10bit
		10'B10_XXXX_XXXX, 10'B01_XXXX_XXXX: p5_clv <= 5'H00;
		10'B11_0XXX_XXXX, 10'B00_1XXX_XXXX: p5_clv <= 5'H00;
		10'B11_10XX_XXXX, 10'B00_01XX_XXXX: p5_clv <= 5'H01;
		10'B11_110X_XXXX, 10'B00_001X_XXXX: p5_clv <= 5'H02;
		10'B11_1110_XXXX, 10'B00_0001_XXXX: p5_clv <= 5'H03;
		10'B11_1111_0XXX, 10'B00_0000_1XXX: p5_clv <= 5'H04;
		10'B11_1111_10XX, 10'B00_0000_01XX: p5_clv <= 5'H05;
		10'B11_1111_110X, 10'B00_0000_001X: p5_clv <= 5'H06;
		10'B11_1111_1110, 10'B00_0000_0001: p5_clv <= 5'H07;
		10'B11_1111_1111, 10'B00_0000_0000: p5_clv <= 5'H18;
	endcase
end

//小数点重新定位2
reg					p6_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p6_vld<=1'B0; else p6_vld <= p5_vld;
reg	signed	[17:0]	p6_fra_val;
reg 		[8:0]	p6_exp_val;
reg			[4:0]	p6_clv;
reg					p6_shift_vld;
always @(posedge i_clk) begin
	p6_fra_val		<= p5_fra_val <<< p5_clv[3:0];
	p6_exp_val		<= p5_exp_val - p5_clv[3:0];
	p6_shift_vld	<= p5_clv[4];
	casex({p5_fra_val[17], p5_fra_val[8:0]})//再判断10bit
		10'B10_XXXX_XXXX, 10'B01_XXXX_XXXX:	p6_clv <= 5'H00;
		10'B11_0XXX_XXXX, 10'B00_1XXX_XXXX: p6_clv <= 5'H01;
		10'B11_10XX_XXXX, 10'B00_01XX_XXXX: p6_clv <= 5'H02;
		10'B11_110X_XXXX, 10'B00_001X_XXXX: p6_clv <= 5'H03;
		10'B11_1110_XXXX, 10'B00_0001_XXXX: p6_clv <= 5'H04;
		10'B11_1111_0XXX, 10'B00_0000_1XXX: p6_clv <= 5'H05;
		10'B11_1111_10XX, 10'B00_0000_01XX: p6_clv <= 5'H06;
		10'B11_1111_110X, 10'B00_0000_001X: p6_clv <= 5'H07;
		10'B11_1111_1110, 10'B00_0000_0001: p6_clv <= 5'H08;
		10'B11_1111_1111, 10'B00_0000_0000: p6_clv <= 5'H19;
	endcase
end

//小数点重新定位3
reg					p7_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p7_vld<=1'B0; else p7_vld <= p6_vld;
reg	signed	[17:0]	p7_fra_val;
reg 		[8:0]	p7_exp_val;
always @(posedge i_clk) begin
	casex({p6_shift_vld, p6_clv[4], p6_fra_val[17]})
		3'B0XX			:	begin
								p7_fra_val <= p6_fra_val;
								p7_exp_val <= p6_exp_val;
							end
		3'B10X, 3'B101	:	begin
								p7_fra_val <= p6_fra_val << p6_clv[3:0];
								p7_exp_val <= p6_exp_val - p6_clv[3:0];
							end
		3'B110			:	begin
								p7_fra_val <= 18'H0;
								p7_exp_val <= 8'H0;
							end
	endcase
end

`ifdef CONFIG_SFP_CHECK_OVERFLOW

`else
	assign	o_vld	= p7_vld;
	assign	o_do	= {|p7_exp_val[7:0] ? p7_fra_val[17]: 1'B0, p7_exp_val[7:0], |p7_exp_val[7:0] ? p7_fra_val[16:0]:17'H0};
`endif

endmodule


