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
QSTP := $(QUARTUS_BIN)/quartus_stp.exe

# ========================
# Project
# ========================
PROJECT := Interface_ver01_with_extboard
CABLE   := USB-Blaster [USB-0]
DEVICE  := EP4CE115F29C7

# Memory instance indices
MEM_INSTANCE_CLKD := 0  # CLKD: Width=3, Depth=1, Constant, Read/Write
MEM_INSTANCE_RUNM := 1  # RUNM: Width=3, Depth=1, Constant, Read/Write
MEM_INSTANCE_SRAM := 2  # SRAM: Width=16, Depth=65536, RAM/ROM, Read/Write
MEM_INSTANCE_DISP := 3  # DISP: Width=2, Depth=1, Constant, Read/Write

# Memory config file
MEM_CONFIG_FILE := $(WORK_ROOT)/memory_config.cfg

SOF     := $(PROJECT_ROOT)/output_files/$(PROJECT).sof
SOF_WIN := $(shell wslpath -w "$(SOF)")

.PHONY: all gen build program clean assemble mif assemble-mif write-mem-config list-devices run

# ========================
# Assembler
# ========================
SU_ROOT := $(abspath $(CURDIR)/..)
ASM_DIR := $(SU_ROOT)/test/asm
BIN_DIR := $(SU_ROOT)/test/bin
MIF_DIR := $(SU_ROOT)/test/mif
JAR_FILE := $(WORK_ROOT)/sep3asm.jar
BIN2MIF_SCRIPT := $(WORK_ROOT)/bin2mif.sh
ASM_FILES := $(wildcard $(ASM_DIR)/*.asm)
BIN_FILES := $(patsubst $(ASM_DIR)/%.asm,$(BIN_DIR)/%.bin,$(ASM_FILES))
MIF_FILES := $(patsubst $(ASM_DIR)/%.asm,$(MIF_DIR)/%.mif,$(ASM_FILES))

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
# run (compile + program + write memory)
# ========================
run:
	$(call STEP,"FPGA FLOW WITH MEMORY WRITE")
	@START=$$(date +%s); \
	$(MAKE) gen && \
	$(MAKE) build && \
	$(MAKE) program && \
	$(MAKE) write-mem-config; \
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
# assemble
# ========================
assemble:
	$(call STEP,"Assemble ASM files")
	@mkdir -p "$(BIN_DIR)"
	@for asm_file in $(ASM_FILES); do \
		asm_basename=$$(basename "$$asm_file" .asm); \
		bin_file="$(BIN_DIR)/$$asm_basename.bin"; \
		echo -e "$(COLOR_INFO)Assembling: $$asm_basename.asm$(COLOR_RESET)"; \
		cd "$(SU_ROOT)/test" && \
		java -jar "$(JAR_FILE)" "asm/$$asm_basename.asm" "bin/$$asm_basename.bin" 2>&1 | grep -v "%%% 問題箇所はありません。" > "bin/$$asm_basename.bin"; \
	done
	$(call OK,"Assemble completed")

# ========================
# generate MIF files
# ========================
mif:
	$(call STEP,"Generate MIF files")
	@mkdir -p "$(MIF_DIR)"
	@for bin_file in $(BIN_FILES); do \
		if [ -f "$$bin_file" ]; then \
			bin_basename=$$(basename "$$bin_file" .bin); \
			mif_file="$(MIF_DIR)/$$bin_basename.mif"; \
			echo -e "$(COLOR_INFO)Converting: $$bin_basename.bin -> $$bin_basename.mif$(COLOR_RESET)"; \
			bash "$(BIN2MIF_SCRIPT)" "$$bin_file" > "$$mif_file"; \
			if [ $$? -eq 0 ] && [ -f "$$mif_file" ]; then \
				echo -e "$(COLOR_OK)[OK] $$bin_basename.mif generated$(COLOR_RESET)"; \
			else \
				echo -e "$(COLOR_ERR)[ERROR] Failed to convert $$bin_basename.bin$(COLOR_RESET)"; \
			fi; \
		fi; \
	done
	$(call OK,"MIF generation completed")

# ========================
# assemble and generate MIF
# ========================
assemble-mif: assemble mif
	$(call OK,"Assemble and MIF generation completed")

# ========================
# write memory to FPGA
# ========================
# Write to all memory instances from config file
# Usage: make write-mem-config [CONFIG_FILE=path/to/config.txt]
# Reads CLKD, RUNM, SRAM (file), DISP from config file and writes to FPGA
write-mem-config:
	$(call STEP,"Write Memory to FPGA from Config File")
	@config_file="$(MEM_CONFIG_FILE)"; \
	if [ -n "$(CONFIG_FILE)" ]; then \
		config_file="$(CONFIG_FILE)"; \
	fi; \
	if [ ! -f "$$config_file" ]; then \
		$(call ERR,"Config file not found: $$config_file"); \
		$(call INFO,"Please create a config file or use CONFIG_FILE=path/to/config.txt"); \
		$(call INFO,"Please edit $(MEM_CONFIG_FILE) to configure memory settings"); \
		exit 1; \
	fi; \
	$(call INFO,"Using config file: $$config_file"); \
	config_file_win="$$(wslpath -m "$$config_file")"; \
	cd "$(PROJECT_ROOT)" && \
		"$(QSTP)" -t "$(shell wslpath -m "$(WORK_ROOT)/write_memory_config.tcl")" \
			"$(CABLE)" \
			"auto" \
			"$$config_file_win" || { \
		echo -e "$(COLOR_ERR)[ERROR] Memory write failed$(COLOR_RESET)"; \
		exit 1; }
	$(call OK,"Memory write from config file completed")


# List available hardware and devices
# Usage: make list-devices
list-devices:
	$(call STEP,"List Available Hardware and Devices")
	"$(QPGM)" -l

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
