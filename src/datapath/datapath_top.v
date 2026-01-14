// ============================================================
// Datapath Top Module
// データパス全体を統合（レジスタファイル、ALU、シフタ、PSW、バス構造）
// ============================================================

module datapath_top(
    // クロック・リセット
    input  wire        CLK,
    input  wire        CLR,

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
    input  wire        Rin,
    input  wire        Lin,
    input  wire        Ain_shift,
    input  wire        Bin_shift,
    input  wire        Cin,
    input  wire        Din,
    input  wire        Ein,
    input  wire        SHS,            // シフタ → Sバス

    // 定数値出力制御信号
    input  wire        S_0080,         // 0x0080 → Sバス
    input  wire        S_00C0,         // 0x00C0 → Sバス

    // H4 ALU制御信号
    input  wire        y,
    input  wire        z,
    input  wire        x,
    input  wire        v,
    input  wire        Sa,
    input  wire        Sb,
    input  wire        u,
    input  wire        ALS_H4,         // H4 → Sバス

    // H6制御信号
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
    input  wire        SFTs,
    input  wire        MOV,
    input  wire        ADD,
    input  wire        SUB,
    input  wire        CMP,
    input  wire        BITs,
    input  wire        ASL,
    input  wire        ASR,
    input  wire        ROL,
    input  wire        ROR,
    input  wire        LSL,
    input  wire        LSR,
    input  wire        OR_inst,
    input  wire        XOR_inst,
    input  wire        AND_inst,
    input  wire        BIT_inst,
    input  wire        MUL3,           // 乗算命令（H6結果選択）

    // データパス制御信号
    input  wire        D5,
    input  wire        D7
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
    wire [15:0] R4_out, R5_out, R6_out, R7_out;

    // =========================================
    // R0～R4, R6～R7レジスタ（通常のGPR）
    // =========================================
    GPR r0 (.CLK(CLK), .CLR(CLR), .SR(SR0), .S_bus(S_bus), .RA(R0A), .data_out(R0_out));
    GPR r1 (.CLK(CLK), .CLR(CLR), .SR(SR1), .S_bus(S_bus), .RA(R1A), .data_out(R1_out));
    GPR r2 (.CLK(CLK), .CLR(CLR), .SR(SR2), .S_bus(S_bus), .RA(R2A), .data_out(R2_out));
    GPR r3 (.CLK(CLK), .CLR(CLR), .SR(SR3), .S_bus(S_bus), .RA(R3A), .data_out(R3_out));
    GPR r4 (.CLK(CLK), .CLR(CLR), .SR(SR4), .S_bus(S_bus), .RA(R4A), .data_out(R4_out));
    GPR r6 (.CLK(CLK), .CLR(CLR), .SR(SR6), .S_bus(S_bus), .RA(R6A), .data_out(R6_out));
    GPR r7 (.CLK(CLK), .CLR(CLR), .SR(SR7), .S_bus(S_bus), .RA(R7A), .data_out(R7_out));

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
    holding_circuit_16bit mar_inst(
        .CLK(CLK),
        .CLR(CLR),
        .enable(SMA),
        .data_in(S_bus),
        .data_out(MAR_out)
    );

    // =========================================
    // Shifter
    // =========================================
    wire [15:0] shifter_out;
    wire        shifter_Cf;

    shifter_module shifter_inst(
        .Rin(Rin),
        .Lin(Lin),
        .Ain(Ain_shift),
        .Bin(Bin_shift),
        .Cin(Cin),
        .Din(Din),
        .Ein(Ein),
        .SHS(SHS),
        .A_bus(A_bus),
        .shifter_out(shifter_out),
        .Cf(shifter_Cf)
    );

    // =========================================
    // H4 ALU
    // =========================================
    wire [15:0] H4_out;
    wire [15:0] ALU_result_bus;
    wire [15:0] A_input_bus;
    wire [15:0] B_reg_bus;
    wire        H4_carry;
    wire        H4_overflow;

    H4_module h4_inst(
        .y(y),
        .z(z),
        .CLK(CLK),
        .CLR(CLR),
        .x(x),
        .v(v),
        .Sa(Sa),
        .Sb(Sb),
        .u(u),
        .ALS_H4(ALS_H4),
        .aa(A_bus[0]),  .ab(A_bus[1]),  .ac(A_bus[2]),  .ad(A_bus[3]),
        .ae(A_bus[4]),  .af(A_bus[5]),  .ag(A_bus[6]),  .ah(A_bus[7]),
        .ai(A_bus[8]),  .aj(A_bus[9]),  .ak(A_bus[10]), .al(A_bus[11]),
        .am(A_bus[12]), .an(A_bus[13]), .ao(A_bus[14]), .ap(A_bus[15]),
        .H4_out(H4_out),
        .ALU_result_bus(ALU_result_bus),
        .A_input_bus(A_input_bus),
        .B_reg_bus(B_reg_bus),
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
        .Zero_in(A_bus[0]),  .One_in(A_bus[1]),    .Two_in(A_bus[2]),    .Three_in(A_bus[3]),
        .Four_in(A_bus[4]),  .Five_in(A_bus[5]),   .Six_in(A_bus[6]),    .Seven_in(A_bus[7]),
        .Eight_in(A_bus[8]), .Nine_in(A_bus[9]),   .A_in(A_bus[10]),     .B_in(A_bus[11]),
        .C_in(A_bus[12]),    .D_in(A_bus[13]),     .E_in(A_bus[14]),     .F_in(A_bus[15]),
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
        .EX0(EX0),
        .CLR_inst(CLR_inst),
        .SFTs(SFTs),
        .MOV(MOV),
        .ADD(ADD),
        .SUB(SUB),
        .CMP(CMP),
        .BITs(BITs),
        .ASL(ASL),
        .ASR(ASR),
        .ROL(ROL),
        .ROR(ROR),
        .LSL(LSL),
        .LSR(LSR),
        .OR_inst(OR_inst),
        .XOR_inst(XOR_inst),
        .AND_inst(AND_inst),
        .BIT_inst(BIT_inst),
        .ALU_result_bus(ALU_result_bus),
        .ALU_carry(H4_carry),
        .ALU_overflow(H4_overflow),
        .shifter_Cf(shifter_Cf),
        .D5(D5),
        .D7(D7),
        .af(A_bus[15]),
        .ae(A_bus[14]),
        .bf(B_bus[15]),
        .be(B_bus[14]),
        .ce(ALU_result_bus[14]),
        .a0(A_bus[0]),
        .current_C(PSW_out[0]),
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
    // 定数値（0x0080, 0x00C0）の出力制御
    // =========================================
    wire [15:0] const_0080_out;
    wire [15:0] const_00C0_out;

    // 定数値定義
    wire [15:0] const_0080 = 16'h0080;
    wire [15:0] const_00C0 = 16'h00C0;

    // ANDゲート制御（transfer_and_16bit使用）
    transfer_and_16bit transfer_0080(
        .enable(S_0080),
        .data_in(const_0080),
        .data_out(const_0080_out)
    );

    transfer_and_16bit transfer_00C0(
        .enable(S_00C0),
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
        .in7(R7_out),
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

endmodule
