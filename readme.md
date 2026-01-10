# SEP3
## セットアップ
配布のsep5_interface_w_extの配下に当レポジトリを配置する。

Interface_ver01_with_extboard.qsfに```set_global_assignment -name SOURCE_TCL_SCRIPT_FILE "SU-CSexpC-Final-A5/tools/src_files.tcl"```と追記する。

## 実行
SU-CSexpC-Final-A5配下で```make```コマンドを実行

# 動かない場合
file tools/gen_src_files.sh
CRLFが入ってたら以下のコマンドを実行
sed -i 's/\r$//' tools/gen_src_files.sh
