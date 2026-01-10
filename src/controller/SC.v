module status_counter (
    input  wire clk,
    input  wire reset,     // async, active-high
    input  wire is_all_zero,

    input  wire ITA,
    input  wire ACK,
    input  wire FROM_D,
    input  wire TO_D,
    input  wire op_MUL,

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
    output wire MUL4
);

    // =========================
    // 次状態論理（配線）
    // =========================
    wire dIF0, dIF1;
    wire dFF0, dFF1, dFF2;
    wire dTF0, dTF1;
    wire dEX0, dEX1;
    wire dIT0, dIT1, dIT2;
    wire dMUL1, dMUL2_1, dMUL2_2, dMUL3, dMUL4;

    assign dIF0 = IT2 |  EX1 | (EX0 &  TO_D);
    assign dIF1 = IF0 & ~ITA;
    assign dFF0 = IF1;
    assign dFF1 = (FF0 & ~FROM_D) |  (FF1 & ~ACK);
    assign dFF2 = (FF0 &  FROM_D) |  (FF1 &  ACK);
    assign dTF0 = FF2;
    assign dTF1 = TF0 & ~TO_D;
    assign dEX0 = (TF0 &  TO_D) |  TF1;
    assign dEX1 = EX0 & ~TO_D;

    assign dIT0 = IF0 &  ITA;
    assign dIT1 = IT0;
    assign dIT2 = IT1;

    assign dMUL1 = op_MUL;
    assign dMUL2_1 = MUL1;
    assign dMUL2_2 = MUL2_1;
    assign dMUL3 = MUL2_2 & is_all_zero; // カウント値が0のときMUL3を0にする
    assign dMUL4 = MUL3;

    // =========================
    // D-FF インスタンス（部品）
    // =========================

    // IF0だけ非同期 PRE（初期値1）
    v_dff_async u_if0 (.clk(clk), .pre(reset), .clr(1'b0), .d(dIF0), .q(IF0));
    // それ以外は非同期 CLR（初期値0）
    v_dff_async u_if1 (.clk(clk), .pre(1'b0), .clr(reset), .d(dIF1), .q(IF1));
    v_dff_async u_ff0 (.clk(clk), .pre(1'b0), .clr(reset), .d(dFF0), .q(FF0));
    v_dff_async u_ff1 (.clk(clk), .pre(1'b0), .clr(reset), .d(dFF1), .q(FF1));
    v_dff_async u_ff2 (.clk(clk), .pre(1'b0), .clr(reset), .d(dFF2), .q(FF2));
    v_dff_async u_tf0 (.clk(clk), .pre(1'b0), .clr(reset), .d(dTF0), .q(TF0));
    v_dff_async u_tf1 (.clk(clk), .pre(1'b0), .clr(reset), .d(dTF1), .q(TF1));
    v_dff_async u_ex0 (.clk(clk), .pre(1'b0), .clr(reset), .d(dEX0), .q(EX0));
    v_dff_async u_ex1 (.clk(clk), .pre(1'b0), .clr(reset), .d(dEX1), .q(EX1));
    v_dff_async u_it0 (.clk(clk), .pre(1'b0), .clr(reset), .d(dIT0), .q(IT0));
    v_dff_async u_it1 (.clk(clk), .pre(1'b0), .clr(reset), .d(dIT1), .q(IT1));
    v_dff_async u_it2 (.clk(clk), .pre(1'b0), .clr(reset), .d(dIT2), .q(IT2));
    v_dff_async u_mul1 (.clk(clk), .pre(1'b0), .clr(reset), .d(dMUL1), .q(MUL1));
    v_dff_async u_mul2_1 (.clk(clk), .pre(1'b0), .clr(reset), .d(dMUL2_1), .q(MUL2_1));
    v_dff_async u_mul2_2 (.clk(clk), .pre(1'b0), .clr(reset), .d(dMUL2_2), .q(MUL2_2));
    v_dff_async u_mul3 (.clk(clk), .pre(1'b0), .clr(reset), .d(dMUL3), .q(MUL3));
    v_dff_async u_mul4 (.clk(clk), .pre(1'b0), .clr(reset), .d(dMUL4), .q(MUL4));

endmodule
