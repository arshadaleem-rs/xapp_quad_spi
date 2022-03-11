REM ################################################################################
REM # Vivado Device Programmer batch file to create update.bin and golden.bin 
REM # programming files for the Xilinx KCU105 Evaluation Board
REM # This batch file uses the default Xilinx installation path
REM #
REM # This batch file is run from a command prompt at the Xapp_QUAD_SPI directory.
REM ################################################################################
copy ..\project_1\project_1.runs\impl_1\debug_nets.ltx golden_nets.ltx
copy ..\project_1\project_1.sdk\design_1_wrapper_hw_platform_0\design_1_wrapper.bit
copy ..\project_1\project_1.sdk\design_1_wrapper_hw_platform_0\design_1_wrapper.mmi
copy ..\project_1\project_1.sdk\quad_spi_rw\Debug\quad_spi_rw.elf  


call C:\\Xilinx\\Vivado\\2016.1\\.\\bin\\vivado.bat -mode batch -source make_download_files.tcl


if exist *isWriteableTest*.tmp del /F *isWriteableTest*.tmp
if exist vivado_*.backup.jou del /F vivado_*.backup.jou
if exist vivado_*.backup.log del /F vivado_*.backup.log
if exist vivado_*.str del /F vivado_*.str
if exist *isWriteableTest*.tmp del /F *isWriteableTest*.tmp
pause
