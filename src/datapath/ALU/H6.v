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
// CREATED		"Sat Jan 10 20:13:52 2026"

module H6(
	Zero_in,
	One_in,
	Two_in,
	Three_in,
	Four_in,
	Five_in,
	Six_in,
	Seven_in,
	Eight_in,
	Nine_in,
	A_in,
	B_in,
	C_in,
	D_in,
	E_in,
	F_in,
	Rst,
	inQLK,
	inTWO,
	inTHREE,
	inFOUR,
	CLK_50,
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
	F_out,
	fixOneLED,
	fixZeroLED,
	outCLKLED,
	outCFLED,
	CounterINLED,
	AndOneLED,
	AndTwoLED,
	aluXULED,
	MUX_RightLED,
	RegA_RWLED,
	RegQ_RWLED,
	RstLED,
	inQLKLED,
	inTWOLED,
	inTHREELED,
	inFOURLED,
	Seg1_zero,
	Seg4_zero,
	segE0,
	segE1,
	segE2,
	segE3,
	segE4,
	segE5,
	segE6,
	A_mul_bus,
	Q_mul_bus
);


input wire	Zero_in;
input wire	One_in;
input wire	Two_in;
input wire	Three_in;
input wire	Four_in;
input wire	Five_in;
input wire	Six_in;
input wire	Seven_in;
input wire	Eight_in;
input wire	Nine_in;
input wire	A_in;
input wire	B_in;
input wire	C_in;
input wire	D_in;
input wire	E_in;
input wire	F_in;
input wire	Rst;
input wire	inQLK;
input wire	inTWO;
input wire	inTHREE;
input wire	inFOUR;
input wire	CLK_50;
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
output wire	[15:0] A_mul_bus;
output wire	[15:0] Q_mul_bus;
output wire	fixOneLED;
output wire	fixZeroLED;
output wire	outCLKLED;
output wire	outCFLED;
output wire	CounterINLED;
output wire	AndOneLED;
output wire	AndTwoLED;
output wire	aluXULED;
output wire	MUX_RightLED;
output wire	RegA_RWLED;
output wire	RegQ_RWLED;
output wire	RstLED;
output wire	inQLKLED;
output wire	inTWOLED;
output wire	inTHREELED;
output wire	inFOURLED;
output wire	Seg1_zero;
output wire	Seg4_zero;
output wire	segE0;
output wire	segE1;
output wire	segE2;
output wire	segE3;
output wire	segE4;
output wire	segE5;
output wire	segE6;

