`timescale 1ns / 1ps

module tb_register;
    // Clock and Reset
    reg CLK;
    reg CLR;

    // Register inputs (r_d)
    reg [15:0] r0_d, r1_d, r2_d, r3_d, r4_d, r5_d, r6_d, r7_d, b0_d;
    reg [15:0] SMA_out, SMD_out, MMD_out, MIS_out;

    // Register outputs (r_q)
    wire [15:0] r0_q, r1_q, r2_q, r3_q, r4_q, r5_q, r6_q, r7_q, b0_q;
    wire [15:0] mar_q, mdr_q, isr_q;

    // Instantiate register module
    register uut (
        .CLK(CLK),
        .CLR(CLR),
        .r0_d(r0_d), .r1_d(r1_d), .r2_d(r2_d), .r3_d(r3_d),
        .r4_d(r4_d), .r5_d(r5_d), .r6_d(r6_d), .r7_d(r7_d),
        .b0_d(b0_d),
        .SMA_out(SMA_out),
        .SMD_out(SMD_out),
        .MMD_out(MMD_out),
        .MIS_out(MIS_out),
        .r0_q(r0_q), .r1_q(r1_q), .r2_q(r2_q), .r3_q(r3_q),
        .r4_q(r4_q), .r5_q(r5_q), .r6_q(r6_q), .r7_q(r7_q),
        .b0_q(b0_q),
        .mar_q(mar_q),
        .mdr_q(mdr_q),
        .isr_q(isr_q)
    );

    // Clock generation (10ns period = 100MHz)
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    // Test sequence
    initial begin
        $display("=== Register Module Test Start ===");

        // Initialize
        CLR = 0;  // Assert reset (active low)
        r0_d = 16'h0000; r1_d = 16'h0000; r2_d = 16'h0000; r3_d = 16'h0000;
        r4_d = 16'h0000; r5_d = 16'h0000; r6_d = 16'h0000; r7_d = 16'h0000;
        b0_d = 16'h0000;
        SMA_out = 16'h0000; SMD_out = 16'h0000; MMD_out = 16'h0000; MIS_out = 16'h0000;

        #10;

        // Release reset
        CLR = 1;
        #10;

        // Test 1: Write to R0
        $display("Test 1: Write 0x1234 to R0");
        r0_d = 16'h1234;
        @(posedge CLK);
        #1;
        if (r0_q == 16'h1234)
            $display("PASS: R0 = 0x%h", r0_q);
        else
            $display("FAIL: R0 = 0x%h (expected 0x1234)", r0_q);

        // Test 2: Write to multiple registers
        $display("Test 2: Write to R1-R3");
        r1_d = 16'h5678;
        r2_d = 16'hABCD;
        r3_d = 16'hEF01;
        @(posedge CLK);
        #1;
        if (r1_q == 16'h5678 && r2_q == 16'hABCD && r3_q == 16'hEF01)
            $display("PASS: R1=0x%h, R2=0x%h, R3=0x%h", r1_q, r2_q, r3_q);
        else
            $display("FAIL: R1=0x%h, R2=0x%h, R3=0x%h", r1_q, r2_q, r3_q);

        // Test 3: Test MAR register
        $display("Test 3: Write 0x1000 to MAR");
        SMA_out = 16'h1000;
        @(posedge CLK);
        #1;
        if (mar_q == 16'h1000)
            $display("PASS: MAR = 0x%h", mar_q);
        else
            $display("FAIL: MAR = 0x%h (expected 0x1000)", mar_q);

        // Test 4: Test MDR register (OR of SMD_out and MMD_out)
        $display("Test 4: Write to MDR via SMD_out");
        SMD_out = 16'h2000;
        MMD_out = 16'h0000;
        @(posedge CLK);
        #1;
        if (mdr_q == 16'h2000)
            $display("PASS: MDR = 0x%h", mdr_q);
        else
            $display("FAIL: MDR = 0x%h (expected 0x2000)", mdr_q);

        // Test 5: Test MDR with MMD_out
        $display("Test 5: Write to MDR via MMD_out");
        SMD_out = 16'h0000;
        MMD_out = 16'h3000;
        @(posedge CLK);
        #1;
        if (mdr_q == 16'h3000)
            $display("PASS: MDR = 0x%h", mdr_q);
        else
            $display("FAIL: MDR = 0x%h (expected 0x3000)", mdr_q);

        // Test 6: Test ISR register
        $display("Test 6: Write 0x4000 to ISR");
        MIS_out = 16'h4000;
        @(posedge CLK);
        #1;
        if (isr_q == 16'h4000)
            $display("PASS: ISR = 0x%h", isr_q);
        else
            $display("FAIL: ISR = 0x%h (expected 0x4000)", isr_q);

        // Test 7: Test reset functionality
        $display("Test 7: Test reset (CLR)");
        CLR = 0;  // Assert reset
        @(posedge CLK);
        #1;
        if (r0_q == 16'h0000 && r1_q == 16'h0000 && mar_q == 16'h0000)
            $display("PASS: Registers cleared");
        else
            $display("FAIL: Registers not cleared - R0=0x%h, R1=0x%h, MAR=0x%h", r0_q, r1_q, mar_q);

        CLR = 1;  // Release reset

        #20;
        $display("=== Register Module Test Complete ===");
        $finish;
    end

    // Waveform dump for GTKWave or similar
    initial begin
        $dumpfile("tb_register.vcd");
        $dumpvars(0, tb_register);
    end

endmodule
