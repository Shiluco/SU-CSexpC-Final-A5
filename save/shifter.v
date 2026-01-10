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
// CREATED		"Mon Nov 10 15:46:41 2025"

module shifter(
	// Control signals
	Rin,
	Lin,
	Ain,
	Bin,
	Cin,
	Din,
	Ein,
	// Input data
	A_bus,
	// Output data
	Szero,
	Sone,
	Stwo,
	Sthree,
	Sfour,
	Sfive,
	Ssix,
	Sseven,
	Seight,
	Snine,
	SA,
	SB,
	SC,
	SD,
	SE,
	SF,
	// Output flag
	Cf
);


// Control signals
input wire	Rin;
input wire	Lin;
input wire	Ain;
input wire	Bin;
input wire	Cin;
input wire	Din;
input wire	Ein;

// Input data
input wire [15:0]	A_bus;

// Output data
output wire	Szero;
output wire	Sone;
output wire	Stwo;
output wire	Sthree;
output wire	Sfour;
output wire	Sfive;
output wire	Ssix;
output wire	Sseven;
output wire	Seight;
output wire	Snine;
output wire	SA;
output wire	SB;
output wire	SC;
output wire	SD;
output wire	SE;
output wire	SF;

// Output flag
output wire	Cf;

// Unpack A_bus to internal signals
wire	Azero;
wire	Aone;
wire	Atwo;
wire	Athree;
wire	Afour;
wire	Afive;
wire	Asix;
wire	Aseven;
wire	Aeight;
wire	Anine;
wire	AA;
wire	AB;
wire	AC;
wire	AD;
wire	AE;
wire	AF;

assign	Azero = A_bus[0];
assign	Aone = A_bus[1];
assign	Atwo = A_bus[2];
assign	Athree = A_bus[3];
assign	Afour = A_bus[4];
assign	Afive = A_bus[5];
assign	Asix = A_bus[6];
assign	Aseven = A_bus[7];
assign	Aeight = A_bus[8];
assign	Anine = A_bus[9];
assign	AA = A_bus[10];
assign	AB = A_bus[11];
assign	AC = A_bus[12];
assign	AD = A_bus[13];
assign	AE = A_bus[14];
assign	AF = A_bus[15];

// Internal wires
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
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;

assign	Cf = SYNTHESIZED_WIRE_41;



assign	SYNTHESIZED_WIRE_24 = Rin & Atwo;

assign	SYNTHESIZED_WIRE_0 = Rin & Afour;

assign	SYNTHESIZED_WIRE_1 = Atwo & Lin;

assign	Sthree = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_3 = Athree & Lin;

assign	SYNTHESIZED_WIRE_2 = Rin & Afive;

assign	Sfour = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_4 = Rin & Asix;

assign	SYNTHESIZED_WIRE_33 = Rin & Aone;

assign	SYNTHESIZED_WIRE_5 = Afour & Lin;

assign	SYNTHESIZED_WIRE_25 = Azero & Lin;

assign	SYNTHESIZED_WIRE_30 = AF & Ain;

assign	Sfive = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_6 = Rin & Aseven;

assign	SYNTHESIZED_WIRE_7 = Afive & Lin;

assign	Ssix = SYNTHESIZED_WIRE_6 | SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_8 = Rin & Aeight;

assign	SYNTHESIZED_WIRE_9 = Asix & Lin;

assign	Sseven = SYNTHESIZED_WIRE_8 | SYNTHESIZED_WIRE_9;

assign	SYNTHESIZED_WIRE_10 = Rin & Anine;

assign	SYNTHESIZED_WIRE_11 = Aseven & Lin;

assign	Seight = SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11;

assign	SYNTHESIZED_WIRE_12 = Rin & AA;

assign	SYNTHESIZED_WIRE_13 = Aeight & Lin;

assign	Snine = SYNTHESIZED_WIRE_12 | SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_14 = Rin & AB;

assign	SYNTHESIZED_WIRE_15 = Anine & Lin;

assign	SA = SYNTHESIZED_WIRE_14 | SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_16 = Rin & AC;

assign	SYNTHESIZED_WIRE_17 = AA & Lin;

assign	SB = SYNTHESIZED_WIRE_16 | SYNTHESIZED_WIRE_17;

assign	SYNTHESIZED_WIRE_18 = Rin & AD;

assign	SYNTHESIZED_WIRE_19 = AB & Lin;

assign	SC = SYNTHESIZED_WIRE_18 | SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_20 = Rin & AE;

assign	SYNTHESIZED_WIRE_21 = AC & Lin;

assign	SD = SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_22 = Rin & AF;

assign	SYNTHESIZED_WIRE_23 = AD & Lin;

assign	SE = SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_23;

assign	SYNTHESIZED_WIRE_27 = AE & Cin;

assign	SYNTHESIZED_WIRE_28 = Azero & Din;

assign	SYNTHESIZED_WIRE_32 = AF & Bin;

assign	Sone = SYNTHESIZED_WIRE_24 | SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_40 = Aone & Lin;

assign	SYNTHESIZED_WIRE_39 = Rin & Athree;

assign	SYNTHESIZED_WIRE_29 = Rin & Ein & SYNTHESIZED_WIRE_41;

assign	SF = SYNTHESIZED_WIRE_27 | SYNTHESIZED_WIRE_28 | SYNTHESIZED_WIRE_29 | SYNTHESIZED_WIRE_30;

assign	SYNTHESIZED_WIRE_34 = SYNTHESIZED_WIRE_41 & Ein & Lin;

assign	Szero = SYNTHESIZED_WIRE_32 | SYNTHESIZED_WIRE_33 | SYNTHESIZED_WIRE_34;

assign	SYNTHESIZED_WIRE_41 = SYNTHESIZED_WIRE_35 | SYNTHESIZED_WIRE_36 | SYNTHESIZED_WIRE_37;

assign	SYNTHESIZED_WIRE_37 = SYNTHESIZED_WIRE_38 & Lin & AF;

assign	SYNTHESIZED_WIRE_35 = Ain & Lin & AE;

assign	SYNTHESIZED_WIRE_36 = Rin & Azero;

assign	SYNTHESIZED_WIRE_38 =  ~Ain;

assign	Stwo = SYNTHESIZED_WIRE_39 | SYNTHESIZED_WIRE_40;


endmodule
