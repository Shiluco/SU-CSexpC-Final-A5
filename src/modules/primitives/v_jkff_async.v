// JK Flip-Flop with asynchronous clear and preset
module v_jkff_async(
    input  wire clk,    // Clock
    input  wire clr,    // Clear (active high)
    input  wire pre,    // Preset (active high)
    input  wire j,      // J input
    input  wire k,      // K input
    output reg  q       // Q output
);

    // JK Flip-Flop logic
    // J=0, K=0: Hold
    // J=1, K=0: Set (Q=1)
    // J=0, K=1: Reset (Q=0)
    // J=1, K=1: Toggle
    // Next state: Q_next = (J & ~Q) | (~K & Q)
    always @(posedge clk or posedge clr or posedge pre) begin
        if (clr)
            q <= 1'b0;              // Clear has priority
        else if (pre)
            q <= 1'b1;              // Preset
        else
            q <= (j & ~q) | (~k & q);  // JK logic
    end

endmodule
