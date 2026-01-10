module bus(
    // Transfer gate outputs from transfer module (array of 8, 16-bit each)
    input  wire [15:0] RA [0:7],
    input  wire [15:0] MDA_out,
    input  wire [15:0] B0,
    input  wire [15:0] SHS,
    input  wire [15:0] ALS,
    input  wire [15:0] MDM_out,

    // Bus outputs
    output wire [15:0] A_bus,   // A bus (OR of all transfer gate outputs)
    output wire [15:0] B_bus,    // B bus (B0 only)
    output wire [15:0] S_bus,
    output wire [15:0] M_bus
);

    // A bus is simply the OR of all transfer gate outputs
    // (transfer.v ensures only one output has a value at a time)
    assign A_bus = MDA_out | RA[0] | RA[1] | RA[2] | RA[3] |
                   RA[4] | RA[5] | RA[6] | RA[7];

    // B bus outputs only B0
    assign B_bus = B0;

    // S bus outputs SMA and SMD
    assign S_bus = SHS | ALS;

    //  ここでは主メモリの内容とのorを取る
    assign M_bus = MDM_out;

    

endmodule
