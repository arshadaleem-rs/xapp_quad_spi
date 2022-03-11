##############################################################################
# Vivado script to program a SPI flash on KCU105 Xilinx Evaluation Board
# The board should be connected via a programming cable and powered prior to
# running this script. The programming file is specified by the variable
# "programming_files" in this example
#
# This script is called from a Vivado command prompt using the load_golden.bat
# (Refer to Xapp1233 for additional indirect programming detail)
##############################################################################
open_hw
connect_hw_server -url localhost:3121
current_hw_target [get_hw_targets]
open_hw_target
# Setup for the current Xilinx FPGA device and flash memory on the KCU105. 
set my_mem_device [lindex [get_cfgmem_parts {n25q256-1.8v-spi-x1_x2_x4}] 0]
# Set a variable to point the to BIN file to program
set programming_files {golden.bin}
# Create a hardware configuration memory object and associate it with the
# hardware device. Also, set a variable with which to point to this object
set my_hw_cfgmem [create_hw_cfgmem -hw_device \
[lindex [get_hw_devices] 0] -mem_dev $my_mem_device]
# Set the address range used for erasing to the size of the programming file
set_property PROGRAM.ADDRESS_RANGE {entire_device} $my_hw_cfgmem
# Set the programming file to program into the SPI flash
set_property PROGRAM.FILES $programming_files $my_hw_cfgmem
# Set the termination of unused pins when programming the SPI flash
set_property PROGRAM.UNUSED_PIN_TERMINATION {pull-none} $my_hw_cfgmem
# Configure the hardware device with the programming bitstream
program_hw_devices [lindex [get_hw_devices] 0]
# Set programming options
# Perform erase, program and verify
set_property PROGRAM.ERASE 1 $my_hw_cfgmem
set_property PROGRAM.CFG_PROGRAM 1 $my_hw_cfgmem
#set_property PROGRAM.VERIFY 1 $my_hw_cfgmem
# Program the part
program_hw_cfgmem -hw_cfgmem $my_hw_cfgmem
boot_hw_device  [lindex [get_hw_devices] 0]