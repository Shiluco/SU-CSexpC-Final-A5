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
// CREATED		"Mon Jan 05 13:45:04 2026"

module ALU_mul(
	A_bus,
	AND1_sw,
	AND2_sw,
	x_in,
	u_in,
	MUX1_sw,
	MUX2_sw,
	A_RW,
	A_CLK,
	A_CLR,
	Q_RW,
	Q_CLK,
	Q_CLR,
	Seg1_zero,
	Seg1_one,
	Seg1_two,
	Seg1_three,
	Seg1_four,
	Seg1_five,
	Seg1_six,
	Seg2_zero,
	Seg2_one,
	Seg2_two,
	Seg2_three,
	Seg2_four,
	Seg2_five,
	Seg2_six,
	Seg3_zero,
	Seg3_one,
	Seg3_two,
	Seg3_three,
	Seg3_four,
	Seg3_five,
	Seg3_six,
	Seg4_zero,
	Seg4_one,
	Seg4_two,
	Seg4_three,
	Seg4_four,
	Seg4_five,
	Seg4_six,
	Seg5_zero,
	Seg5_one,
	Seg5_two,
	Seg5_three,
	Seg5_four,
	Seg5_five,
	Seg5_six,
	Seg6_zero,
	Seg6_one,
	Seg6_two,
	Seg6_three,
	Seg6_four,
	Seg6_five,
	Seg6_six,
	Seg7_zero,
	Seg7_one,
	Seg7_two,
	Seg7_three,
	Seg7_four,
	Seg7_five,
	Seg7_six,
	Seg8_zero,
	Seg8_one,
	Seg8_two,
	Seg8_three,
	Seg8_four,
	Seg8_five,
	Seg8_six,
	alu_carryOut,
	alu_overflowOut,
	Zero_out,
	One_out,
	Two_out,
	Three_out,
	Four_out,
	Five_out,
	Six_out,
	Seven_out,
	Eight_out,
	Nine_out,
	A_out,
	B_out,
	C_out,
	D_out,
	E_out,
	F_out
);


input wire [15:0]	A_bus;
input wire	AND1_sw;
input wire	AND2_sw;
input wire	x_in;
input wire	u_in;
input wire	MUX1_sw;
input wire	MUX2_sw;
input wire	A_RW;
input wire	A_CLK;
input wire	A_CLR;
input wire	Q_RW;
input wire	Q_CLK;
input wire	Q_CLR;
output wire	Seg1_zero;
output wire	Seg1_one;
output wire	Seg1_two;
output wire	Seg1_three;
output wire	Seg1_four;
output wire	Seg1_five;
output wire	Seg1_six;
output wire	Seg2_zero;
output wire	Seg2_one;
output wire	Seg2_two;
output wire	Seg2_three;
output wire	Seg2_four;
output wire	Seg2_five;
output wire	Seg2_six;
output wire	Seg3_zero;
output wire	Seg3_one;
output wire	Seg3_two;
output wire	Seg3_three;
output wire	Seg3_four;
output wire	Seg3_five;
output wire	Seg3_six;
output wire	Seg4_zero;
output wire	Seg4_one;
output wire	Seg4_two;
output wire	Seg4_three;
output wire	Seg4_four;
output wire	Seg4_five;
output wire	Seg4_six;
output wire	Seg5_zero;
output wire	Seg5_one;
output wire	Seg5_two;
output wire	Seg5_three;
output wire	Seg5_four;
output wire	Seg5_five;
output wire	Seg5_six;
output wire	Seg6_zero;
output wire	Seg6_one;
output wire	Seg6_two;
output wire	Seg6_three;
output wire	Seg6_four;
output wire	Seg6_five;
output wire	Seg6_six;
output wire	Seg7_zero;
output wire	Seg7_one;
output wire	Seg7_two;
output wire	Seg7_three;
output wire	Seg7_four;
output wire	Seg7_five;
output wire	Seg7_six;
output wire	Seg8_zero;
output wire	Seg8_one;
output wire	Seg8_two;
output wire	Seg8_three;
output wire	Seg8_four;
output wire	Seg8_five;
output wire	Seg8_six;
output wire	alu_carryOut;
output wire	alu_overflowOut;
output wire	Zero_out;
output wire	One_out;
output wire	Two_out;
output wire	Three_out;
output wire	Four_out;
output wire	Five_out;
output wire	Six_out;
output wire	Seven_out;
output wire	Eight_out;
output wire	Nine_out;
output wire	A_out;
output wire	B_out;
output wire	C_out;
output wire	D_out;
output wire	E_out;
output wire	F_out;

