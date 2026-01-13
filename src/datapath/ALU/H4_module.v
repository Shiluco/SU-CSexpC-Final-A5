// ============================================================
// H4 Module Wrapper
// H4単体モジュールの出力とALS_H4とのANDを取る
// ============================================================

module H4_module(
    // 制御信号
    input  wire        y,          // ALU control y
    input  wire        z,          // ALU control z
    input  wire        CLK,        // Clock
    input  wire        CLR,        // Clear
    input  wire        x,          // ALU control x
    input  wire        v,          // ALU control v
    input  wire        Sa,         // Selector control Sa
    input  wire        Sb,         // Selector control Sb
    input  wire        u,          // Carry input
    input  wire        ALS_H4,     // H4 to S-bus control signal

    // データ入力（16ビット個別信号）
    input  wire        aa,
    input  wire        ab,
    input  wire        ac,
    input  wire        ad,
    input  wire        ae,
    input  wire        af,
    input  wire        ag,
    input  wire        ah,
    input  wire        ai,
    input  wire        aj,
    input  wire        ak,
    input  wire        al,
    input  wire        am,
    input  wire        an,
    input  wire        ao,
    input  wire        ap,

    // 出力データ（16ビットバス、ANDゲート後）
    output wire [15:0] H4_out,

    // バス出力（PSW計算用）
    output wire [15:0] ALU_result_bus,
    output wire [15:0] A_input_bus,
    output wire [15:0] B_reg_bus,

    // ステータスフラグ
    output wire        carry,
    output wire        overflow
);

    // H4の個別ビット出力
    wire Aout, Bout, Cout, Dout, Eout, Fout, Gout, Hout;
    wire Iout, Jout, Kout, Lout, Mout, Nout, Oout, Pout;

    // H4インスタンス化
    H4 h4_inst(
        .y(y),
        .z(z),
        .CLK(CLK),
        .CLR(CLR),
        .x(x),
        .v(v),
        .Sa(Sa),
        .Sb(Sb),
        .u(u),
        .aa(aa),
        .ab(ab),
        .ac(ac),
        .ad(ad),
        .ae(ae),
        .af(af),
        .ag(ag),
        .ah(ah),
        .ai(ai),
        .aj(aj),
        .ak(ak),
        .al(al),
        .am(am),
        .an(an),
        .ao(ao),
        .ap(ap),
        .Aout(Aout),
        .Bout(Bout),
        .Cout(Cout),
        .Dout(Dout),
        .Eout(Eout),
        .Fout(Fout),
        .Gout(Gout),
        .Hout(Hout),
        .Iout(Iout),
        .Jout(Jout),
        .Kout(Kout),
        .Lout(Lout),
        .Mout(Mout),
        .Nout(Nout),
        .Oout(Oout),
        .Pout(Pout),
        .carry(carry),
        .overflow(overflow),
        .ALU_result_bus(ALU_result_bus),
        .A_input_bus(A_input_bus),
        .B_reg_bus(B_reg_bus)
    );

    // 個別ビット出力を16ビットバスに結合
    wire [15:0] h4_raw_out;
    assign h4_raw_out[0]  = Aout;
    assign h4_raw_out[1]  = Bout;
    assign h4_raw_out[2]  = Cout;
    assign h4_raw_out[3]  = Dout;
    assign h4_raw_out[4]  = Eout;
    assign h4_raw_out[5]  = Fout;
    assign h4_raw_out[6]  = Gout;
    assign h4_raw_out[7]  = Hout;
    assign h4_raw_out[8]  = Iout;
    assign h4_raw_out[9]  = Jout;
    assign h4_raw_out[10] = Kout;
    assign h4_raw_out[11] = Lout;
    assign h4_raw_out[12] = Mout;
    assign h4_raw_out[13] = Nout;
    assign h4_raw_out[14] = Oout;
    assign h4_raw_out[15] = Pout;

    // ALS_H4制御信号とのAND
    transfer_and_16bit h4_and(
        .enable(ALS_H4),
        .data_in(h4_raw_out),
        .data_out(H4_out)
    );

endmodule
