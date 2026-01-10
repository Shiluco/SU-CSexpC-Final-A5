# 単体テスト実行方法

## 必要なツール

以下のいずれかのシミュレータが必要です：

1. **Icarus Verilog** (オープンソース、推奨)
2. **ModelSim** (商用)
3. **Verilator** (オープンソース)

## Icarus Verilogを使った例

### インストール（Windows）

```bash
# Icarus Verilogをダウンロード・インストール
# http://bleyer.org/icarus/
```

### テスト実行手順

#### 例1: transfer_SRモジュールのテスト

```bash
# プロジェクトのルートディレクトリに移動
cd c:/Work/SU-CSexpC-Final-A5

# ソースファイルとテストベンチをコンパイル
iverilog -o test/tb_transfer_SR.out src/transfer.v test/tb_transfer_SR.v

# シミュレーション実行
vvp test/tb_transfer_SR.out
```

**期待される出力:**
```
=== transfer_SR Module Test Start ===
Test 1: Hold mode (SR=0, SB0=0)
PASS: All outputs hold current values
Test 2: Store 0xAAAA to R0 (SR[0]=1)
PASS: r0_d=0xaaaa, r1_d holds 0x1111
Test 3: Store to R0, R2, R4 (SR=0x15)
PASS: R0, R2, R4 = 0xBEEF, others hold
Test 4: Store 0xCAFE to B0 (SB0=1)
PASS: b0_d=0xcafe, registers hold
Test 5: Store to all registers (SR=0xFF, SB0=1)
PASS: All registers = 0xDEAD
Test 6: Return to hold mode
PASS: r0_d holds updated value 0xffff
=== transfer_SR Module Test Complete ===
```

#### 波形ビューア（オプション）

シミュレーション実行後、VCDファイルが生成されます：

```bash
# GTKWaveで波形を確認
gtkwave test/tb_transfer_SR.vcd
```

## 他のテストベンチ

### registerモジュールのテスト
```bash
iverilog -o test/tb_register.out src/register.v test/tb_register.v
vvp test/tb_register.out
```

### 転送ゲートモジュールのテスト
```bash
iverilog -o test/tb_transfer_gates.out src/transfer.v test/tb_transfer_gates.v
vvp test/tb_transfer_gates.out
```

## テストのカスタマイズ

各テストベンチファイル（`tb_*.v`）を編集して、独自のテストケースを追加できます。

### テストケースの追加例

```verilog
// Test 7: Custom test case
$display("Test 7: My custom test");
SR = 8'b01010101;  // Set control signals
S_bus = 16'hFFFF;  // Set input data
#1;                // Wait for combinational logic
if (r0_d == expected_value)
    $display("PASS: Test passed");
else
    $display("FAIL: Test failed");
```

## トラブルシューティング

### エラー: モジュールが見つからない
```
error: Unknown module type: transfer_SR
```
→ ソースファイルのパスを確認してください

### エラー: 信号が未定義
```
error: reg/wire `xxx' not found
```
→ モジュールのポート名が正しいか確認してください
