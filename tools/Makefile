SHELL := /bin/bash

# tools/ から見たパス
WORK_ROOT    := $(abspath $(CURDIR))
PROJECT_ROOT := $(abspath $(CURDIR)/../..)

# Quartus
QUARTUS_BIN := /mnt/c/intelFPGA_lite/20.1/quartus/bin64
QSH  := $(QUARTUS_BIN)/quartus_sh.exe
QPGM := $(QUARTUS_BIN)/quartus_pgm.exe

# Project
PROJECT := Interface_ver01_with_extboard
CABLE   := USB-Blaster[USB-0]

# SOF
SOF     := $(PROJECT_ROOT)/output_files/$(PROJECT).sof
SOF_WIN := $(shell wslpath -w "$(SOF)")

.PHONY: all gen build program clean

# ========================
# default
# ========================
all: gen build program

# ========================
# generate src_files.tcl
# ========================
gen:
	cd "$(PROJECT_ROOT)" && bash "$(WORK_ROOT)/gen_src_files.sh"

# ========================
# build
# ========================
build:
	cd "$(PROJECT_ROOT)" && "$(QSH)" --flow compile "$(PROJECT)"

# ========================
# program FPGA
# ========================
program:
	@if [ ! -f "$(SOF)" ]; then \
		echo "ERROR: $(SOF) not found. Run make build first."; \
		exit 1; \
	fi
	cd "$(PROJECT_ROOT)" && "$(QPGM)" -c "$(CABLE)" -m jtag -o "p;$(SOF_WIN)"

# ========================
# clean
# ========================
clean:
	rm -rf \
		"$(PROJECT_ROOT)/db" \
		"$(PROJECT_ROOT)/incremental_db" \
		"$(PROJECT_ROOT)/output_files"
