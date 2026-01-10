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
// CREATED		"Sat Jan 10 20:22:21 2026"

module sixteenALU(
	u,
	y,
	z,
	x,
	v,
	alu_zeroBin,
	alu_zeroAin,
	alu_oneBin,
	alu_oneAin,
	alu_twoBin,
	alu_twoAin,
	alu_threeBin,
	alu_threeAin,
	alu_fourBin,
	alu_fourAin,
	alu_fiveBin,
	alu_fiveAin,
	alu_sixBin,
	alu_sixAin,
	alu_sevenBin,
	alu_sevenAin,
	alu_eightBin,
	alu_eightAin,
	alu_nineBin,
	alu_nineAin,
	alu_aBin,
	alu_aAin,
	alu_bBin,
	alu_bAin,
	alu_cBin,
	alu_cAin,
	alu_dBin,
	alu_dAin,
	alu_eBin,
	alu_eAin,
	alu_fBin,
	alu_fAin,
	carry,
	overflow,
	alu_zeroOut,
	alu_oneOut,
	alu_twoOut,
	alu_threeOut,
	alu_fourOut,
	alu_fiveOut,
	alu_sixOut,
	alu_sevenOut,
	alu_eightOut,
	alu_nineOut,
	alu_aOut,
	alu_bOut,
	alu_cOut,
	alu_dOut,
	alu_eOut,
	alu_fOut
);


input wire	u;
input wire	y;
input wire	z;
input wire	x;
input wire	v;
input wire	alu_zeroBin;
input wire	alu_zeroAin;
input wire	alu_oneBin;
input wire	alu_oneAin;
input wire	alu_twoBin;
input wire	alu_twoAin;
input wire	alu_threeBin;
input wire	alu_threeAin;
input wire	alu_fourBin;
input wire	alu_fourAin;
input wire	alu_fiveBin;
input wire	alu_fiveAin;
input wire	alu_sixBin;
input wire	alu_sixAin;
input wire	alu_sevenBin;
input wire	alu_sevenAin;
input wire	alu_eightBin;
input wire	alu_eightAin;
input wire	alu_nineBin;
input wire	alu_nineAin;
input wire	alu_aBin;
input wire	alu_aAin;
input wire	alu_bBin;
input wire	alu_bAin;
input wire	alu_cBin;
input wire	alu_cAin;
input wire	alu_dBin;
input wire	alu_dAin;
input wire	alu_eBin;
input wire	alu_eAin;
input wire	alu_fBin;
input wire	alu_fAin;
output wire	carry;
output wire	overflow;
output wire	alu_zeroOut;
output wire	alu_oneOut;
output wire	alu_twoOut;
output wire	alu_threeOut;
output wire	alu_fourOut;
output wire	alu_fiveOut;
output wire	alu_sixOut;
output wire	alu_sevenOut;
output wire	alu_eightOut;
output wire	alu_nineOut;
output wire	alu_aOut;
output wire	alu_bOut;
output wire	alu_cOut;
output wire	alu_dOut;
output wire	alu_eOut;
output wire	alu_fOut;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;

assign	carry = SYNTHESIZED_WIRE_12;




alu	b2v_inst10(
	.x(x),
	.b(alu_eightBin),
	.v(v),
	.a(alu_eightAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_0),
	.g(alu_eightOut),
	.c(SYNTHESIZED_WIRE_1));


alu	b2v_inst11(
	.x(x),
	.b(alu_nineBin),
	.v(v),
	.a(alu_nineAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_1),
	.g(alu_nineOut),
	.c(SYNTHESIZED_WIRE_2));


alu	b2v_inst12(
	.x(x),
	.b(alu_aBin),
	.v(v),
	.a(alu_aAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_2),
	.g(alu_aOut),
	.c(SYNTHESIZED_WIRE_3));


alu	b2v_inst13(
	.x(x),
	.b(alu_bBin),
	.v(v),
	.a(alu_bAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_3),
	.g(alu_bOut),
	.c(SYNTHESIZED_WIRE_4));


alu	b2v_inst14(
	.x(x),
	.b(alu_cBin),
	.v(v),
	.a(alu_cAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_4),
	.g(alu_cOut),
	.c(SYNTHESIZED_WIRE_5));


alu	b2v_inst15(
	.x(x),
	.b(alu_dBin),
	.v(v),
	.a(alu_dAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_5),
	.g(alu_dOut),
	.c(SYNTHESIZED_WIRE_6));


alu	b2v_inst16(
	.x(x),
	.b(alu_eBin),
	.v(v),
	.a(alu_eAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_6),
	.g(alu_eOut),
	.c(SYNTHESIZED_WIRE_17));


alu	b2v_inst2(
	.x(x),
	.b(alu_zeroBin),
	.v(v),
	.a(alu_zeroAin),
	.y(y),
	.z(z),
	.u(u),
	.g(alu_zeroOut),
	.c(SYNTHESIZED_WIRE_8));


alu	b2v_inst26(
	.x(x),
	.b(alu_fBin),
	.v(v),
	.a(alu_fAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_17),
	.g(alu_fOut),
	.c(SYNTHESIZED_WIRE_12));


alu	b2v_inst3(
	.x(x),
	.b(alu_oneBin),
	.v(v),
	.a(alu_oneAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_8),
	.g(alu_oneOut),
	.c(SYNTHESIZED_WIRE_9));


alu	b2v_inst4(
	.x(x),
	.b(alu_twoBin),
	.v(v),
	.a(alu_twoAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_9),
	.g(alu_twoOut),
	.c(SYNTHESIZED_WIRE_10));


alu	b2v_inst5(
	.x(x),
	.b(alu_threeBin),
	.v(v),
	.a(alu_threeAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_10),
	.g(alu_threeOut),
	.c(SYNTHESIZED_WIRE_13));

assign	overflow = SYNTHESIZED_WIRE_17 ^ SYNTHESIZED_WIRE_12;


alu	b2v_inst6(
	.x(x),
	.b(alu_fourBin),
	.v(v),
	.a(alu_fourAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_13),
	.g(alu_fourOut),
	.c(SYNTHESIZED_WIRE_14));


alu	b2v_inst7(
	.x(x),
	.b(alu_fiveBin),
	.v(v),
	.a(alu_fiveAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_14),
	.g(alu_fiveOut),
	.c(SYNTHESIZED_WIRE_15));


alu	b2v_inst8(
	.x(x),
	.b(alu_sixBin),
	.v(v),
	.a(alu_sixAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_15),
	.g(alu_sixOut),
	.c(SYNTHESIZED_WIRE_16));


alu	b2v_inst9(
	.x(x),
	.b(alu_sevenBin),
	.v(v),
	.a(alu_sevenAin),
	.y(y),
	.z(z),
	.u(SYNTHESIZED_WIRE_16),
	.g(alu_sevenOut),
	.c(SYNTHESIZED_WIRE_0));


endmodule
