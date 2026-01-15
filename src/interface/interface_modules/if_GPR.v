// ============================================================
// Interface for GPR (General Purpose Register)
// DE2-115 board (negative logic)
// ============================================================

module if_GPR (
    // Push buttons (KEY)
    input  wire [1:0] KEY,          // KEY[0]: clock input (pressed=0, released=1)
                                    // KEY[1]: clear input (pressed=0, released=1)

    // Slide switches (SW)
    input  wire [17:0] SW,          // SW[15:0]: S_bus input
                                    // SW[16]: SR signal (Store Register)
                                    // SW[17]: RA signal (Register to A-bus)

    // LED outputs
    output wire [17:0] LEDR         // LEDR[15:0]: register output data_out[15:0]
                                    // LEDR[16]: SR signal status
                                    // LEDR[17]: RA signal status
);

    // =========================
    // Internal signals
    // =========================

    // Clock signal
    wire clk;

    // Clear signal
    wire clr;

    // Control signals
    wire sr;
    wire ra;

    // S_bus
    wire [15:0] s_bus;

    // Register output
    wire [15:0] data_out;

    // =========================
    // Clock signal generation
    // =========================
    // KEY[0] is 0 when pressed, 1 when released, so invert for use
    assign clk = ~KEY[0];

    // =========================
    // Clear signal
    // =========================
    // KEY[1] is 0 when pressed, 1 when released
    // GPR.CLR is active low (CLR=0 means clear active)
    // When KEY[1] is pressed (0), we want clear active (CLR=0)
    // So pass KEY[1] directly
    assign clr = KEY[1];

    // =========================
    // Control signals
    // =========================
    // Negative logic: invert SW inputs
    assign sr = ~SW[16];
    assign ra = ~SW[17];

    // =========================
    // S_bus assignment
    // =========================
    // Negative logic: invert SW inputs
    assign s_bus = ~SW[15:0];

    // =========================
    // GPR instance
    // =========================
    GPR u_gpr (
        .CLK(clk),
        .CLR(clr),
        .SR(sr),
        .S_bus(s_bus),
        .RA(ra),
        .data_out(data_out)
    );

    // =========================
    // LED output assignment
    // =========================
    // Output data to LEDR[15:0]
    assign LEDR[15:0] = data_out[15:0];

    // Control signal status to LEDR[17:16]
    assign LEDR[16] = sr;
    assign LEDR[17] = ra;

endmodule
