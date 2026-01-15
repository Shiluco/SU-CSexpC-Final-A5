// ============================================================
// Interface for shifter_module
// DE2-115 board (negative logic)
// Control signals selected by KEY[3:1] multiplexer
// ============================================================

module if_shifter (
    // Push buttons (KEY)
    input  wire [3:0] KEY,          // KEY[0]: unused
                                    // KEY[3:1]: control mode select (3-bit = 8 patterns)

    // Slide switches (SW)
    input  wire [17:0] SW,          // SW[15:0]: A_bus[15:0] input data
                                    // SW[16]: Cf_in (Carry input for Cin)
                                    // SW[17]: SHS (Shifter to S-bus)

    // LED outputs
    output wire [15:0] LEDR,        // LEDR[15:0]: shifter_out[15:0]
    output wire [7:0] LEDG          // LEDG[0]: Cf (Carry flag output)
                                    // LEDG[3:1]: control mode display
                                    // LEDG[7:4]: unused
);

    // =========================
    // Internal signals
    // =========================

    // Control mode select
    wire [2:0] mode_sel;

    // Control signals
    wire rin;
    wire lin;
    wire ain;
    wire bin;
    wire cin;
    wire din;
    wire ein;
    wire shs;

    // Carry input
    wire cf_in;

    // A_bus
    wire [15:0] a_bus;

    // Shifter outputs
    wire [15:0] shifter_out;
    wire [15:0] shifter_result_bus;
    wire cf_out;

    // =========================
    // Mode select from KEY[3:1]
    // =========================
    // KEY is negative logic (pressed=0, released=1)
    // Invert to get positive logic mode selection
    assign mode_sel = ~KEY[3:1];

    // =========================
    // Control signal multiplexer
    // =========================
    // Truth table (Q2 Q1 Q0 = KEY[3:1]):
    // Q2 Q1 Q0 | A B C D E R L | Operation
    // ---------+----------------+-----------
    // 0  0  0  | 0 1 1 0 0 0 1  | ROL (Rotate Left)
    // 0  0  1  | 0 0 0 1 0 1 0  | ROR (Rotate Right)
    // 0  1  0  | 1 0 0 0 0 0 1  | ASL (Arithmetic Shift Left)
    // 0  1  1  | 1 0 0 0 0 1 0  | ASR (Arithmetic Shift Right)
    // 1  0  0  | 0 0 1 0 0 0 1  | LSL (Logical Shift Left)
    // 1  0  1  | 0 0 0 0 0 1 0  | LSR (Logical Shift Right)
    // 1  1  0  | 0 0 1 0 1 0 1  | RLC (Rotate Left through Carry)
    // 1  1  1  | 0 0 0 0 1 1 0  | RRC (Rotate Right through Carry)

    wire q2, q1, q0;
    assign q2 = mode_sel[2];
    assign q1 = mode_sel[1];
    assign q0 = mode_sel[0];

    // Ain (A): 010, 011
    assign ain = (~q2 & q1 & ~q0) | (~q2 & q1 & q0);

    // Bin (B): 000
    assign bin = (~q2 & ~q1 & ~q0);

    // Cin (C): 000, 100, 110
    assign cin = (~q2 & ~q1 & ~q0) | (q2 & ~q1 & ~q0) | (q2 & q1 & ~q0);

    // Din (D): 001
    assign din = (~q2 & ~q1 & q0);

    // Ein (E): 110, 111
    assign ein = (q2 & q1 & ~q0) | (q2 & q1 & q0);

    // Rin (R): 001, 011, 101, 111 (q0=1)
    assign rin = (~q2 & ~q1 & q0) | (~q2 & q1 & q0) | (q2 & ~q1 & q0) | (q2 & q1 & q0);
    // Simplified: rin = q0;

    // Lin (L): 000, 010, 100, 110 (q0=0)
    assign lin = (~q2 & ~q1 & ~q0) | (~q2 & q1 & ~q0) | (q2 & ~q1 & ~q0) | (q2 & q1 & ~q0);
    // Simplified: lin = ~q0;

    // =========================
    // SHS and Cf_in assignment
    // =========================
    // Negative logic: invert SW inputs
    assign shs = ~SW[17];
    assign cf_in = ~SW[16];

    // =========================
    // A_bus assignment
    // =========================
    // Negative logic: invert SW inputs
    assign a_bus = ~SW[15:0];

    // =========================
    // shifter_module instance
    // =========================
    shifter_module u_shifter (
        .Rin(rin),
        .Lin(lin),
        .Ain(ain),
        .Bin(bin),
        .Cin(cf_in & cin),  // Cin controlled by both cf_in (SW[16]) and cin signal (mode)
        .Din(din),
        .Ein(ein),
        .SHS(shs),
        .A_bus(a_bus),
        .shifter_out(shifter_out),
        .shifter_result_bus(shifter_result_bus),
        .Cf(cf_out)
    );

    // =========================
    // LED output assignment
    // =========================
    // Shifter output to LEDR[15:0]
    assign LEDR[15:0] = shifter_out[15:0];

    // Carry flag and mode display to LEDG
    assign LEDG[0] = cf_out;
    assign LEDG[3:1] = mode_sel;
    assign LEDG[7:4] = 4'b0;  // Unused

endmodule
