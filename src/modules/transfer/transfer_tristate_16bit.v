// Tri-state transfer gate (16-bit)
// 16ビット入力と1ビット制御信号のtri-state転送ゲート
module transfer_tristate_16bit(
    input  wire [15:0] data_in,      // データ入力（16ビット）
    input  wire        enable,       // イネーブル信号
    output wire [15:0] data_out      // データ出力（16ビット、tri-state）
);

    // 16個の1ビット転送ゲートをインスタンス化
    transfer_tristate_1bit bit_0  (.data_in(data_in[0]),  .enable(enable), .data_out(data_out[0]));
    transfer_tristate_1bit bit_1  (.data_in(data_in[1]),  .enable(enable), .data_out(data_out[1]));
    transfer_tristate_1bit bit_2  (.data_in(data_in[2]),  .enable(enable), .data_out(data_out[2]));
    transfer_tristate_1bit bit_3  (.data_in(data_in[3]),  .enable(enable), .data_out(data_out[3]));
    transfer_tristate_1bit bit_4  (.data_in(data_in[4]),  .enable(enable), .data_out(data_out[4]));
    transfer_tristate_1bit bit_5  (.data_in(data_in[5]),  .enable(enable), .data_out(data_out[5]));
    transfer_tristate_1bit bit_6  (.data_in(data_in[6]),  .enable(enable), .data_out(data_out[6]));
    transfer_tristate_1bit bit_7  (.data_in(data_in[7]),  .enable(enable), .data_out(data_out[7]));
    transfer_tristate_1bit bit_8  (.data_in(data_in[8]),  .enable(enable), .data_out(data_out[8]));
    transfer_tristate_1bit bit_9  (.data_in(data_in[9]),  .enable(enable), .data_out(data_out[9]));
    transfer_tristate_1bit bit_10 (.data_in(data_in[10]), .enable(enable), .data_out(data_out[10]));
    transfer_tristate_1bit bit_11 (.data_in(data_in[11]), .enable(enable), .data_out(data_out[11]));
    transfer_tristate_1bit bit_12 (.data_in(data_in[12]), .enable(enable), .data_out(data_out[12]));
    transfer_tristate_1bit bit_13 (.data_in(data_in[13]), .enable(enable), .data_out(data_out[13]));
    transfer_tristate_1bit bit_14 (.data_in(data_in[14]), .enable(enable), .data_out(data_out[14]));
    transfer_tristate_1bit bit_15 (.data_in(data_in[15]), .enable(enable), .data_out(data_out[15]));

endmodule
