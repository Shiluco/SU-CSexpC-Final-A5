// ============================================================
// H4 Module Wrapper
// H4 ALUモジュールの出力とALS_H4とのANDを取る
// 16ビットバス入力を個別ビットに分解してH4に渡す
// ============================================================

module H4_module(
    // 制御信号
    input  wire        y,          // ALU control y
    input  wire        z,          // ALU control z
    input  wire        x,          // ALU control x
    input  wire        v,          // ALU control v
    input  wire        u,          // Carry input
    input  wire        ALS_H4,     // H4 to S-bus control signal

    // データ入力（16ビットバス）
    input  wire [15:0] A_bus_in,   // A input bus
    input  wire [15:0] B_bus_in,   // B input bus

    // 出力データ（16ビットバス、ANDゲート後）
    output wire [15:0] H4_out,

    // バス出力（PSW計算用）
    output wire [15:0] ALU_result_bus,

    // ステータスフラグ
    output wire        carry,
    output wire        overflow
);

    // H4インスタンス化
    H4 h4_inst(
        .y(y),
        .z(z),
        .x(x),
        .v(v),
        .u(u),
        // A input (individual bits)
        .aa(A_bus_in[0]),
        .ab(A_bus_in[1]),
        .ac(A_bus_in[2]),
        .ad(A_bus_in[3]),
        .ae(A_bus_in[4]),
        .af(A_bus_in[5]),
        .ag(A_bus_in[6]),
        .ah(A_bus_in[7]),
        .ai(A_bus_in[8]),
        .aj(A_bus_in[9]),
        .ak(A_bus_in[10]),
        .al(A_bus_in[11]),
        .am(A_bus_in[12]),
        .an(A_bus_in[13]),
        .ao(A_bus_in[14]),
        .ap(A_bus_in[15]),
        // B input (individual bits)
        .ba(B_bus_in[0]),
        .bb(B_bus_in[1]),
        .bc(B_bus_in[2]),
        .bd(B_bus_in[3]),
        .be(B_bus_in[4]),
        .bf(B_bus_in[5]),
        .bg(B_bus_in[6]),
        .bh(B_bus_in[7]),
        .bi(B_bus_in[8]),
        .bj(B_bus_in[9]),
        .bk(B_bus_in[10]),
        .bl(B_bus_in[11]),
        .bm(B_bus_in[12]),
        .bn(B_bus_in[13]),
        .bo(B_bus_in[14]),
        .bp(B_bus_in[15]),
        // Outputs
        .ALU_result_bus(ALU_result_bus),
        .carry(carry),
        .overflow(overflow)
    );

    // ALS_H4制御信号とのAND（S-bus出力用）
    transfer_and_16bit h4_and(
        .enable(ALS_H4),
        .data_in(ALU_result_bus),
        .data_out(H4_out)
    );

endmodule
