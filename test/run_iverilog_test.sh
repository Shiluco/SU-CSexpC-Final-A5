#!/bin/bash

echo ""
echo "Icarus Verilog Test Script"
echo "=========================="
echo ""

# Icarus Verilogがインストールされているか確認
if ! command -v iverilog &> /dev/null; then
    echo "[エラー] Icarus Verilogが見つかりません"
    echo ""
    echo "以下のコマンドでインストールしてください:"
    echo "  sudo apt-get update"
    echo "  sudo apt-get install iverilog gtkwave"
    echo ""
    exit 1
fi

echo "Icarus Verilog が見つかりました"
iverilog -V | head -n 1
echo ""

# ========================================
# テスト1: transfer_SR モジュール
# ========================================
echo "[1/3] transfer_SR モジュールのテスト"
echo "----------------------------------------"

echo "コンパイル中: transfer.v + tb_transfer_SR.v"
iverilog -g2012 -o tb_transfer_SR.vvp ../src/transfer.v tb_transfer_SR.v
if [ $? -ne 0 ]; then
    echo "[エラー] コンパイルに失敗しました"
    exit 1
fi

echo "シミュレーション実行中..."
vvp tb_transfer_SR.vvp
if [ $? -ne 0 ]; then
    echo "[エラー] シミュレーションに失敗しました"
    exit 1
fi
echo ""

# ========================================
# テスト2: transfer gates モジュール
# ========================================
echo "[2/3] transfer gates モジュールのテスト"
echo "----------------------------------------"

echo "コンパイル中: transfer.v + tb_transfer_gates.v"
iverilog -g2012 -o tb_transfer_gates.vvp ../src/transfer.v tb_transfer_gates.v
if [ $? -ne 0 ]; then
    echo "[エラー] コンパイルに失敗しました"
    exit 1
fi

echo "シミュレーション実行中..."
vvp tb_transfer_gates.vvp
if [ $? -ne 0 ]; then
    echo "[エラー] シミュレーションに失敗しました"
    exit 1
fi
echo ""

# ========================================
# テスト3: register モジュール
# ========================================
echo "[3/3] register モジュールのテスト"
echo "----------------------------------------"

echo "コンパイル中: register.v + transfer.v + tb_register.v"
iverilog -g2012 -o tb_register.vvp ../src/register.v ../src/transfer.v tb_register.v
if [ $? -ne 0 ]; then
    echo "[エラー] コンパイルに失敗しました"
    exit 1
fi

echo "シミュレーション実行中..."
vvp tb_register.vvp
if [ $? -ne 0 ]; then
    echo "[エラー] シミュレーションに失敗しました"
    exit 1
fi
echo ""

# ========================================
# 完了
# ========================================
echo "========================================"
echo "すべてのテストが完了しました"
echo "========================================"
echo ""
echo "波形ファイルが生成されました:"
echo "  - tb_transfer_SR.vcd"
echo "  - tb_transfer_gates.vcd"
echo "  - tb_register.vcd"
echo ""
echo "GTKWaveで波形を確認するには:"
echo "  gtkwave tb_transfer_SR.vcd"
echo ""
