// ============================================================
// 実機単体テスト用インターフェース for counter_4bit_sync
// DE2-115ボード用
// ============================================================

module if_counter_4bit (
    // プッシュボタン (KEY)
    input  wire [3:0] KEY,          // KEY[0]: クロック入力 (押下=0, 離す=1)

    // スライドスイッチ (SW)
    input  wire [1:0] SW,           // SW[0]: clear (1=クリア, 0=動作)
                                    // SW[1]: enable (1=カウントアップ, 0=保持)

    // LED出力
    output wire [3:0] LEDR,         // LEDR[3:0]: カウント値 q[3:0]
    output wire [4:0] LEDG          // LEDG[0]: clk信号の状態
                                    // LEDG[1]: clear信号
                                    // LEDG[2]: enable信号
                                    // LEDG[3]: is_all_zero（カウント値が0のとき点灯）
                                    // LEDG[4]: 未使用
);

    // =========================
    // 内部信号
    // =========================

    // クロック信号
    wire clk;

    // クリア信号
    wire clr;

    // イネーブル信号
    wire en;

    // カウンタ出力
    wire [3:0] q;

    // 全て0かどうかのフラグ
    wire is_all_zero;

    // =========================
    // クロック信号生成
    // =========================
    // KEY[0]は押下時に0、離す時に1なので反転して使用
    assign clk = ~KEY[0];

    // =========================
    // クリア信号
    // =========================
    // SW[0]=1でクリア、SW[0]=0で動作
    assign clr = ~SW[0];

    // =========================
    // イネーブル信号
    // =========================
    // SW[1]=1でカウントアップ、SW[1]=0で保持
    assign en = ~SW[1];

    // =========================
    // counter_4bit_sync インスタンス
    // =========================
    counter_4bit_sync u_counter (
        .clk(clk),
        .clr(clr),
        .en(en),
        .q(q),
        .is_all_zero(is_all_zero)
    );

    // =========================
    // LED出力割り当て
    // =========================
    // カウント値をLEDRに表示
    assign LEDR[0] = q[0];  // LSB
    assign LEDR[1] = q[1];
    assign LEDR[2] = q[2];
    assign LEDR[3] = q[3];  // MSB

    // デバッグ用：入力信号をLEDGに表示
    assign LEDG[0] = clk;           // clk信号の状態
    assign LEDG[1] = clr;           // clear信号
    assign LEDG[2] = en;            // enable信号
    assign LEDG[3] = is_all_zero;   // カウント値が0のとき点灯
    assign LEDG[4] = 1'b0;          // 未使用

endmodule

