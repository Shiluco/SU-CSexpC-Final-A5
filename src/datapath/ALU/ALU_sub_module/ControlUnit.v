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
// CREATED		"Thu Jan 15 19:32:33 2026"

module ControlUnit(
	inTWO,
	inTHREE,
	inFOUR,
	inCF,
	inQZero,
	Rst,
	inQLK,
	outReset,
	outCF,
	AndOne,
	AndTwo,
	aluXU,
	outCLK,
	MUX_Right,
	RegA_RW,
	RegQ_RW,
	fixOne,
	fixZero,
	CounterIN
);


input wire	inTWO;
input wire	inTHREE;
input wire	inFOUR;
input wire	inCF;
input wire	inQZero;
input wire	Rst;
input wire	inQLK;
output wire	outReset;
output wire	outCF;
output wire	AndOne;
output wire	AndTwo;
output wire	aluXU;
output wire	outCLK;
output wire	MUX_Right;
output wire	RegA_RW;
output wire	RegQ_RW;
output wire	fixOne;
output wire	fixZero;
output wire	CounterIN;

wire	NotRst;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;

assign	outCF = inCF;
assign	outCLK = inQLK;
assign	fixOne = 1;
assign	fixZero = 0;
assign	MUX_Right = SYNTHESIZED_WIRE_12;



assign	SYNTHESIZED_WIRE_20 =  ~inTWO;

assign	AndOne = SYNTHESIZED_WIRE_0 & NotRst;

assign	AndTwo = inTWO & NotRst;

assign	aluXU = SYNTHESIZED_WIRE_1 & NotRst;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_2 & NotRst;

assign	SYNTHESIZED_WIRE_18 = SYNTHESIZED_WIRE_20 & inFOUR;

assign	RegA_RW = SYNTHESIZED_WIRE_4 & NotRst;

assign	SYNTHESIZED_WIRE_17 = inTHREE & inFOUR;

assign	SYNTHESIZED_WIRE_22 =  ~inTHREE;

assign	SYNTHESIZED_WIRE_10 = SYNTHESIZED_WIRE_20 & SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_8 = inTWO & inFOUR;

assign	SYNTHESIZED_WIRE_9 = inTWO & SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_8 | SYNTHESIZED_WIRE_9 | SYNTHESIZED_WIRE_10;

assign	RegQ_RW = SYNTHESIZED_WIRE_11 & NotRst;



assign	CounterIN = inQLK & SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_21 =  ~inFOUR;

assign	SYNTHESIZED_WIRE_15 = inQZero & SYNTHESIZED_WIRE_21 & inTWO;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_1 = inTWO & SYNTHESIZED_WIRE_22 & inFOUR;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_17 | SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_2 = inTWO & inTHREE & SYNTHESIZED_WIRE_21;

assign	outReset = NotRst;
assign	NotRst = Rst;

endmodule
