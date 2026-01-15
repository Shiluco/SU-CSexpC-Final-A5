#!/usr/bin/tclsh
# ============================================================================
# Memory Write Script from Config File for Quartus In-System Memory Content Editor
# ============================================================================
# This script reads a config file and writes values to FPGA memory
# Usage: quartus_stp -t write_memory_config.tcl <hardware_name> <device_name> <config_file>
# ============================================================================

package require ::quartus::insystem_memory_edit

# Memory instance indices
set MEM_INSTANCE_CLKD 0
set MEM_INSTANCE_RUNM 1
set MEM_INSTANCE_SRAM 2
set MEM_INSTANCE_DISP 3

# Get command line arguments
if { [llength $argv] != 3 } {
    puts "ERROR: Invalid number of arguments"
    puts "Usage: quartus_stp -t write_memory_config.tcl <hardware_name> <device_name> <config_file>"
    exit 1
}

lassign $argv hardware_name device_name config_file

# Check if config file exists
if { ![file exists $config_file] } {
    puts "ERROR: Config file not found: $config_file"
    exit 1
}

puts "========================================="
puts "Memory Write Operation from Config File"
puts "========================================="
puts "Hardware Name: $hardware_name"
puts "Device Name: $device_name"
puts "Config File: $config_file"
puts "========================================="

# Read and parse config file
puts "Reading config file..."
set config_data [dict create]
set file_handle [open $config_file r]
set line_number 0

while { [gets $file_handle line] >= 0 } {
    incr line_number
    set line [string trim $line]
    
    # Skip empty lines and comments
    if { $line eq "" || [string match "#*" $line] } {
        continue
    }
    
    # Parse key:value format
    if { [regexp {^([^:]+):(.+)$} $line -> key value] } {
        set key [string trim $key]
        set value [string trim $value]
        dict set config_data [string toupper $key] $value
    } else {
        puts "WARNING: Invalid format at line $line_number: $line (expected KEY:VALUE)"
    }
}
close $file_handle

# Check required keys
set required_keys {CLKD RUNM SRAM DISP}
foreach key $required_keys {
    if { ![dict exists $config_data $key] } {
        puts "ERROR: Required key '$key' not found in config file"
        exit 1
    }
}

puts "Config file parsed successfully:"
dict for {key value} $config_data {
    puts "  $key: $value"
}

# Begin memory edit session
puts ""
puts "Starting memory edit session..."

# Try to begin memory edit with device name as-is first
if { [catch {begin_memory_edit -hardware_name $hardware_name -device_name $device_name} result] } {
    puts "WARNING: Failed with device name '$device_name': $result"
    puts ""
    puts "Trying alternative device name format..."
    
    # Try with just the index number
    set device_index [string map {"@" ""} $device_name]
    if { [catch {begin_memory_edit -hardware_name $hardware_name -device_name $device_index} result2] } {
        puts "ERROR: Failed to begin memory edit session with both formats"
        puts "  Device name '$device_name': $result"
        puts "  Device index '$device_index': $result2"
        puts ""
        puts "Troubleshooting:"
        puts "  1. Make sure FPGA is connected via USB-Blaster"
        puts "  2. Check if USB-Blaster drivers are installed"
        puts "  3. Make sure FPGA is powered on"
        puts "  4. Make sure FPGA has been programmed with the design (run 'make program')"
        puts "  5. Try using device name from 'make list-devices' output"
        exit 1
    } else {
        set device_name $device_index
        puts "Successfully connected using device index: $device_name"
    }
} else {
    puts "Successfully connected using device name: $device_name"
}

puts "Memory edit session started successfully"

# Get editable memory instances (for verification)
puts "Getting editable memory instances..."
if { [catch {get_editable_mem_instances -hardware_name $hardware_name -device_name $device_name} instances] } {
    puts "WARNING: Failed to get editable memory instances: $instances"
    puts "Continuing anyway..."
} else {
    puts "Found [llength $instances] editable memory instance(s)"
}

set errors 0

# Write to CLKD
set clkd_value [dict get $config_data CLKD]
puts ""
puts "========================================="
puts "[1/4] Writing to CLKD (Index $MEM_INSTANCE_CLKD)"
puts "========================================="
puts "Value: $clkd_value"

