// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 Patches 1.02i SJ Lite Edition"
// CREATED		"Mon Jan 12 03:00:38 2026"

module H4(
	y,
	z,
	CLK,
	CLR,
	x,
	v,
	Sb,
	Sa,
	u,
	aa,
	ab,
	ac,
	ad,
	ae,
	af,
	ag,
	ah,
	ai,
	aj,
	ak,
	al,
	am,
	an,
	ao,
	ap,
	Aout,
	Bout,
	Cout,
	Dout,
	Eout,
	Fout,
	Gout,
	Hout,
	Iout,
	Jout,
	Kout,
	Lout,
	Mout,
	Nout,
	Oout,
	Pout,
	carry,
	overflow
);


input wire	y;
input wire	z;
input wire	CLK;
input wire	CLR;
input wire	x;
input wire	v;
input wire	Sb;
input wire	Sa;
input wire	u;
input wire	aa;
input wire	ab;
input wire	ac;
input wire	ad;
input wire	ae;
input wire	af;
input wire	ag;
input wire	ah;
input wire	ai;
input wire	aj;
input wire	ak;
input wire	al;
input wire	am;
input wire	an;
input wire	ao;
input wire	ap;
output wire	Aout;
output wire	Bout;
output wire	Cout;
output wire	Dout;
output wire	Eout;
output wire	Fout;
output wire	Gout;
output wire	Hout;
output wire	Iout;
output wire	Jout;
output wire	Kout;
output wire	Lout;
output wire	Mout;
output wire	Nout;
output wire	Oout;
output wire	Pout;
output wire	carry;
output wire	overflow;

wire	a;
wire	b;
wire	ba;
wire	bb;
wire	bc;
wire	bd;
wire	be;
wire	bf;
wire	bg;
wire	bh;
wire	bi;
wire	bj;
wire	bk;
wire	bl;
wire	bm;
wire	bn;
wire	bo;
wire	bp;
wire	c;
wire	d;
wire	e;
wire	f;
wire	g;
wire	ga;
wire	gb;
wire	gc;
wire	gd;
wire	ge;
wire	gf;
wire	gg;
wire	gh;
wire	gi;
wire	gj;
wire	gk;
wire	gl;
wire	gm;
wire	gn;
wire	go;
wire	gp;
wire	h;
wire	i;
wire	j;
wire	k;
wire	l;
wire	m;
wire	n;
wire	o;
wire	p;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;

assign	carry = SYNTHESIZED_WIRE_14;
assign	SYNTHESIZED_WIRE_0 = 1;
assign	SYNTHESIZED_WIRE_1 = 0;




sixteen_register	b2v_inst(
	.Ea(SYNTHESIZED_WIRE_0),
	.R_W(SYNTHESIZED_WIRE_1),
	.D15(gp),
	.D14(go),
	.D13(gn),
	.D12(gm),
	.D11(gl),
	.D10(gk),
	.D9(gj),
	.D8(gi),
	.D7(gh),
	.D6(gg),
	.D5(gf),
	.D4(ge),
	.D3(gd),
	.D2(gc),
	.D1(gb),
	.D0(ga),
	.CLK(CLK),
	.CLR(CLR),
	.Q15(bp),
	
	.Q14(bo),
	
	.Q13(bn),
	
	.Q12(bm),
	
	.Q11(bl),
	
	.Q10(bk),
	
	.Q9(bj),
	
	.Q8(bi),
	
	.Q7(bh),
	
	.Q6(bg),
	
	.Q5(bf),
	
	.Q4(be),
	
	.Q3(bd),
	
	.Q2(bc),
	
	.Q1(bb),
	
	.Q0(ba)
	);


alu	b2v_inst10(
	.x(x),
	.b(bi),
	.v(v),
	.a(i),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_2),
	.g(gi),
	.c(SYNTHESIZED_WIRE_3));


alu	b2v_inst11(
	.x(x),
	.b(bj),
	.v(v),
	.a(j),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_3),
	.g(gj),
	.c(SYNTHESIZED_WIRE_4));


alu	b2v_inst12(
	.x(x),
	.b(bk),
	.v(v),
	.a(k),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_4),
	.g(gk),
	.c(SYNTHESIZED_WIRE_5));


alu	b2v_inst13(
	.x(x),
	.b(bl),
	.v(v),
	.a(l),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_5),
	.g(gl),
	.c(SYNTHESIZED_WIRE_6));


alu	b2v_inst14(
	.x(x),
	.b(bm),
	.v(v),
	.a(m),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_6),
	.g(gm),
	.c(SYNTHESIZED_WIRE_7));


alu	b2v_inst15(
	.x(x),
	.b(bn),
	.v(v),
	.a(n),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_7),
	.g(gn),
	.c(SYNTHESIZED_WIRE_8));


alu	b2v_inst16(
	.x(x),
	.b(bo),
	.v(v),
	.a(o),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_8),
	.g(go),
	.c(SYNTHESIZED_WIRE_19));


