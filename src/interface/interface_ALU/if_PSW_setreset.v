// ============================================================
// Interface for PSW_setreset (Program Status Word Set/Reset)
// DE2-115 board (negative logic)
// ============================================================

module if_PSW_setreset (
    // Push buttons (KEY)
    input  wire [1:0] KEY,          // KEY[0]: clock input (pressed=0, released=1)
                                    // KEY[1]: clear input (pressed=0, released=1)

    // Slide switches (SW)
    input  wire [7:0] SW,           // SW[7]: J_N (N flag J input)
                                    // SW[6]: K_N (N flag K input)
                                    // SW[5]: J_Z (Z flag J input)
                                    // SW[4]: K_Z (Z flag K input)
                                    // SW[3]: J_V (V flag J input)
                                    // SW[2]: K_V (V flag K input)
                                    // SW[1]: J_C (C flag J input)
                                    // SW[0]: K_C (C flag K input)

    // LED outputs
    output wire [17:0] LEDR         // LEDR[7:0]: JK input status display
                                    // LEDR[11:8]: NZVC flag outputs
                                    //   LEDR[11] = N
                                    //   LEDR[10] = Z
                                    //   LEDR[9]  = V
                                    //   LEDR[8]  = C
                                    // LEDR[17:12]: unused
);

    // =========================
    // Internal signals
    // =========================

    // Clock signal
    wire clk;

    // Clear signal
    wire clr;

    // JK inputs
    wire j_n, k_n;
    wire j_z, k_z;
    wire j_v, k_v;
    wire j_c, k_c;

    // PSW output
    wire [15:0] psw;

    // =========================
    // Clock signal generation
    // =========================
    // KEY[0] is 0 when pressed, 1 when released, so invert for use
    assign clk = ~KEY[0];

    // =========================
    // Clear signal
    // =========================
    // KEY[1] is 0 when pressed, 1 when released
    // PSW_setreset.CLR is active low (CLR=0 means clear active)
    // When KEY[1] is pressed (0), we want clear active (CLR=0)
    // So pass KEY[1] directly
    assign clr = KEY[1];

    // =========================
    // JK input assignment
    // =========================
    // Negative logic: invert SW inputs
    assign j_n = ~SW[7];
    assign k_n = ~SW[6];
    assign j_z = ~SW[5];
    assign k_z = ~SW[4];
    assign j_v = ~SW[3];
    assign k_v = ~SW[2];
    assign j_c = ~SW[1];
    assign k_c = ~SW[0];

    // =========================
    // PSW_setreset instance
    // =========================
    PSW_setreset u_psw (
        .CLK(clk),
        .CLR(clr),
        .J_N(j_n),
        .K_N(k_n),
        .J_Z(j_z),
        .K_Z(k_z),
        .J_V(j_v),
        .K_V(k_v),
        .J_C(j_c),
        .K_C(k_c),
        .PSW(psw)
    );

    // =========================
    // LED output assignment
    // =========================
    // Display JK input status on LEDR[7:0]
    assign LEDR[7] = j_n;
    assign LEDR[6] = k_n;
    assign LEDR[5] = j_z;
    assign LEDR[4] = k_z;
    assign LEDR[3] = j_v;
    assign LEDR[2] = k_v;
    assign LEDR[1] = j_c;
    assign LEDR[0] = k_c;

    // Display NZVC flags on LEDR[11:8]
    assign LEDR[11] = psw[3];  // N flag
    assign LEDR[10] = psw[2];  // Z flag
    assign LEDR[9]  = psw[1];  // V flag
    assign LEDR[8]  = psw[0];  // C flag

    // Unused LEDs
    assign LEDR[17:12] = 6'b0;

endmodule