// Unpack A_bus to individual bit signals
wire	Zero_in;
wire	One_in;
wire	Two_in;
wire	Three_in;
wire	Four_in;
wire	Five_in;
wire	Six_in;
wire	Seven_in;
wire	Eight_in;
wire	Nine_in;
wire	A_in;
wire	B_in;
wire	C_in;
wire	D_in;
wire	E_in;
wire	F_in;

assign	Zero_in = A_bus[0];
assign	One_in = A_bus[1];
assign	Two_in = A_bus[2];
assign	Three_in = A_bus[3];
assign	Four_in = A_bus[4];
assign	Five_in = A_bus[5];
assign	Six_in = A_bus[6];
assign	Seven_in = A_bus[7];
assign	Eight_in = A_bus[8];
assign	Nine_in = A_bus[9];
assign	A_in = A_bus[10];
assign	B_in = A_bus[11];
assign	C_in = A_bus[12];
assign	D_in = A_bus[13];
assign	E_in = A_bus[14];
assign	F_in = A_bus[15];

// Zero (bit 0) signals
wire	Zero_And1;
wire	Zero_And2;
wire	Zero_Aregister_o;
wire	zero_mux1;
wire	zero_mux2;
wire	Zero_Qregister_o;
wire	zero_shifter1;
wire	zero_shifter2;

// One (bit 1) signals
wire	One_And1;
wire	One_And2;
wire	One_Aregister_o;
wire	one_mux1;
wire	one_mux2;
wire	One_Qregister_o;
wire	one_shifter1;
wire	one_shifter2;

// Two (bit 2) signals
wire	Two_And1;
wire	Two_And2;
wire	Two_Aregister_o;
wire	two_mux1;
wire	two_mux2;
wire	Two_Qregister_o;
wire	two_shifter1;
wire	two_shifter2;

// Three (bit 3) signals
wire	Three_And1;
wire	Three_And2;
wire	Three_Aregister_o;
wire	three_mux1;
wire	three_mux2;
wire	Three_Qregister_o;
wire	three_shifter1;
wire	three_shifter2;

// Four (bit 4) signals
wire	Four_And1;
wire	Four_And2;
wire	Four_Aregister_o;
wire	four_mux1;
wire	four_mux2;
wire	Four_Qregister_o;
wire	four_shifter1;
wire	four_shifter2;

// Five (bit 5) signals
wire	Five_And1;
wire	Five_And2;
wire	Five_Aregister_o;
wire	five_mux1;
wire	five_mux2;
wire	Five_Qregister_o;
wire	five_shifter1;
wire	five_shifter2;

// Six (bit 6) signals
wire	Six_And1;
wire	Six_And2;
wire	Six_Aregister_o;
wire	six_mux1;
wire	six_mux2;
wire	Six_Qregister_o;
wire	six_shifter1;
wire	six_shifter2;

// Seven (bit 7) signals
wire	Seven_And1;
wire	Seven_And2;
wire	Seven_Aregister_o;
wire	seven_mux1;
wire	seven_mux2;
wire	Seven_Qregister_o;
wire	seven_shifter1;
wire	seven_shifter2;

