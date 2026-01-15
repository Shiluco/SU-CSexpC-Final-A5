module counter_4bit_sync (
    input  wire       clk,
    input  wire       clr,      // 非同期クリア（アクティブHigh）
    input  wire       en,       // カウントイネーブル（1=カウントアップ, 0=保持）
    output wire [3:0] q,         // カウント出力
    output wire is_all_zero         // 全て0かどうかのフラグ
);

    // 内部信号
    wire [3:0] q_n;             // Q の反転
    wire [3:0] d;               // 各DFFのD入力

    assign is_all_zero = (q == 4'b0000);

    // Q の反転を生成
    assign q_n[0] = ~q[0];
    assign q_n[1] = ~q[1];
    assign q_n[2] = ~q[2];
    assign q_n[3] = ~q[3];

    // 次状態論理（XOR と AND の組み合わせ）
    // en=1: カウントアップ、en=0: 保持
    // D = (en & 次の値) | (~en & 現在の値)

    // D0 = (en & Q0_N) | (~en & Q0)
    assign d[0] = (en & q_n[0]) | (~en & q[0]);

    // D1 = (en & (Q1 XOR Q0)) | (~en & Q1)
    assign d[1] = (en & (q[1] ^ q[0])) | (~en & q[1]);

    // D2 = (en & (Q2 XOR (Q1 AND Q0))) | (~en & Q2)
    assign d[2] = (en & (q[2] ^ (q[1] & q[0]))) | (~en & q[2]);

    // D3 = (en & (Q3 XOR (Q2 AND Q1 AND Q0))) | (~en & Q3)
    assign d[3] = (en & (q[3] ^ (q[2] & q[1] & q[0]))) | (~en & q[3]);

    // DFF インスタンス（4個）
    v_dff_async dff0 (
        .clk(clk),
        .pre(1'b0),
        .clr(clr),
        .d(d[0]),
        .q(q[0])
    );

    v_dff_async dff1 (
        .clk(clk),
        .pre(1'b0),
        .clr(clr),
        .d(d[1]),
        .q(q[1])
    );

    v_dff_async dff2 (
        .clk(clk),
        .pre(1'b0),
        .clr(clr),
        .d(d[2]),
        .q(q[2])
    );

    v_dff_async dff3 (
        .clk(clk),
        .pre(1'b0),
        .clr(clr),
        .d(d[3]),
        .q(q[3])
    );

endmodule