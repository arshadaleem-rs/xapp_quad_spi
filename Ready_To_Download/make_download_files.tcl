###############################################################################
# Vivado script to create golden.bin and update.bin
# programming files for the Xilinx KCU105 Evaluation Board
# This batch file uses the default Xilinx installation path
#
# This script is called from a command prompt using the make_download_files.bat
###############################################################################
exec C:/Xilinx/SDK/2016.1/bin/unwrapped/win64.o/updatemem.exe -force -meminfo design_1_wrapper.mmi -bit design_1_wrapper.bit -data quad_spi_rw.elf -proc design_1_i/microblaze_0 -out golden.bit

write_cfgmem -force -format BIN -size 32 -interface SPIx4 -loadbit "up 0x00000000 golden.bit" golden.bin
write_cfgmem -force -format BIN -size 32 -interface SPIx4 -loadbit "up 0x00000000 update.bit" update.bin


