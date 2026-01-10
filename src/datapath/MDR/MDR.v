// Memory Data Register (MDR) module
// four_input_multiplexerを使用し、出力をMDAとMDMの2つのゲートに通す
module MDR(
    input  wire        CLK,        // クロック
    input  wire        CLR,        // クリア（active low）
    input  wire [15:0] M_bus,      // Mバス入力
    input  wire [15:0] S_bus,      // Sバス入力
    input  wire        MMD,        // M-bus to MDR制御信号
    input  wire        SMD,        // S-bus to MDR制御信号
    input  wire        MDA,        // MDR to A-bus制御信号
    input  wire        MDM,        // MDR to M-bus制御信号
    output wire [15:0] MDR_to_A,   // Aバスへの出力
    output wire [15:0] MDR_to_M,   // Mバスへの出力（tri-state）
    output wire [15:0] MDR_q       // MDRレジスタの出力（デバッグ用）
);

    wire [15:0] mdr_d;  // マルチプレクサの出力 → レジスタ入力

    // four_input_multiplexer: 入力選択とホールド機能
    four_input_multiplexer_16bit mux(
        .M_bus(M_bus),
        .S_bus(S_bus),
        .MMD(MMD),
        .SMD(SMD),
        .MDR_out(MDR_q),
        .out(mdr_d)
    );

    // MDRレジスタ: v_reg16を使用
    // R_W=0（常に書き込み可能）、Ea=1（常に出力有効）
    v_reg16 mdr_reg(
        .CLK(CLK),
        .CLR(CLR),
        .R_W(1'b0),      // 固定値: 常に書き込み可能
        .Ea(1'b1),       // 固定値: 常に出力有効
        .D(mdr_d),
        .Q(MDR_q),
        .Qa()            // 未使用
    );

    // MDA: MDRからAバスへの転送（ANDゲート）
    transfer_and_16bit mda_transfer(
        .enable(MDA),
        .data_in(MDR_q),
        .data_out(MDR_to_A)
    );

    // MDM: MDRからMバスへの転送（tri-stateバッファ）
    transfer_tristate_16bit mdm_transfer(
        .data_in(MDR_q),
        .enable(MDM),
        .data_out(MDR_to_M)
    );

endmodule
