################################################################################
# Script for debug that can use XMD and verify the SPI flash ID
# The board should be connected via a programming cable and powered prior to
# running this file.  This script file uses the default Xilinx installation path.
#
# This batch file is run from a command prompt at the Xapp_QUAD_SPI directory.
################################################################################
proc idcode {} {
	# Control register Reset FIFOs and SPI enable
	mwr 0x44A00060 0x1E6
	mwr 0x44A00068 0x9F
	mwr 0x44A00068 0x00
	mwr 0x44A00068 0x00
	# Slave select
	mwr 0x44A00070 0x00
	# Master Inhibit enable
	mwr 0x44A00060 0x086
	# Slave deselect
	mwr 0x44A00070 0x0f
	# Master Inhibit disable
	mwr 0x44A00060 0x186
	# read Data
	mrd 0x44A0006c
	mrd 0x44A0006c
	mrd 0x44A0006c
	#puts "Device ID x:\t[mrd 0x44A0006c]"
	#puts "Device ID x:\t[mrd 0x44A0006c]"
	#Control register Reset FIFOs and SPI enable
	mwr 0x44A00060 0x1FE
	mwr 0x44A00068 0x9F
	mwr 0x44A00068 0x00
	mwr 0x44A00068 0x00
	mwr 0x44A00068 0x00
	mwr 0x44A00068 0x00
	mwr 0x44A00068 0x00
	# Slave select
	mwr 0x44A00070 0x00
	# Master Inhibit enable
	mwr 0x44A00060 0x09e
	# Slave deselect
	mwr 0x44A00070 0x0f
	# Master Inhibit disable
	mwr 0x44A00060 0x19e
	# read Data
	mrd 0x44A0006c
	puts "Mfg ID:\t\t\t[mrd 0x44A0006c]"
	puts "Memory Type:\t[mrd 0x44A0006c]"
	puts "Memory Size:\t[mrd 0x44A0006c]"
	puts "Device ID 1:\t[mrd 0x44A0006c]"
}
