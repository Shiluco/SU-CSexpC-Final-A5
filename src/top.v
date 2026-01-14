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
// CREATED		"Wed Jan 14 19:11:37 2026"

module TOP(
	CLOCK_50,
	KEY,
	SW,
	LCD_BLON,
	LCD_EN,
	LCD_ON,
	LCD_RS,
	LCD_RW,
	GPIO,
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7,
	LCD_DATA,
	LEDG,
	LEDR
);


input wire	CLOCK_50;
input wire	[3:0] KEY;
input wire	[17:0] SW;
output wire	LCD_BLON;
output wire	LCD_EN;
output wire	LCD_ON;
output wire	LCD_RS;
output wire	LCD_RW;
inout wire	[35:0] GPIO;
output wire	[6:0] HEX0;
output wire	[6:0] HEX1;
output wire	[6:0] HEX2;
output wire	[6:0] HEX3;
output wire	[6:0] HEX4;
output wire	[6:0] HEX5;
output wire	[6:0] HEX6;
output wire	[6:0] HEX7;
inout wire	[7:0] LCD_DATA;
output wire	[6:0] LEDG;
output wire	[15:0] LEDR;

wire	[15:0] A;
wire	ACK;
wire	ACKO;
wire	[15:0] ADBUS;
wire	[15:0] B;
wire	BIT_N;
wire	CLK;
wire	CLKSTEP;
wire	CPUCK;
wire	[15:0] DTBUS;
wire	HLT;
wire	ILLEGAL;
wire	INSTSTEP;
wire	IOREQ_N;
wire	[15:0] ISR;
wire	ITF;
wire	[15:0] MDR;
wire	MREQ_N;
wire	NORMAL;
wire	[15:0] QB;
wire	[15:0] QR0;
wire	[15:0] QR1;
wire	[15:0] QR2;
wire	[15:0] QR3;
wire	[15:0] QR4;
wire	[15:0] QR5;
wire	[15:0] QR6;
wire	[15:0] QR7;
wire	RESET;
wire	RW;
wire	[15:0] S;
wire	[15:0] SC;
wire	START_N;
wire	STOP;
wire	TIT0;
wire	TIT1;
wire	TIT2;
wire	TIT3;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[15:0] SYNTHESIZED_WIRE_2;
wire	RUN_CK;
wire	RUN_STOPPED;

assign	GPIO[35:24] = 12'b000000000000;




sep5_interface	b2v_inst(
	.ORGCLK(CLOCK_50),
	.RUNMSW1(GPIO[0]),
	.RUNMSW2(GPIO[1]),
	.RUNMSW3(GPIO[2]),
	.STOPSW(SYNTHESIZED_WIRE_0),
	.STARTB_N(KEY[1]),
	.BITB_N(KEY[3]),
	.RESETB_N(KEY[0]),
	.ACKB_N(KEY[2]),
	.CPUCK(CPUCK),
	.DISPLAY(SYNTHESIZED_WIRE_1),
	.ACKO(ACKO),
	.HLT(HLT),
	.ILLEGAL(ILLEGAL),
	.ITF(ITF),
	.IOREQ_N(IOREQ_N),
	.MREQ_N(MREQ_N),
	.RW(RW),
	.A(A),
	.ADBUS(ADBUS),
	.B(B),
	.DTBUS(DTBUS),
	.ISR(ISR),
	.MDR(MDR),
	.QB(QB),
	.QR0(QR0),
	.QR1(QR1),
	.QR2(QR2),
	.QR3(QR3),
	.QR4(QR4),
	.QR5(QR5),
	.QR6(QR6),
	.QR7(QR7),
	.S(S),
	.SC(SC),
	.SW(SYNTHESIZED_WIRE_2),
	.CLK(CLK),
	.INSTSTEP(INSTSTEP),
	.CLKSTEP(CLKSTEP),
	.NORMAL(NORMAL),
	.AUXI6(STOP),
	.EIT(TIT0),
	.TIT1(TIT1),
	.TIT2(TIT2),
	.TIT3(TIT3),
	.START_N(START_N),
	.BIT_N(BIT_N),
	.RESET(RESET),
	.ACK(ACK),
	.LCD_RW(LCD_RW),
	.LCD_EN(LCD_EN),
	.LCD_RS(LCD_RS),
	.LCD_ON(LCD_ON),
	.LCD_BLON(LCD_BLON),
	
	.EXTHEX(GPIO[23:10]),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2),
	.HEX3(HEX3),
	.HEX4(HEX4),
	.HEX5(HEX5),
	.HEX6(HEX6),
	.HEX7(HEX7),
	.LCD_DATA(LCD_DATA),
	.LEDG({LEDG[3],LEDG[2],LEDG[1],LEDG[0]}),
	.LEDR(LEDR));

assign	SYNTHESIZED_WIRE_0 =  ~SW[16];


run	b2v_inst_run(
	.START(~START_N),
	.ILLEGAL(ILLEGAL),
	.FF0(1'b0),
	.KITECK(CLK),
	.RESET_N(~RESET),
	.IF0D(1'b1),
	.AUXI6(STOP),
	.EX0(TIT0),
	.HLT(HLT),
	.NOMAL(NORMAL),
	.MSTEP(INSTSTEP),
	.CKSTEP(CLKSTEP),
	.CK(RUN_CK),
	.stopped(RUN_STOPPED));


cap1_1	b2v_inst10(
	.result(ILLEGAL));


cap1_0	b2v_inst11(
	.result(ITF));


cap16_0080	b2v_inst12(
	.result(QR0));


cap16_3130	b2v_inst13(
	.result(QR1));


cap16_4a40	b2v_inst14(
	.result(QR2));


cap16_4a10	b2v_inst15(
	.result(QR3));


cap16_5200	b2v_inst16(
	.result(QR4));


cap16_6240	b2v_inst17(
	.result(QR5));


cap16_0100	b2v_inst18(
	.result(QB));


cap16_0252	b2v_inst19(
	.result(MDR));


cap1_0	b2v_inst2(
	.result(MREQ_N));


cap_0852	b2v_inst20(
	.result(ISR));


cap16_004a	b2v_inst21(
	.result(A));


cap16_0246	b2v_inst22(
	.result(B));


cap12_102	b2v_inst23(
	.result(SC[11:0]));


cap16_0080	b2v_inst24(
	.result(ADBUS));


cap16_A2F5	b2v_inst25(
	.result(QR6));


cap16_DBC3	b2v_inst26(
	.result(S));


cap16_F800	b2v_inst27(
	.result(QR7));


assign	SYNTHESIZED_WIRE_1 =  ~SW[17];

assign	SYNTHESIZED_WIRE_2 =  ~SW[15:0];


cap1_1	b2v_inst5(
	.result(IOREQ_N));


cap1_1	b2v_inst6(
	.result(RW));


cap1_0	b2v_inst7(
	.result(CPUCK));


cap1_0	b2v_inst8(
	.result(ACKO));


cap1_1	b2v_inst9(
	.result(HLT));

assign	LEDG[5] = INSTSTEP;
assign	LEDG[6] = CLKSTEP;
assign	LEDG[4] = NORMAL;

endmodule
