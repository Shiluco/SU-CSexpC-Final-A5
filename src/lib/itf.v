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
// CREATED		"Sat Jan 10 10:57:51 2026"

module itf(
	KIT,
	SVC,
	RIT,
	IT0,
	RESET_N,
	IT2,
	KITECK,
	EX0,
	EX1,
	EIT_input,
	ITA,
	ITF,
	OIT,
	EIT
);


input wire	KIT;
input wire	SVC;
input wire	RIT;
input wire	IT0;
input wire	RESET_N;
input wire	IT2;
input wire	KITECK;
input wire	EX0;
input wire	EX1;
input wire	EIT_input;
output wire	ITA;
output wire	ITF;
output wire	OIT;
output wire	EIT;

reg	SYNTHESIZED_WIRE_20;
reg	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_9;
reg	JKFF_6;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_19;

assign	ITF = JKFF_6;
assign	OIT = SYNTHESIZED_WIRE_20;
assign	EIT = SYNTHESIZED_WIRE_21;
assign	SYNTHESIZED_WIRE_4 = 1;
assign	SYNTHESIZED_WIRE_5 = 1;
assign	SYNTHESIZED_WIRE_10 = 1;
assign	SYNTHESIZED_WIRE_11 = 1;
assign	SYNTHESIZED_WIRE_13 = 1;
assign	SYNTHESIZED_WIRE_14 = 1;




assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_21;

assign	ITA = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_17 =  ~SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_7 = SVC & EX1;

assign	SYNTHESIZED_WIRE_9 = RIT & EX0;


always@(posedge KITECK or negedge SYNTHESIZED_WIRE_5 or negedge SYNTHESIZED_WIRE_4)
begin
if (!SYNTHESIZED_WIRE_5)
	begin
	SYNTHESIZED_WIRE_21 <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_4)
	begin
	SYNTHESIZED_WIRE_21 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_21 <= ~SYNTHESIZED_WIRE_21 & EIT_input | SYNTHESIZED_WIRE_21 & ~SYNTHESIZED_WIRE_6;
	end
	end
end

assign	SYNTHESIZED_WIRE_16 = IT0 | SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_9;

assign	SYNTHESIZED_WIRE_1 =  ~JKFF_6;




always@(posedge KITECK or negedge SYNTHESIZED_WIRE_11 or negedge SYNTHESIZED_WIRE_10)
begin
if (!SYNTHESIZED_WIRE_11)
	begin
	SYNTHESIZED_WIRE_20 <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_10)
	begin
	SYNTHESIZED_WIRE_20 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_20 <= ~SYNTHESIZED_WIRE_20 & KIT | SYNTHESIZED_WIRE_20 & ~SYNTHESIZED_WIRE_12;
	end
	end
end



assign	SYNTHESIZED_WIRE_22 =  ~RESET_N;



always@(posedge KITECK or negedge SYNTHESIZED_WIRE_14 or negedge SYNTHESIZED_WIRE_13)
begin
if (!SYNTHESIZED_WIRE_14)
	begin
	JKFF_6 <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_13)
	begin
	JKFF_6 <= 1;
	end
else
	begin
	JKFF_6 <= ~JKFF_6 & SYNTHESIZED_WIRE_16 | JKFF_6 & ~SYNTHESIZED_WIRE_15;
	end
	end
end

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_20 & SYNTHESIZED_WIRE_17 & IT2;

assign	SYNTHESIZED_WIRE_19 = SYNTHESIZED_WIRE_21 & IT2;

assign	SYNTHESIZED_WIRE_6 = SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_19;


endmodule
