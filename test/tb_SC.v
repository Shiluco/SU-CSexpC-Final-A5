// ============================================================
// 実機単体テスト用インターフェース for status_counter (SC.v)
// DE2-115ボード用
// ============================================================

module tb_SC (
    // プッシュボタン (KEY)
    input  wire [0:0] KEY,          // KEY[0]: クロック入力 (押下=0, 離す=1)

    // スライドスイッチ (SW)
    input  wire [4:0] SW,           // SW[0]: reset
                                     // SW[1]: ITA
                                     // SW[2]: ACK
                                     // SW[3]: FROM_D
                                     // SW[4]: TO_D

    // LED出力
    output wire [11:0] LEDR         // LEDR[0]: IF0
                                     // LEDR[1]: IF1
                                     // LEDR[2]: FF0
                                     // LEDR[3]: FF1
                                     // LEDR[4]: FF2
                                     // LEDR[5]: TF0
                                     // LEDR[6]: TF1
                                     // LEDR[7]: EX0
                                     // LEDR[8]: EX1
                                     // LEDR[9]: IT0
                                     // LEDR[10]: IT1
                                     // LEDR[11]: IT2
);

    // =========================
    // 内部信号
    // =========================

    // クロック信号 (KEY[0]を反転して使用)
    wire clk;

    // リセット信号
    wire reset;

    // status_counter の出力
    wire IF0, IF1;
    wire FF0, FF1, FF2;
    wire TF0, TF1;
    wire EX0, EX1;
    wire IT0, IT1, IT2;

    // =========================
    // クロック信号生成
    // =========================
    // KEY[0]は押下時に0、離す時に1なので反転して使用
    assign clk = ~KEY[0];

    // =========================
    // リセット信号
    // =========================
    assign reset = SW[0];

    // =========================
    // status_counter インスタンス
    // =========================
    status_counter u_sc (
        .clk(clk),
        .reset(reset),
        .ITA(SW[1]),
        .ACK(SW[2]),
        .FROM_D(SW[3]),
        .TO_D(SW[4]),
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
        .IT2(IT2)
    );

    // =========================
    // LED出力割り当て
    // =========================
    assign LEDR[0]  = IF0;
    assign LEDR[1]  = IF1;
    assign LEDR[2]  = FF0;
    assign LEDR[3]  = FF1;
    assign LEDR[4]  = FF2;
    assign LEDR[5]  = TF0;
    assign LEDR[6]  = TF1;
    assign LEDR[7]  = EX0;
    assign LEDR[8]  = EX1;
    assign LEDR[9]  = IT0;
    assign LEDR[10] = IT1;
    assign LEDR[11] = IT2;

endmodule
