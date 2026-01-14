// ============================================================
// PSW Set/Reset Module
// Sets NZVC flags using JK flip-flops
// ============================================================

module PSW_setreset(
    // JK inputs for each flag
    input  wire J_N,                 // N flag J input
    input  wire K_N,                 // N flag K input
    input  wire J_Z,                 // Z flag J input
    input  wire K_Z,                 // Z flag K input
    input  wire J_V,                 // V flag J input
    input  wire K_V,                 // V flag K input
    input  wire J_C,                 // C flag J input
    input  wire K_C,                 // C flag K input

    // Control signals
    input  wire CLK,                 // Clock
    input  wire CLR,                 // Clear (active low)

    // Output
    output wire [15:0] PSW           // 16-bit PSW output (lower 4 bits = NZVC)
);

    // =========================
    // Internal signals
    // =========================

    // Flag outputs from JK flip-flops
    wire N_out;
    wire Z_out;
    wire V_out;
    wire C_out;

    // Clear signal for JKFF (active high, inverted from CLR which is active low)
    wire clr_jkff;
    assign clr_jkff = ~CLR;

    // Preset signal (not used, tied to 0)
    wire pre_jkff;
    assign pre_jkff = 1'b0;

    // =========================
    // JK Flip-Flops instances
    // =========================

    // N flag flip-flop
    v_jkff_async ff_N (
        .clk(CLK),
        .clr(clr_jkff),
        .pre(pre_jkff),
        .j(J_N),
        .k(K_N),
        .q(N_out)
    );

    // Z flag flip-flop
    v_jkff_async ff_Z (
        .clk(CLK),
        .clr(clr_jkff),
        .pre(pre_jkff),
        .j(J_Z),
        .k(K_Z),
        .q(Z_out)
    );

    // V flag flip-flop
    v_jkff_async ff_V (
        .clk(CLK),
        .clr(clr_jkff),
        .pre(pre_jkff),
        .j(J_V),
        .k(K_V),
        .q(V_out)
    );

    // C flag flip-flop
    v_jkff_async ff_C (
        .clk(CLK),
        .clr(clr_jkff),
        .pre(pre_jkff),
        .j(J_C),
        .k(K_C),
        .q(C_out)
    );

    // =========================
    // Output assignment
    // =========================
    // 16-bit output with NZVC in lower 4 bits
    // PSW[3] = N, PSW[2] = Z, PSW[1] = V, PSW[0] = C
    // Upper 12 bits are set to 0

    assign PSW[15:4] = 12'b0;
    assign PSW[3] = N_out;
    assign PSW[2] = Z_out;
    assign PSW[1] = V_out;
    assign PSW[0] = C_out;

endmodule
