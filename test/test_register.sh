#!/bin/bash

echo "==================================="
echo "Register Module Test (Icarus Verilog)"
echo "==================================="
echo ""

# ステップ1: コンパイル
echo "ステップ1: コンパイル"
echo "実行コマンド: iverilog -g2012 -o tb_register.vvp ../src/register.v ../src/transfer.v tb_register.v"
iverilog -g2012 -o tb_register.vvp ../src/register.v ../src/transfer.v tb_register.v

if [ $? -ne 0 ]; then
    echo "[エラー] コンパイルに失敗しました"
    exit 1
fi
echo "✓ コンパイル成功"
echo ""

# ステップ2: シミュレーション実行
echo "ステップ2: シミュレーション実行"
echo "実行コマンド: vvp tb_register.vvp"
vvp tb_register.vvp

if [ $? -ne 0 ]; then
    echo "[エラー] シミュレーションに失敗しました"
    exit 1
fi
echo "✓ シミュレーション成功"
echo ""

# ステップ3: 波形ファイル確認
echo "ステップ3: 波形ファイル確認"
if [ -f tb_register.vcd ]; then
    echo "✓ 波形ファイル tb_register.vcd が生成されました"
    echo ""
    echo "波形を表示するには以下を実行:"
    echo "  gtkwave tb_register.vcd"
else
    echo "⚠ 波形ファイルが見つかりません"
fi
echo ""

# 参考URLとの対応確認
echo "==================================="
echo "参考URL手順との対応:"
echo "==================================="
echo "1. コンパイル: iverilog -o [出力] [ソース] [テストベンチ]"
echo "   → 実行済み ✓"
echo ""
echo "2. シミュレーション: vvp [出力ファイル]"
echo "   → 実行済み ✓"
echo ""
echo "3. 波形表示: gtkwave [vcdファイル]"
echo "   → 次のステップで実行可能"
echo ""
echo "参考URL: https://www.ritsumei.ac.jp/se/re/izumilab/lecture/25iverilog/"
echo "==================================="
