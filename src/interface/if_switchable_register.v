// ============================================================
// Interface for switchable_register
// DE2-115 board (negative logic)
// ============================================================

module if_switchable_register (
    // Push buttons (KEY)
    input  wire [1:0] KEY,          // KEY[0]: clock input (pressed=0, released=1)
                                    // KEY[1]: clear input (pressed=0, released=1)

    // Slide switches (SW)
    input  wire [16:0] SW,          // SW[15:0]: S_bus input
                                    // SW[16]: SR signal

    // LED outputs
    output wire [15:0] LEDR         // LEDR[15:0]: register output Q[15:0]
);

    // =========================
    // Internal signals
    // =========================

    // Clock signal
    wire clk;

    // Clear signal
    wire clr;

    // SR signal
    wire sr;

    // S_bus
    wire [15:0] s_bus;

    // Register output
    wire [15:0] q;

    // =========================
    // Clock signal generation
    // =========================
    // KEY[0] is 0 when pressed, 1 when released, so invert for use
    assign clk = ~KEY[0];

    // =========================
    // Clear signal
    // =========================
    // KEY[1] is 0 when pressed, 1 when released
    // switchable_register.CLR is active low (CLR=0 means clear active)
    // When KEY[1] is pressed (0), we want clear active (CLR=0)
    // So pass KEY[1] directly
    assign clr = KEY[1];

    // =========================
    // SR signal
    // =========================
    assign sr = SW[16];

    // =========================
    // S_bus assignment
    // =========================
    // Negative logic: invert SW inputs
    assign s_bus = ~SW[15:0];

    // =========================
    // switchable_register instance
    // =========================
    switchable_register u_reg (
        .CLK(clk),
        .CLR(clr),
        .SR(sr),
        .S_bus(s_bus),
        .Q(q)
    );

    // =========================
    // LED output assignment
    // =========================
    assign LEDR[15:0] = q[15:0];

endmodule
