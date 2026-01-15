// ============================================================
// Interface for H4_module (ALU) - Lower 8-bit version
// DE2-115 board (negative logic)
// Control signals selected by KEY[3:1] multiplexer
// ============================================================

module if_H4 (
    // Push buttons (KEY)
    input  wire [3:0] KEY,          // KEY[0]: unused
                                    // KEY[3:1]: ALU operation select (3-bit = 8 patterns)

    // Slide switches (SW)
    input  wire [17:0] SW,          // SW[7:0]: A_bus[7:0] (lower 8-bit)
                                    // SW[15:8]: B_bus[7:0] (lower 8-bit)
                                    // SW[16]: unused
                                    // SW[17]: ALS_H4 (H4 to S-bus)

    // LED outputs
    output wire [15:0] LEDR,        // LEDR[7:0]: H4_out[7:0]
                                    // LEDR[15:8]: ALU_result_bus[7:0]
    output wire [7:0] LEDG          // LEDG[0]: carry flag
                                    // LEDG[1]: overflow flag
                                    // LEDG[4:2]: operation mode display
                                    // LEDG[7:5]: unused
);

    // =========================
    // Internal signals
    // =========================

    // Operation mode select
    wire [2:0] mode_sel;
    wire q2, q1, q0;

    // ALU control signals
    wire y, z, x, v, u;
    wire als_h4;

    // Bus signals (16-bit with upper 8-bit tied to 0)
    wire [15:0] a_bus_in;
    wire [15:0] b_bus_in;

    // H4 outputs
    wire [15:0] h4_out;
    wire [15:0] alu_result_bus;
    wire carry;
    wire overflow;

    // =========================
    // Mode select from KEY[3:1]
    // =========================
    // KEY is negative logic (pressed=0, released=1)
    // Invert to get positive logic mode selection
    assign mode_sel = ~KEY[3:1];
    assign q2 = mode_sel[2];
    assign q1 = mode_sel[1];
    assign q0 = mode_sel[0];

    // =========================
    // Control signal multiplexer
    // =========================
    // Truth table (Q2 Q1 Q0 = KEY[3:1]):
    // Q2 Q1 Q0 | x y z u v | Operation
    // ---------+-----------+-----------
    // 0  0  0  | 0 1 0 0 1 | ADD (a + b)
    // 0  0  1  | 0 1 0 1 1 | INC (a + b + 1)
    // 0  1  0  | 1 1 0 1 1 | SUB (a - b)
    // 0  1  1  | 1 1 0 0 1 | DEC (a - b - 1)
    // 1  0  0  | 0 0 0 0 0 | AND (a ∧ b)
    // 1  0  1  | 0 0 1 0 0 | OR (a ∨ b)
    // 1  1  0  | 0 0 0 0 1 | XOR (a ⊕ b)
    // 1  1  1  | 1 0 0 0 1 | NOT (NOT b, a=0)

    // x signal: 010, 011, 111
    assign x = (~q2 & q1 & ~q0) | (~q2 & q1 & q0) | (q2 & q1 & q0);

    // y signal: 000, 001, 010, 011
    assign y = ~q2;

    // z signal: 101 (OR operation only)
    assign z = (q2 & ~q1 & q0);

    // u signal: 001, 010
    assign u = (~q2 & ~q1 & q0) | (~q2 & q1 & ~q0);

    // v signal: 000, 001, 010, 011, 110, 111
    assign v = ~q2 | (q2 & q1);

    // =========================
    // ALS_H4 assignment
    // =========================
    // Negative logic: invert SW input
    assign als_h4 = ~SW[17];

    // =========================
    // A_bus and B_bus assignment
    // =========================
    // Negative logic: invert SW inputs
    // Use lower 8-bit (bits 7:0), upper 8-bit = 0
    assign a_bus_in[7:0] = ~SW[7:0];
    assign a_bus_in[15:8] = 8'b0;

    assign b_bus_in[7:0] = ~SW[15:8];
    assign b_bus_in[15:8] = 8'b0;

    // =========================
    // H4_module instance
    // =========================
    H4_module u_h4 (
        .y(y),
        .z(z),
        .x(x),
        .v(v),
        .u(u),  // Use u signal directly from mode decoder
        .ALS_H4(als_h4),
        .A_bus_in(a_bus_in),
        .B_bus_in(b_bus_in),
        .H4_out(h4_out),
        .ALU_result_bus(alu_result_bus),
        .carry(carry),
        .overflow(overflow)
    );

    // =========================
    // LED output assignment
    // =========================
    // H4_out (gated output) to LEDR[7:0]
    assign LEDR[7:0] = h4_out[7:0];

    // ALU_result_bus (raw output) to LEDR[15:8]
    assign LEDR[15:8] = alu_result_bus[7:0];

    // Status flags and mode display to LEDG
    assign LEDG[0] = carry;
    assign LEDG[1] = overflow;
    assign LEDG[4:2] = mode_sel;
    assign LEDG[7:5] = 3'b0;  // Unused

endmodule
