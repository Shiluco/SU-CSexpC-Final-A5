// Tri-state transfer gate (1-bit)
// Output = enable ? data_in : Z
module transfer_tristate_1bit(
    input  wire data_in,     // データ入力
    input  wire enable,      // イネーブル信号
    output wire data_out     // データ出力（tri-state）
);

    // tristateプリミティブモジュールを使用
    tristate tri_inst(
        .data_in(data_in),
        .enable(enable),
        .data_out(data_out)
    );

endmodule
