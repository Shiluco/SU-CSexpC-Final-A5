// ============================================================
// H6 Module Wrapper
// H6乗算器モジュールのラッパー
// A_busとB_busの2入力をAND制御してORで結合してH6に入力
// ============================================================

module H6_module(
    // データ入力（16ビットバス）
    input  wire [15:0] A_bus_in,    // A bus input
    input  wire [15:0] B_bus_in,    // B bus input

    // 制御信号
    input  wire        MUL1,        // A bus input enable
    input  wire        MUL2_1,      // B bus input enable 1
    input  wire        MUL2_2,      // B bus input enable 2
    input  wire        Rst,         // Reset
    input  wire        inQLK,       // Control signal
    input  wire        inTWO,       // Control signal
    input  wire        inTHREE,     // Control signal
    input  wire        inFOUR,      // Control signal
    input  wire        CLK_50,      // Clock
    input  wire        ALS_H6_a,    // A register to S-bus control signal
    input  wire        ALS_H6_q,    // Q register to S-bus control signal

    // 出力データ（16ビットバス、ANDゲート後）
    output wire [15:0] H6_a_out,    // A register output (with AND gate)
    output wire [15:0] H6_q_out,    // Q register output (with AND gate)

    // バス出力（PSW計算用）
    output wire [15:0] A_mul_bus,
    output wire [15:0] Q_mul_bus,

    // ステータスフラグ
    output wire        alu_carryOut,
    output wire        alu_overflowOut
);

    // =========================================
    // H6への入力生成
    // =========================================
    wire [15:0] h6_a_controlled;
    wire [15:0] h6_b_controlled;
    wire [15:0] h6_input;
    wire        b_enable;

    // B_bus制御: MUL2_1とMUL2_2のOR
    assign b_enable = MUL2_1 | MUL2_2;

    // A_busをMUL1で制御
    transfer_and_16bit h6_a_gate(
        .enable(MUL1),
        .data_in(A_bus_in),
        .data_out(h6_a_controlled)
    );

    // B_busをb_enable (MUL2_1 | MUL2_2)で制御
    transfer_and_16bit h6_b_gate(
        .enable(b_enable),
        .data_in(B_bus_in),
        .data_out(h6_b_controlled)
    );

    // 2つの制御された入力をORで結合
    or_16bit h6_input_or(
        .in0(h6_a_controlled),
        .in1(h6_b_controlled),
        .out(h6_input)
    );

    // =========================================
    // H6のその他の接続
    // =========================================
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

    // =========================================
    // H6インスタンス化
    // =========================================
    H6 h6_inst(
        // データ入力（h6_inputから個別ビットに分解）
        .Zero_in(h6_input[0]),
        .One_in(h6_input[1]),
        .Two_in(h6_input[2]),
        .Three_in(h6_input[3]),
        .Four_in(h6_input[4]),
        .Five_in(h6_input[5]),
        .Six_in(h6_input[6]),
        .Seven_in(h6_input[7]),
        .Eight_in(h6_input[8]),
        .Nine_in(h6_input[9]),
        .A_in(h6_input[10]),
        .B_in(h6_input[11]),
        .C_in(h6_input[12]),
        .D_in(h6_input[13]),
        .E_in(h6_input[14]),
        .F_in(h6_input[15]),
        // データ出力（使用しない）
        .Zero_out(Zero_out), .One_out(One_out), .Two_out(Two_out), .Three_out(Three_out),
        .Four_out(Four_out), .Five_out(Five_out), .Six_out(Six_out), .Seven_out(Seven_out),
        .Eight_out(Eight_out), .Nine_out(Nine_out), .A_out(A_out), .B_out(B_out),
        .C_out(C_out), .D_out(D_out), .E_out(E_out), .F_out(F_out),
        // 制御信号
        .Rst(Rst),
        .inQLK(inQLK),
        .inTWO(inTWO),
        .inTHREE(inTHREE),
        .inFOUR(inFOUR),
        .CLK_50(CLK_50),
        // LED出力（使用しない）
        .fixOneLED(fixOneLED), .fixZeroLED(fixZeroLED), .outCLKLED(outCLKLED),
        .outCFLED(outCFLED), .CounterINLED(CounterINLED), .AndOneLED(AndOneLED),
        .AndTwoLED(AndTwoLED), .aluXULED(aluXULED), .MUX_RightLED(MUX_RightLED),
        .RegA_RWLED(RegA_RWLED), .RegQ_RWLED(RegQ_RWLED), .RstLED(RstLED),
        .inQLKLED(inQLKLED), .inTWOLED(inTWOLED), .inTHREELED(inTHREELED),
        .inFOURLED(inFOURLED),
        // ステータスフラグ
        .alu_carryOut(alu_carryOut),
        .alu_overflowOut(alu_overflowOut),
        // セグメント出力（Aレジスタ、Qレジスタ）
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
        .segE4(segE4), .segE5(segE5), .segE6(segE6),
        // バス出力（ALU乗算結果）
        .A_mul_bus(A_mul_bus),
        .Q_mul_bus(Q_mul_bus)
    );

    // =========================================
    // S-bus出力用ANDゲート制御
    // =========================================
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
