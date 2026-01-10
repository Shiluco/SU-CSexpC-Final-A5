// ALU module wrapper
// ALU.vの出力とALSとのANDを取る
module ALU_module(
    // 制御信号
    input  wire        CLK,
    input  wire        CLR,
    input  wire        x,
    input  wire        y,
    input  wire        z,
    input  wire        v,
    input  wire        u,
    input  wire        Sa,
    input  wire        Sb,
    input  wire        ALS,       // ALU to S-bus制御信号

    // 入力データ（A-bus）
    input  wire [15:0] A_bus,

    // 出力データ（16ビット）
    output wire [15:0] ALU_out,

    // ステータスフラグ
    output wire        carry,
    output wire        overflow
);

    // ALUの個別ビット出力
    wire Aout, Bout, Cout, Dout, Eout, Fout, Gout, Hout;
    wire Iout, Jout, Kout, Lout, Mout, Nout, Oout, Pout;

    // ALUインスタンス化
    ALU alu_inst(
        .CLK(CLK),
        .CLR(CLR),
        .x(x),
        .y(y),
        .z(z),
        .v(v),
        .u(u),
        .Sa(Sa),
        .Sb(Sb),
        .A_bus(A_bus),
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
        .overflow(overflow)
    );

    // 個別ビット出力を16ビットバスに結合
    wire [15:0] alu_raw_out;
    assign alu_raw_out[0]  = Aout;
    assign alu_raw_out[1]  = Bout;
    assign alu_raw_out[2]  = Cout;
    assign alu_raw_out[3]  = Dout;
    assign alu_raw_out[4]  = Eout;
    assign alu_raw_out[5]  = Fout;
    assign alu_raw_out[6]  = Gout;
    assign alu_raw_out[7]  = Hout;
    assign alu_raw_out[8]  = Iout;
    assign alu_raw_out[9]  = Jout;
    assign alu_raw_out[10] = Kout;
    assign alu_raw_out[11] = Lout;
    assign alu_raw_out[12] = Mout;
    assign alu_raw_out[13] = Nout;
    assign alu_raw_out[14] = Oout;
    assign alu_raw_out[15] = Pout;

    // ALS制御信号とのAND
    transfer_and_16bit alu_and(
        .enable(ALS),
        .data_in(alu_raw_out),
        .data_out(ALU_out)
    );

endmodule