// Eight (bit 8) signals
wire	Eight_And1;
wire	Eight_And2;
wire	Eight_Aregister_o;
wire	eight_mux1;
wire	eight_mux2;
wire	Eight_Qregister_o;
wire	eight_shifter1;
wire	eight_shifter2;

// Nine (bit 9) signals
wire	Nine_And1;
wire	Nine_And2;
wire	Nine_Aregister_o;
wire	nine_mux1;
wire	nine_mux2;
wire	Nine_Qregister_o;
wire	nine_shifter1;
wire	nine_shifter2;

// A (bit 10) signals
wire	A_And1;
wire	A_And2;
wire	A_Aregister_o;
wire	A_mux1;
wire	A_mux2;
wire	A_Qregister_o;
wire	A_shifter1;
wire	A_shifter2;

// B (bit 11) signals
wire	B_And1;
wire	B_And2;
wire	B_Aregister_o;
wire	B_mux1;
wire	B_mux2;
wire	B_Qregister_o;
wire	B_shifter1;
wire	B_shifter2;

// C (bit 12) signals
wire	C_And1;
wire	C_And2;
wire	C_Aregister_o;
wire	C_mux1;
wire	C_mux2;
wire	C_Qregister_o;
wire	C_shifter1;
wire	C_shifter2;

// D (bit 13) signals
wire	D_And1;
wire	D_And2;
wire	D_Aregister_o;
wire	D_mux1;
wire	D_mux2;
wire	D_Qregister_o;
wire	D_shifter1;
wire	D_shifter2;

// E (bit 14) signals
wire	E_And1;
wire	E_And2;
wire	E_Aregister_o;
wire	E_mux1;
wire	E_mux2;
wire	E_Qregister_o;
wire	E_shifter1;
wire	E_shifter2;

// F (bit 15) signals
wire	F_And1;
wire	F_And2;
wire	F_Aregister_o;
wire	F_mux1;
wire	F_mux2;
wire	F_Qregister_o;
wire	F_shifter1;
wire	F_shifter2;

// ALU output signals
wire	alu_zeroOut;
wire	alu_oneOut;
wire	alu_twoOut;
wire	alu_threeOut;
wire	alu_fourOut;
wire	alu_fiveOut;
wire	alu_sixOut;
wire	alu_sevenOut;
wire	alu_eightOut;
wire	alu_nineOut;
wire	alu_aOut;
wire	alu_bOut;
wire	alu_cOut;
wire	alu_dOut;
wire	alu_eOut;
wire	alu_fOut;
wire	alu_carry_out;
wire	alu_overflow_out;

// Carry signals
wire	carry_shifter1;
wire	Carry_shift2;
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

assign	Zero_out = Zero_in;
assign	One_out = One_in;
assign	Two_out = Two_in;
assign	Three_out = Three_in;
assign	Four_out = Four_in;
assign	Five_out = Five_in;
assign	Six_out = Six_in;
assign	Seven_out = Seven_in;
assign	Eight_out = Eight_in;
assign	Nine_out = Nine_in;
assign	A_out = A_in;
assign	B_out = B_in;
assign	C_out = C_in;
assign	D_out = D_in;
assign	E_out = E_in;
assign	F_out = F_in;
assign	SYNTHESIZED_WIRE_0 = 1;
assign	SYNTHESIZED_WIRE_1 = 1;
assign	SYNTHESIZED_WIRE_2 = 0;
assign	SYNTHESIZED_WIRE_3 = 0;
assign	SYNTHESIZED_WIRE_4 = 1;
assign	SYNTHESIZED_WIRE_5 = 0;
assign	SYNTHESIZED_WIRE_6 = 0;
assign	SYNTHESIZED_WIRE_7 = 0;
assign	SYNTHESIZED_WIRE_8 = 0;
assign	SYNTHESIZED_WIRE_9 = 1;
assign	SYNTHESIZED_WIRE_10 = 0;
assign	SYNTHESIZED_WIRE_11 = 1;
assign	SYNTHESIZED_WIRE_12 = 0;
assign	SYNTHESIZED_WIRE_13 = 0;
assign	SYNTHESIZED_WIRE_14 = 0;
assign	SYNTHESIZED_WIRE_15 = 0;
assign	SYNTHESIZED_WIRE_16 = 1;
assign	SYNTHESIZED_WIRE_17 = 1;
assign	SYNTHESIZED_WIRE_18 = 1;





