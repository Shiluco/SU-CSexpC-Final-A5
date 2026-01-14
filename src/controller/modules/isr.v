module isr (
    input  wire        CLK,
    input  wire        CLR,
    input  wire        MIS,
    input  wire [15:0] M_BUS,
    output wire [15:0] ISR
);
    // M_BUSとMISでANDを取って、MISが1の時だけM_BUSの値を通す
    wire [15:0] gated_data;
    assign gated_data = {16{MIS}} & M_BUS;

    // 16bitレジスタの実体
    reg [15:0] isr_reg;

    // レジスタの更新ロジック
    always @(posedge CLK or negedge CLR) begin
        if (!CLR)
            isr_reg <= 16'b0;
        else
            isr_reg <= gated_data;
    end

    // 出力
    assign ISR = isr_reg;
endmodule
