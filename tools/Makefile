SHELL := /bin/bash

# ========================
# path
# ========================
WORK_ROOT    := $(abspath $(CURDIR))
PROJECT_ROOT := $(abspath $(CURDIR)/../..)

# ========================
# Quartus
# ========================
QUARTUS_BIN := /mnt/c/intelFPGA_lite/20.1/quartus/bin64
QSH  := $(QUARTUS_BIN)/quartus_sh.exe
QPGM := $(QUARTUS_BIN)/quartus_pgm.exe

# ========================
# Project
# ========================
PROJECT := Interface_ver01_with_extboard
CABLE   := USB-Blaster[USB-0]

SOF     := $(PROJECT_ROOT)/output_files/$(PROJECT).sof
SOF_WIN := $(shell wslpath -w "$(SOF)")

.PHONY: all gen build program clean

# ========================
# pretty log
# ========================
COLOR_RESET := \033[0m
COLOR_STEP  := \033[35m
COLOR_OK    := \033[32m
COLOR_ERR   := \033[31m
COLOR_INFO  := \033[36m

define STEP
	@echo -e "$(COLOR_STEP)========== $1 ==========$(COLOR_RESET)"
endef

define OK
	@echo -e "$(COLOR_OK)[OK] $1$(COLOR_RESET)"
endef

define ERR
	@echo -e "$(COLOR_ERR)[ERROR] $1$(COLOR_RESET)"
endef

define INFO
	@echo -e "$(COLOR_INFO)$1$(COLOR_RESET)"
endef

# ========================
# default
# ========================
all:
	$(call STEP,"FPGA FLOW START")
	@START=$$(date +%s); \
	$(MAKE) gen && \
	$(MAKE) build && \
	$(MAKE) program; \
	END=$$(date +%s); \
	echo -e "$(COLOR_OK)========== ALL DONE ($$((END-START)) sec) ==========$(COLOR_RESET)"

# ========================
# generate src_files.tcl
# ========================
gen:
	$(call STEP,"Generate src_files.tcl")
	cd "$(PROJECT_ROOT)" && bash "$(WORK_ROOT)/gen_src_files.sh"
	$(call OK,"src_files.tcl generated")

# ========================
# build
# ========================
build:
	$(call STEP,"Quartus Compile")
	cd "$(PROJECT_ROOT)" && "$(QSH)" --flow compile "$(PROJECT)"
	$(call OK,"Quartus compile finished")

# ========================
# program FPGA
# ========================
program:
	$(call STEP,"FPGA Programming")
	@if [ ! -f "$(SOF)" ]; then \
		$(call ERR,"SOF not found: $(SOF)"); \
		exit 1; \
	fi
	$(call INFO,"Using SOF: $(SOF)")
	cd "$(PROJECT_ROOT)" && "$(QPGM)" -c "$(CABLE)" -m jtag -o "p;$(SOF_WIN)"
	$(call OK,"FPGA programming completed")

# ========================
# clean
# ========================
clean:
	$(call STEP,"Clean Artifacts")
	rm -rf \
		"$(PROJECT_ROOT)/db" \
		"$(PROJECT_ROOT)/incremental_db" \
		"$(PROJECT_ROOT)/output_files"
	$(call OK,"Clean completed")
