// Four-input multiplexer for MDR (1-bit)
// 論理: (MDR_out & (~MMD & ~SMD)) | (M_bus & MMD) | (S_bus & SMD)
module four_input_multiplexer_1bit(
    input  wire M_bus,       // Mバス入力
    input  wire S_bus,       // Sバス入力
    input  wire MMD,         // M-bus to MDR制御信号
    input  wire SMD,         // S-bus to MDR制御信号
    input  wire MDR_out,     // MDRの現在の出力（フィードバック）
    output wire out          // 出力
);

    // ロジック演算
    assign out = (MDR_out & (~MMD & ~SMD)) | (M_bus & MMD) | (S_bus & SMD);

endmodule
