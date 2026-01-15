#!/usr/bin/tclsh
# ============================================================================
# Memory Write Script (robust) for Quartus In-System Memory Content Editor
#
# Usage:
#   quartus_stp -t write_memory_config.tcl <hardware_name> <device_name|@idx|idx|auto> <config_file>
#
# Your env (Quartus 20.1) provides:
#   begin_memory_edit, end_memory_edit, get_editable_mem_instances,
#   write_content_to_memory, update_content_to_memory_from_file
# ============================================================================

package require ::quartus::jtag
package require ::quartus::insystem_memory_edit

# -------------------------
# Memory instance indices (your design assumption)
# -------------------------
set MEM_INSTANCE_CLKD 0
set MEM_INSTANCE_RUNM 1
set MEM_INSTANCE_SRAM 2
set MEM_INSTANCE_DISP 3

# -------------------------
# utils
# -------------------------
proc die {msg {code 1}} {
    puts "ERROR: $msg"
    exit $code
}

proc warn {msg} { puts "WARNING: $msg" }

proc parse_int {s} {
    set t [string trim $s]
    if {[string match -nocase "0x*" $t]} {
        return [expr "0x[string range $t 2 end]"]
    }
    return [expr {int($t)}]
}

# 終了保証（セッション残り対策）
proc cleanup_memory_edit {} {
    catch { end_memory_edit } _
}

# device_spec を解釈して get_device_names の返り値から選ぶ
proc resolve_device_name {hardware_name device_spec} {
    set devs [get_device_names -hardware_name $hardware_name]
    if {[llength $devs] == 0} {
        die "No device found on hardware '$hardware_name'. Check cable/power/JTAG."
    }

    set spec [string trim $device_spec]
    if {$spec eq "" || [string equal -nocase $spec "auto"]} {
        return [lindex $devs 0]
    }

    # そのまま一致
    if {[lsearch -exact $devs $spec] >= 0} {
        return $spec
    }

    # @N / N を「N番目(1-indexed)」
    if {[string match "@*" $spec]} {
        set n [string range $spec 1 end]
    } else {
        set n $spec
    }

    if {[string is integer -strict $n]} {
        set idx [expr {$n - 1}]
        if {$idx < 0 || $idx >= [llength $devs]} {
            die "Device index '$n' is out of range. Available devices: $devs"
        }
        return [lindex $devs $idx]
    }

    die "Device spec '$device_spec' not found/invalid. Available devices: $devs"
}

# write single word helper (uses write_content_to_memory)
# Note: begin_memory_edit must be called before this function
proc write_word {instance_index value_int} {
    # Quartus 20.1: write_content_to_memory requires -content (string) and -word_count
    # Use address 0, 1 word. Value is provided as hexadecimal string.
    # After begin_memory_edit, hardware_name and device_name are not needed
    write_content_to_memory \
        -instance_index $instance_index \
        -start_address  0 \
        -word_count     1 \
        -content_in_hex \
        -content        [format "%X" $value_int]
}

# -------------------------
# args
# -------------------------
if {[llength $argv] != 3} {
    die "Invalid number of arguments.\nUsage: quartus_stp -t write_memory_config.tcl <hardware_name> <device_name|@idx|idx|auto> <config_file>"
}

lassign $argv hardware_name device_spec config_file

if {![file exists $config_file]} {
    die "Config file not found: $config_file"
}

puts "========================================="
puts "Memory Write Operation from Config File"
puts "========================================="
puts "Hardware Name: $hardware_name"
puts "Device Spec  : $device_spec"
puts "Config File  : $config_file"
puts "========================================="

# -------------------------
# read config
# -------------------------
puts "Reading config file..."
set config_data [dict create]

set fh [open $config_file r]
set line_number 0
while {[gets $fh line] >= 0} {
    incr line_number
    set line [string trim $line]
    if {$line eq "" || [string match "#*" $line]} {
        continue
    }
    if {[regexp {^([^:]+):(.+)$} $line -> key value]} {
        set key   [string toupper [string trim $key]]
        set value [string trim $value]
        dict set config_data $key $value
    } else {
        warn "Invalid format at line $line_number: $line (expected KEY:VALUE)"
    }
}
close $fh

set required_keys {CLKD RUNM SRAM DISP}
foreach k $required_keys {
    if {![dict exists $config_data $k]} {
        die "Required key '$k' not found in config file"
    }
}

puts "Config file parsed successfully:"
dict for {k v} $config_data { puts "  $k: $v" }

