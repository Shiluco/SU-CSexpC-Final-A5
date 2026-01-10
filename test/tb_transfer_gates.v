`timescale 1ns / 1ps

module tb_transfer_gates;
    // Test signals
    reg [15:0] S_bus;
    reg [15:0] M_bus;
    reg SMA, SMD, MMD, MIS;

    // Outputs
    wire [15:0] SMA_out, SMD_out, MMD_out, MIS_out;

    // Instantiate transfer gate modules
    transfer_SMA uut_sma (
        .S_bus(S_bus),
        .SMA(SMA),
        .SMA_out(SMA_out)
    );

    transfer_SMD uut_smd (
        .S_bus(S_bus),
        .SMD(SMD),
        .SMD_out(SMD_out)
    );

    transfer_MMD uut_mmd (
        .M_bus(M_bus),
        .MMD(MMD),
        .MMD_out(MMD_out)
    );

    transfer_MIS uut_mis (
        .M_bus(M_bus),
        .MIS(MIS),
        .MIS_out(MIS_out)
    );

    // Test sequence
    initial begin
        $display("=== Transfer Gate Modules Test Start ===");

        // Initialize
        S_bus = 16'h0000;
        M_bus = 16'h0000;
        SMA = 1'b0;
        SMD = 1'b0;
        MMD = 1'b0;
        MIS = 1'b0;

        #10;

        // Test 1: All gates disabled - outputs should be 0
        $display("Test 1: All gates disabled");
        S_bus = 16'hFFFF;
        M_bus = 16'hFFFF;
        #1;
        if (SMA_out == 16'h0000 && SMD_out == 16'h0000 && MMD_out == 16'h0000 && MIS_out == 16'h0000)
            $display("PASS: All outputs = 0x0000");
        else
            $display("FAIL: SMA_out=0x%h, SMD_out=0x%h, MMD_out=0x%h, MIS_out=0x%h",
                     SMA_out, SMD_out, MMD_out, MIS_out);

        // Test 2: Test SMA gate
        $display("Test 2: SMA gate enabled with S_bus=0xAAAA");
        S_bus = 16'hAAAA;
        SMA = 1'b1;
        #1;
        if (SMA_out == 16'hAAAA)
            $display("PASS: SMA_out = 0x%h", SMA_out);
        else
            $display("FAIL: SMA_out = 0x%h (expected 0xAAAA)", SMA_out);
        SMA = 1'b0;

        // Test 3: Test SMD gate
        $display("Test 3: SMD gate enabled with S_bus=0x5555");
        S_bus = 16'h5555;
        SMD = 1'b1;
        #1;
        if (SMD_out == 16'h5555)
            $display("PASS: SMD_out = 0x%h", SMD_out);
        else
            $display("FAIL: SMD_out = 0x%h (expected 0x5555)", SMD_out);
        SMD = 1'b0;

        // Test 4: Test MMD gate
        $display("Test 4: MMD gate enabled with M_bus=0x1234");
        M_bus = 16'h1234;
        MMD = 1'b1;
        #1;
        if (MMD_out == 16'h1234)
            $display("PASS: MMD_out = 0x%h", MMD_out);
        else
            $display("FAIL: MMD_out = 0x%h (expected 0x1234)", MMD_out);
        MMD = 1'b0;

        // Test 5: Test MIS gate
        $display("Test 5: MIS gate enabled with M_bus=0xABCD");
        M_bus = 16'hABCD;
        MIS = 1'b1;
        #1;
        if (MIS_out == 16'hABCD)
            $display("PASS: MIS_out = 0x%h", MIS_out);
        else
            $display("FAIL: MIS_out = 0x%h (expected 0xABCD)", MIS_out);
        MIS = 1'b0;

        // Test 6: Multiple gates enabled simultaneously
        $display("Test 6: Multiple gates enabled (SMA, SMD)");
        S_bus = 16'hBEEF;
        SMA = 1'b1;
        SMD = 1'b1;
        #1;
        if (SMA_out == 16'hBEEF && SMD_out == 16'hBEEF)
            $display("PASS: SMA_out = 0x%h, SMD_out = 0x%h", SMA_out, SMD_out);
        else
            $display("FAIL: SMA_out = 0x%h, SMD_out = 0x%h", SMA_out, SMD_out);

        // Test 7: Test with different bit patterns
        $display("Test 7: Test with bit pattern 0xF0F0");
        S_bus = 16'hF0F0;
        M_bus = 16'h0F0F;
        SMA = 1'b0;
        SMD = 1'b1;
        MMD = 1'b1;
        MIS = 1'b0;
        #1;
        if (SMD_out == 16'hF0F0 && MMD_out == 16'h0F0F)
            $display("PASS: SMD_out = 0x%h, MMD_out = 0x%h", SMD_out, MMD_out);
        else
            $display("FAIL: SMD_out = 0x%h, MMD_out = 0x%h", SMD_out, MMD_out);

        #20;
        $display("=== Transfer Gate Modules Test Complete ===");
        $finish;
    end

    // Waveform dump
    initial begin
        $dumpfile("tb_transfer_gates.vcd");
        $dumpvars(0, tb_transfer_gates);
    end

endmodule
