#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
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
    rel="${f#$ROOT/}"
    case "${f##*.}" in
      v)    echo "set_global_assignment -name VERILOG_FILE $rel" ;;
      sv)   echo "set_global_assignment -name SYSTEMVERILOG_FILE $rel" ;;
      vhd)  echo "set_global_assignment -name VHDL_FILE $rel" ;;
      vhdl) echo "set_global_assignment -name VHDL_FILE $rel" ;;
    esac
  done < <(find "$SRC_DIR" -type f \( -name '*.v' -o -name '*.sv' -o -name '*.vhd' -o -name '*.vhdl' \) -print0 | sort -z)
} > "$OUT"

echo "Generated: $OUT"