sevenSegments	b2v_inst1(
	.x3(F_Aregister_o),
	.x2(E_Aregister_o),
	.x1(D_Aregister_o),
	.x0(C_Aregister_o),
	.zero(Seg1_zero),
	.one(Seg1_one),
	.two(Seg1_two),
	.three(Seg1_three),
	.four(Seg1_four),
	.five(Seg1_five),
	.six(Seg1_six));


sevenSegments	b2v_inst10(
	.x3(B_Aregister_o),
	.x2(A_Aregister_o),
	.x1(Nine_Aregister_o),
	.x0(Eight_Aregister_o),
	.zero(Seg2_zero),
	.one(Seg2_one),
	.two(Seg2_two),
	.three(Seg2_three),
	.four(Seg2_four),
	.five(Seg2_five),
	.six(Seg2_six));


sevenSegments	b2v_inst11(
	.x3(Seven_Aregister_o),
	.x2(Six_Aregister_o),
	.x1(Five_Aregister_o),
	.x0(Four_Aregister_o),
	.zero(Seg3_zero),
	.one(Seg3_one),
	.two(Seg3_two),
	.three(Seg3_three),
	.four(Seg3_four),
	.five(Seg3_five),
	.six(Seg3_six));


sevenSegments	b2v_inst12(
	.x3(Three_Aregister_o),
	.x2(Two_Aregister_o),
	.x1(One_Aregister_o),
	.x0(Zero_Aregister_o),
	.zero(Seg4_zero),
	.one(Seg4_one),
	.two(Seg4_two),
	.three(Seg4_three),
	.four(Seg4_four),
	.five(Seg4_five),
	.six(Seg4_six));


sevenSegments	b2v_inst13(
	.x3(F_Qregister_o),
	.x2(E_Qregister_o),
	.x1(D_Qregister_o),
	.x0(C_Qregister_o),
	.zero(Seg5_zero),
	.one(Seg5_one),
	.two(Seg5_two),
	.three(Seg5_three),
	.four(Seg5_four),
	.five(Seg5_five),
	.six(Seg5_six));


sevenSegments	b2v_inst14(
	.x3(B_Qregister_o),
	.x2(A_Qregister_o),
	.x1(Nine_Qregister_o),
	.x0(Eight_Qregister_o),
	.zero(Seg6_zero),
	.one(Seg6_one),
	.two(Seg6_two),
	.three(Seg6_three),
	.four(Seg6_four),
	.five(Seg6_five),
	.six(Seg6_six));


sevenSegments	b2v_inst15(
	.x3(Seven_Qregister_o),
	.x2(Six_Qregister_o),
	.x1(Five_Qregister_o),
	.x0(Four_Qregister_o),
	.zero(Seg7_zero),
	.one(Seg7_one),
	.two(Seg7_two),
	.three(Seg7_three),
	.four(Seg7_four),
	.five(Seg7_five),
	.six(Seg7_six));


sevenSegments	b2v_inst16(
	.x3(Three_Qregister_o),
	.x2(Two_Qregister_o),
	.x1(One_Qregister_o),
	.x0(Zero_Qregister_o),
	.zero(Seg8_zero),
	.one(Seg8_one),
	.two(Seg8_two),
	.three(Seg8_three),
	.four(Seg8_four),
	.five(Seg8_five),
	.six(Seg8_six));



