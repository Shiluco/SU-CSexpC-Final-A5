`timescale 1ns / 1ps

module tb_transfer_SR;
    // Register outputs (current values)
    reg [15:0] r0_q, r1_q, r2_q, r3_q, r4_q, r5_q, r6_q, r7_q, b0_q;

    // Control signals
    reg [7:0] SR;
    reg SB0;

    // Data input
    reg [15:0] S_bus;

    // Register inputs (outputs from transfer_SR)
    wire [15:0] r0_d, r1_d, r2_d, r3_d, r4_d, r5_d, r6_d, r7_d, b0_d;

    // Instantiate transfer_SR module
    transfer_SR uut (
        .r0_q(r0_q), .r1_q(r1_q), .r2_q(r2_q), .r3_q(r3_q),
        .r4_q(r4_q), .r5_q(r5_q), .r6_q(r6_q), .r7_q(r7_q),
        .b0_q(b0_q),
        .SR(SR),
        .SB0(SB0),
        .S_bus(S_bus),
        .r0_d(r0_d), .r1_d(r1_d), .r2_d(r2_d), .r3_d(r3_d),
        .r4_d(r4_d), .r5_d(r5_d), .r6_d(r6_d), .r7_d(r7_d),
        .b0_d(b0_d)
    );

    // Test sequence
    initial begin
        $display("=== transfer_SR Module Test Start ===");

        // Initialize
        r0_q = 16'h1000; r1_q = 16'h1111; r2_q = 16'h2222; r3_q = 16'h3333;
        r4_q = 16'h4444; r5_q = 16'h5555; r6_q = 16'h6666; r7_q = 16'h7777;
        b0_q = 16'hBBBB;
        SR = 8'h00;
        SB0 = 1'b0;
        S_bus = 16'h0000;

        #10;

        // Test 1: No store signal - outputs should match inputs (hold mode)
        $display("Test 1: Hold mode (SR=0, SB0=0)");
        #1;
        if (r0_d == r0_q && r1_d == r1_q && b0_d == b0_q)
            $display("PASS: All outputs hold current values");
        else
            $display("FAIL: r0_d=0x%h (expected 0x%h)", r0_d, r0_q);

        // Test 2: Store to R0
        $display("Test 2: Store 0xAAAA to R0 (SR[0]=1)");
        SR = 8'h01;  // SR[0] = 1
        S_bus = 16'hAAAA;
        #1;
        if (r0_d == 16'hAAAA && r1_d == r1_q)
            $display("PASS: r0_d=0x%h, r1_d holds 0x%h", r0_d, r1_d);
        else
            $display("FAIL: r0_d=0x%h (expected 0xAAAA), r1_d=0x%h", r0_d, r1_d);

        // Test 3: Store to multiple registers
        $display("Test 3: Store to R0, R2, R4 (SR=0x15)");
        SR = 8'b00010101;  // SR[0,2,4] = 1
        S_bus = 16'hBEEF;
        #1;
        if (r0_d == 16'hBEEF && r2_d == 16'hBEEF && r4_d == 16'hBEEF && r1_d == r1_q && r3_d == r3_q)
            $display("PASS: R0, R2, R4 = 0xBEEF, others hold");
        else
            $display("FAIL: r0_d=0x%h, r2_d=0x%h, r4_d=0x%h", r0_d, r2_d, r4_d);

        // Test 4: Store to B0
        $display("Test 4: Store 0xCAFE to B0 (SB0=1)");
        SR = 8'h00;
        SB0 = 1'b1;
        S_bus = 16'hCAFE;
        #1;
        if (b0_d == 16'hCAFE && r0_d == r0_q)
            $display("PASS: b0_d=0x%h, registers hold", b0_d);
        else
            $display("FAIL: b0_d=0x%h (expected 0xCAFE)", b0_d);

        // Test 5: Store to all registers simultaneously
        $display("Test 5: Store to all registers (SR=0xFF, SB0=1)");
        SR = 8'hFF;
        SB0 = 1'b1;
        S_bus = 16'hDEAD;
        #1;
        if (r0_d == 16'hDEAD && r7_d == 16'hDEAD && b0_d == 16'hDEAD)
            $display("PASS: All registers = 0xDEAD");
        else
            $display("FAIL: r0_d=0x%h, r7_d=0x%h, b0_d=0x%h", r0_d, r7_d, b0_d);

        // Test 6: Return to hold mode
        $display("Test 6: Return to hold mode");
        SR = 8'h00;
        SB0 = 1'b0;
        r0_q = 16'hFFFF;  // Update current value
        #1;
        if (r0_d == 16'hFFFF)
            $display("PASS: r0_d holds updated value 0x%h", r0_d);
        else
            $display("FAIL: r0_d=0x%h (expected 0xFFFF)", r0_d);

        #20;
        $display("=== transfer_SR Module Test Complete ===");
        $finish;
    end

    // Waveform dump
    initial begin
        $dumpfile("tb_transfer_SR.vcd");
        $dumpvars(0, tb_transfer_SR);
    end

endmodule
