// OR-based transfer gate (16-bit)
// 16ビット入力と1ビット制御信号のOR転送ゲート
module transfer_or_16bit(
    input  wire        select,      // セレクト信号 (1: new_data, 0: hold_data)
    input  wire [15:0] new_data,    // 新しいデータ入力（16ビット）
    input  wire [15:0] hold_data,   // 保持するデータ（16ビット）
    output wire [15:0] out          // 出力（16ビット）
);

    // 16個の1ビット転送ゲートをインスタンス化
    transfer_or_1bit bit_0  (.select(select), .new_data(new_data[0]),  .hold_data(hold_data[0]),  .out(out[0]));
    transfer_or_1bit bit_1  (.select(select), .new_data(new_data[1]),  .hold_data(hold_data[1]),  .out(out[1]));
    transfer_or_1bit bit_2  (.select(select), .new_data(new_data[2]),  .hold_data(hold_data[2]),  .out(out[2]));
    transfer_or_1bit bit_3  (.select(select), .new_data(new_data[3]),  .hold_data(hold_data[3]),  .out(out[3]));
    transfer_or_1bit bit_4  (.select(select), .new_data(new_data[4]),  .hold_data(hold_data[4]),  .out(out[4]));
    transfer_or_1bit bit_5  (.select(select), .new_data(new_data[5]),  .hold_data(hold_data[5]),  .out(out[5]));
    transfer_or_1bit bit_6  (.select(select), .new_data(new_data[6]),  .hold_data(hold_data[6]),  .out(out[6]));
    transfer_or_1bit bit_7  (.select(select), .new_data(new_data[7]),  .hold_data(hold_data[7]),  .out(out[7]));
    transfer_or_1bit bit_8  (.select(select), .new_data(new_data[8]),  .hold_data(hold_data[8]),  .out(out[8]));
    transfer_or_1bit bit_9  (.select(select), .new_data(new_data[9]),  .hold_data(hold_data[9]),  .out(out[9]));
    transfer_or_1bit bit_10 (.select(select), .new_data(new_data[10]), .hold_data(hold_data[10]), .out(out[10]));
    transfer_or_1bit bit_11 (.select(select), .new_data(new_data[11]), .hold_data(hold_data[11]), .out(out[11]));
    transfer_or_1bit bit_12 (.select(select), .new_data(new_data[12]), .hold_data(hold_data[12]), .out(out[12]));
    transfer_or_1bit bit_13 (.select(select), .new_data(new_data[13]), .hold_data(hold_data[13]), .out(out[13]));
    transfer_or_1bit bit_14 (.select(select), .new_data(new_data[14]), .hold_data(hold_data[14]), .out(out[14]));
    transfer_or_1bit bit_15 (.select(select), .new_data(new_data[15]), .hold_data(hold_data[15]), .out(out[15]));

endmodule