sixteenAnd	b2v_inst18(
	.ANDin(AND2_sw),
	.Zeroand(Zero_in),
	.Oneand(One_in),
	.Twoand(Two_in),
	.Threeand(Three_in),
	.Fourand(Four_in),
	.Fiveand(Five_in),
	.Sixand(Six_in),
	.Sevenand(Seven_in),
	.Eightand(Eight_in),
	.Nineand(Nine_in),
	.Aand(A_in),
	.Band(B_in),
	.Cand(C_in),
	.Dand(D_in),
	.Eand(E_in),
	.Fand(F_in),
	.ZeroandOut(Zero_And1),
	.OneandOut(One_And1),
	.TwoandOut(Two_And1),
	.ThreeandOut(Three_And1),
	.FourandOut(Four_And1),
	.FiveandOut(Five_And1),
	.SixandOut(Six_And1),
	.SevenandOut(Seven_And1),
	.EightandOut(Eight_And1),
	.NineandOut(Nine_And1),
	.AandOut(A_And1),
	.BandOut(B_And1),
	.CandOut(C_And1),
	.DandOut(D_And1),
	.EandOut(E_And1),
	.FandOut(F_And1));


sixteenAnd	b2v_inst2(
	.ANDin(AND1_sw),
	.Zeroand(Zero_Aregister_o),
	.Oneand(One_Aregister_o),
	.Twoand(Two_Aregister_o),
	.Threeand(Three_Aregister_o),
	.Fourand(Four_Aregister_o),
	.Fiveand(Five_Aregister_o),
	.Sixand(Six_Aregister_o),
	.Sevenand(Seven_Aregister_o),
	.Eightand(Eight_Aregister_o),
	.Nineand(Nine_Aregister_o),
	.Aand(A_Aregister_o),
	.Band(B_Aregister_o),
	.Cand(C_Aregister_o),
	.Dand(D_Aregister_o),
	.Eand(E_Aregister_o),
	.Fand(F_Aregister_o),
	.ZeroandOut(Zero_And2),
	.OneandOut(One_And2),
	.TwoandOut(Two_And2),
	.ThreeandOut(Three_And2),
	.FourandOut(Four_And2),
	.FiveandOut(Five_And2),
	.SixandOut(Six_And2),
	.SevenandOut(Seven_And2),
	.EightandOut(Eight_And2),
	.NineandOut(Nine_And2),
	.AandOut(A_And2),
	.BandOut(B_And2),
	.CandOut(C_And2),
	.DandOut(D_And2),
	.EandOut(E_And2),
	.FandOut(F_And2));











sixteenALU	b2v_inst3(
	.x(x_in),
	.alu_zeroBin(Zero_And1),
	.v(SYNTHESIZED_WIRE_0),
	.alu_zeroAin(Zero_And2),
	.y(SYNTHESIZED_WIRE_1),
	.z(SYNTHESIZED_WIRE_2),
	.u(u_in),
	.alu_oneBin(One_And1),
	.alu_oneAin(One_And2),
	.alu_twoBin(Two_And1),
	.alu_twoAin(Two_And2),
	.alu_trheeBin(Three_And1),
	.alu_threeAin(Three_And2),
	.alu_fourBin(Four_And1),
	.alu_fourAin(Four_And2),
	.alu_fiveBin(Five_And1),
	.alu_fiveAin(Five_And2),
	.alu_sixBin(Six_And1),
	.alu_sixAin(Six_And2),
	.alu_sevenBin(Seven_And1),
	.alu_sevenAin(Seven_And2),
	.alu_eightBin(Eight_And1),
	.alu_eightAin(Eight_And2),
	.alu_nineBin(Nine_And1),
	.alu_neieAin(Nine_And2),
	.alu_aBin(A_And1),
	.alu_aAin(A_And2),
	.alu_bBin(B_And1),
	.alu_bAin(B_And2),
	.alu_cBin(C_And1),
	.alu_cAin(C_And2),
	.alu_dBin(D_And1),
	.alu_dAin(D_And2),
	.alu_eBin(E_And1),
	.alu_eAin(E_And2),
	.alu_fBin(F_And1),
	.alu_fAin(F_And2),
	.alu_zeroOut(alu_zeroOut),
	.aou_oneOut(alu_oneOut),
	.alu_twoOut(alu_twoOut),
	.alu_threeOut(alu_threeOut),
	.alu_fourOut(alu_fourOut),
	.alu_fiveOut(alu_fiveOut),
	.alu_sixOut(alu_sixOut),
	.alu_sevenOut(alu_sevenOut),
	.alu_eightOut(alu_eightOut),
	.alu_nineOut(alu_nineOut),
	.alu_aOut(alu_aOut),
	.alu_bOut(alu_bOut),
	.alu_cOut(alu_cOut),
	.alu_dOut(alu_dOut),
	.alu_eOut(alu_eOut),
	.alu_fOut(alu_fOut),
	.carry(alu_carry_out),
	.overflow(alu_overflow_out));










