
 /*
标准格式，用于IEEE754，转换
1	符号位
8	指数位，无符号数
23	有效数字，无符号数		支持规约数和非规约数，其中隐含1个整数位

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
module sfp_slf2std
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
input[25:0]			i_dat;
output 				o_vld;
output [31:0]		o_dat;
//===========================
wire signed [17:0]	p1_fra_pre;
assign				p1_fra_pre = {i_dat[25],i_dat[16:0]};
wire	[7:0]		p1_exp_pre;
assign				p1_exp_pre = i_dat[24:17];

reg					p1_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p1_vld<=1'B0; else p1_vld<=i_req;

reg					p1_sig;
reg			[16:0]	p1_fra;
reg			[7:0]	p1_exp;

always @(posedge i_clk) begin
	p1_vld			<= i_req;
	p1_sig			<= p1_fra_pre[17];
	p1_exp			<= p1_exp_pre;
	p1_fra			<= p1_fra_pre[17] ? ~p1_fra_pre[16:0]+1'B1 : p1_fra_pre[16:0];
end
//重新定位有效位
reg					p2_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p2_vld<=1'B0; else p2_vld<=p1_vld;

reg					p2_sig,
					p2_zero;
reg			[16:0]	p2_fra;
reg			[7:0]	p2_exp;
reg			[4:0]	p2_shift;
always @(posedge i_clk) begin
	p2_sig	<= p1_sig;
	p2_exp	<= p1_exp;
	p2_fra	<= p1_fra;
	casex(p1_fra)
		17'B1_XXXX_XXXX_XXXX_XXXX:	begin p2_shift <= 5'D0;		p2_zero <= 1'B0; end
		17'B0_1XXX_XXXX_XXXX_XXXX:	begin p2_shift <= 5'D1;		p2_zero <= 1'B0; end
		17'B0_01XX_XXXX_XXXX_XXXX:	begin p2_shift <= 5'D2;		p2_zero <= 1'B0; end
		17'B0_001X_XXXX_XXXX_XXXX:	begin p2_shift <= 5'D3;		p2_zero <= 1'B0; end
		17'B0_0001_XXXX_XXXX_XXXX:	begin p2_shift <= 5'D4;		p2_zero <= 1'B0; end
		17'B0_0000_1XXX_XXXX_XXXX:	begin p2_shift <= 5'D5;		p2_zero <= 1'B0; end
		17'B0_0000_01XX_XXXX_XXXX:	begin p2_shift <= 5'D6;		p2_zero <= 1'B0; end
		17'B0_0000_001X_XXXX_XXXX:	begin p2_shift <= 5'D7;		p2_zero <= 1'B0; end
		17'B0_0000_0001_XXXX_XXXX:	begin p2_shift <= 5'D8;		p2_zero <= 1'B0; end
		17'B0_0000_0000_1XXX_XXXX:	begin p2_shift <= 5'D9;		p2_zero <= 1'B0; end
		17'B0_0000_0000_01XX_XXXX:	begin p2_shift <= 5'HA;		p2_zero <= 1'B0; end
		17'B0_0000_0000_001X_XXXX:	begin p2_shift <= 5'HB;		p2_zero <= 1'B0; end
		17'B0_0000_0000_0001_XXXX:	begin p2_shift <= 5'HC;		p2_zero <= 1'B0; end
		17'B0_0000_0000_0000_1XXX:	begin p2_shift <= 5'HD;		p2_zero <= 1'B0; end
		17'B0_0000_0000_0000_01XX:	begin p2_shift <= 5'HE;		p2_zero <= 1'B0; end
		17'B0_0000_0000_0000_001X:	begin p2_shift <= 5'HF;		p2_zero <= 1'B0; end
		17'B0_0000_0000_0000_0001:	begin p2_shift <= 5'H1F;	p2_zero <= 1'B0; end
		17'B0_0000_0000_0000_0000:	begin p2_shift <= 5'H0;		p2_zero <= 1'B1; end
	endcase
end
//检查级数是否溢出，上溢定义为正负无穷, 下溢为非规约数或零
reg	p3_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p3_vld<=1'B0; else p3_vld<=p2_vld;

reg			p3_sig;
reg[16:0]	p3_fra;
reg[7:0]	p3_exp;
reg[4:0]	p3_shift;
always @(posedge i_clk) begin
	if(p2_zero)	p3_sig	<= 1'B0;
	else		p3_sig	<= p2_sig;
	p3_fra				<= p2_fra;
	if(p2_zero) begin
		p3_exp		<= 8'H0;
		p3_shift	<= 5'H0;
	end else begin
		if(p2_exp>p2_shift) begin
			p3_shift	<= p2_shift;
			p3_exp		<= p2_exp - p2_shift;
		end else begin
			p3_shift	<= p2_shift - p2_exp;
			p3_exp		<= 9'D0;
		end
	end
end

//移动小数点
reg			p4_vld;
always @(posedge i_clk or negedge i_rst) if(!i_rst) p4_vld<=1'B0; else p4_vld<=p3_vld;

reg			p4_sig;
reg[15:0]	p4_fra;
reg[7:0]	p4_exp;
always @(posedge i_clk) begin
	p4_sig	<= p3_sig;
	p4_fra	<= p3_fra<<p3_shift;
	p4_exp	<= p3_exp;
end

assign o_vld = p4_vld;
assign o_dat = {p4_sig,p4_exp,p4_fra,7'H0};

endmodule


