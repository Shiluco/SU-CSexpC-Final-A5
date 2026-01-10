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
// CREATED		"Mon Jan 05 08:39:40 2026"

module ALU(
	// Control signals
	CLK,
	CLR,
	x,
	y,
	z,
	v,
	u,
	Sa,
	Sb,
	// Input data A (16-bit)
	A_bus,
	// Output data (16-bit)
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
	// Status flags
	carry,
	overflow
);


// Control signals
input wire	CLK;
input wire	CLR;
input wire	x;
input wire	y;
input wire	z;
input wire	v;
input wire	u;
input wire	Sa;
input wire	Sb;

// Input data A (16-bit)
input wire [15:0]	A_bus;

// Output data (16-bit)
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

// Status flags
output wire	carry;
output wire	overflow;

// Internal wires - A bus signals
wire	a;
wire	b;
wire	c;
wire	d;
wire	e;
wire	f;
wire	g;
wire	h;
wire	i;
wire	j;
wire	k;
wire	l;
wire	m;
wire	n;
wire	o;
wire	p;

// Internal wires - B bus signals (from register)
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

// Internal wires - ALU output signals
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

// Internal wires - Synthesized signals
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;

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
	.Output(Aout));


multi	b2v_inst35(
	.Sa(Sa),
	.Sb(Sb),
	.A(b),
	.B(bb),
	.C(gb),
	.Output(Bout));


multi	b2v_inst36(
	.Sa(Sa),
	.Sb(Sb),
	.A(c),
	.B(bc),
	.C(gc),
	.Output(Cout));


multi	b2v_inst37(
	.Sa(Sa),
	.Sb(Sb),
	.A(d),
	.B(bd),
	.C(gd),
	.Output(Dout));


multi	b2v_inst38(
	.Sa(Sa),
	.Sb(Sb),
	.A(e),
	.B(be),
	.C(ge),
	.Output(Eout));


multi	b2v_inst39(
	.Sa(Sa),
	.Sb(Sb),
	.A(f),
	.B(bf),
	.C(gf),
	.Output(Fout));


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
	.Output(Gout));


multi	b2v_inst41(
	.Sa(Sa),
	.Sb(Sb),
	.A(h),
	.B(bh),
	.C(gh),
	.Output(Hout));


multi	b2v_inst42(
	.Sa(Sa),
	.Sb(Sb),
	.A(i),
	.B(bi),
	.C(gi),
	.Output(Iout));


multi	b2v_inst43(
	.Sa(Sa),
	.Sb(Sb),
	.A(j),
	.B(bj),
	.C(gj),
	.Output(Jout));


multi	b2v_inst44(
	.Sa(Sa),
	.Sb(Sb),
	.A(k),
	.B(bk),
	.C(gk),
	.Output(Kout));


multi	b2v_inst45(
	.Sa(Sa),
	.Sb(Sb),
	.A(l),
	.B(bl),
	.C(gl),
	.Output(Lout));


multi	b2v_inst46(
	.Sa(Sa),
	.Sb(Sb),
	.A(m),
	.B(bm),
	.C(gm),
	.Output(Mout));


multi	b2v_inst47(
	.Sa(Sa),
	.Sb(Sb),
	.A(n),
	.B(bn),
	.C(gn),
	.Output(Nout));


multi	b2v_inst48(
	.Sa(Sa),
	.Sb(Sb),
	.A(o),
	.B(bo),
	.C(go),
	.Output(Oout));


multi	b2v_inst49(
	.Sa(Sa),
	.Sb(Sb),
	.A(p),
	.B(bp),
	.C(gp),
	.Output(Pout));


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

// Unpack A_bus to internal signals
assign	a = A_bus[0];
assign	b = A_bus[1];
assign	c = A_bus[2];
assign	d = A_bus[3];
assign	e = A_bus[4];
assign	f = A_bus[5];
assign	g = A_bus[6];
assign	h = A_bus[7];
assign	i = A_bus[8];
assign	j = A_bus[9];
assign	k = A_bus[10];
assign	l = A_bus[11];
assign	m = A_bus[12];
assign	n = A_bus[13];
assign	o = A_bus[14];
assign	p = A_bus[15];


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

endmodule
