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
// MODIFIED		"Mon Jan 14 2026" - Removed B register and multiplexers

module H4(
	y,
	z,
	x,
	v,
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
	ba,
	bb,
	bc,
	bd,
	be,
	bf,
	bg,
	bh,
	bi,
	bj,
	bk,
	bl,
	bm,
	bn,
	bo,
	bp,
	ALU_result_bus,
	carry,
	overflow
);


input wire	y;
input wire	z;
input wire	x;
input wire	v;
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
input wire	ba;
input wire	bb;
input wire	bc;
input wire	bd;
input wire	be;
input wire	bf;
input wire	bg;
input wire	bh;
input wire	bi;
input wire	bj;
input wire	bk;
input wire	bl;
input wire	bm;
input wire	bn;
input wire	bo;
input wire	bp;
output wire	[15:0] ALU_result_bus;
output wire	carry;
output wire	overflow;

wire	a;
wire	b;
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
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;

assign	carry = SYNTHESIZED_WIRE_14;


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
	.c(SYNTHESIZED_WIRE_18));


 alu	b2v_inst16(
	.x(x),
	.b(bo),
	.v(v),
	.a(o),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_18),
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
	.c(SYNTHESIZED_WIRE_0));


 alu	b2v_inst9(
	.x(x),
	.b(bh),
	.v(v),
	.a(h),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_0),
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

// 16-bit bus output
assign	ALU_result_bus = {gp, go, gn, gm, gl, gk, gj, gi, gh, gg, gf, ge, gd, gc, gb, ga};

endmodule
