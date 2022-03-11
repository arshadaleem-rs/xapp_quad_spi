################################################################################
# Script file for debug using Vivado Device Programmer to get the SPI Flash ID
# The board should be connected via a programming cable and powered prior to
# running this file.  This batch file uses the default Xilinx installation path
#
# This batch file is run from a command prompt at the Xapp_QUAD_SPI directory.
################################################################################
reset_hw_axi [get_hw_axis hw_axi_1]
set qspi_BaseAddress 0x44A00000
set SPIDGIER	0x1C
set SPIIPISR	0x20
set SPIIPIER	0x28
set SPISRR		0x40
set SPICR		0x60
set SPISR		0x64
set SPIDTR 		0x68
set	SPIDRR		0x6C
set SPISSR		0x70
set SPITFOR		0x74
set SPIRFOR		0x78

set qspi_write_txn {}
set qspi_idcode_dt qspi_idcode_dt

create_hw_axi_txn qspi_write_txn[0] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPICR] ] -data {000001E6} -len 1 -type write

create_hw_axi_txn qspi_write_txn[1] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPIDTR] ] -data {0000009F} -len 1 -type write

create_hw_axi_txn qspi_write_txn[2] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPIDTR] ] -data {00000000} -len 1 -type write
create_hw_axi_txn qspi_write_txn[3] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPIDTR] ] -data {00000000} -len 1 -type write

create_hw_axi_txn qspi_write_txn[4] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPISSR] ] -data {00000000} -len 1 -type write

create_hw_axi_txn qspi_write_txn[5] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPICR] ] -data {00000086} -len 1 -type write

create_hw_axi_txn qspi_write_txn[6] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPISSR] ] -data {0000000F} -len 1 -type write

create_hw_axi_txn qspi_write_txn[7] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPICR] ] -data {00000186} -len 1 -type write

create_hw_axi_txn qspi_write_txn[8] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPICR] ] -data {000001FE} -len 1 -type write

create_hw_axi_txn qspi_write_txn[9] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPIDTR] ] -data {0000009F} -len 1 -type write

create_hw_axi_txn qspi_write_txn[10] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPIDTR] ] -data {00000000} -len 1 -type write

create_hw_axi_txn qspi_write_txn[11] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPIDTR] ] -data {00000000} -len 1 -type write

create_hw_axi_txn qspi_write_txn[12] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPIDTR] ] -data {00000000} -len 1 -type write

create_hw_axi_txn qspi_write_txn[13] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPIDTR] ] -data {00000000} -len 1 -type write

create_hw_axi_txn qspi_write_txn[14] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPIDTR] ] -data {00000000} -len 1 -type write

create_hw_axi_txn qspi_write_txn[15] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPISSR] ] -data {00000000} -len 1 -type write

create_hw_axi_txn qspi_write_txn[16] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPICR] ] -data {0000009E} -len 1 -type write

create_hw_axi_txn qspi_write_txn[17] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPISSR] ] -data {0000000F} -len 1 -type write

create_hw_axi_txn qspi_write_txn[18] [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPICR] ] -data {0000019E} -len 1 -type write

create_hw_axi_txn rd_txn_0 [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPIDRR] ] -len 3 -type read

create_hw_axi_txn rd_txn_1 [lindex [get_hw_axis] 0] -address [format %08x [expr $qspi_BaseAddress + $SPIDRR] ] -len 5 -type read

for {set j 0} {$j < 8} {incr j} { 

		run_hw_axi [get_hw_axi_txns qspi_write_txn[$j]]
		set wr_report [report_hw_axi_txn qspi_write_txn[$j] -w 32]
		puts $wr_report
	}

run_hw_axi [get_hw_axi_txns rd_txn_0]
set rd_report [report_hw_axi_txn rd_txn_0 -w 32]
puts $rd_report
		
for { set j 8} {$j < 19} {incr j} { 

		run_hw_axi [get_hw_axi_txns qspi_write_txn[$j]]
		set wr_report [report_hw_axi_txn qspi_write_txn[$j] -w 32]
		puts $wr_report
	}
run_hw_axi [get_hw_axi_txns rd_txn_1]
set rd_report [report_hw_axi_txn rd_txn_1 -w 32]
puts $rd_report

delete_hw_axi_txn [get_hw_axi_txns *]