shifter	b2v_inst4(
	.Azero(alu_zeroOut),
	.Aone(alu_oneOut),
	.Atwo(alu_twoOut),
	.Athree(alu_threeOut),
	.Afour(alu_fourOut),
	.Afive(alu_fiveOut),
	.Asix(alu_sixOut),
	.Aseven(alu_sevenOut),
	.Aeight(alu_eightOut),
	.Anine(alu_nineOut),
	.AA(alu_aOut),
	.AB(alu_bOut),
	.AC(alu_cOut),
	.AD(alu_dOut),
	.AE(alu_eOut),
	.AF(alu_fOut),
	.Cin(SYNTHESIZED_WIRE_3),
	.Rin(SYNTHESIZED_WIRE_4),
	.Ain(SYNTHESIZED_WIRE_5),
	.Lin(SYNTHESIZED_WIRE_6),
	.Din(SYNTHESIZED_WIRE_7),
	.Bin(SYNTHESIZED_WIRE_8),
	.Ein(SYNTHESIZED_WIRE_9),
	.Carryinput(alu_carry_out),
	.Stwo(two_shifter1),
	.Sthree(three_shifter1),
	.Sfour(four_shifter1),
	.Sfive(five_shifter1),
	.Seight(eight_shifter1),
	.Sone(one_shifter1),
	.Ssix(six_shifter1),
	.Sseven(seven_shifter1),
	.Snine(nine_shifter1),
	.SA(A_shifter1),
	.SB(B_shifter1),
	.SC(C_shifter1),
	.SD(D_shifter1),
	.SE(E_shifter1),
	.Szero(zero_shifter1),
	.SF(F_shifter1),
	.Cf(carry_shifter1));


shifter	b2v_inst5(
	.Azero(Zero_Qregister_o),
	.Aone(One_Qregister_o),
	.Atwo(Two_Qregister_o),
	.Athree(Three_Qregister_o),
	.Afour(Four_Qregister_o),
	.Afive(Five_Qregister_o),
	.Asix(Six_Qregister_o),
	.Aseven(Seven_Qregister_o),
	.Aeight(Eight_Qregister_o),
	.Anine(Nine_Qregister_o),
	.AA(A_Qregister_o),
	.AB(B_Qregister_o),
	.AC(C_Qregister_o),
	.AD(D_Qregister_o),
	.AE(E_Qregister_o),
	.AF(F_Qregister_o),
	.Cin(SYNTHESIZED_WIRE_10),
	.Rin(SYNTHESIZED_WIRE_11),
	.Ain(SYNTHESIZED_WIRE_12),
	.Lin(SYNTHESIZED_WIRE_13),
	.Din(SYNTHESIZED_WIRE_14),
	.Bin(SYNTHESIZED_WIRE_15),
	.Ein(SYNTHESIZED_WIRE_16),
	.Carryinput(carry_shifter1),
	.Stwo(two_shifter2),
	.Sthree(three_shifter2),
	.Sfour(four_shifter2),
	.Sfive(five_shifter2),
	.Seight(eight_shifter2),
	.Sone(one_shifter2),
	.Ssix(six_shifter2),
	.Sseven(seven_shifter2),
	.Snine(nine_shifter2),
	.SA(A_shifter2),
	.SB(B_shifter2),
	.SC(C_shifter2),
	.SD(D_shifter2),
	.SE(E_shifter2),
	.Szero(zero_shifter2),
	.SF(F_shifter2)
	);


