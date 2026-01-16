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
// CREATED		"Thu Jan 08 15:10:25 2026"

module run(
	START,
	ILLEGAL,
	FF0,
	KITECK,
	RESET_N,
	IF0D,
	AUXI6,
	EX0,
	HLT,
	NOMAL,
	MSTEP,
	CKSTEP,
	CK,
	stopped
);


input wire	START;
input wire	ILLEGAL;
input wire	FF0;
input wire	KITECK;
input wire	RESET_N;
input wire	IF0D;
input wire	AUXI6;
input wire	EX0;
input wire	HLT;
input wire	NOMAL;
input wire	MSTEP;
input wire	CKSTEP;
output wire	CK;
output wire	stopped;

reg	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
reg	JKFF_32;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
reg	START_prev;	// START信号の前の値を保持（エッジ検出用）
wire	START_EDGE;	// START信号の立ち上がりエッジ検出

assign	SYNTHESIZED_WIRE_0 = 1;
assign	SYNTHESIZED_WIRE_1 = 1;
assign	SYNTHESIZED_WIRE_3 = 1;
assign	SYNTHESIZED_WIRE_4 = 1;
assign	SYNTHESIZED_WIRE_8 = 0;



assign	SYNTHESIZED_WIRE_13 = CKSTEP & SYNTHESIZED_WIRE_17;

assign	SYNTHESIZED_WIRE_12 = MSTEP & IF0D;

assign	SYNTHESIZED_WIRE_11 = EX0 & HLT & NOMAL;

assign	SYNTHESIZED_WIRE_10 = AUXI6 & NOMAL & IF0D;

// START信号の立ち上がりエッジ検出
assign	START_EDGE = START & ~START_prev;

always@(posedge KITECK or negedge SYNTHESIZED_WIRE_1 or negedge SYNTHESIZED_WIRE_0)
begin
if (!SYNTHESIZED_WIRE_1)
	begin
	JKFF_32 <= 0;
	START_prev <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_0)
	begin
	JKFF_32 <= 1;
	START_prev <= 0;
	end
else
	begin
	START_prev <= START;	// START信号の前の値を保持
	JKFF_32 <= ~JKFF_32 & START_EDGE | JKFF_32 & ~SYNTHESIZED_WIRE_2;
	end
	end
end




always@(posedge SYNTHESIZED_WIRE_7 or negedge SYNTHESIZED_WIRE_4 or negedge SYNTHESIZED_WIRE_3)
begin
if (!SYNTHESIZED_WIRE_4)
	begin
	SYNTHESIZED_WIRE_17 <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_3)
	begin
	SYNTHESIZED_WIRE_17 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_17 <= ~SYNTHESIZED_WIRE_17 & SYNTHESIZED_WIRE_18 | SYNTHESIZED_WIRE_17 & ~SYNTHESIZED_WIRE_5;
	end
	end
end

assign	CK = SYNTHESIZED_WIRE_17 & KITECK;

assign	SYNTHESIZED_WIRE_7 =  ~KITECK;

assign	SYNTHESIZED_WIRE_9 =  ~RESET_N;

assign	stopped =  ~SYNTHESIZED_WIRE_17;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_8 | SYNTHESIZED_WIRE_9 | SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11 | SYNTHESIZED_WIRE_12 | SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_16 = FF0 & ILLEGAL;


assign	SYNTHESIZED_WIRE_5 =  ~SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_18 = JKFF_32 & SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_15 =  ~SYNTHESIZED_WIRE_16;


endmodule
