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

// ============================================================
// Controller to Datapath 制御信号
// ============================================================
wire        MDA_wire;
wire        R0A_wire, R1A_wire, R2A_wire, R3A_wire, R4A_wire, R5A_wire, R6A_wire, R7A_wire;
wire        B0B_wire;
wire        SMD_wire, SMA_wire;
wire        SR0_wire, SR1_wire, SR2_wire, SR3_wire, SR4_wire, SR5_wire, SR6_wire, SR7_wire;
wire        SB0_wire, ALS_wire;
wire        ALU_x_wire, ALU_y_wire, ALU_z_wire, ALU_u_wire, ALU_v_wire;
wire        SHS_wire;
wire        SFT_A_wire, SFT_B_wire, SFT_C_wire, SFT_D_wire, SFT_E_wire, SFT_R_wire, SFT_L_wire;
wire        SET_PSW_wire;
wire        R_W_N_wire, MREQ_N_wire, MIRQ_N_wire, MIS_wire;
wire        MMD_wire, MDM_wire;
wire        f_is_D_wire, t_is_D_wire;
wire        is_T_DFive_wire, is_T_DSeven_wire;
wire        EIT_gate_wire, OIT_gate_wire;
wire        BUS_A_to_AND_one_wire, BUS_B_to_AND_one_wire;
wire        REG_A_to_BUS_S_wire, REG_Q_to_BUS_S_wire;
wire        MUL1_wire, MUL2_1_wire, MUL2_2_wire, MUL3_wire;
wire [2:0]  MUL_ctrl_wire;
wire [15:0] ISR_wire;

// 命令デコード信号
wire        EX0_wire;
wire        CLR_inst_wire;
wire        MOV_wire, ADD_wire, ADC_wire, SUB_wire, SBC_wire, CMP_wire;
wire        ASL_wire, ASR_wire, ROL_wire, ROR_wire, RLC_wire, RRC_wire, LSL_wire, LSR_wire;
wire        OR_inst_wire, XOR_inst_wire, AND_inst_wire, BIT_inst_wire;

// ============================================================
// Datapath to Controller フィードバック信号
// ============================================================
wire        PSW_N_wire, PSW_Z_wire, PSW_V_wire, PSW_C_wire;

// ============================================================
// Datapath 内部信号
// ============================================================
// MAR_out は ADBUS に直接接続
// M_bus は DTBUS と双方向接続

// CLR信号（active-low）を生成
wire        CLR_datapath;
assign      CLR_datapath = ~RESET;

// D5, D7信号生成
wire        D5_wire, D7_wire;
assign      D5_wire = t_is_D_wire & is_T_DFive_wire;
assign      D7_wire = t_is_D_wire & is_T_DSeven_wire;

// ============================================================
// DTBUS 双方向接続
// ============================================================
// DTBUSはinout（双方向）バス
// datapath内部でMDM信号によりtri-state制御されているため、
// M_bus_inとM_bus_outの両方にDTBUSを直接接続

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

assign	SYNTHESIZED_WIRE_1 =  ~SW[17];

assign	SYNTHESIZED_WIRE_2 =  ~SW[15:0];

