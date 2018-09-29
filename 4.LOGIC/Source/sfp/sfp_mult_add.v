
// A*B+C
module sfp_mult_add
(
i_rst,
i_clk,

i_req,
i_da,
i_db,
i_dc,

o_vld,
o_do
);

input				i_rst;
input				i_clk;
input				i_req;
input	[25:0]		i_da;
input	[25:0]		i_db;
input	[25:0]		i_dc;

output				o_vld;
output	[25:0]		o_do;
//=============================================================================
wire signed[17:0]	p1_fra_a_pre,
					p1_fra_b_pre,
					p1_fra_c_pre;
assign	p1_fra_a_pre = {i_da[25], i_da[16:0]};
assign	p1_fra_b_pre = {i_db[25], i_db[16:0]};
assign	p1_fra_c_pre = {i_dc[25], i_dc[16:0]};

wire signed[7:0]	p1_exp_a_pre,
					p1_exp_b_pre,
					p1_exp_c_pre;
assign	p1_exp_a_pre = i_da[24:17];
assign	p1_exp_b_pre = i_da[24:17];
assign	p1_exp_c_pre = i_da[24:17];

wire signed [35:0]	p3_fra_mult;
ip_mult_s18 mult
(
	.CLK(i_clk),
	.A(p1_fra_a_pre),
	.B(p1_fra_b_pre),
	.P(p3_fra_mult)
);
//=============================================================================
reg					p1_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p1_vld<=1'B0; else p1_vld<=i_req;

reg signed	[17:0]	p1_fra_c;
reg			[7:0]	p1_exp_c;
reg			[8:0]	p1_exp_mult;
always @(posedge i_clk) begin
	p1_fra_c 	<= p1_fra_c_pre;
	p1_exp_c	<= p1_exp_c_pre;
	p1_exp_mult	<= p1_exp_a_pre + p1_exp_b_pre;
end
//=============================================================================
reg					p2_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p2_vld<=1'B0; else p2_vld<=p1_vld;

reg signed	[17:0]	p2_fra_c;
reg			[7:0]	p2_exp_c;
reg			[8:0]	p2_exp_mult;
always @(posedge i_clk) begin
	p2_fra_c 	<= p1_fra_c;
	p2_exp_c	<= p1_exp_c;
	p2_exp_mult <= p1_exp_mult - 8'D127;
end
//=============================================================================
reg					p3_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p3_vld<=1'B0; else p3_vld <= p2_vld;

reg signed	[17:0]	p3_fra_c;
reg			[7:0]	p3_exp_c;
reg					p3_exp_ge;
reg			[8:0]	p3_exp_mult;
always @(posedge i_clk) begin
	if(p2_exp_mult > p2_exp_c)	p3_exp_ge <= 1'B1;
	else 						p3_exp_ge <= 1'B0;
	p3_exp_mult	<= p2_exp_mult;
	p3_fra_c 	<= p2_fra_c;
	p3_exp_c	<= p2_exp_c;
end
//=============================================================================
reg					p4_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p4_vld<=1'B0; else p4_vld<=p3_vld;
//乘数均有16bit小数，积有32位小数，丢掉其中16位小数，直接取结果中的[35:16]
reg			[8:0]	p4_exp_shift;
reg			[8:0]	p4_exp_val;
reg					p4_exp_ge;
reg signed [17:0]	p4_fra_c;
reg signed [19:0]	p4_fra_mult;
always @(posedge i_clk) begin
	if(p3_exp_ge) begin
		p4_exp_val		<= p3_exp_mult;
		p4_exp_shift	<= p3_exp_mult - p3_exp_c;
	end else begin
		p4_exp_val		<= p3_exp_c;
		p4_exp_shift	<= p3_exp_c - p3_exp_mult;
	end
	p4_fra_mult			<= p3_fra_mult[35:16];
	p4_fra_c			<= p3_fra_c;
	p4_exp_ge			<= p3_exp_ge;
end
//=============================================================================
//移位
reg					p5_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p5_vld<=1'B0; else p5_vld<=p4_vld;

reg signed [17:0]	p5_fra_c;
reg signed [19:0]	p5_fra_mult;
reg signed [8:0]	p5_exp_val;
always @(posedge i_clk) begin
	p5_exp_val		<= p4_exp_val;
	if(p4_exp_ge) begin
		p5_fra_c	<= p4_fra_c >>> p4_exp_shift;
		p5_fra_mult <= p4_fra_mult;
	end else begin
		p5_fra_c	<= p4_fra_c;
		p5_fra_mult	<= p4_fra_mult >>> p4_exp_shift;
	end