sixteenMUX	b2v_inst6(
	.MUXsw(MUX1_sw),
	.Zero_Ain(alu_zeroOut),
	.Zero_Bin(zero_shifter1),
	.One_Ain(alu_oneOut),
	.One_Bin(one_shifter1),
	.Two_Ain(alu_twoOut),
	.Two_Bin(two_shifter1),
	.Three_Ain(alu_threeOut),
	.Three_Bin(three_shifter1),
	.Four_Ain(alu_fourOut),
	.Four_Bin(four_shifter1),
	.Five_Ain(alu_fiveOut),
	.Five_Bin(five_shifter1),
	.Six_Ain(alu_sixOut),
	.Six_Bin(six_shifter1),
	.Seven_Ain(alu_sevenOut),
	.Seven_Bin(seven_shifter1),
	.Eight_Ain(alu_eightOut),
	.Eight_Bin(eight_shifter1),
	.Nine_Ain(alu_nineOut),
	.Nine_Bin(nine_shifter1),
	.A_Ain(alu_aOut),
	.A_Bin(A_shifter1),
	.B_Ain(alu_bOut),
	.B_Bin(B_shifter1),
	.C_Ain(alu_cOut),
	.C_Bin(C_shifter1),
	.D_Ain(alu_dOut),
	.D_Bin(D_shifter1),
	.E_Ain(alu_eOut),
	.E_Bin(E_shifter1),
	.F_Ain(alu_fOut),
	.F_Bin(F_shifter1),
	.ZeromuxOut(zero_mux1),
	.OnemuxOut(one_mux1),
	.TwomuxOut(two_mux1),
	.ThreemuxOut(three_mux1),
	.FourmuxOut(four_mux1),
	.FivemuxOut(five_mux1),
	.SixmuxOut(six_mux1),
	.SevenmuxOut(seven_mux1),
	.EightmuxOut(eight_mux1),
	.NinemuxOut(nine_mux1),
	.AmuxOut(A_mux1),
	.BmuxOut(B_mux1),
	.CmuxOut(C_mux1),
	.DmuxOut(D_mux1),
	.EmuxOut(E_mux1),
	.FmuxOut(F_mux1));


sixteenMUX	b2v_inst7(
	.MUXsw(MUX2_sw),
	.Zero_Ain(zero_mux1),
	.Zero_Bin(zero_shifter2),
	.One_Ain(one_mux1),
	.One_Bin(one_shifter2),
	.Two_Ain(two_mux1),
	.Two_Bin(two_shifter2),
	.Three_Ain(three_mux1),
	.Three_Bin(three_shifter2),
	.Four_Ain(four_mux1),
	.Four_Bin(four_shifter2),
	.Five_Ain(five_mux1),
	.Five_Bin(five_shifter2),
	.Six_Ain(six_mux1),
	.Six_Bin(six_shifter2),
	.Seven_Ain(seven_mux1),
	.Seven_Bin(seven_shifter2),
	.Eight_Ain(eight_mux1),
	.Eight_Bin(eight_shifter2),
	.Nine_Ain(nine_mux1),
	.Nine_Bin(nine_shifter2),
	.A_Ain(A_mux1),
	.A_Bin(A_shifter2),
	.B_Ain(B_mux1),
	.B_Bin(B_shifter2),
	.C_Ain(C_mux1),
	.C_Bin(C_shifter2),
	.D_Ain(D_mux1),
	.D_Bin(D_shifter2),
	.E_Ain(E_mux1),
	.E_Bin(E_shifter2),
	.F_Ain(F_mux1),
	.F_Bin(F_shifter2),
	.ZeromuxOut(zero_mux2),
	.OnemuxOut(one_mux2),
	.TwomuxOut(two_mux2),
	.ThreemuxOut(three_mux2),
	.FourmuxOut(four_mux2),
	.FivemuxOut(five_mux2),
	.SixmuxOut(six_mux2),
	.SevenmuxOut(seven_mux2),
	.EightmuxOut(eight_mux2),
	.NinemuxOut(nine_mux2),
	.AmuxOut(A_mux2),
	.BmuxOut(B_mux2),
	.CmuxOut(C_mux2),
	.DmuxOut(D_mux2),
	.EmuxOut(E_mux2),
	.FmuxOut(F_mux2));