// controller は run が生成した RUN_CK をクロックとして使用
controller u_controller (
	.clk        (RUN_CK),
	.reset      (RESET),      // active-high reset
	.m_bus      (DTBUS),
	.ACK        (ACK),
	.PSW_N      (PSW_N_wire),
	.PSW_Z      (PSW_Z_wire),
	.PSW_V      (PSW_V_wire),
	.PSW_C      (PSW_C_wire),

	.KIT        (BIT_N),       // oit,SEPスイッチ信号
	.EIT_input  (1'b0),       // PC入力信号

	// State出力（未使用）
	.IF0        (), .IF1(), .FF0(), .FF1(), .FF2(),
	.TF0        (), .TF1(),
	.EX0        (EX0_wire), .EX1(),
	.IT0        (), .IT1(), .IT2(),
	.MUL1       (MUL1_wire), .MUL2_1(MUL2_1_wire), .MUL2_2(MUL2_2_wire), .MUL3(MUL3_wire), .MUL4(),
	.counter_q  (),
	.ITA        (), .ITF(),

	// Datapath制御信号
	.MDA        (MDA_wire),
	.R0A        (R0A_wire), .R1A(R1A_wire), .R2A(R2A_wire), .R3A(R3A_wire),
	.R4A        (R4A_wire), .R5A(R5A_wire), .R6A(R6A_wire), .R7A(R7A_wire),
	.B0B        (B0B_wire),
	.SMD        (SMD_wire), .SMA(SMA_wire),
	.SR0        (SR0_wire), .SR1(SR1_wire), .SR2(SR2_wire), .SR3(SR3_wire),
	.SR4        (SR4_wire), .SR5(SR5_wire), .SR6(SR6_wire), .SR7(SR7_wire),
	.SB0        (SB0_wire), .ALS(ALS_wire),
	.ALU_x      (ALU_x_wire), .ALU_y(ALU_y_wire), .ALU_z(ALU_z_wire),
	.ALU_u      (ALU_u_wire), .ALU_v(ALU_v_wire),
	.SHS        (SHS_wire),
	.SFT_A      (SFT_A_wire), .SFT_B(SFT_B_wire), .SFT_C(SFT_C_wire),
	.SFT_D      (SFT_D_wire), .SFT_E(SFT_E_wire), .SFT_R(SFT_R_wire), .SFT_L(SFT_L_wire),
	.SET_PSW    (SET_PSW_wire),
	.R_W_N      (R_W_N_wire), .MREQ_N(MREQ_N_wire), .MIRQ_N(MIRQ_N_wire), .MIS(MIS_wire),
	.MMD        (MMD_wire), .MDM(MDM_wire),
	.f_is_D     (f_is_D_wire), .t_is_D(t_is_D_wire),
	.is_T_DFive (is_T_DFive_wire),
	.is_T_DSeven(is_T_DSeven_wire),
	.EIT_gate   (EIT_gate_wire), .OIT_gate(OIT_gate_wire),
	.BUS_A_to_AND_one(BUS_A_to_AND_one_wire), .BUS_B_to_AND_one(BUS_B_to_AND_one_wire),
	.REG_A_to_BUS_S(REG_A_to_BUS_S_wire), .REG_Q_to_BUS_S(REG_Q_to_BUS_S_wire),
	.MUL_ctrl   (MUL_ctrl_wire),

	// 命令デコード信号
	.CLR_inst   (CLR_inst_wire),
	.MOV        (MOV_wire), .ADD(ADD_wire), .ADC(ADC_wire),
	.SUB        (SUB_wire), .SBC(SBC_wire), .CMP(CMP_wire),
	.ASL        (ASL_wire), .ASR(ASR_wire), .ROL(ROL_wire), .ROR(ROR_wire),
	.RLC        (RLC_wire), .RRC(RRC_wire), .LSL(LSL_wire), .LSR(LSR_wire),
	.OR_inst    (OR_inst_wire), .XOR_inst(XOR_inst_wire),
	.AND_inst   (AND_inst_wire), .BIT_inst(BIT_inst_wire),

	.ISR_out    (ISR_wire)
);

// ============================================================
// Datapath統合
// ============================================================
datapath_top u_datapath (
	// クロック・リセット
	.CLK        (RUN_CK),           // runモジュールからのクロック
	.CLR        (CLR_datapath),     // active-low reset

	// メモリインターフェース
	.M_bus_in   (DTBUS),            // DTBUSから入力
	.M_bus_out  (DTBUS),            // DTBUSへ出力（MDMでtri-state制御）
	.MAR_out    (ADBUS),            // アドレスバス直接接続

	// レジスタ制御信号（Aバス出力）
	.R0A        (R0A_wire), .R1A(R1A_wire), .R2A(R2A_wire), .R3A(R3A_wire),
	.R4A        (R4A_wire), .R5A(R5A_wire), .R6A(R6A_wire), .R7A(R7A_wire),

	// レジスタ制御信号（Sバス入力）
	.SR0        (SR0_wire), .SR1(SR1_wire), .SR2(SR2_wire), .SR3(SR3_wire),
	.SR4        (SR4_wire), .SR5(SR5_wire), .SR6(SR6_wire), .SR7(SR7_wire),

	// B0レジスタ制御信号
	.SB0        (SB0_wire),
	.B0B        (B0B_wire),

	// MDR制御信号
	.MMD        (MMD_wire),
	.SMD        (SMD_wire),
	.MDA        (MDA_wire),
	.MDM        (MDM_wire),

	// MAR制御信号
	.SMA        (SMA_wire),

	// シフタ制御信号
	.SFT_R      (SFT_R_wire), .SFT_L(SFT_L_wire),
	.SFT_A      (SFT_A_wire), .SFT_B(SFT_B_wire), .SFT_C(SFT_C_wire),
	.SFT_D      (SFT_D_wire), .SFT_E(SFT_E_wire),
	.SHS        (SHS_wire),

	// 定数値出力制御信号
	.OIT_gate   (OIT_gate_wire),
	.EIT_gate   (EIT_gate_wire),

	// H4 ALU制御信号
	.ALU_y      (ALU_y_wire), .ALU_z(ALU_z_wire), .ALU_x(ALU_x_wire),
	.ALU_v      (ALU_v_wire), .ALU_u(ALU_u_wire),
	.ALS_H4     (ALS_wire),

	// H6制御信号
	.MUL1       (MUL1_wire),
	.MUL2_1     (MUL2_1_wire),
	.MUL2_2     (MUL2_2_wire),
	.Rst_H6     (CLR_datapath),     // H6リセットはCLRと同じ
	.inQLK      (RUN_CK),           // H6クロック入力
	.inTWO      (MUL_ctrl_wire[0]),
	.inTHREE    (MUL_ctrl_wire[1]),
	.inFOUR     (MUL_ctrl_wire[2]),
	.CLK_50     (RUN_CK),           // H6内部クロック（RUN_CKを使用）
	.ALS_H6_a   (REG_A_to_BUS_S_wire),
	.ALS_H6_q   (REG_Q_to_BUS_S_wire),

	// PSW制御信号（命令デコード）
	.EX0        (EX0_wire),
	.CLR_inst   (CLR_inst_wire),
	.MOV        (MOV_wire),
	.ADD        (ADD_wire), .ADC(ADC_wire),
	.SUB        (SUB_wire), .SBC(SBC_wire),
	.CMP        (CMP_wire),
	.ASL        (ASL_wire), .ASR(ASR_wire),
	.ROL        (ROL_wire), .ROR(ROR_wire),
	.RLC        (RLC_wire), .RRC(RRC_wire),
	.LSL        (LSL_wire), .LSR(LSR_wire),
	.OR_inst    (OR_inst_wire), .XOR_inst(XOR_inst_wire),
	.AND_inst   (AND_inst_wire), .BIT_inst(BIT_inst_wire),
	.MUL3       (MUL3_wire),

	// データパス制御信号
	.D5         (D5_wire),
	.D7         (D7_wire),

	// PSWフラグ出力（controllerへのフィードバック）
	.PSW_N      (PSW_N_wire),
	.PSW_Z      (PSW_Z_wire),
	.PSW_V      (PSW_V_wire),
	.PSW_C      (PSW_C_wire)
);

assign	LEDG[5] = INSTSTEP;
assign	LEDG[6] = CLKSTEP;
assign	LEDG[4] = NORMAL;

endmodule
