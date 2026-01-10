// OR-based transfer gate (1-bit)
// Output = (select & new_data) | (~select & hold_data)
module transfer_or_1bit(
    input  wire select,      // セレクト信号 (1: new_data, 0: hold_data)
    input  wire new_data,    // 新しいデータ入力
    input  wire hold_data,   // 保持するデータ
    output wire out          // 出力
);

    // ロジック演算
    assign out = (select & new_data) | (~select & hold_data);

endmodule