# -------------------------
# main (with guaranteed cleanup)
# -------------------------
set rc 0
cleanup_memory_edit
after 200

if {[catch {
    set final_device_name [resolve_device_name $hardware_name $device_spec]
    puts ""
    puts "Detected/Selected device: $final_device_name"

    puts "Getting editable memory instances..."
    set instances [get_editable_mem_instances -hardware_name $hardware_name -device_name $final_device_name]
    puts "Found [llength $instances] editable memory instance(s)"
    if {[llength $instances] <= $MEM_INSTANCE_DISP} {
        warn "Instance count is small. Your indices (0..3) may not match. Instances: $instances"
    }

    puts ""
    puts "Starting memory edit session..."
    begin_memory_edit -hardware_name $hardware_name -device_name $final_device_name
    puts "Memory edit session started successfully"

    set errors 0

    # 1/4 CLKD
    set clkd_value [dict get $config_data CLKD]
    set clkd_int   [parse_int $clkd_value]
    puts ""
    puts "========================================="
    puts "1/4 Writing to CLKD (Index $MEM_INSTANCE_CLKD)"
    puts "========================================="
    puts "Value: $clkd_value ($clkd_int)"
    if {[catch { write_word $MEM_INSTANCE_CLKD $clkd_int } r]} {
        puts "ERROR: Failed to write to CLKD: $r"
        incr errors
    } else {
        puts "OK: CLKD written successfully"
    }

    # 2/4 RUNM
    set runm_value [dict get $config_data RUNM]
    set runm_int   [parse_int $runm_value]
    puts ""
    puts "========================================="
    puts "2/4 Writing to RUNM (Index $MEM_INSTANCE_RUNM)"
    puts "========================================="
    puts "Value: $runm_value ($runm_int)"
    if {[catch { write_word $MEM_INSTANCE_RUNM $runm_int } r]} {
        puts "ERROR: Failed to write to RUNM: $r"
        incr errors
    } else {
        puts "OK: RUNM written successfully"
    }

    # 3/4 SRAM from file (MIF)
    set sram_file [dict get $config_data SRAM]
    puts ""
    puts "========================================="
    puts "3/4 Writing to SRAM (Index $MEM_INSTANCE_SRAM)"
    puts "========================================="
    puts "MIF File (raw): $sram_file"

    # resolve relative path (Tcl variant-safe)
    # config_file is in tools/, but MIF files are in SU-CSexpC-Final-A5/test/mif/
    # So we need to go up one level from config_dir (tools/) to SU-CSexpC-Final-A5/
    set config_dir [file dirname [file normalize $config_file]]
    if {[file pathtype $sram_file] ne "absolute"} {
        # Go up one level from tools/ to SU-CSexpC-Final-A5/
        set base_dir [file dirname $config_dir]
        set sram_file [file join $base_dir $sram_file]
    }
    set sram_file [file normalize $sram_file]
    puts "MIF File (resolved): $sram_file"

    if {![file exists $sram_file]} {
        puts "ERROR: MIF file not found: $sram_file"
        incr errors
    } else {
        if {[catch {
            # After begin_memory_edit, hardware_name and device_name are not needed
            update_content_to_memory_from_file \
                -instance_index $MEM_INSTANCE_SRAM \
                -mem_file_path  $sram_file \
                -mem_file_type  mif
        } r]} {
            puts "ERROR: Failed to write to SRAM: $r"
            incr errors
        } else {
            puts "OK: SRAM written successfully"
        }
    }

    # 4/4 DISP
    set disp_value [dict get $config_data DISP]
    set disp_int   [parse_int $disp_value]
    puts ""
    puts "========================================="
    puts "4/4 Writing to DISP (Index $MEM_INSTANCE_DISP)"
    puts "========================================="
    puts "Value: $disp_value ($disp_int)"
    if {[catch { write_word $MEM_INSTANCE_DISP $disp_int } r]} {
        puts "ERROR: Failed to write to DISP: $r"
        incr errors
    } else {
        puts "OK: DISP written successfully"
    }

    puts ""
    puts "========================================="
    if {$errors > 0} {
        puts "Memory write operation completed with $errors error(s)!"
        set ::rc 1
    } else {
        puts "Memory write operation completed successfully!"
        set ::rc 0
    }
    puts "========================================="

} err]} {
    puts "ERROR: $err"
    set rc 1
}

puts ""
puts "Ending memory edit session..."
cleanup_memory_edit
exit $rc
