

module sfp_mult
(
i_rst,
i_clk,

i_req,
i_da,
i_db,

o_vld,
o_do
);
input				i_rst;
input				i_clk;
input				i_req;
input	[25:0]		i_da;
input	[25:0]		i_db;

output				o_vld;
output	[25:0]		o_do;
//P1===========================================================================
wire [7:0]	p1_exp_a_pre, p1_exp_b_pre;
assign	p1_exp_a_pre = i_da[24:17];
assign	p1_exp_b_pre = i_db[24:17];

wire signed	[17:0]	p1_fra_a_pre, p1_fra_b_pre;
assign	p1_fra_a_pre = $signed({i_da[25],i_da[16:0]});
assign	p1_fra_b_pre = $signed({i_db[25],i_db[16:0]});

wire[35:0]	p3_fra_mult;
ip_mult_s18 mult(.CLK(i_clk), .A(p1_fra_a_pre), .B(p1_fra_b_pre), .P(p3_fra_mult));

reg					p1_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p1_vld<=1'B0; else p1_vld<=i_req;
reg [8:0]			p1_exp_val;
reg signed	[17:0]	p1_fra_a,
					p1_fra_b;
always @(posedge i_clk) begin
	p1_exp_val	<= p1_exp_a_pre + p1_exp_b_pre;
	p1_fra_a	<= p1_fra_a_pre;
	p1_fra_b	<= p1_fra_b_pre;
end
//P2===========================================================================
reg					p2_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p2_vld<=1'B0; else p2_vld<=p1_vld;
reg	[8:0]	p2_exp_val;
reg [7:0]	p2_shift_a, p2_shift_b;
always @(posedge i_clk) p2_exp_val	<= p1_exp_val - 8'D127;
//P3===========================================================================
reg					p3_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p3_vld<=1'B0; else p3_vld<=p2_vld;
reg	[8:0]	p3_exp_val;
always @(posedge i_clk) p3_exp_val <= p2_exp_val;
//P4===========================================================================
reg signed	[17:0]	p4_fra_val;
reg			[8:0]	p4_exp_val;
reg					p4_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p4_vld<=1'B0; else p4_vld <= p3_vld;
//乘数均有16bit小数，积有32位小数，丢掉其中16位小数，直接取结果中的[35:16]
always @(posedge i_clk) begin
	casex(p3_fra_mult[35:33])
		3'B000,3'B111: begin
			p4_fra_val	<= {p3_fra_mult[35],p3_fra_mult[32:16]};//无进位
			p4_exp_val	<= p3_exp_val;
		end
		3'B001,4'B110: begin
			p4_fra_val	<={p3_fra_mult[35],p3_fra_mult[33:17]};//进1位
			p4_exp_val	<= p3_exp_val + 8'D1;
		end
		3'B01X,4'B10X: begin
			p4_fra_val	<={p3_fra_mult[35],p3_fra_mult[34:18]};//进2位
			p4_exp_val	<= p3_exp_val + 8'D2;
		end
	endcase
end

//溢出检查
assign	o_vld = p4_vld;
assign	o_do = {p4_fra_val[17], p4_exp_val[7:0], p4_fra_val[16:0]};

endmodule


