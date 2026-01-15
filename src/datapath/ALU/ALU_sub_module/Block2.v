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
// CREATED		"Sat Jan 10 20:12:14 2026"

module Block2(
	x3input,
	x2input,
	x1input,
	x0input,
	zero,
	one,
	two,
	three,
	four,
	five,
	six,
	x3out,
	x2out,
	x1out,
	x0out
);


input wire	x3input;
input wire	x2input;
input wire	x1input;
input wire	x0input;
output wire	zero;
output wire	one;
output wire	two;
output wire	three;
output wire	four;
output wire	five;
output wire	six;
output wire	x3out;
output wire	x2out;
output wire	x1out;
output wire	x0out;

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

assign	x3out = SYNTHESIZED_WIRE_0;
assign	x2out = SYNTHESIZED_WIRE_1;
assign	x1out = SYNTHESIZED_WIRE_2;
assign	x0out = SYNTHESIZED_WIRE_3;




sevenSegments	b2v_inst(
	.x3(SYNTHESIZED_WIRE_0),
	.x2(SYNTHESIZED_WIRE_1),
	.x1(SYNTHESIZED_WIRE_2),
	.x0(SYNTHESIZED_WIRE_3),
	.zero(SYNTHESIZED_WIRE_4),
	.one(SYNTHESIZED_WIRE_7),
	.two(SYNTHESIZED_WIRE_8),
	.three(SYNTHESIZED_WIRE_9),
	.four(SYNTHESIZED_WIRE_10),
	.five(SYNTHESIZED_WIRE_5),
	.six(SYNTHESIZED_WIRE_6));

assign	zero =  ~SYNTHESIZED_WIRE_4;

assign	five =  ~SYNTHESIZED_WIRE_5;

assign	six =  ~SYNTHESIZED_WIRE_6;

assign	one =  ~SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_0 =  ~x3input;

assign	SYNTHESIZED_WIRE_1 =  ~x2input;

assign	SYNTHESIZED_WIRE_2 =  ~x1input;

assign	SYNTHESIZED_WIRE_3 =  ~x0input;

assign	two =  ~SYNTHESIZED_WIRE_8;

assign	three =  ~SYNTHESIZED_WIRE_9;

assign	four =  ~SYNTHESIZED_WIRE_10;


endmodule
