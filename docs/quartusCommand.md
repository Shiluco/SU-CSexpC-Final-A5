### デバイス一覧
quartus_pgm -l

### コンパイルと書き込み
quartus_pgm -c "USB-Blaster[USB-0]" -m jtag -o "p;output_files/Interface_ver01_with_extboard.sof"

### コンパイル指定
set_global_assignment -name VERILOG_FILE xxx.v

### トップ指定
set_global_assignment -name TOP_LEVEL_ENTITY

---

## メモリ書き込み（In-System Memory Content Editor）

### 自動化されたメモリ書き込み

GUI（IMCE）で手動で行っていたメモリ書き込み作業を、Makefile + `quartus_stp` で自動化しました。

#### 基本的な使い方（推奨：設定ファイル方式）

**設定ファイルから一括書き込み**

すべてのメモリインスタンスの値を設定ファイルで管理し、一つのコマンドで書き込みます。

1. **設定ファイルを作成**

`tools/memory_config.cfg` を編集します：

```text
# Memory Configuration File
CLKD:0
RUNM:0
SRAM:test/mif/test_program1.mif
DISP:0
```

2. **書き込み実行**

```bash
make write-mem-config
```

または、別の設定ファイルを使用する場合：

```bash
make write-mem-config CONFIG_FILE=path/to/my_config.txt
```

**設定ファイルのフォーマット**

- 形式: `KEY:VALUE`
- `#` で始まる行はコメント
- 空行は無視される
- 必須キー: `CLKD`, `RUNM`, `SRAM`, `DISP`

**値の指定方法:**
- `CLKD`: 0-7（10進数）、または `0x0`-`0x7`（16進数）
- `RUNM`: 0-7（10進数）、または `0x0`-`0x7`（16進数）
- `SRAM`: MIFファイルのパス（設定ファイルからの相対パス、または絶対パス）
- `DISP`: 0-3（10進数）、または `0x0`-`0x3`（16進数）

**利用可能なメモリインスタンス**

| Index | Instance ID | Width | Depth | Type     | Mode       |
|-------|-------------|-------|-------|----------|------------|
| 0     | CLKD        | 3     | 1     | Constant | Read/Write |
| 1     | RUNM        | 3     | 1     | Constant | Read/Write |
| 2     | SRAM        | 16    | 65536 | RAM/ROM  | Read/Write |
| 3     | DISP        | 2     | 1     | Constant | Read/Write |

#### 完全なフロー（アセンブル → MIF生成 → メモリ書き込み）

```bash
# 1. アセンブルとMIF生成
make assemble-mif

# 2. FPGAをプログラム（必要に応じて）
make program

# 3. メモリに書き込み（設定ファイルを編集してから実行）
make write-mem-config
```

#### デバイス情報の確認

利用可能なハードウェアとデバイスを確認する場合：
```bash
cd tools
quartus_stp -t get_device_info.tcl
```

#### 手動実行（Tclスクリプト直接実行）

設定ファイル方式を使う場合：

```bash
cd tools
quartus_stp -t write_memory_config.tcl "USB-Blaster[USB-0]" "@1" "memory_config.cfg"
```

**引数の説明:**
- `hardware_name`: ハードウェア名（例: `USB-Blaster[USB-0]`）
- `device_name`: デバイス名（例: `@1` は最初のデバイス）
- `config_file`: 設定ファイルのパス（例: `memory_config.cfg`）

#### 設定の変更

`tools/Makefile` で以下の変数を変更できます：
- `CABLE`: ハードウェア名（デフォルト: `USB-Blaster[USB-0]`）
- `MEM_INSTANCE_CLKD`: CLKDインスタンスのインデックス（デフォルト: `0`）
- `MEM_INSTANCE_RUNM`: RUNMインスタンスのインデックス（デフォルト: `1`）
- `MEM_INSTANCE_SRAM`: SRAMインスタンスのインデックス（デフォルト: `2`）
- `MEM_INSTANCE_DISP`: DISPインスタンスのインデックス（デフォルト: `3`）

#### 注意事項

1. **FPGAがプログラム済みであること**: メモリに書き込む前に、FPGAに設計をプログラムしておく必要があります（`make program`を実行）。

2. **メモリが書き換え可能に設定されていること**: 設計でメモリが `ENABLE_RUNTIME_MOD=YES` と `INSTANCE_NAME` で設定されている必要があります（`ram01.vhd`で設定済み）。

3. **MIFファイルが存在すること**: 書き込み前にMIFファイルが生成されている必要があります（`make assemble-mif`を実行）。

4. **Quartusがハードウェアを認識していること**: USB-Blasterが正しく接続され、ドライバがインストールされている必要があります。 
