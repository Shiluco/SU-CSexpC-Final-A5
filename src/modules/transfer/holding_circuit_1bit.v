// Holding circuit (1-bit)
// 論理: (select & new_data) | (~select & hold_data)
// transfer_or_1bitと同じ機能だが、命名を明確にするため別モジュールとして定義
module holding_circuit_1bit(
    input  wire select,      // セレクト信号 (例: SRx)
    input  wire new_data,    // 新しいデータ入力 (例: Sbus)
    input  wire hold_data,   // 保持するデータ (例: r_d)
    output wire out          // 出力
);

    // ロジック演算
    assign out = (select & new_data) | (~select & hold_data);

endmodule
