// ============================================================
// H6 Module Wrapper
// H6単体モジュールの出力とALS_H6_a, ALS_H6_qとのANDを取る
// ============================================================

module H6_module(
    // データ入力（16ビット個別信号）
    input  wire        Zero_in,
    input  wire        One_in,
    input  wire        Two_in,
    input  wire        Three_in,
    input  wire        Four_in,
    input  wire        Five_in,
    input  wire        Six_in,
    input  wire        Seven_in,
    input  wire        Eight_in,
    input  wire        Nine_in,
    input  wire        A_in,
    input  wire        B_in,
    input  wire        C_in,
    input  wire        D_in,
    input  wire        E_in,
    input  wire        F_in,

    // 制御信号
    input  wire        Rst,        // Reset
    input  wire        inQLK,      // Control signal
    input  wire        inTWO,      // Control signal
    input  wire        inTHREE,    // Control signal
    input  wire        inFOUR,     // Control signal
    input  wire        CLK_50,     // Clock
    input  wire        ALS_H6_a,   // A register to S-bus control signal
    input  wire        ALS_H6_q,   // Q register to S-bus control signal

    // 出力データ（16ビットバス、ANDゲート後）
    output wire [15:0] H6_a_out,   // A register output (with AND gate)
    output wire [15:0] H6_q_out,   // Q register output (with AND gate)

    // バス出力（PSW計算用）
    output wire [15:0] A_mul_bus,
    output wire [15:0] Q_mul_bus,

    // ステータスフラグ
    output wire        alu_carryOut,
    output wire        alu_overflowOut
);

    // セグメント入力は全て0に接続（未使用）
    wire seg_zero = 1'b0;

    // H6の出力（使用しないもの）
    wire Zero_out, One_out, Two_out, Three_out, Four_out, Five_out, Six_out, Seven_out;
    wire Eight_out, Nine_out, A_out, B_out, C_out, D_out, E_out, F_out;
    wire fixOneLED, fixZeroLED, outCLKLED, outCFLED, CounterINLED;
    wire AndOneLED, AndTwoLED, aluXULED, MUX_RightLED, RegA_RWLED, RegQ_RWLED;
    wire RstLED, inQLKLED, inTWOLED, inTHREELED, inFOURLED;
    wire Seg1_zero, Seg1_one, Seg1_two, Seg1_three, Seg1_four, Seg1_five, Seg1_six;
    wire Seg2_zero, Seg2_one, Seg2_two, Seg2_three, Seg2_four, Seg2_five, Seg2_six;
    wire Seg3_zero, Seg3_one, Seg3_two, Seg3_three, Seg3_four, Seg3_five, Seg3_six;
    wire Seg4_zero, Seg4_one, Seg4_two, Seg4_three, Seg4_four, Seg4_five, Seg4_six;
    wire Seg5_zero, Seg5_one, Seg5_two, Seg5_three, Seg5_four, Seg5_five, Seg5_six;
    wire Seg6_zero, Seg6_one, Seg6_two, Seg6_three, Seg6_four, Seg6_five, Seg6_six;
    wire Seg7_zero, Seg7_one, Seg7_two, Seg7_three, Seg7_four, Seg7_five, Seg7_six;
    wire Seg8_zero, Seg8_one, Seg8_two, Seg8_three, Seg8_four, Seg8_five, Seg8_six;
    wire segE0, segE1, segE2, segE3, segE4, segE5, segE6;

    // H6インスタンス化
    H6 h6_inst(
        // データ入力
        .Zero_in(Zero_in),
        .One_in(One_in),
        .Two_in(Two_in),
        .Three_in(Three_in),
        .Four_in(Four_in),
        .Five_in(Five_in),
        .Six_in(Six_in),
        .Seven_in(Seven_in),
        .Eight_in(Eight_in),
        .Nine_in(Nine_in),
        .A_in(A_in),
        .B_in(B_in),
        .C_in(C_in),
        .D_in(D_in),
        .E_in(E_in),
        .F_in(F_in),

        // 制御信号
        .Rst(Rst),
        .inQLK(inQLK),
        .inTWO(inTWO),
        .inTHREE(inTHREE),
        .inFOUR(inFOUR),
        .CLK_50(CLK_50),

        // セグメント入力（全て0）
        .Seg1_one(seg_zero), .Seg1_two(seg_zero), .Seg1_three(seg_zero),
        .Seg1_four(seg_zero), .Seg1_five(seg_zero), .Seg1_six(seg_zero),
        .Seg2_zero(seg_zero), .Seg2_one(seg_zero), .Seg2_two(seg_zero),
        .Seg2_three(seg_zero), .Seg2_four(seg_zero), .Seg2_five(seg_zero), .Seg2_six(seg_zero),
        .Seg3_zero(seg_zero), .Seg3_one(seg_zero), .Seg3_two(seg_zero),
        .Seg3_three(seg_zero), .Seg3_four(seg_zero), .Seg3_five(seg_zero), .Seg3_six(seg_zero),
        .Seg4_one(seg_zero), .Seg4_two(seg_zero), .Seg4_three(seg_zero),
        .Seg4_four(seg_zero), .Seg4_five(seg_zero), .Seg4_six(seg_zero),
        .Seg5_zero(seg_zero), .Seg5_one(seg_zero), .Seg5_two(seg_zero),
        .Seg5_three(seg_zero), .Seg5_four(seg_zero), .Seg5_five(seg_zero), .Seg5_six(seg_zero),
        .Seg6_zero(seg_zero), .Seg6_one(seg_zero), .Seg6_two(seg_zero),
        .Seg6_three(seg_zero), .Seg6_four(seg_zero), .Seg6_five(seg_zero), .Seg6_six(seg_zero),
        .Seg7_zero(seg_zero), .Seg7_one(seg_zero), .Seg7_two(seg_zero),
        .Seg7_three(seg_zero), .Seg7_four(seg_zero), .Seg7_five(seg_zero), .Seg7_six(seg_zero),
        .Seg8_zero(seg_zero), .Seg8_one(seg_zero), .Seg8_two(seg_zero),
        .Seg8_three(seg_zero), .Seg8_four(seg_zero), .Seg8_five(seg_zero), .Seg8_six(seg_zero),

        // ALU出力
        .alu_carryOut(alu_carryOut),
        .alu_overflowOut(alu_overflowOut),

        // データ出力（未使用）
        .Zero_out(Zero_out), .One_out(One_out), .Two_out(Two_out), .Three_out(Three_out),
        .Four_out(Four_out), .Five_out(Five_out), .Six_out(Six_out), .Seven_out(Seven_out),
        .Eight_out(Eight_out), .Nine_out(Nine_out), .A_out(A_out), .B_out(B_out),
        .C_out(C_out), .D_out(D_out), .E_out(E_out), .F_out(F_out),

        // バス出力
        .A_mul_bus(A_mul_bus),
        .Q_mul_bus(Q_mul_bus),

        // LED出力（未使用）
        .fixOneLED(fixOneLED), .fixZeroLED(fixZeroLED), .outCLKLED(outCLKLED),
        .outCFLED(outCFLED), .CounterINLED(CounterINLED), .AndOneLED(AndOneLED),
        .AndTwoLED(AndTwoLED), .aluXULED(aluXULED), .MUX_RightLED(MUX_RightLED),
        .RegA_RWLED(RegA_RWLED), .RegQ_RWLED(RegQ_RWLED), .RstLED(RstLED),
        .inQLKLED(inQLKLED), .inTWOLED(inTWOLED), .inTHREELED(inTHREELED), .inFOURLED(inFOURLED),

        // セグメント出力（未使用）
        .Seg1_zero(Seg1_zero), .Seg1_one(Seg1_one), .Seg1_two(Seg1_two),
        .Seg1_three(Seg1_three), .Seg1_four(Seg1_four), .Seg1_five(Seg1_five), .Seg1_six(Seg1_six),
        .Seg2_zero(Seg2_zero), .Seg2_one(Seg2_one), .Seg2_two(Seg2_two),
        .Seg2_three(Seg2_three), .Seg2_four(Seg2_four), .Seg2_five(Seg2_five), .Seg2_six(Seg2_six),
        .Seg3_zero(Seg3_zero), .Seg3_one(Seg3_one), .Seg3_two(Seg3_two),
        .Seg3_three(Seg3_three), .Seg3_four(Seg3_four), .Seg3_five(Seg3_five), .Seg3_six(Seg3_six),
        .Seg4_zero(Seg4_zero), .Seg4_one(Seg4_one), .Seg4_two(Seg4_two),
        .Seg4_three(Seg4_three), .Seg4_four(Seg4_four), .Seg4_five(Seg4_five), .Seg4_six(Seg4_six),
        .Seg5_zero(Seg5_zero), .Seg5_one(Seg5_one), .Seg5_two(Seg5_two),
        .Seg5_three(Seg5_three), .Seg5_four(Seg5_four), .Seg5_five(Seg5_five), .Seg5_six(Seg5_six),
        .Seg6_zero(Seg6_zero), .Seg6_one(Seg6_one), .Seg6_two(Seg6_two),
        .Seg6_three(Seg6_three), .Seg6_four(Seg6_four), .Seg6_five(Seg6_five), .Seg6_six(Seg6_six),
        .Seg7_zero(Seg7_zero), .Seg7_one(Seg7_one), .Seg7_two(Seg7_two),
        .Seg7_three(Seg7_three), .Seg7_four(Seg7_four), .Seg7_five(Seg7_five), .Seg7_six(Seg7_six),
        .Seg8_zero(Seg8_zero), .Seg8_one(Seg8_one), .Seg8_two(Seg8_two),
        .Seg8_three(Seg8_three), .Seg8_four(Seg8_four), .Seg8_five(Seg8_five), .Seg8_six(Seg8_six),
        .segE0(segE0), .segE1(segE1), .segE2(segE2), .segE3(segE3),
        .segE4(segE4), .segE5(segE5), .segE6(segE6)
    );

    // ALS_H6_a制御信号とのAND（Aレジスタ）
    transfer_and_16bit h6_a_and(
        .enable(ALS_H6_a),
        .data_in(A_mul_bus),
        .data_out(H6_a_out)
    );

    // ALS_H6_q制御信号とのAND（Qレジスタ）
    transfer_and_16bit h6_q_and(
        .enable(ALS_H6_q),
        .data_in(Q_mul_bus),
        .data_out(H6_q_out)
    );

endmodule
