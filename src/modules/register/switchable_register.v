// Switchable register module
// SRx部分（ホールド回路）とRx部分（レジスタ）を組み合わせたモジュール
// 論理: (SRx & Sbus) | (~SRx & r_q) → レジスタに格納
module switchable_register #(
    parameter [15:0] INIT_VALUE = 16'b0
)(
    input  wire        CLK,        // クロック
    input  wire        CLR,        // クリア（active low）
    input  wire        SR,         // ストア制御信号 (例: SR0, SR1, ...)
    input  wire [15:0] S_bus,      // Sバス入力
    output wire [15:0] Q           // レジスタ出力
);

    wire [15:0] r_d;  // ホールド回路の出力 → レジスタ入力

    // SRx部分: holding_circuit_16bit を使用
    // (SR & S_bus) | (~SR & Q) を実現
    holding_circuit_16bit hold_circuit(
        .select(SR),
        .new_data(S_bus),
        .hold_data(Q),
        .out(r_d)
    );

    // Rx部分: v_reg16 を使用
    // R_W=0 (常に書き込み可能), Ea=1 (常に出力有効), Qa未使用
    v_reg16 #(
        .INIT_VALUE(INIT_VALUE)
    ) reg_inst(
        .CLK(CLK),
        .CLR(CLR),
        .R_W(1'b0),      // 固定値: 常に書き込み可能
        .Ea(1'b1),       // 固定値: 常に出力有効
        .D(r_d),
        .Q(Q),
        .Qa()            // 未使用
    );

endmodule
