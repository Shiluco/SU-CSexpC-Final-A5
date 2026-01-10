// D Flip-Flop with asynchronous clear and preset
module dff(
    input  wire clk,    // Clock
    input  wire clr,    // Clear (active high)
    input  wire pre,    // Preset (active high)
    input  wire d,      // Data input
    output reg  q       // Data output
);

    // Asynchronous clear and preset with clock synchronization
    always @(posedge clk or posedge clr or posedge pre) begin
        if (clr)
            q <= 1'b0;       // Clear has priority
        else if (pre)
            q <= 1'b1;       // Preset
        else
            q <= d;          // Normal operation
    end

endmodule
