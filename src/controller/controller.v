// ============================================================
// Controller モジュール
// state_mul_controller, ISR_decoder, itf を統合
// ============================================================

module controller (
    input  wire        clk,
    input  wire        reset,       // async, active-high

    // 命令入力バス
    input  wire [15:0] m_bus,

    // state_mul_controller への入力
    input  wire ACK,

    // PSW入力
    input  wire PSW_N,
    input  wire PSW_Z,
    input  wire PSW_V,
    input  wire PSW_C,

    // itf への入力
    input  wire KIT,            // 外部割込み要求
    input  wire EIT_input,      // 外部割込み入力(OIT,BITB_N)

    // ステート出力
    output wire IF0,
    output wire IF1,
    output wire FF0,
    output wire FF1,
    output wire FF2,
    output wire TF0,
    output wire TF1,
    output wire EX0,
    output wire EX1,
    output wire IT0,
    output wire IT1,
    output wire IT2,
    output wire MUL1,
    output wire MUL2_1,
    output wire MUL2_2,
    output wire MUL3,
    output wire MUL4,

    // MULカウンタ出力
    output wire [3:0] counter_q,

    // itf からの出力
    output wire ITA,
    output wire ITF,

    // decoder からの出力
    output wire MDA,

    output wire R0A,
    output wire R1A,
    output wire R2A,
    output wire R3A,
    output wire R4A,
    output wire R5A,
    output wire R6A,
    output wire R7A,

    output wire B0B,

    output wire SMD,
    output wire SMA,

    output wire SR0,
    output wire SR1,
    output wire SR2,
    output wire SR3,
    output wire SR4,
    output wire SR5,
    output wire SR6,
    output wire SR7,

    output wire SB0,
    output wire ALS,

    output wire ALU_x,
    output wire ALU_y,
    output wire ALU_z,
    output wire ALU_u,
    output wire ALU_v,

    output wire SHS,

    output wire SFT_A,
    output wire SFT_B,
    output wire SFT_C,
    output wire SFT_D,
    output wire SFT_E,
    output wire SFT_R,
    output wire SFT_L,

    output wire SET_PSW,

    output wire R_W_N,
    output wire MREQ_N,
    output wire MIRQ_N,
    output wire MIS,

    output wire MMD,
    output wire MDM,

    output wire f_is_D,
    output wire t_is_D,
    output wire is_T_DFive,
    output wire is_T_DSeven,

    output wire EIT_gate,
    output wire OIT_gate,

    output wire BUS_A_to_AND_one,
    output wire BUS_B_to_AND_one,
    output wire REG_A_to_BUS_S,
    output wire REG_B_to_BUS_S,
    output wire [2:0] MUL_ctrl,

    // 命令種別出力
    output wire CLR_inst,
    output wire MOV,
    output wire ADD,
    output wire ADC,
    output wire SUB,
    output wire SBC,
    output wire CMP,

    output wire ASL,
    output wire ASR,
    output wire ROL,
    output wire ROR,
    output wire RLC,
    output wire RRC,
    output wire LSL,
    output wire LSR,

    output wire OR_inst,
    output wire XOR_inst,
    output wire AND_inst,
    output wire BIT_inst,

    // ISRレジスタの出力（デバッグ用）
    output wire [15:0] ISR_out
);

    // =========================
    // 内部信号
    // =========================

    // CLR信号（ISR_decoder用、active low）
    wire CLR;
    assign CLR = ~reset;

    // RESET_N（itf用、active low）
    wire RESET_N;
    assign RESET_N = ~reset;

    // itf からの出力（内部接続）
    wire EIT;
    wire OIT;

    // decoder からの出力（内部接続）
    wire op_MUL;
    wire op_RIT;
    wire op_SVC;

    // =========================
    // itf インスタンス
    // =========================
    itf u_itf (
        .KIT(KIT),
        .SVC(op_SVC),         // decoderのop_SVCを使用
        .RIT(op_RIT),         // decoderのop_RITを使用
        .IT0(IT0),
        .RESET_N(RESET_N),
        .IT2(IT2),
        .KITECK(clk),
        .EX0(EX0),
        .EX1(EX1),
        .EIT_input(EIT_input),
        .ITA(ITA),
        .ITF(ITF),
        .OIT(OIT),
        .EIT(EIT)
    );

    // =========================
    // state_mul_controller インスタンス
    // =========================
    state_mul_controller u_state_mul (
        .clk(clk),
        .reset(reset),
        .ITA(ITA),
        .ACK(ACK),
        .FROM_D(f_is_D),    // ISR_decoderのf_is_Dを使用
        .TO_D(t_is_D),      // ISR_decoderのt_is_Dを使用
        .op_MUL(op_MUL),
        .IF0(IF0),
        .IF1(IF1),
        .FF0(FF0),
        .FF1(FF1),
        .FF2(FF2),
        .TF0(TF0),
        .TF1(TF1),
        .EX0(EX0),
        .EX1(EX1),
        .IT0(IT0),
        .IT1(IT1),
        .IT2(IT2),
        .MUL1(MUL1),
        .MUL2_1(MUL2_1),
        .MUL2_2(MUL2_2),
        .MUL3(MUL3),
        .MUL4(MUL4),
        .counter_q(counter_q)
    );

    // =========================
    // ISR_decoder インスタンス
    // =========================
    ISR_decoder u_isr_decoder (
        .CLK(clk),
        .CLR(CLR),
        .m_bus(m_bus),
        .IF0(IF0),
        .IF1(IF1),
        .FF0(FF0),
        .FF1(FF1),
        .FF2(FF2),
        .TF0(TF0),
        .TF1(TF1),
        .EX0(EX0),
        .EX1(EX1),
        .IT0(IT0),
        .IT1(IT1),
        .IT2(IT2),
        .MUL1(MUL1),
        .MUL2_1(MUL2_1),
        .MUL2_2(MUL2_2),
        .MUL3(MUL3),
        .MUL4(MUL4),
        .PSW_N(PSW_N),
        .PSW_Z(PSW_Z),
        .PSW_V(PSW_V),
        .PSW_C(PSW_C),
        .EIT(EIT),          // itfから受け取る
        .OIT(OIT),          // itfから受け取る
        .MDA(MDA),
        .R0A(R0A),
        .R1A(R1A),
        .R2A(R2A),
        .R3A(R3A),
        .R4A(R4A),
        .R5A(R5A),
        .R6A(R6A),
        .R7A(R7A),
        .B0B(B0B),
        .SMD(SMD),
        .SMA(SMA),
        .SR0(SR0),
        .SR1(SR1),
        .SR2(SR2),
        .SR3(SR3),
        .SR4(SR4),
        .SR5(SR5),
        .SR6(SR6),
        .SR7(SR7),
        .SB0(SB0),
        .ALS(ALS),
        .ALU_x(ALU_x),
        .ALU_y(ALU_y),
        .ALU_z(ALU_z),
        .ALU_u(ALU_u),
        .ALU_v(ALU_v),
        .SHS(SHS),
        .SFT_A(SFT_A),
        .SFT_B(SFT_B),
        .SFT_C(SFT_C),
        .SFT_D(SFT_D),
        .SFT_E(SFT_E),
        .SFT_R(SFT_R),
        .SFT_L(SFT_L),
        .SET_PSW(SET_PSW),
        .R_W_N(R_W_N),
        .MREQ_N(MREQ_N),
        .MIRQ_N(MIRQ_N),
        .MIS(MIS),
        .MMD(MMD),
        .MDM(MDM),
        .f_is_D(f_is_D),
        .t_is_D(t_is_D),
        .is_T_DFive(is_T_DFive),
        .is_T_DSeven(is_T_DSeven),
        .EIT_gate(EIT_gate),
        .OIT_gate(OIT_gate),
        .op_MUL(op_MUL),
        .op_RIT(op_RIT),
        .op_SVC(op_SVC),
        .BUS_A_to_AND_one(BUS_A_to_AND_one),
        .BUS_B_to_AND_one(BUS_B_to_AND_one),
        .REG_A_to_BUS_S(REG_A_to_BUS_S),
        .REG_B_to_BUS_S(REG_B_to_BUS_S),
        .MUL_ctrl(MUL_ctrl),

        .CLR_inst(CLR_inst),
        .MOV(MOV),
        .ADD(ADD),
        .ADC(ADC),
        .SUB(SUB),
        .SBC(SBC),
        .CMP(CMP),

        .ASL(ASL),
        .ASR(ASR),
        .ROL(ROL),
        .ROR(ROR),
        .RLC(RLC),
        .RRC(RRC),
        .LSL(LSL),
        .LSR(LSR),

        .OR_inst(OR_inst),
        .XOR_inst(XOR_inst),
        .AND_inst(AND_inst),
        .BIT_inst(BIT_inst),

        .ISR_out(ISR_out)
    );

endmodule
