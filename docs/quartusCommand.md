### デバイス一覧
quartus_pgm -l

### コンパイルと書き込み
quartus_pgm -c "USB-Blaster[USB-0]" -m jtag -o "p;output_files/Interface_ver01_with_extboard.sof"

### コンパイル指定
set_global_assignment -name VERILOG_FILE xxx.v

### トップ指定
set_global_assignment -name TOP_LEVEL_ENTITY cap1