wire	A_And1;
wire	A_And2;
wire	A_Aregister_o;
wire	A_mux1;
wire	A_mux2;
wire	A_Qregister_o;
wire	A_shifter1;
wire	A_shifter2;
wire	alu_aOut;
wire	alu_bOut;
wire	alu_carry_out;
wire	alu_cOut;
wire	alu_dOut;
wire	alu_eightOut;
wire	alu_eOut;
wire	alu_fiveOut;
wire	alu_fourOut;
wire	alu_fOut;
wire	alu_nineOut;
wire	alu_oneOut;
wire	alu_overflow_out;
wire	alu_sevenOut;
wire	alu_sixOut;
wire	alu_threeOut;
wire	alu_twoOut;
wire	alu_zeroOut;
wire	aluXU;
wire	AndOne;
wire	AndTwo;
wire	B_And1;
wire	B_And2;
wire	B_Aregister_o;
wire	B_mux1;
wire	B_mux2;
wire	B_Qregister_o;
wire	B_shifter1;
wire	B_shifter2;
wire	C_And1;
wire	C_And2;
wire	C_Aregister_o;
wire	C_mux1;
wire	C_mux2;
wire	C_Qregister_o;
wire	C_shifter1;
wire	C_shifter2;
wire	Carry_shift2;
wire	carry_shifter1;
wire	CounterIN;
wire	D_And1;
wire	D_And2;
wire	D_Aregister_o;
wire	D_mux1;
wire	D_mux2;
wire	D_Qregister_o;
wire	D_shifter1;
wire	D_shifter2;
wire	E_And1;
wire	E_And2;
wire	E_Aregister_o;
wire	E_mux1;
wire	E_mux2;
wire	E_Qregister_o;
wire	E_shifter1;
wire	E_shifter2;
wire	Eight_And1;
wire	Eight_And2;
wire	Eight_Aregister_o;
wire	eight_mux1;
wire	eight_mux2;
wire	Eight_Qregister_o;
wire	eight_shifter1;
wire	eight_shifter2;
wire	F_And1;
wire	F_And2;
wire	F_Aregister_o;
wire	F_mux1;
wire	F_mux2;
wire	F_Qregister_o;
wire	F_shifter1;
wire	F_shifter2;
wire	Five_And1;
wire	Five_And2;
wire	Five_Aregister_o;
wire	five_mux1;
wire	five_mux2;
wire	Five_Qregister_o;
wire	five_shifter1;
wire	five_shifter2;
wire	fixOne;
wire	fixZero;
wire	Four_And1;
wire	Four_And2;
wire	Four_Aregister_o;
wire	four_mux1;
wire	four_mux2;
wire	Four_Qregister_o;
wire	four_shifter1;
wire	four_shifter2;
wire	MUX_Right;
wire	Nine_And1;
wire	Nine_And2;
wire	Nine_Aregister_o;
wire	nine_mux1;
wire	nine_mux2;
wire	Nine_Qregister_o;
wire	nine_shifter1;
wire	nine_shifter2;
wire	One_And1;
wire	One_And2;
wire	One_Aregister_o;
wire	one_mux1;
wire	one_mux2;
wire	One_Qregister_o;
wire	one_shifter1;
wire	one_shifter2;
wire	outCF;
wire	outCLK;
wire	outReset;
wire	RegA_RW;
wire	RegQ_RW;
wire	Seven_And1;
wire	Seven_And2;
wire	Seven_Aregister_o;
wire	seven_mux1;
wire	seven_mux2;
wire	Seven_Qregister_o;
wire	seven_shifter1;
wire	seven_shifter2;
wire	Six_And1;
wire	Six_And2;
wire	Six_Aregister_o;
wire	six_mux1;
wire	six_mux2;
wire	Six_Qregister_o;
wire	six_shifter1;
wire	six_shifter2;
wire	Three_And1;
wire	Three_And2;
wire	Three_Aregister_o;
wire	three_mux1;
wire	three_mux2;
wire	Three_Qregister_o;
wire	three_shifter1;
wire	three_shifter2;
wire	Two_And1;
wire	Two_And2;
wire	Two_Aregister_o;
wire	two_mux1;
wire	two_mux2;
wire	Two_Qregister_o;
wire	two_shifter1;
wire	two_shifter2;
wire	Zero_And1;
wire	Zero_And2;
wire	Zero_Aregister_o;
wire	zero_mux1;
wire	zero_mux2;
wire	Zero_Qregister_o;
wire	zero_shifter1;
wire	zero_shifter2;
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
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
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
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_56;
wire	SYNTHESIZED_WIRE_57;
wire	SYNTHESIZED_WIRE_58;
wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_60;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_62;
wire	SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_64;
wire	SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_67;
wire	SYNTHESIZED_WIRE_68;
wire	SYNTHESIZED_WIRE_69;
wire	SYNTHESIZED_WIRE_70;
wire	SYNTHESIZED_WIRE_71;
wire	SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_73;
wire	SYNTHESIZED_WIRE_74;
wire	SYNTHESIZED_WIRE_75;
wire	SYNTHESIZED_WIRE_76;
wire	SYNTHESIZED_WIRE_77;
wire	SYNTHESIZED_WIRE_78;
wire	SYNTHESIZED_WIRE_79;
wire	SYNTHESIZED_WIRE_80;
wire	SYNTHESIZED_WIRE_81;
wire	SYNTHESIZED_WIRE_82;
wire	SYNTHESIZED_WIRE_83;
wire	SYNTHESIZED_WIRE_84;
wire	SYNTHESIZED_WIRE_85;
wire	SYNTHESIZED_WIRE_86;

