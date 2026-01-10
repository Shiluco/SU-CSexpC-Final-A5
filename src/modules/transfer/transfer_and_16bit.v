// Simple AND transfer gate (16-bit)
// 16ビット入力と1ビット制御信号のAND転送ゲート
module transfer_and_16bit(
    input  wire        enable,       // イネーブル信号
    input  wire [15:0] data_in,      // データ入力（16ビット）
    output wire [15:0] data_out      // 出力（16ビット）
);

    // 16個の1ビット転送ゲートをインスタンス化
    transfer_and_1bit bit_0  (.enable(enable), .data_in(data_in[0]),  .data_out(data_out[0]));
    transfer_and_1bit bit_1  (.enable(enable), .data_in(data_in[1]),  .data_out(data_out[1]));
    transfer_and_1bit bit_2  (.enable(enable), .data_in(data_in[2]),  .data_out(data_out[2]));
    transfer_and_1bit bit_3  (.enable(enable), .data_in(data_in[3]),  .data_out(data_out[3]));
    transfer_and_1bit bit_4  (.enable(enable), .data_in(data_in[4]),  .data_out(data_out[4]));
    transfer_and_1bit bit_5  (.enable(enable), .data_in(data_in[5]),  .data_out(data_out[5]));
    transfer_and_1bit bit_6  (.enable(enable), .data_in(data_in[6]),  .data_out(data_out[6]));
    transfer_and_1bit bit_7  (.enable(enable), .data_in(data_in[7]),  .data_out(data_out[7]));
    transfer_and_1bit bit_8  (.enable(enable), .data_in(data_in[8]),  .data_out(data_out[8]));
    transfer_and_1bit bit_9  (.enable(enable), .data_in(data_in[9]),  .data_out(data_out[9]));
    transfer_and_1bit bit_10 (.enable(enable), .data_in(data_in[10]), .data_out(data_out[10]));
    transfer_and_1bit bit_11 (.enable(enable), .data_in(data_in[11]), .data_out(data_out[11]));
    transfer_and_1bit bit_12 (.enable(enable), .data_in(data_in[12]), .data_out(data_out[12]));
    transfer_and_1bit bit_13 (.enable(enable), .data_in(data_in[13]), .data_out(data_out[13]));
    transfer_and_1bit bit_14 (.enable(enable), .data_in(data_in[14]), .data_out(data_out[14]));
    transfer_and_1bit bit_15 (.enable(enable), .data_in(data_in[15]), .data_out(data_out[15]));

endmodule