sixteen_register	b2v_inst8(
	.Ea(SYNTHESIZED_WIRE_17),
	.R_W(A_RW),
	.D15(F_mux1),
	.D14(E_mux1),
	.D13(D_mux1),
	.D12(C_mux1),
	.D11(B_mux1),
	.D10(A_mux1),
	.D9(nine_mux1),
	.D8(eight_mux1),
	.D7(seven_mux1),
	.D6(six_mux1),
	.D5(five_mux1),
	.D4(four_mux1),
	.D3(three_mux1),
	.D2(two_mux1),
	.D1(one_mux1),
	.D0(zero_mux1),
	.CLK(A_CLK),
	.CLR(A_CLR),
	.Q15(F_Aregister_o),
	
	.Q14(E_Aregister_o),
	
	.Q13(D_Aregister_o),
	
	.Q12(C_Aregister_o),
	
	.Q11(B_Aregister_o),
	
	.Q10(A_Aregister_o),
	
	.Q9(Nine_Aregister_o),
	
	.Q8(Eight_Aregister_o),
	
	.Q7(Seven_Aregister_o),
	
	.Q6(Six_Aregister_o),
	
	.Q5(Five_Aregister_o),
	
	.Q4(Four_Aregister_o),
	
	.Q3(Three_Aregister_o),
	
	.Q2(Two_Aregister_o),
	
	.Q1(One_Aregister_o),
	
	.Q0(Zero_Aregister_o)
	);


sixteen_register	b2v_inst9(
	.Ea(SYNTHESIZED_WIRE_18),
	.R_W(Q_RW),
	.D15(F_mux2),
	.D14(E_mux2),
	.D13(D_mux2),
	.D12(C_mux2),
	.D11(B_mux2),
	.D10(A_mux2),
	.D9(nine_mux2),
	.D8(eight_mux2),
	.D7(seven_mux2),
	.D6(six_mux2),
	.D5(five_mux2),
	.D4(four_mux2),
	.D3(three_mux2),
	.D2(two_mux2),
	.D1(one_mux2),
	.D0(zero_mux2),
	.CLK(Q_CLK),
	.CLR(Q_CLR),
	.Q15(F_Qregister_o),
	
	.Q14(E_Qregister_o),
	
	.Q13(D_Qregister_o),
	
	.Q12(C_Qregister_o),
	
	.Q11(B_Qregister_o),
	
	.Q10(A_Qregister_o),
	
	.Q9(Nine_Qregister_o),
	
	.Q8(Eight_Qregister_o),
	
	.Q7(Seven_Qregister_o),
	
	.Q6(Six_Qregister_o),
	
	.Q5(Five_Qregister_o),
	
	.Q4(Four_Qregister_o),
	
	.Q3(Three_Qregister_o),
	
	.Q2(Two_Qregister_o),
	
	.Q1(One_Qregister_o),
	
	.Q0(Zero_Qregister_o)
	);

assign	alu_carryOut = alu_carry_out;
assign	alu_overflowOut = alu_overflow_out;

endmodule