assign	Zero_out = SYNTHESIZED_WIRE_0;
assign	One_out = SYNTHESIZED_WIRE_1;
assign	Two_out = SYNTHESIZED_WIRE_2;
assign	Three_out = SYNTHESIZED_WIRE_3;
assign	Four_out = SYNTHESIZED_WIRE_4;
assign	Five_out = SYNTHESIZED_WIRE_5;
assign	Six_out = SYNTHESIZED_WIRE_6;
assign	Seven_out = SYNTHESIZED_WIRE_7;
assign	Eight_out = SYNTHESIZED_WIRE_8;
assign	Nine_out = SYNTHESIZED_WIRE_9;
assign	A_out = SYNTHESIZED_WIRE_10;
assign	B_out = SYNTHESIZED_WIRE_11;
assign	C_out = SYNTHESIZED_WIRE_12;
assign	D_out = SYNTHESIZED_WIRE_13;
assign	E_out = SYNTHESIZED_WIRE_14;
assign	F_out = SYNTHESIZED_WIRE_15;
assign	inQLKLED = SYNTHESIZED_WIRE_16;
assign	SYNTHESIZED_WIRE_81 = 1;
assign	SYNTHESIZED_WIRE_86 = 1;




sixteenAnd	b2v_inst(
	.ANDin(AndOne),
	.Zeroand(SYNTHESIZED_WIRE_0),
	.Oneand(SYNTHESIZED_WIRE_1),
	.Twoand(SYNTHESIZED_WIRE_2),
	.Threeand(SYNTHESIZED_WIRE_3),
	.Fourand(SYNTHESIZED_WIRE_4),
	.Fiveand(SYNTHESIZED_WIRE_5),
	.Sixand(SYNTHESIZED_WIRE_6),
	.Sevenand(SYNTHESIZED_WIRE_7),
	.Eightand(SYNTHESIZED_WIRE_8),
	.Nineand(SYNTHESIZED_WIRE_9),
	.Aand(SYNTHESIZED_WIRE_10),
	.Band(SYNTHESIZED_WIRE_11),
	.Cand(SYNTHESIZED_WIRE_12),
	.Dand(SYNTHESIZED_WIRE_13),
	.Eand(SYNTHESIZED_WIRE_14),
	.Fand(SYNTHESIZED_WIRE_15),
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


sevenSegments	b2v_inst1(
	.x3(F_Aregister_o),
	.x2(E_Aregister_o),
	.x1(D_Aregister_o),
	.x0(C_Aregister_o),
	.zero(SYNTHESIZED_WIRE_28),
	.one(SYNTHESIZED_WIRE_29),
	.two(SYNTHESIZED_WIRE_30),
	.three(SYNTHESIZED_WIRE_32),
	.four(SYNTHESIZED_WIRE_33),
	.five(SYNTHESIZED_WIRE_34),
	.six(SYNTHESIZED_WIRE_35));


sevenSegments	b2v_inst10(
	.x3(B_Aregister_o),
	.x2(A_Aregister_o),
	.x1(Nine_Aregister_o),
	.x0(Eight_Aregister_o),
	.zero(SYNTHESIZED_WIRE_36),
	.one(SYNTHESIZED_WIRE_37),
	.two(SYNTHESIZED_WIRE_38),
	.three(SYNTHESIZED_WIRE_39),
	.four(SYNTHESIZED_WIRE_40),
	.five(SYNTHESIZED_WIRE_41),
	.six(SYNTHESIZED_WIRE_42));

assign	RstLED =  ~Rst;

assign	inFOURLED =  ~inFOUR;

assign	inTHREELED =  ~inTHREE;

assign	inTWOLED =  ~inTWO;


sevenSegments	b2v_inst11(
	.x3(Seven_Aregister_o),
	.x2(Six_Aregister_o),
	.x1(Five_Aregister_o),
	.x0(Four_Aregister_o),
	.zero(SYNTHESIZED_WIRE_43),
	.one(SYNTHESIZED_WIRE_44),
	.two(SYNTHESIZED_WIRE_45),
	.three(SYNTHESIZED_WIRE_46),
	.four(SYNTHESIZED_WIRE_47),
	.five(SYNTHESIZED_WIRE_48),
	.six(SYNTHESIZED_WIRE_49));

assign	SYNTHESIZED_WIRE_31 =  ~inQLK;


sevenSegments	b2v_inst12(
	.x3(Three_Aregister_o),
	.x2(Two_Aregister_o),
	.x1(One_Aregister_o),
	.x0(Zero_Aregister_o),
	.zero(SYNTHESIZED_WIRE_50),
	.one(SYNTHESIZED_WIRE_51),
	.two(SYNTHESIZED_WIRE_52),
	.three(SYNTHESIZED_WIRE_53),
	.four(SYNTHESIZED_WIRE_54),
	.five(SYNTHESIZED_WIRE_55),
	.six(SYNTHESIZED_WIRE_56));


sevenSegments	b2v_inst13(
	.x3(F_Qregister_o),
	.x2(E_Qregister_o),
	.x1(D_Qregister_o),
	.x0(C_Qregister_o),
	.zero(SYNTHESIZED_WIRE_57),
	.one(SYNTHESIZED_WIRE_58),
	.two(SYNTHESIZED_WIRE_59),
	.three(SYNTHESIZED_WIRE_60),
	.four(SYNTHESIZED_WIRE_61),
	.five(SYNTHESIZED_WIRE_62),
	.six(SYNTHESIZED_WIRE_63));


sevenSegments	b2v_inst14(
	.x3(B_Qregister_o),
	.x2(A_Qregister_o),
	.x1(Nine_Qregister_o),
	.x0(Eight_Qregister_o),
	.zero(SYNTHESIZED_WIRE_64),
	.one(SYNTHESIZED_WIRE_65),
	.two(SYNTHESIZED_WIRE_66),
	.three(SYNTHESIZED_WIRE_67),
	.four(SYNTHESIZED_WIRE_68),
	.five(SYNTHESIZED_WIRE_69),
	.six(SYNTHESIZED_WIRE_70));


sevenSegments	b2v_inst15(
	.x3(Seven_Qregister_o),
	.x2(Six_Qregister_o),
	.x1(Five_Qregister_o),
	.x0(Four_Qregister_o),
	.zero(SYNTHESIZED_WIRE_71),
	.one(SYNTHESIZED_WIRE_72),
	.two(SYNTHESIZED_WIRE_73),
	.three(SYNTHESIZED_WIRE_74),
	.four(SYNTHESIZED_WIRE_75),
	.five(SYNTHESIZED_WIRE_76),
	.six(SYNTHESIZED_WIRE_77));

assign	AndOneLED =  ~AndOne;

assign	AndTwoLED =  ~AndTwo;

assign	aluXULED =  ~aluXU;

assign	SYNTHESIZED_WIRE_0 =  ~Zero_in;

assign	SYNTHESIZED_WIRE_1 =  ~One_in;

assign	SYNTHESIZED_WIRE_2 =  ~Two_in;

assign	SYNTHESIZED_WIRE_3 =  ~Three_in;

assign	SYNTHESIZED_WIRE_4 =  ~Four_in;


sevenSegments	b2v_inst16(
	.x3(Three_Qregister_o),
	.x2(Two_Qregister_o),
	.x1(One_Qregister_o),
	.x0(Zero_Qregister_o),
	.zero(SYNTHESIZED_WIRE_78),
	.one(SYNTHESIZED_WIRE_79),
	.two(SYNTHESIZED_WIRE_80),
	.three(SYNTHESIZED_WIRE_82),
	.four(SYNTHESIZED_WIRE_83),
	.five(SYNTHESIZED_WIRE_84),
	.six(SYNTHESIZED_WIRE_85));

assign	SYNTHESIZED_WIRE_5 =  ~Five_in;

assign	SYNTHESIZED_WIRE_6 =  ~Six_in;

assign	SYNTHESIZED_WIRE_7 =  ~Seven_in;

assign	SYNTHESIZED_WIRE_8 =  ~Eight_in;

assign	SYNTHESIZED_WIRE_9 =  ~Nine_in;

assign	SYNTHESIZED_WIRE_10 =  ~A_in;

assign	SYNTHESIZED_WIRE_11 =  ~B_in;

assign	SYNTHESIZED_WIRE_12 =  ~C_in;

assign	SYNTHESIZED_WIRE_13 =  ~D_in;

assign	SYNTHESIZED_WIRE_14 =  ~E_in;


ControlUnit	b2v_inst17(
	.Rst(Rst),
	.inQLK(SYNTHESIZED_WIRE_16),
	.inCF(alu_carry_out),
	.inQZero(Zero_Qregister_o),
	.inTWO(inTWO),
	.inTHREE(inTHREE),
	.inFOUR(inFOUR),
	.outReset(outReset),
	.fixOne(fixOne),
	.fixZero(fixZero),
	.outCLK(outCLK),
	.outCF(outCF),
	.CounterIN(CounterIN),
	.AndOne(AndOne),
	.AndTwo(AndTwo),
	.aluXU(aluXU),
	.MUX_Right(MUX_Right),
	.RegA_RW(RegA_RW),
	.RegQ_RW(RegQ_RW));

assign	SYNTHESIZED_WIRE_15 =  ~F_in;


sevenSegments	b2v_inst18(
	.x3(SYNTHESIZED_WIRE_17),
	.x2(SYNTHESIZED_WIRE_18),
	.x1(SYNTHESIZED_WIRE_19),
	.x0(SYNTHESIZED_WIRE_20),
	.zero(SYNTHESIZED_WIRE_21),
	.one(SYNTHESIZED_WIRE_22),
	.two(SYNTHESIZED_WIRE_23),
	.three(SYNTHESIZED_WIRE_24),
	.four(SYNTHESIZED_WIRE_25),
	.five(SYNTHESIZED_WIRE_26),
	.six(SYNTHESIZED_WIRE_27));


hexCounter	b2v_inst19(
	.PulseIn(CounterIN),
	.setZero(outReset),
	.Q3out(SYNTHESIZED_WIRE_17),
	.Q2out(SYNTHESIZED_WIRE_18),
	.Q1out(SYNTHESIZED_WIRE_19),
	.Q0out(SYNTHESIZED_WIRE_20));

assign	segE0 =  ~SYNTHESIZED_WIRE_21;

assign	segE1 =  ~SYNTHESIZED_WIRE_22;

assign	segE2 =  ~SYNTHESIZED_WIRE_23;


assign	segE3 =  ~SYNTHESIZED_WIRE_24;

assign	segE4 =  ~SYNTHESIZED_WIRE_25;

assign	segE5 =  ~SYNTHESIZED_WIRE_26;

assign	segE6 =  ~SYNTHESIZED_WIRE_27;

assign	Seg1_zero =  ~SYNTHESIZED_WIRE_28;

assign	Seg1_one =  ~SYNTHESIZED_WIRE_29;

assign	Seg1_two =  ~SYNTHESIZED_WIRE_30;


sixteenAnd	b2v_inst289(
	.ANDin(AndTwo),
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


CHATTER	b2v_inst29(
	.clock(CLK_50),
	.SW(SYNTHESIZED_WIRE_31),
	.SSW(SYNTHESIZED_WIRE_16));


sixteenALU	b2v_inst3(
	.x(aluXU),
	.alu_zeroBin(Zero_And1),
	.v(fixOne),
	.alu_zeroAin(Zero_And2),
	.y(fixOne),
	.z(fixOne),
	.u(aluXU),
	.alu_oneBin(One_And1),
	.alu_oneAin(One_And2),
	.alu_twoBin(Two_And1),
	.alu_twoAin(Two_And2),
	.alu_threeBin(Three_And1),
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
	.alu_nineAin(Nine_And2),
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
	.alu_oneOut(alu_oneOut),
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

assign	Seg1_three =  ~SYNTHESIZED_WIRE_32;

assign	Seg1_four =  ~SYNTHESIZED_WIRE_33;

assign	Seg1_five =  ~SYNTHESIZED_WIRE_34;

assign	Seg1_six =  ~SYNTHESIZED_WIRE_35;

assign	Seg2_zero =  ~SYNTHESIZED_WIRE_36;

assign	Seg2_one =  ~SYNTHESIZED_WIRE_37;

assign	Seg2_two =  ~SYNTHESIZED_WIRE_38;

assign	Seg2_three =  ~SYNTHESIZED_WIRE_39;

assign	Seg2_four =  ~SYNTHESIZED_WIRE_40;

assign	Seg2_five =  ~SYNTHESIZED_WIRE_41;


shifter	b2v_inst4(
	.Rin(Rin),
	.Lin(Lin),
	.Ain(Ain),
	.Bin(Bin),
	.Cin(Cin),
	.Din(Din),
	.Ein(Ein),
	.A_bus(A_bus),
	.Szero(zero_shifter1),
	.Sone(one_shifter1),
	.Stwo(two_shifter1),
	.Sthree(three_shifter1),
	.Sfour(four_shifter1),
	.Sfive(five_shifter1),
	.Ssix(six_shifter1),
	.Sseven(seven_shifter1),
	.Seight(eight_shifter1),
	.Snine(nine_shifter1),
	.SA(A_shifter1),
	.SB(B_shifter1),
	.SC(C_shifter1),
	.SD(D_shifter1),
	.SE(E_shifter1),
	.SF(F_shifter1),
	.Cf(carry_shifter1)
    );


assign	Seg2_six =  ~SYNTHESIZED_WIRE_42;

assign	Seg3_zero =  ~SYNTHESIZED_WIRE_43;

assign	Seg3_one =  ~SYNTHESIZED_WIRE_44;

assign	Seg3_two =  ~SYNTHESIZED_WIRE_45;

assign	Seg3_three =  ~SYNTHESIZED_WIRE_46;

assign	Seg3_four =  ~SYNTHESIZED_WIRE_47;

assign	Seg3_five =  ~SYNTHESIZED_WIRE_48;

assign	Seg3_six =  ~SYNTHESIZED_WIRE_49;

assign	Seg4_zero =  ~SYNTHESIZED_WIRE_50;

assign	Seg4_one =  ~SYNTHESIZED_WIRE_51;


shifter	b2v_inst5(
	.Rin(Rin),
	.Lin(Lin),
	.Ain(Ain),
	.Bin(Bin),
	.Cin(Cin),
	.Din(Din),
	.Ein(Ein),
	.A_bus(A_bus),
	.Szero(zero_shifter2),
	.Sone(one_shifter2),
	.Stwo(two_shifter2),
	.Sthree(three_shifter2),
	.Sfour(four_shifter2),
	.Sfive(five_shifter2),
	.Ssix(six_shifter2),
	.Sseven(seven_shifter2),
	.Seight(eight_shifter2),
	.Snine(nine_shifter2),
	.SA(A_shifter2),
	.SB(B_shifter2),
	.SC(C_shifter2),
	.SD(D_shifter2),
	.SE(E_shifter2),
	.SF(F_shifter2),
	.Cf(carry_shifter2)
	);

assign	Seg4_two =  ~SYNTHESIZED_WIRE_52;

assign	Seg4_three =  ~SYNTHESIZED_WIRE_53;

assign	Seg4_four =  ~SYNTHESIZED_WIRE_54;

assign	Seg4_five =  ~SYNTHESIZED_WIRE_55;

assign	Seg4_six =  ~SYNTHESIZED_WIRE_56;

assign	Seg5_zero =  ~SYNTHESIZED_WIRE_57;

assign	Seg5_one =  ~SYNTHESIZED_WIRE_58;

assign	Seg5_two =  ~SYNTHESIZED_WIRE_59;

assign	Seg5_three =  ~SYNTHESIZED_WIRE_60;

assign	Seg5_four =  ~SYNTHESIZED_WIRE_61;


sixteenMUX	b2v_inst6(
	.MUXsw(MUX_Right),
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

assign	Seg5_five =  ~SYNTHESIZED_WIRE_62;

assign	Seg5_six =  ~SYNTHESIZED_WIRE_63;

assign	Seg6_zero =  ~SYNTHESIZED_WIRE_64;

assign	Seg6_one =  ~SYNTHESIZED_WIRE_65;

assign	Seg6_two =  ~SYNTHESIZED_WIRE_66;

assign	Seg6_three =  ~SYNTHESIZED_WIRE_67;

assign	Seg6_four =  ~SYNTHESIZED_WIRE_68;

assign	Seg6_five =  ~SYNTHESIZED_WIRE_69;

assign	Seg6_six =  ~SYNTHESIZED_WIRE_70;


sixteenMUX	b2v_inst7(
	.MUXsw(MUX_Right),
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

assign	Seg7_zero =  ~SYNTHESIZED_WIRE_71;

assign	Seg7_one =  ~SYNTHESIZED_WIRE_72;

assign	Seg7_two =  ~SYNTHESIZED_WIRE_73;

assign	Seg7_three =  ~SYNTHESIZED_WIRE_74;

assign	Seg7_four =  ~SYNTHESIZED_WIRE_75;

assign	Seg7_five =  ~SYNTHESIZED_WIRE_76;

assign	Seg7_six =  ~SYNTHESIZED_WIRE_77;

assign	Seg8_zero =  ~SYNTHESIZED_WIRE_78;

assign	Seg8_one =  ~SYNTHESIZED_WIRE_79;

assign	Seg8_two =  ~SYNTHESIZED_WIRE_80;


sixteen_register	b2v_inst8(
	.Ea(SYNTHESIZED_WIRE_81),
	.R_W(RegA_RW),
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
	.CLK(outCLK),
	.CLR(outReset),
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

assign	Seg8_three =  ~SYNTHESIZED_WIRE_82;

assign	Seg8_four =  ~SYNTHESIZED_WIRE_83;

assign	Seg8_five =  ~SYNTHESIZED_WIRE_84;

assign	Seg8_six =  ~SYNTHESIZED_WIRE_85;



sixteen_register	b2v_inst9(
	.Ea(SYNTHESIZED_WIRE_86),
	.R_W(RegQ_RW),
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
	.CLK(outCLK),
	.CLR(outReset),
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
assign	fixOneLED = fixOne;
assign	fixZeroLED = fixZero;
assign	outCLKLED = outCLK;
assign	outCFLED = outCF;
assign	CounterINLED = CounterIN;
assign	MUX_RightLED = MUX_Right;
assign	RegA_RWLED = RegA_RW;
assign	RegQ_RWLED = RegQ_RW;

// 16-bit bus outputs for A and Q registers
assign	A_mul_bus = {F_Aregister_o, E_Aregister_o, D_Aregister_o, C_Aregister_o,
                     B_Aregister_o, A_Aregister_o, Nine_Aregister_o, Eight_Aregister_o,
                     Seven_Aregister_o, Six_Aregister_o, Five_Aregister_o, Four_Aregister_o,
                     Three_Aregister_o, Two_Aregister_o, One_Aregister_o, Zero_Aregister_o};

assign	Q_mul_bus = {F_Qregister_o, E_Qregister_o, D_Qregister_o, C_Qregister_o,
                     B_Qregister_o, A_Qregister_o, Nine_Qregister_o, Eight_Qregister_o,
                     Seven_Qregister_o, Six_Qregister_o, Five_Qregister_o, Four_Qregister_o,
                     Three_Qregister_o, Two_Qregister_o, One_Qregister_o, Zero_Qregister_o};

endmodule
