
module sfp_add
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
input				i_mode;
input	[25:0]		i_da;
input	[25:0]		i_db;

output				o_vld;
output	[25:0]		o_do;
//=============================================================================
//前置准备
wire [7:0]	p0_exp_a,
			p0_exp_b;
assign		p0_exp_a = i_da[24:17];
assign		p0_exp_b = i_db[24:17];

wire signed[17:0]	p0_fra_a,
					p0_fra_b;
assign	p0_fra_a = $signed({i_da[25],i_da[16:0]});
assign	p0_fra_b = $signed({i_db[25],i_db[16:0]});
//=============================================================================
//P1
reg signed	[17:0]	p1_fra_a, p1_fra_b;
reg	[7:0]			p1_exp_a, p1_exp_b;
reg					p1_mode,  p1_vld, p1_ge;

always @(posedge i_clk or negedge i_rst) if(!i_rst) p1_vld<=1'B0; else p1_vld<=i_req;
always @(posedge i_clk)
	if(i_req) begin
		p1_fra_a 		<= p0_fra_a;
		p1_exp_a 		<= p0_exp_a;
		p1_fra_b 		<= p0_fra_b;
		p1_exp_b 		<= p0_exp_b;
		p1_mode			<= i_mode;
		p1_ge			<= p1_exp_a > p1_exp_b;
	end

endmodule


