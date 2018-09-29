

 /*
标准格式，用于IEEE754，转换
1	符号位
8	指数位，无符号数
16	有效数字，无符号数		支持规约数和非规约数，其中隐含1个整数位

支持		类别				正负号	实际指数	有偏移指数	指数域		尾数域					数值
✔		零				0		-127	0			0000 0000	0 0000 0000 0000 0000	0.0
✔		负零				1		-127	0			0000 0000	0 0000 0000 0000 0000	−0.0
✔		1				0		0		127			0111 1111	0 0000 0000 0000 0000	1.0
✔		-1				1		0		127			0111 1111	0 0000 0000 0000 0000	−1.0
✔		最小的非规约数		*		-126	0			0000 0000	0 0000 0000 0000 0001	±2× 2= ±2≈ ±1.4×10
✔		中间大小的非规约数	*		-126	0			0000 0000	1 0000 0000 0000 0000	±2× 2= ±2≈ ±5.88×10
✔		最大的非规约数		*		-126	0			0000 0000	1 1111 1111 1111 1111	±(1−2) × 2≈ ±1.18×10
✔		最小的规约数		*		-126	1			0000 0001	0 0000 0000 0000 0000	±2≈ ±1.18×10
✔		最大的规约数		*		127		254			1111 1110	1 1111 1111 1111 1111	±(2−2) × 2≈ ±3.4×10
✘		正无穷			0		128		255			1111 1111	0 0000 0000 0000 0000	+∞
✘		负无穷			1		128		255			1111 1111	0 0000 0000 0000 0000	−∞
✘		NaN				*		128		255			1111 1111	non zero				NaN

自定格式
1	符号位
8	指数位，有符号数 定义为实际指数
17	有效数字，有符号数	带1个bit整数位， 隐含使用整个数的符号位
*/
module sfp_std2slf
(
i_clk,
i_rst,
i_req,
i_dat,

o_vld,
o_dat
);
input				i_clk;
input				i_rst;

input				i_req;
input[31:0]			i_dat;

output				o_vld;
output[25:0]		o_dat;
//==================================
reg			p1_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p1_vld <= 1'B0; else p1_vld <= i_req;
wire				p1_sig_pre;
wire	[7:0]		p1_exp_pre;
wire	[23:0]		p1_fra_pre;

assign	p1_sig_pre = i_dat[31];
assign	p1_exp_pre = i_dat[30:23];
assign	p1_fra_pre = {|i_dat[30:23], i_dat[22:0]};

reg		[7:0]	p1_exp;
reg			[24:0]	p1_fra;
always @(posedge i_clk) begin
	p1_exp	<= p1_exp_pre;
	p1_fra	<= {p1_sig_pre, p1_sig_pre ? ~p1_fra_pre+1 : p1_fra_pre};
end

assign	o_vld = p1_vld;
assign	o_dat = {p1_fra[24], p1_exp[7:0], p1_fra[23:7]};

endmodule


