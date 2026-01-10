module counter_4bit_sync (
    input  wire       clk,
    input  wire       clr,      // 非同期クリア（アクティブHigh）
    output wire [3:0] q         // カウント出力
);

    // 内部信号
    wire [3:0] q_n;             // Q の反転
    wire [3:0] d;               // 各DFFのD入力

    // Q の反転を生成
    assign q_n[0] = ~q[0];
    assign q_n[1] = ~q[1];
    assign q_n[2] = ~q[2];
    assign q_n[3] = ~q[3];

    // 次状態論理（XOR と AND の組み合わせ）
    // D0 = Q0_N （常にトグル）
    assign d[0] = q_n[0];

    // D1 = Q1 XOR Q0
    assign d[1] = q[1] ^ q[0];

    // D2 = Q2 XOR (Q1 AND Q0)
    assign d[2] = q[2] ^ (q[1] & q[0]);

    // D3 = Q3 XOR (Q2 AND Q1 AND Q0)
    assign d[3] = q[3] ^ (q[2] & q[1] & q[0]);

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