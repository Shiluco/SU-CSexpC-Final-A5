// ALU_mul module wrapper
// ALU_mul.vの出力とALS_mulとのANDを取る
module ALU_mul_module(
    // 制御信号
    input  wire        AND1_sw,
    input  wire        AND2_sw,
    input  wire        x_in,
    input  wire        u_in,
    input  wire        MUX1_sw,
    input  wire        MUX2_sw,
    input  wire        A_RW,
    input  wire        A_CLK,
    input  wire        A_CLR,
    input  wire        Q_RW,
    input  wire        Q_CLK,
    input  wire        Q_CLR,
    input  wire        ALS_mul,       // ALU_mul to S-bus制御信号

    // 入力データ（A-bus）
    input  wire [15:0] A_bus,

    // 出力データ（16ビット）
    output wire [15:0] ALU_mul_out,

    // ステータスフラグ
    output wire        carry,
    output wire        overflow,

    // セグメント出力（デバッグ用）
    output wire        Seg1_zero, Seg1_one, Seg1_two, Seg1_three, Seg1_four, Seg1_five, Seg1_six,
    output wire        Seg2_zero, Seg2_one, Seg2_two, Seg2_three, Seg2_four, Seg2_five, Seg2_six,
    output wire        Seg3_zero, Seg3_one, Seg3_two, Seg3_three, Seg3_four, Seg3_five, Seg3_six,
    output wire        Seg4_zero, Seg4_one, Seg4_two, Seg4_three, Seg4_four, Seg4_five, Seg4_six,
    output wire        Seg5_zero, Seg5_one, Seg5_two, Seg5_three, Seg5_four, Seg5_five, Seg5_six,
    output wire        Seg6_zero, Seg6_one, Seg6_two, Seg6_three, Seg6_four, Seg6_five, Seg6_six,
    output wire        Seg7_zero, Seg7_one, Seg7_two, Seg7_three, Seg7_four, Seg7_five, Seg7_six,
    output wire        Seg8_zero, Seg8_one, Seg8_two, Seg8_three, Seg8_four, Seg8_five, Seg8_six
);

    // ALU_mulの個別ビット出力
    wire Zero_out, One_out, Two_out, Three_out, Four_out, Five_out, Six_out, Seven_out;
    wire Eight_out, Nine_out, A_out, B_out, C_out, D_out, E_out, F_out;

    // ALU_mulインスタンス化
    ALU_mul alu_mul_inst(
        .A_bus(A_bus),
        .AND1_sw(AND1_sw),
        .AND2_sw(AND2_sw),
        .x_in(x_in),
        .u_in(u_in),
        .MUX1_sw(MUX1_sw),
        .MUX2_sw(MUX2_sw),
        .A_RW(A_RW),
        .A_CLK(A_CLK),
        .A_CLR(A_CLR),
        .Q_RW(Q_RW),
        .Q_CLK(Q_CLK),
        .Q_CLR(Q_CLR),
        .Seg1_zero(Seg1_zero), .Seg1_one(Seg1_one), .Seg1_two(Seg1_two), .Seg1_three(Seg1_three),
        .Seg1_four(Seg1_four), .Seg1_five(Seg1_five), .Seg1_six(Seg1_six),
        .Seg2_zero(Seg2_zero), .Seg2_one(Seg2_one), .Seg2_two(Seg2_two), .Seg2_three(Seg2_three),
        .Seg2_four(Seg2_four), .Seg2_five(Seg2_five), .Seg2_six(Seg2_six),
        .Seg3_zero(Seg3_zero), .Seg3_one(Seg3_one), .Seg3_two(Seg3_two), .Seg3_three(Seg3_three),
        .Seg3_four(Seg3_four), .Seg3_five(Seg3_five), .Seg3_six(Seg3_six),
        .Seg4_zero(Seg4_zero), .Seg4_one(Seg4_one), .Seg4_two(Seg4_two), .Seg4_three(Seg4_three),
        .Seg4_four(Seg4_four), .Seg4_five(Seg4_five), .Seg4_six(Seg4_six),
        .Seg5_zero(Seg5_zero), .Seg5_one(Seg5_one), .Seg5_two(Seg5_two), .Seg5_three(Seg5_three),
        .Seg5_four(Seg5_four), .Seg5_five(Seg5_five), .Seg5_six(Seg5_six),
        .Seg6_zero(Seg6_zero), .Seg6_one(Seg6_one), .Seg6_two(Seg6_two), .Seg6_three(Seg6_three),
        .Seg6_four(Seg6_four), .Seg6_five(Seg6_five), .Seg6_six(Seg6_six),
        .Seg7_zero(Seg7_zero), .Seg7_one(Seg7_one), .Seg7_two(Seg7_two), .Seg7_three(Seg7_three),
        .Seg7_four(Seg7_four), .Seg7_five(Seg7_five), .Seg7_six(Seg7_six),
        .Seg8_zero(Seg8_zero), .Seg8_one(Seg8_one), .Seg8_two(Seg8_two), .Seg8_three(Seg8_three),
        .Seg8_four(Seg8_four), .Seg8_five(Seg8_five), .Seg8_six(Seg8_six),
        .alu_carryOut(carry),
        .alu_overflowOut(overflow),
        .Zero_out(Zero_out),
        .One_out(One_out),
        .Two_out(Two_out),
        .Three_out(Three_out),
        .Four_out(Four_out),
        .Five_out(Five_out),
        .Six_out(Six_out),
        .Seven_out(Seven_out),
        .Eight_out(Eight_out),
        .Nine_out(Nine_out),
        .A_out(A_out),
        .B_out(B_out),
        .C_out(C_out),
        .D_out(D_out),
        .E_out(E_out),
        .F_out(F_out)
    );

    // 個別ビット出力を16ビットバスに結合
    wire [15:0] alu_mul_raw_out;
    assign alu_mul_raw_out[0]  = Zero_out;
    assign alu_mul_raw_out[1]  = One_out;
    assign alu_mul_raw_out[2]  = Two_out;
    assign alu_mul_raw_out[3]  = Three_out;
    assign alu_mul_raw_out[4]  = Four_out;
    assign alu_mul_raw_out[5]  = Five_out;
    assign alu_mul_raw_out[6]  = Six_out;
    assign alu_mul_raw_out[7]  = Seven_out;
    assign alu_mul_raw_out[8]  = Eight_out;
    assign alu_mul_raw_out[9]  = Nine_out;
    assign alu_mul_raw_out[10] = A_out;
    assign alu_mul_raw_out[11] = B_out;
    assign alu_mul_raw_out[12] = C_out;
    assign alu_mul_raw_out[13] = D_out;
    assign alu_mul_raw_out[14] = E_out;
    assign alu_mul_raw_out[15] = F_out;

    // ALS_mul制御信号とのAND
    transfer_and_16bit alu_mul_and(
        .enable(ALS_mul),
        .data_in(alu_mul_raw_out),
        .data_out(ALU_mul_out)
    );

endmodule
