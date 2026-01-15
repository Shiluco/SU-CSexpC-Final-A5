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
// CREATED		"Sat Jan 10 20:23:28 2026"

module sixteenMUX(
	MUXsw,
	Zero_Ain,
	Zero_Bin,
	One_Ain,
	One_Bin,
	Two_Ain,
	Two_Bin,
	Three_Ain,
	Three_Bin,
	Four_Ain,
	Four_Bin,
	Five_Ain,
	Five_Bin,
	Six_Ain,
	Six_Bin,
	Seven_Ain,
	Seven_Bin,
	Eight_Ain,
	Eight_Bin,
	Nine_Ain,
	Nine_Bin,
	A_Ain,
	A_Bin,
	B_Ain,
	B_Bin,
	C_Bin,
	D_Bin,
	E_Ain,
	E_Bin,
	F_Ain,
	F_Bin,
	D_Ain,
	C_Ain,
	ZeromuxOut,
	OnemuxOut,
	TwomuxOut,
	ThreemuxOut,
	FourmuxOut,
	FivemuxOut,
	SixmuxOut,
	SevenmuxOut,
	EightmuxOut,
	NinemuxOut,
	AmuxOut,
	BmuxOut,
	CmuxOut,
	DmuxOut,
	EmuxOut,
	FmuxOut
);


input wire	MUXsw;
input wire	Zero_Ain;
input wire	Zero_Bin;
input wire	One_Ain;
input wire	One_Bin;
input wire	Two_Ain;
input wire	Two_Bin;
input wire	Three_Ain;
input wire	Three_Bin;
input wire	Four_Ain;
input wire	Four_Bin;
input wire	Five_Ain;
input wire	Five_Bin;
input wire	Six_Ain;
input wire	Six_Bin;
input wire	Seven_Ain;
input wire	Seven_Bin;
input wire	Eight_Ain;
input wire	Eight_Bin;
input wire	Nine_Ain;
input wire	Nine_Bin;
input wire	A_Ain;
input wire	A_Bin;
input wire	B_Ain;
input wire	B_Bin;
input wire	C_Bin;
input wire	D_Bin;
input wire	E_Ain;
input wire	E_Bin;
input wire	F_Ain;
input wire	F_Bin;
input wire	D_Ain;
input wire	C_Ain;
output wire	ZeromuxOut;
output wire	OnemuxOut;
output wire	TwomuxOut;
output wire	ThreemuxOut;
output wire	FourmuxOut;
output wire	FivemuxOut;
output wire	SixmuxOut;
output wire	SevenmuxOut;
output wire	EightmuxOut;
output wire	NinemuxOut;
output wire	AmuxOut;
output wire	BmuxOut;
output wire	CmuxOut;
output wire	DmuxOut;
output wire	EmuxOut;
output wire	FmuxOut;






multi	b2v_inst(
	.Sa(MUXsw),
	.Sb(1'b0),
	.A(Zero_Ain),
	.B(Zero_Bin),
	.C(1'b0),
	.multiOut(ZeromuxOut));


multi	b2v_inst10(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(Nine_Ain),
	.B(Nine_Bin),
	.multiOut(NinemuxOut));


multi	b2v_inst11(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(A_Ain),
	.B(A_Bin),
	.multiOut(AmuxOut));


multi	b2v_inst12(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(B_Ain),
	.B(B_Bin),
	.multiOut(BmuxOut));


multi	b2v_inst13(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(C_Ain),
	.B(C_Bin),
	.multiOut(CmuxOut));


multi	b2v_inst14(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(D_Ain),
	.B(D_Bin),
	.multiOut(DmuxOut));


multi	b2v_inst15(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(E_Ain),
	.B(E_Bin),
	.multiOut(EmuxOut));


multi	b2v_inst16(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(F_Ain),
	.B(F_Bin),
	.multiOut(FmuxOut));


multi	b2v_inst2(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(One_Ain),
	.B(One_Bin),
	.multiOut(OnemuxOut));


multi	b2v_inst3(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(Two_Ain),
	.B(Two_Bin),
	.multiOut(TwomuxOut));


multi	b2v_inst4(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(Three_Ain),
	.B(Three_Bin),
	.multiOut(ThreemuxOut));


multi	b2v_inst5(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(Four_Ain),
	.B(Four_Bin),
	.multiOut(FourmuxOut));


multi	b2v_inst6(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(Five_Ain),
	.B(Five_Bin),
	.multiOut(FivemuxOut));


multi	b2v_inst7(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(Six_Ain),
	.B(Six_Bin),
	.multiOut(SixmuxOut));


multi	b2v_inst8(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(Seven_Ain),
	.B(Seven_Bin),
	.multiOut(SevenmuxOut));


multi	b2v_inst9(
	.Sa(MUXsw),
	.Sb(1'b0),
	.C(1'b0),
	.A(Eight_Ain),
	.B(Eight_Bin),
	.multiOut(EightmuxOut));


endmodule
