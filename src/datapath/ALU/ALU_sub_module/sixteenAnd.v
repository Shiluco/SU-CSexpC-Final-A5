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
// CREATED		"Sat Jan 10 20:22:49 2026"

module sixteenAnd(
	ANDin,
	Zeroand,
	Oneand,
	Twoand,
	Threeand,
	Fourand,
	Fiveand,
	Sixand,
	Sevenand,
	Eightand,
	Nineand,
	Aand,
	Band,
	Cand,
	Dand,
	Eand,
	Fand,
	ZeroandOut,
	OneandOut,
	TwoandOut,
	ThreeandOut,
	FourandOut,
	FiveandOut,
	SixandOut,
	SevenandOut,
	EightandOut,
	NineandOut,
	AandOut,
	BandOut,
	CandOut,
	DandOut,
	EandOut,
	FandOut
);


input wire	ANDin;
input wire	Zeroand;
input wire	Oneand;
input wire	Twoand;
input wire	Threeand;
input wire	Fourand;
input wire	Fiveand;
input wire	Sixand;
input wire	Sevenand;
input wire	Eightand;
input wire	Nineand;
input wire	Aand;
input wire	Band;
input wire	Cand;
input wire	Dand;
input wire	Eand;
input wire	Fand;
output wire	ZeroandOut;
output wire	OneandOut;
output wire	TwoandOut;
output wire	ThreeandOut;
output wire	FourandOut;
output wire	FiveandOut;
output wire	SixandOut;
output wire	SevenandOut;
output wire	EightandOut;
output wire	NineandOut;
output wire	AandOut;
output wire	BandOut;
output wire	CandOut;
output wire	DandOut;
output wire	EandOut;
output wire	FandOut;





assign	ZeroandOut = ANDin & Zeroand;

assign	NineandOut = ANDin & Nineand;

assign	AandOut = ANDin & Aand;

assign	BandOut = ANDin & Band;

assign	CandOut = ANDin & Cand;

assign	DandOut = ANDin & Dand;

assign	EandOut = ANDin & Eand;

assign	FandOut = ANDin & Fand;

assign	OneandOut = ANDin & Oneand;

assign	TwoandOut = ANDin & Twoand;

assign	ThreeandOut = ANDin & Threeand;

assign	FourandOut = ANDin & Fourand;

assign	FiveandOut = ANDin & Fiveand;

assign	SixandOut = ANDin & Sixand;

assign	SevenandOut = ANDin & Sevenand;

assign	EightandOut = ANDin & Eightand;


endmodule
