@echo off
REM ========================================
REM ModelSim Test Runner
REM ========================================

echo.
echo ModelSim Test Script
echo ====================

REM ========================================
REM ModelSimのパスを設定してください
REM 例: C:\intelFPGA\20.1\modelsim_ase\win32aloem
REM     C:\intelFPGA_lite\20.1\modelsim_ase\win32aloem
REM ========================================

set MODELSIM_BIN=C:\intelFPGA\20.1\modelsim_ase\win32aloem

REM パスが存在するか確認
if not exist "%MODELSIM_BIN%\vlog.exe" (
    echo.
    echo [エラー] ModelSimが見つかりません: %MODELSIM_BIN%
    echo.
    echo 以下のいずれかを確認してください:
    echo 1. ModelSim-Alteraがインストールされているか
    echo 2. このファイルの MODELSIM_BIN 変数を正しいパスに設定しているか
    echo.
    echo よくあるパス:
    echo   C:\intelFPGA\20.1\modelsim_ase\win32aloem
    echo   C:\intelFPGA_lite\20.1\modelsim_ase\win32aloem
    echo   C:\intelFPGA\18.1\modelsim_ase\win32aloem
    echo.
    pause
    exit /b 1
)

REM PATHに追加
set PATH=%MODELSIM_BIN%;%PATH%

echo ModelSimパス: %MODELSIM_BIN%
echo.

REM ========================================
REM 作業ディレクトリの作成
REM ========================================
if not exist work (
    echo [1/4] 作業ディレクトリを作成中...
    vlib work
) else (
    echo [1/4] 作業ディレクトリは既に存在します
)

REM ========================================
REM コンパイル
REM ========================================
echo [2/4] ソースファイルをコンパイル中...
vlog -work work ..\src\transfer.v
if errorlevel 1 (
    echo [エラー] transfer.v のコンパイルに失敗しました
    pause
    exit /b 1
)

echo [3/4] テストベンチをコンパイル中...
vlog -work work tb_transfer_SR.v
if errorlevel 1 (
    echo [エラー] tb_transfer_SR.v のコンパイルに失敗しました
    pause
    exit /b 1
)

REM ========================================
REM シミュレーション実行
REM ========================================
echo [4/4] シミュレーション実行中...
echo.
vsim -c -do "run -all; quit" -L work tb_transfer_SR

echo.
echo ========================================
echo テスト完了
echo ========================================
pause
