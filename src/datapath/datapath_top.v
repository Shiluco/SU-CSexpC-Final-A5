// ============================================================
// Datapath Top Module
// データパス全体を統合（レジスタファイル、ALU、シフタ、PSW、バス構造）
// ============================================================

module datapath_top(
    // クロック・リセット
    input  wire        CLK,
    input  wire        CLR,          // クリア（active low）

    // メモリインターフェース
    input  wire [15:0] M_bus_in,       // メモリからのデータ入力
    output wire [15:0] M_bus_out,      // メモリへのデータ出力
    output wire [15:0] MAR_out,        // メモリアドレス出力

    // レジスタ制御信号（Aバス出力）
    input  wire        R0A,
    input  wire        R1A,
    input  wire        R2A,
    input  wire        R3A,
    input  wire        R4A,
    input  wire        R5A,
    input  wire        R6A,
    input  wire        R7A,

    // レジスタ制御信号（Sバス入力）
    input  wire        SR0,
    input  wire        SR1,
    input  wire        SR2,
    input  wire        SR3,
    input  wire        SR4,
    input  wire        SR5,
    input  wire        SR6,
    input  wire        SR7,

    // B0レジスタ制御信号
    input  wire        SB0,            // Sバス → B0
    input  wire        B0B,            // B0 → Bバス

    // MDR制御信号
    input  wire        MMD,            // Mバス → MDR
    input  wire        SMD,            // Sバス → MDR
    input  wire        MDA,            // MDR → Aバス
    input  wire        MDM,            // MDR → Mバス

    // MAR制御信号
    input  wire        SMA,            // Sバス → MAR

    // シフタ制御信号
    input  wire        SFT_R,
    input  wire        SFT_L,
    input  wire        SFT_A,
    input  wire        SFT_B,
    input  wire        SFT_C,
    input  wire        SFT_D,
    input  wire        SFT_E,
    input  wire        SHS,            // シフタ → Sバス

    // 定数値出力制御信号（割り込みゲート名に合わせる）
    input  wire        OIT_gate,       // 0x0080 → Sバス
    input  wire        EIT_gate,       // 0x00C0 → Sバス

    // H4 ALU制御信号
    input  wire        ALU_y,
    input  wire        ALU_z,
    input  wire        ALU_x,
    input  wire        ALU_v,
    input  wire        ALU_u,
    input  wire        ALS_H4,         // H4 → Sバス

    // H6制御信号
    input  wire        MUL1,           // H6 A入力制御
    input  wire        MUL2_1,         // H6 B入力制御1
    input  wire        MUL2_2,         // H6 B入力制御2
    input  wire        Rst_H6,
    input  wire        inQLK,
    input  wire        inTWO,
    input  wire        inTHREE,
    input  wire        inFOUR,
    input  wire        CLK_50,
    input  wire        ALS_H6_a,       // H6 Aレジスタ → Sバス
    input  wire        ALS_H6_q,       // H6 Qレジスタ → Sバス

    // PSW制御信号（命令デコード）
    input  wire        EX0,
    input  wire        CLR_inst,
    input  wire        MOV,
    input  wire        ADD,
    input  wire        ADC,            // Add with carry
    input  wire        SUB,
    input  wire        SBC,            // Subtract with carry
    input  wire        CMP,
    input  wire        ASL,
    input  wire        ASR,
    input  wire        ROL,
    input  wire        ROR,
    input  wire        RLC,            // Rotate left through carry
    input  wire        RRC,            // Rotate right through carry
    input  wire        LSL,
    input  wire        LSR,
    input  wire        OR_inst,
    input  wire        XOR_inst,
    input  wire        AND_inst,
    input  wire        BIT_inst,
    input  wire        MUL3,           // 乗算命令（H6結果選択）

    // データパス制御信号
    input  wire        D5,
    input  wire        D7,

    // PSWフラグ出力（controllerへのフィードバック）
    output wire        PSW_N,
    output wire        PSW_Z,
    output wire        PSW_V,
    output wire        PSW_C,

    // レジスタ値出力（表示用）
    output wire [15:0] QB_out,      // B0レジスタ値
    output wire [15:0] QR0_out,      // R0レジスタ値
    output wire [15:0] QR1_out,      // R1レジスタ値
    output wire [15:0] QR2_out,      // R2レジスタ値
    output wire [15:0] QR3_out,      // R3レジスタ値
    output wire [15:0] QR4_out,      // R4レジスタ値
    output wire [15:0] QR5_out,      // R5レジスタ値
    output wire [15:0] QR6_out,      // R6レジスタ値
    output wire [15:0] QR7_out       // R7レジスタ値
);

    // =========================================
    // 内部バス
    // =========================================
    wire [15:0] A_bus;
    wire [15:0] B_bus;
    wire [15:0] S_bus;

    // =========================================
    // レジスタファイル（R0～R7）の出力
    // =========================================
    wire [15:0] R0_out, R1_out, R2_out, R3_out;
    wire [15:0] R4_out, R5_out, R6_out, R7_out_internal;
    
    // レジスタ値（表示用）
    wire [15:0] R0_value, R1_value, R2_value, R3_value;
    wire [15:0] R4_value, R6_value, R7_value;

    // =========================================
    // R0～R4, R6～R7レジスタ（通常のGPR）
    // =========================================
    GPR r0 (.CLK(CLK), .CLR(CLR), .SR(SR0), .S_bus(S_bus), .RA(R0A), .data_out(R0_out), .reg_value(R0_value));
    GPR r1 (.CLK(CLK), .CLR(CLR), .SR(SR1), .S_bus(S_bus), .RA(R1A), .data_out(R1_out), .reg_value(R1_value));
    GPR r2 (.CLK(CLK), .CLR(CLR), .SR(SR2), .S_bus(S_bus), .RA(R2A), .data_out(R2_out), .reg_value(R2_value));
    GPR r3 (.CLK(CLK), .CLR(CLR), .SR(SR3), .S_bus(S_bus), .RA(R3A), .data_out(R3_out), .reg_value(R3_value));
    GPR r4 (.CLK(CLK), .CLR(CLR), .SR(SR4), .S_bus(S_bus), .RA(R4A), .data_out(R4_out), .reg_value(R4_value));
    GPR r6 (.CLK(CLK), .CLR(CLR), .SR(SR6), .S_bus(S_bus), .RA(R6A), .data_out(R6_out), .reg_value(R6_value));
    GPR #(.INIT_VALUE(16'hf800)) r7 (.CLK(CLK), .CLR(CLR), .SR(SR7), .S_bus(S_bus), .RA(R7A), .data_out(R7_out_internal), .reg_value(R7_value));

    // =========================================
    // R5レジスタ（PSW）
    // =========================================
    wire [15:0] PSW_out;
    wire [15:0] R5_input;

    // R5はPSWの値を入力として受け取る
    // SR5が有効な時はPSW_outをR5に書き込む
    switchable_register r5_reg(
        .CLK(CLK),
        .CLR(CLR),
        .SR(SR5),
        .S_bus(PSW_out),
        .Q(R5_input)
    );

    // R5のAバスへの出力
    transfer_and_16bit r5_transfer(
        .enable(R5A),
        .data_in(R5_input),
        .data_out(R5_out)
    );

    // =========================================
    // B0レジスタ
    // =========================================
    wire [15:0] B0_out;
    wire [15:0] B0_q;

    switchable_register b0_reg(
        .CLK(CLK),
        .CLR(CLR),
        .SR(SB0),
        .S_bus(S_bus),
        .Q(B0_q)
    );

    transfer_and_16bit b0_transfer(
        .enable(B0B),
        .data_in(B0_q),
        .data_out(B0_out)
    );

    // =========================================
    // MDR（Memory Data Register）
    // =========================================
    wire [15:0] MDR_to_A;

    MDR mdr_inst(
        .CLK(CLK),
        .CLR(CLR),
        .M_bus(M_bus_in),
        .S_bus(S_bus),
        .MMD(MMD),
        .SMD(SMD),
        .MDA(MDA),
        .MDM(MDM),
        .MDR_to_A(MDR_to_A),
        .MDR_to_M(M_bus_out),
        .MDR_q()
    );

    // =========================================
    // MAR（Memory Address Register）
    // =========================================
    switchable_register mar_inst(
        .CLK(CLK),
        .CLR(CLR),
        .SR(SMA),
        .S_bus(S_bus),
        .Q(MAR_out)
    );

    // =========================================
    // Shifter
    // =========================================
    wire [15:0] shifter_out;
    wire [15:0] shifter_result_bus;
    wire        shifter_Cf;

    shifter_module shifter_inst(
        .Rin(SFT_R),
        .Lin(SFT_L),
        .Ain(SFT_A),
        .Bin(SFT_B),
        .Cin(SFT_C),
        .Din(SFT_D),
        .Ein(SFT_E),
        .SHS(SHS),
        .A_bus(A_bus),
        .shifter_out(shifter_out),
        .shifter_result_bus(shifter_result_bus),
        .Cf(shifter_Cf)
    );

    // =========================================
    // H4 ALU
    // =========================================
    wire [15:0] H4_out;
    wire [15:0] ALU_result_bus;
    wire        H4_carry;
    wire        H4_overflow;

    H4_module h4_inst(
        .y(ALU_y),
        .z(ALU_z),
        .x(ALU_x),
        .v(ALU_v),
        .u(ALU_u),
        .ALS_H4(ALS_H4),
        .A_bus_in(A_bus),
        .B_bus_in(B_bus),
        .H4_out(H4_out),
        .ALU_result_bus(ALU_result_bus),
        .carry(H4_carry),
        .overflow(H4_overflow)
    );

    // =========================================
    // H6（乗算器付きALU）
    // =========================================
    wire [15:0] H6_a_out;
    wire [15:0] H6_q_out;
    wire [15:0] A_mul_bus;
    wire [15:0] Q_mul_bus;
    wire        H6_carry;
    wire        H6_overflow;

    H6_module h6_inst(
        .A_bus_in(A_bus),
        .B_bus_in(B_bus),
        .MUL1(MUL1),
        .MUL2_1(MUL2_1),
        .MUL2_2(MUL2_2),
        .Rst(Rst_H6),
        .inQLK(inQLK),
        .inTWO(inTWO),
        .inTHREE(inTHREE),
        .inFOUR(inFOUR),
        .CLK_50(CLK_50),
        .ALS_H6_a(ALS_H6_a),
        .ALS_H6_q(ALS_H6_q),
        .H6_a_out(H6_a_out),
        .H6_q_out(H6_q_out),
        .A_mul_bus(A_mul_bus),
        .Q_mul_bus(Q_mul_bus),
        .alu_carryOut(H6_carry),
        .alu_overflowOut(H6_overflow)
    );

    // =========================================
    // PSW（Program Status Word）
    // =========================================
    wire J_N, K_N, J_Z, K_Z, J_V, K_V, J_C, K_C;

    // PSWロジック（J/K信号生成）
    PSW_logic psw_logic_inst(
        // Instruction decode signals
        .EX0(EX0),
        .CLR(CLR_inst),
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
        .MUL3(MUL3),

        // Shifter outputs (using raw ungated output)
        .shifter_out(shifter_result_bus),
        .shifter_Cf(shifter_Cf),

        // H4 ALU outputs (using raw ungated outputs)
        .H4_out(ALU_result_bus),
        .ALU_carry(H4_carry),
        .ALU_overflow(H4_overflow),

        // H6 Multiplier outputs (using raw ungated outputs)
        .H6_a_out(A_mul_bus),
        .H6_q_out(Q_mul_bus),

        // Data path control signals
        .D5(D5),
        .D7(D7),

        // Output J/K signals
        .J_N(J_N), .K_N(K_N),
        .J_Z(J_Z), .K_Z(K_Z),
        .J_V(J_V), .K_V(K_V),
        .J_C(J_C), .K_C(K_C)
    );

    // PSWレジスタ（JKフリップフロップ）
    PSW_setreset psw_reg_inst(
        .J_N(J_N), .K_N(K_N),
        .J_Z(J_Z), .K_Z(K_Z),
        .J_V(J_V), .K_V(K_V),
        .J_C(J_C), .K_C(K_C),
        .CLK(CLK),
        .CLR(CLR),
        .PSW(PSW_out)
    );

    // =========================================
    // PSWフラグの抽出（controllerへのフィードバック）
    // =========================================
    // PSW[3:0] = NZVC
    assign PSW_N = PSW_out[3];
    assign PSW_Z = PSW_out[2];
    assign PSW_V = PSW_out[1];
    assign PSW_C = PSW_out[0];

    // =========================================
    // 定数値（0x0080, 0x00C0）の出力制御
    // =========================================
    wire [15:0] const_0080_out;
    wire [15:0] const_00C0_out;

    // 定数値定義（2進数リテラル）
    // 0x0080 = 0000_0000_1000_0000
    // 0x00C0 = 0000_0000_1100_0000
    wire [15:0] const_0080 = 16'b0000_0000_1000_0000;
    wire [15:0] const_00C0 = 16'b0000_0000_1100_0000;

    // ANDゲート制御（transfer_and_16bit使用）
    transfer_and_16bit transfer_0080(
        .enable(OIT_gate),
        .data_in(const_0080),
        .data_out(const_0080_out)
    );

    transfer_and_16bit transfer_00C0(
        .enable(EIT_gate),
        .data_in(const_00C0),
        .data_out(const_00C0_out)
    );

    // =========================================
    // バス接続
    // =========================================

    // Aバス: R0A～R7A + MDA（9入力）
    bus_A a_bus_inst(
        .in0(R0_out),
        .in1(R1_out),
        .in2(R2_out),
        .in3(R3_out),
        .in4(R4_out),
        .in5(R5_out),
        .in6(R6_out),
        .in7(R7_out_internal),
        .in8(MDR_to_A),
        .out(A_bus)
    );

    // Bバス: B0B（1入力）
    bus_B b_bus_inst(
        .in0(B0_out),
        .out(B_bus)
    );

    // Sバス: 6入力（shifter, H4, H6_a, H6_q, 0x0080, 0x00C0）
    bus_S s_bus_inst(
        .in0(shifter_out),      // シフタ出力（SHS制御）
        .in1(H4_out),           // H4 ALU出力（ALS_H4制御）
        .in2(H6_a_out),         // H6 Aレジスタ出力（ALS_H6_a制御）
        .in3(H6_q_out),         // H6 Qレジスタ出力（ALS_H6_q制御）
        .in4(const_0080_out),   // 定数0x0080（S_0080制御）
        .in5(const_00C0_out),   // 定数0x00C0（S_00C0制御）
        .out(S_bus)
    );

    // =========================================
    // レジスタ値出力（表示用）
    // =========================================
    assign QB_out  = B0_q;           // B0レジスタ値
    assign QR0_out = R0_value;       // R0レジスタ値
    assign QR1_out = R1_value;       // R1レジスタ値
    assign QR2_out = R2_value;       // R2レジスタ値
    assign QR3_out = R3_value;       // R3レジスタ値
    assign QR4_out = R4_value;       // R4レジスタ値
    assign QR5_out = R5_input;        // R5レジスタ値（PSW）
    assign QR6_out = R6_value;       // R6レジスタ値
    assign QR7_out = R7_value;       // R7レジスタ値

endmodule