alu	b2v_inst2(
	.x(x),
	.b(ba),
	.v(v),
	.a(a),
	.y(y),
	.z(z),
	.u(u),
	.g(ga),
	.c(SYNTHESIZED_WIRE_10));


alu	b2v_inst26(
	.x(x),
	.b(bp),
	.v(v),
	.a(p),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_19),
	.g(gp),
	.c(SYNTHESIZED_WIRE_14));




alu	b2v_inst3(
	.x(x),
	.b(bb),
	.v(v),
	.a(b),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_10),
	.g(gb),
	.c(SYNTHESIZED_WIRE_11));


multi	b2v_inst34(
	.Sa(Sa),
	.Sb(Sb),
	.A(a),
	.B(ba),
	.C(ga),
	.multiOut(Aout));


multi	b2v_inst35(
	.Sa(Sa),
	.Sb(Sb),
	.A(b),
	.B(bb),
	.C(gb),
	.multiOut(Bout));


multi	b2v_inst36(
	.Sa(Sa),
	.Sb(Sb),
	.A(c),
	.B(bc),
	.C(gc),
	.multiOut(Cout));


multi	b2v_inst37(
	.Sa(Sa),
	.Sb(Sb),
	.A(d),
	.B(bd),
	.C(gd),
	.multiOut(Dout));


multi	b2v_inst38(
	.Sa(Sa),
	.Sb(Sb),
	.A(e),
	.B(be),
	.C(ge),
	.multiOut(Eout));


multi	b2v_inst39(
	.Sa(Sa),
	.Sb(Sb),
	.A(f),
	.B(bf),
	.C(gf),
	.multiOut(Fout));


alu	b2v_inst4(
	.x(x),
	.b(bc),
	.v(v),
	.a(c),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_11),
	.g(gc),
	.c(SYNTHESIZED_WIRE_12));


multi	b2v_inst40(
	.Sa(Sa),
	.Sb(Sb),
	.A(g),
	.B(bg),
	.C(gg),
	.multiOut(Gout));


multi	b2v_inst41(
	.Sa(Sa),
	.Sb(Sb),
	.A(h),
	.B(bh),
	.C(gh),
	.multiOut(Hout));


multi	b2v_inst42(
	.Sa(Sa),
	.Sb(Sb),
	.A(i),
	.B(bi),
	.C(gi),
	.multiOut(Iout));


multi	b2v_inst43(
	.Sa(Sa),
	.Sb(Sb),
	.A(j),
	.B(bj),
	.C(gj),
	.multiOut(Jout));


multi	b2v_inst44(
	.Sa(Sa),
	.Sb(Sb),
	.A(k),
	.B(bk),
	.C(gk),
	.multiOut(Kout));


multi	b2v_inst45(
	.Sa(Sa),
	.Sb(Sb),
	.A(l),
	.B(bl),
	.C(gl),
	.multiOut(Lout));


multi	b2v_inst46(
	.Sa(Sa),
	.Sb(Sb),
	.A(m),
	.B(bm),
	.C(gm),
	.multiOut(Mout));


multi	b2v_inst47(
	.Sa(Sa),
	.Sb(Sb),
	.A(n),
	.B(bn),
	.C(gn),
	.multiOut(Nout));


multi	b2v_inst48(
	.Sa(Sa),
	.Sb(Sb),
	.A(o),
	.B(bo),
	.C(go),
	.multiOut(Oout));


multi	b2v_inst49(
	.Sa(Sa),
	.Sb(Sb),
	.A(p),
	.B(bp),
	.C(gp),
	.multiOut(Pout));


alu	b2v_inst5(
	.x(x),
	.b(bd),
	.v(v),
	.a(d),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_12),
	.g(gd),
	.c(SYNTHESIZED_WIRE_15));

assign	overflow = SYNTHESIZED_WIRE_19 ^ SYNTHESIZED_WIRE_14;


alu	b2v_inst6(
	.x(x),
	.b(be),
	.v(v),
	.a(e),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_15),
	.g(ge),
	.c(SYNTHESIZED_WIRE_16));


alu	b2v_inst7(
	.x(x),
	.b(bf),
	.v(v),
	.a(f),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_16),
	.g(gf),
	.c(SYNTHESIZED_WIRE_17));


alu	b2v_inst8(
	.x(x),
	.b(bg),
	.v(v),
	.a(g),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_17),
	.g(gg),
	.c(SYNTHESIZED_WIRE_18));


alu	b2v_inst9(
	.x(x),
	.b(bh),
	.v(v),
	.a(h),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_18),
	.g(gh),
	.c(SYNTHESIZED_WIRE_2));

assign	a = aa;
assign	p = ap;
assign	o = ao;
assign	n = an;
assign	m = am;
assign	l = al;
assign	k = ak;
assign	j = aj;
assign	i = ai;
assign	h = ah;
assign	g = ag;
assign	f = af;
assign	e = ae;
assign	d = ad;
assign	c = ac;
assign	b = ab;

endmodule
