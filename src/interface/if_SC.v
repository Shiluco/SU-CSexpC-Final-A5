// ============================================================
// 実機単体テスト用インターフェース for status_counter (SC.v)
// DE2-115ボード用
// ============================================================

module if_SC (
    // プッシュボタン (KEY)
    input  wire [4:0] KEY,          // KEY[0]: クロック入力 (押下=0, 離す=1)

    // スライドスイッチ (SW)
    input  wire [4:0] SW,           // SW[0]: reset (0=リセット中, 1=動作)
                                     // SW[1]: ~ITA (0=割込み要求なし, 1=割込み要求)
                                     // SW[2]: ~ACK (0=応答なし, 1=応答)
                                     // SW[3]: ~FROM_D (0=データなし, 1=データ受信)
                                     // SW[4]: ~TO_D (0=データなし, 1=データ送信)

    // LED出力
    output wire [11:0] LEDR,        // LEDR[0]: IF0
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
    output wire [8:0] LEDG          // LEDG[0]: KEY[0]押下時に点灯
                                     // LEDG[1]: clk信号の状態
                                     // LEDG[2]: reset信号
                                     // LEDG[3]: ITA
                                     // LEDG[4]: ACK
                                     // LEDG[5]: FROM_D
                                     // LEDG[6]: TO_D
);

    // =========================
    // 内部信号
    // =========================

    // クロック信号
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
    // SW[0]=1でリセット、SW[0]=0で動作
    assign reset = SW[0];

    // =========================
    // status_counter インスタンス
    // =========================
    status_counter u_sc (
        .clk(clk),
        .reset(reset),
        .ITA(~SW[1]),
        .ACK(~SW[2]),
        .FROM_D(~SW[3]),
        .TO_D(~SW[4]),
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

    // KEY[0]が押されたら(0になったら)LEDG[0]が点灯
    assign LEDG[0] = ~KEY[0];
    // clk信号の状態をLEDG[1]に表示
    assign LEDG[1] = clk;
    // デバッグ用：入力信号をLEDGに表示
    assign LEDG[2] = reset;
    assign LEDG[3] = ~SW[1];  // ITA
    assign LEDG[4] = ~SW[2];  // ACK
    assign LEDG[5] = ~SW[3];  // FROM_D
    assign LEDG[6] = ~SW[4];  // TO_D

endmodule
