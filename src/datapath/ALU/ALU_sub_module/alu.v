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
// CREATED		"Sat Jan 10 20:11:10 2026"

module alu(
	y,
	z,
	u,
	v,
	x,
	b,
	a,
	g,
	c
);


input wire	y;
input wire	z;
input wire	u;
input wire	v;
input wire	x;
input wire	b;
input wire	a;
output wire	g;
output wire	c;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;

assign	c = SYNTHESIZED_WIRE_2;




FA	b2v_inst(
	.a(a),
	.b(SYNTHESIZED_WIRE_0),
	.d(SYNTHESIZED_WIRE_1),
	.c(SYNTHESIZED_WIRE_2),
	.s(SYNTHESIZED_WIRE_3));


selector	b2v_inst16(
	.S(y),
	.X(z),
	.Y(u),
	.output(SYNTHESIZED_WIRE_1));

assign	SYNTHESIZED_WIRE_0 = x ^ b;


selector	b2v_inst19(
	.S(v),
	.X(SYNTHESIZED_WIRE_2),
	.Y(SYNTHESIZED_WIRE_3),
	.output(g));


endmodule
