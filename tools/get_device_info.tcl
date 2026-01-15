#!/usr/bin/tclsh
# ============================================================================
# Device Information Script for Quartus
# ============================================================================
# This script lists available hardware and devices for memory programming
# Usage: quartus_stp -t get_device_info.tcl [hardware_name]
# ============================================================================

package require ::quartus::device

# Function to get hardware names
proc get_hardware_names {} {
    set hardware_list {}
    if { [catch {::quartus::device::get_hardware_names} result] } {
        return $result
    }
    return [::quartus::device::get_hardware_names]
}

# Function to get device names for a hardware
proc get_device_names {hardware_name} {
    if { [catch {::quartus::device::get_device_names -hardware_name $hardware_name} result] } {
        return $result
    }
    return [::quartus::device::get_device_names -hardware_name $hardware_name]
}

puts "========================================="
puts "Available Hardware and Devices"
puts "========================================="

# Get hardware names
if { [catch {set hardware_list [get_hardware_names]} result] } {
    puts "ERROR: Failed to get hardware names: $result"
    puts "Make sure FPGA is connected and drivers are installed"
    exit 1
}

if { [llength $hardware_list] == 0 } {
    puts "WARNING: No hardware found"
    puts "Please check:"
    puts "  1. FPGA is connected via USB-Blaster"
    puts "  2. USB-Blaster drivers are installed"
    puts "  3. Hardware is powered on"
    exit 1
}

# List all hardware and devices
foreach hardware $hardware_list {
    puts "\nHardware: $hardware"
    
    # Get device names for this hardware
    if { [catch {set device_list [get_device_names $hardware]} result] } {
        puts "  ERROR: Failed to get devices: $result"
        continue
    }
    
    if { [llength $device_list] == 0 } {
        puts "  No devices found"
        continue
    }
    
    set index 0
    foreach device $device_list {
        puts "  Device [$index]: $device"
        incr index
    }
}

puts "\n========================================="
puts "Usage in Makefile:"
puts "  Hardware: Use the hardware name from above"
puts "  Device: Use '@0', '@1', etc. or device name"
puts "========================================="

exit 0

