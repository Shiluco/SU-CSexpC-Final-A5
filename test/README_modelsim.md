# ModelSimでのテスト実行方法

## 手順

### 1. ModelSimのパスを確認

ModelSimがインストールされている場所を探します：

- **Quartus Prime Standard**: `C:\intelFPGA\<version>\modelsim_ase\win32aloem`
- **Quartus Prime Lite**: `C:\intelFPGA_lite\<version>\modelsim_ase\win32aloem`

例: `C:\intelFPGA\20.1\modelsim_ase\win32aloem`

### 2. バッチファイルを編集

`run_modelsim_test.bat` を開いて、以下の行を編集します：

```batch
set MODELSIM_BIN=C:\intelFPGA\20.1\modelsim_ase\win32aloem
```

あなたの環境のパスに変更してください。

### 3. テスト実行

コマンドプロンプトを開いて：

```cmd
cd c:\Work\SU-CSexpC-Final-A5\test
run_modelsim_test.bat
```

または、エクスプローラーで `run_modelsim_test.bat` をダブルクリック

## 期待される出力

```
ModelSim Test Script
====================
ModelSimパス: C:\intelFPGA\20.1\modelsim_ase\win32aloem

[1/4] 作業ディレクトリを作成中...
[2/4] ソースファイルをコンパイル中...
[3/4] テストベンチをコンパイル中...
[4/4] シミュレーション実行中...

=== transfer_SR Module Test Start ===
Test 1: Hold mode (SR=0, SB0=0)
PASS: All outputs hold current values
Test 2: Store 0xAAAA to R0 (SR[0]=1)
PASS: r0_d=0xaaaa, r1_d holds 0x1111
...
=== transfer_SR Module Test Complete ===

========================================
テスト完了
========================================
```

## 手動でコマンドを実行する場合

```cmd
cd c:\Work\SU-CSexpC-Final-A5\test

REM ModelSimのパスを追加
set PATH=C:\intelFPGA\20.1\modelsim_ase\win32aloem;%PATH%

REM 作業ディレクトリ作成
vlib work

REM コンパイル
vlog -work work ..\src\transfer.v
vlog -work work tb_transfer_SR.v

REM シミュレーション実行
vsim -c -do "run -all; quit" -L work tb_transfer_SR
```

## トラブルシューティング

### エラー: 'vlog' は、内部コマンドまたは外部コマンド...

→ ModelSimのパスが正しく設定されていません。`MODELSIM_BIN` の値を確認してください。

### エラー: ** Error: (vlog-7) Failed to open design unit file

→ ファイルパスが間違っています。`cd c:\Work\SU-CSexpC-Final-A5\test` で正しいディレクトリにいるか確認してください。

### ModelSimのバージョンを確認

```cmd
vsim -version
```
