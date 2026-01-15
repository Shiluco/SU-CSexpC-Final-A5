// Simple AND transfer gate (1-bit)
// Output = enable & data_in
module transfer_and_1bit(
    input  wire enable,      // イネーブル信号
    input  wire data_in,     // データ入力
    output wire data_out     // 出力
);

    assign data_out = enable & data_in;

endmodule
