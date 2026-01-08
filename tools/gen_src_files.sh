#!/usr/bin/env bash
set -euo pipefail

# このスクリプトの位置: SU-CSexpC-Final-A5/tools/gen_src_files.sh を想定
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"           # .../SU-CSexpC-Final-A5
PROJECT_ROOT="$(cd "$ROOT/.." && pwd)"                           # Quartus .qsf がある想定のプロジェクトルート

# Quartusプロジェクトルートから見た SU-CSexpC-Final-A5 の相対パス（通常は "SU-CSexpC-Final-A5"）
ROOT_REL="$(realpath --relative-to="$PROJECT_ROOT" "$ROOT")"

SRC_DIR="$ROOT/src"
OUT="$ROOT/tools/src_files.tcl"

if [ ! -d "$SRC_DIR" ]; then
  echo "src directory not found: $SRC_DIR" >&2
  exit 1
fi

{
  echo "# Auto-generated. Do not edit."
  echo "# Generated at: $(date '+%Y-%m-%d %H:%M:%S')"
  echo

  while IFS= read -r -d '' f; do
    # SU-CSexpC-Final-A5 から見た相対パス (例: src/TOP.v)
    rel_in_root="$(realpath --relative-to="$ROOT" "$f")"
    # Quartusプロジェクトルートから見た相対パス (例: SU-CSexpC-Final-A5/src/TOP.v)
    rel="${ROOT_REL}/${rel_in_root}"

    case "${f##*.}" in
      v)    echo "set_global_assignment -name VERILOG_FILE \"${rel}\"" ;;
      sv)   echo "set_global_assignment -name SYSTEMVERILOG_FILE \"${rel}\"" ;;
      vhd)  echo "set_global_assignment -name VHDL_FILE \"${rel}\"" ;;
      vhdl) echo "set_global_assignment -name VHDL_FILE \"${rel}\"" ;;
    esac
  done < <(find "$SRC_DIR" -type f \( -name '*.v' -o -name '*.sv' -o -name '*.vhd' -o -name '*.vhdl' \) -print0 | sort -z)
} > "$OUT"

echo "Generated: $OUT"
