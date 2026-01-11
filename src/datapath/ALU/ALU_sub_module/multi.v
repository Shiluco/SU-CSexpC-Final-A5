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
// CREATED		"Sat Jan 10 20:14:48 2026"

module multi(
	Sa,
	Sb,
	A,
	B,
	C,
	multiOut
);


input wire	Sa;
input wire	Sb;
input wire	A;
input wire	B;
input wire	C;
output wire	multiOut;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;




assign	SYNTHESIZED_WIRE_0 =  ~Sa;

assign	SYNTHESIZED_WIRE_1 =  ~Sb;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1 & A;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_0 & Sb & B;

assign	SYNTHESIZED_WIRE_4 = Sa & SYNTHESIZED_WIRE_1 & C;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	multiOut = SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_4;


endmodule
