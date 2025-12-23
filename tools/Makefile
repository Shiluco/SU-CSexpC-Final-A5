SHELL := /bin/bash

# tools/ から見た「作業用ディレクトリ」と「Quartusプロジェクトルート」
WORK_ROOT    := $(abspath $(CURDIR)/..)
PROJECT_ROOT := $(abspath $(CURDIR)/../..)

QUARTUS_BIN := /mnt/c/intelFPGA_lite/20.1/quartus/bin64
QSH  := $(QUARTUS_BIN)/quartus_sh.exe
QPGM := $(QUARTUS_BIN)/quartus_pgm.exe

PROJECT := sep5_top
SOF := $(PROJECT_ROOT)/output_files/$(PROJECT).sof
CABLE := USB-Blaster[USB-0]

.PHONY: all gen build program clean
all: gen build program

gen:
	cd "$(PROJECT_ROOT)" && bash "$(WORK_ROOT)/tools/gen_src_files.sh"

build:
	cd "$(PROJECT_ROOT)" && "$(QSH)" --flow compile "$(PROJECT)"

program:
	cd "$(PROJECT_ROOT)" && "$(QPGM)" -c "$(CABLE)" -m jtag -o "p;$(SOF)"

clean:
	rm -rf "$(PROJECT_ROOT)/db" "$(PROJECT_ROOT)/incremental_db" "$(PROJECT_ROOT)/output_files"
