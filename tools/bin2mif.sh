#!/bin/sh
# bin2mif
# usage: ./bin2mif input.txt > output.mif
#
# input format example:
#   0000F840: 47E7 ; comment
#   0000F841: F9B0 ;

WIDTH=16
DEPTH=65536

cat <<EOF
WIDTH=$WIDTH;
DEPTH=$DEPTH;
ADDRESS_RADIX=HEX;
DATA_RADIX=HEX;

CONTENT BEGIN
EOF

awk '
/^[0-9A-Fa-f]+:/ {
    split($1, a, ":")
    addr = a[1]
    data = $2
    printf("  %s : %s;\n", addr, data)
}
' "$1"

cat <<EOF
END;
EOF
