// ============================================================
// state_mul_controller モジュール
// status_counter と counter_4bit_sync を統合
// ============================================================

module state_mul_controller (
    input  wire clk,
    input  wire reset,     // async, active-high

    // status_counter への入力
    input  wire ITA,
    input  wire ACK,
    input  wire FROM_D,
    input  wire TO_D,
    input  wire op_MUL,

    // status_counter からの出力
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

    // counter_4bit_sync からの出力
    output wire [3:0] counter_q
);

    // =========================
    // 内部信号
    // =========================

    // カウンタのis_all_zero → status_counterへ
    wire is_all_zero;

    // MUL計算中フラグ（ MUL2_1 or MUL2_2）
    wire is_calculate_MUL;
    assign is_calculate_MUL = MUL2_1 | MUL2_2;

    // =========================
    // status_counter インスタンス
    // =========================
    status_counter u_sc (
        .clk(clk),
        .reset(reset),
        .ITA(ITA),
        .ACK(ACK),
        .FROM_D(FROM_D),
        .TO_D(TO_D),
        .op_MUL(op_MUL),
        .is_all_zero(is_all_zero),
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
        .MUL4(MUL4)
    );

    // =========================
    // counter_4bit_sync インスタンス
    // =========================
    counter_4bit_sync u_counter (
        .clk(clk),
        .clr(reset),
        .en(is_calculate_MUL),
        .q(counter_q),
        .is_all_zero(is_all_zero)
    );

endmodule