end
//=============================================================================
//计算和
reg		p6_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p6_vld<=1'B0; else p6_vld<=p5_vld;

reg signed [20:0]	p6_fra_val;
reg			[8:0]	p6_exp_val;
always @(posedge i_clk) begin
	p6_exp_val	<= p5_exp_val;
	p6_fra_val	<= p5_fra_c + p5_fra_mult;
end
//=============================================================================
//重新定位小数点 1 
reg		p7_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p7_vld <= 1'B0; else p7_vld <= p6_vld;

reg			[4:0]	p7_clv;
reg signed	[17:0]	p7_fra_val;
reg			[8:0]	p7_exp_val;
always @(posedge i_clk) begin
	
	casex(p6_fra_val[20:17])
		5'B1_0XXX, 5'B0_1XXX: begin p7_fra_val<= p6_fra_val[20:3];  p7_exp_val <= p6_exp_val + 2'H3; end
		5'B1_10XX, 5'B0_01XX: begin p7_fra_val<= p6_fra_val[19:2];  p7_exp_val <= p6_exp_val + 2'H2; end
		5'B1_110X, 5'B0_001X: begin p7_fra_val<= p6_fra_val[18:1];  p7_exp_val <= p6_exp_val + 2'H1; end
		5'B1_1110, 5'B0_0001: begin p7_fra_val<= p6_fra_val[17:0];  p7_exp_val <= p6_exp_val; 		 end
	endcase
	
	casex(p6_fra_val[20:10])//先判断前11bit
		11'B10X_XXXX_XXXX, 11'B01X_XXXX_XXXX: p7_clv <= 5'H00;
		11'B110_XXXX_XXXX, 11'B001_XXXX_XXXX: p7_clv <= 5'H00;
		11'B111_0XXX_XXXX, 11'B000_1XXX_XXXX: p7_clv <= 5'H00;
		11'B111_10XX_XXXX, 11'B000_01XX_XXXX: p7_clv <= 5'H00;
		
		11'B111_110X_XXXX, 11'B000_001X_XXXX: p7_clv <= 5'H01;
		11'B111_1110_XXXX, 11'B000_0001_XXXX: p7_clv <= 5'H02;
		11'B111_1111_0XXX, 11'B000_0000_1XXX: p7_clv <= 5'H03;
		11'B111_1111_10XX, 11'B000_0000_01XX: p7_clv <= 5'H04;
		11'B111_1111_110X, 11'B000_0000_001X: p7_clv <= 5'H05;
		11'B111_1111_1110, 11'B000_0000_0001: p7_clv <= 5'H06;
		11'B111_1111_1111, 11'B000_0000_0000: p7_clv <= 5'H17;
	endcase
end
//=============================================================================
//重新定位小数点 2
reg		p8_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p8_vld <= 1'B0; else p8_vld <= p7_vld;

reg			[4:0]	p8_clv;
reg signed	[17:0]	p8_fra_val;
reg			[8:0]	p8_exp_val;
always @(posedge i_clk) begin
	p8_fra_val	<= p7_fra_val <<< p7_clv[3:0];
	p8_exp_val	<= p7_exp_val - p7_clv[3:0];
	
	casex({p7_fra_val[17], p7_fra_val[9:0]})//再判断11bit
		11'B10X_XXXX_XXXX, 11'B01X_XXXX_XXXX: p7_clv <= 5'H00;
		11'B110_XXXX_XXXX, 11'B001_XXXX_XXXX: p7_clv <= 5'H00;
		11'B111_0XXX_XXXX, 11'B000_1XXX_XXXX: p7_clv <= 5'H00;
		11'B111_10XX_XXXX, 11'B000_01XX_XXXX: p7_clv <= 5'H00;
		
		11'B111_110X_XXXX, 11'B000_001X_XXXX: p7_clv <= 5'H01;
		11'B111_1110_XXXX, 11'B000_0001_XXXX: p7_clv <= 5'H02;
		11'B111_1111_0XXX, 11'B000_0000_1XXX: p7_clv <= 5'H03;
		11'B111_1111_10XX, 11'B000_0000_01XX: p7_clv <= 5'H04;
		11'B111_1111_110X, 11'B000_0000_001X: p7_clv <= 5'H05;
		11'B111_1111_1110, 11'B000_0000_0001: p7_clv <= 5'H06;
		11'B111_1111_1111, 11'B000_0000_0000: p7_clv <= 5'H17;
	endcase
end
//=============================================================================
assign	o_vld = p7_vld;
assign	o_do = {p7_fra_val[17], p7_exp_val[7:0], p7_fra_val[16:0]};

endmodule