# Parse value (support hex with 0x prefix or decimal)
set clkd_int 0
if { [string match "0x*" $clkd_value] || [string match "0X*" $clkd_value] } {
    set clkd_int [expr "0x[string range $clkd_value 2 end]"]
} else {
    set clkd_int [expr {int($clkd_value)}]
}

if { [catch {
    update_content_to_memory_from_memory_data \
        -hardware_name $hardware_name \
        -device_name $device_name \
        -instance_index $MEM_INSTANCE_CLKD \
        -start_address 0 \
        -memory_data [list $clkd_int]
} result] } {
    puts "ERROR: Failed to write to CLKD: $result"
    incr errors
} else {
    puts "OK: CLKD written successfully"
}

# Write to RUNM
set runm_value [dict get $config_data RUNM]
puts ""
puts "========================================="
puts "[2/4] Writing to RUNM (Index $MEM_INSTANCE_RUNM)"
puts "========================================="
puts "Value: $runm_value"

# Parse value
set runm_int 0
if { [string match "0x*" $runm_value] || [string match "0X*" $runm_value] } {
    set runm_int [expr "0x[string range $runm_value 2 end]"]
} else {
    set runm_int [expr {int($runm_value)}]
}

if { [catch {
    update_content_to_memory_from_memory_data \
        -hardware_name $hardware_name \
        -device_name $device_name \
        -instance_index $MEM_INSTANCE_RUNM \
        -start_address 0 \
        -memory_data [list $runm_int]
} result] } {
    puts "ERROR: Failed to write to RUNM: $result"
    incr errors
} else {
    puts "OK: RUNM written successfully"
}

# Write to SRAM from file
set sram_file [dict get $config_data SRAM]
puts ""
puts "========================================="
puts "[3/4] Writing to SRAM (Index $MEM_INSTANCE_SRAM)"
puts "========================================="
puts "MIF File: $sram_file"

# Check if MIF file exists (resolve relative to config file directory)
set config_dir [file dirname [file normalize $config_file]]
if { ![file isabsolute $sram_file] } {
    set sram_file [file join $config_dir $sram_file]
}
set sram_file [file normalize $sram_file]

if { ![file exists $sram_file] } {
    puts "ERROR: MIF file not found: $sram_file"
    incr errors
} else {
    if { [catch {
        update_content_to_memory_from_file \
            -hardware_name $hardware_name \
            -device_name $device_name \
            -instance_index $MEM_INSTANCE_SRAM \
            -mem_file_path $sram_file \
            -mem_file_type mif
    } result] } {
        puts "ERROR: Failed to write to SRAM: $result"
        incr errors
    } else {
        puts "OK: SRAM written successfully"
    }
}

# Write to DISP
set disp_value [dict get $config_data DISP]
puts ""
puts "========================================="
puts "[4/4] Writing to DISP (Index $MEM_INSTANCE_DISP)"
puts "========================================="
puts "Value: $disp_value"

# Parse value
set disp_int 0
if { [string match "0x*" $disp_value] || [string match "0X*" $disp_value] } {
    set disp_int [expr "0x[string range $disp_value 2 end]"]
} else {
    set disp_int [expr {int($disp_value)}]
}

if { [catch {
    update_content_to_memory_from_memory_data \
        -hardware_name $hardware_name \
        -device_name $device_name \
        -instance_index $MEM_INSTANCE_DISP \
        -start_address 0 \
        -memory_data [list $disp_int]
} result] } {
    puts "ERROR: Failed to write to DISP: $result"
    incr errors
} else {
    puts "OK: DISP written successfully"
}

# End memory edit session
puts ""
puts "Ending memory edit session..."
if { [catch {end_memory_edit -hardware_name $hardware_name -device_name $device_name} result] } {
    puts "WARNING: Failed to end memory edit session: $result"
}

puts ""
puts "========================================="
if { $errors > 0 } {
    puts "Memory write operation completed with $errors error(s)!"
    exit 1
} else {
    puts "Memory write operation completed successfully!"
}
puts "========================================="
exit 0

