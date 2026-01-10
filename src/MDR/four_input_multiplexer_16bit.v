// Four-input multiplexer for MDR (16-bit)
// 16ビット版: 各ビットに対して1ビット版をインスタンス化
module four_input_multiplexer_16bit(
    input  wire [15:0] M_bus,       // Mバス入力（16ビット）
    input  wire [15:0] S_bus,       // Sバス入力（16ビット）
    input  wire        MMD,         // M-bus to MDR制御信号
    input  wire        SMD,         // S-bus to MDR制御信号
    input  wire [15:0] MDR_out,     // MDRの現在の出力（フィードバック）
    output wire [15:0] out          // 出力（16ビット）
);

    // 16個の1ビットマルチプレクサをインスタンス化
    four_input_multiplexer_1bit bit_0  (.M_bus(M_bus[0]),  .S_bus(S_bus[0]),  .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[0]),  .out(out[0]));
    four_input_multiplexer_1bit bit_1  (.M_bus(M_bus[1]),  .S_bus(S_bus[1]),  .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[1]),  .out(out[1]));
    four_input_multiplexer_1bit bit_2  (.M_bus(M_bus[2]),  .S_bus(S_bus[2]),  .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[2]),  .out(out[2]));
    four_input_multiplexer_1bit bit_3  (.M_bus(M_bus[3]),  .S_bus(S_bus[3]),  .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[3]),  .out(out[3]));
    four_input_multiplexer_1bit bit_4  (.M_bus(M_bus[4]),  .S_bus(S_bus[4]),  .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[4]),  .out(out[4]));
    four_input_multiplexer_1bit bit_5  (.M_bus(M_bus[5]),  .S_bus(S_bus[5]),  .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[5]),  .out(out[5]));
    four_input_multiplexer_1bit bit_6  (.M_bus(M_bus[6]),  .S_bus(S_bus[6]),  .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[6]),  .out(out[6]));
    four_input_multiplexer_1bit bit_7  (.M_bus(M_bus[7]),  .S_bus(S_bus[7]),  .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[7]),  .out(out[7]));
    four_input_multiplexer_1bit bit_8  (.M_bus(M_bus[8]),  .S_bus(S_bus[8]),  .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[8]),  .out(out[8]));
    four_input_multiplexer_1bit bit_9  (.M_bus(M_bus[9]),  .S_bus(S_bus[9]),  .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[9]),  .out(out[9]));
    four_input_multiplexer_1bit bit_10 (.M_bus(M_bus[10]), .S_bus(S_bus[10]), .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[10]), .out(out[10]));
    four_input_multiplexer_1bit bit_11 (.M_bus(M_bus[11]), .S_bus(S_bus[11]), .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[11]), .out(out[11]));
    four_input_multiplexer_1bit bit_12 (.M_bus(M_bus[12]), .S_bus(S_bus[12]), .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[12]), .out(out[12]));
    four_input_multiplexer_1bit bit_13 (.M_bus(M_bus[13]), .S_bus(S_bus[13]), .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[13]), .out(out[13]));
    four_input_multiplexer_1bit bit_14 (.M_bus(M_bus[14]), .S_bus(S_bus[14]), .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[14]), .out(out[14]));
    four_input_multiplexer_1bit bit_15 (.M_bus(M_bus[15]), .S_bus(S_bus[15]), .MMD(MMD), .SMD(SMD), .MDR_out(MDR_out[15]), .out(out[15]));

endmodule
