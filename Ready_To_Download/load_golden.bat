REM ################################################################################
REM # Vivado Device Programmer batch file to program a SPI flash on the KCU105 board
REM # The board should be connected via a programming cable and powered prior to
REM # running this file.  This batch file uses the default Xilinx installation path
REM #
REM # This batch file is run from a command prompt at the Xapp_QUAD_SPI directory.
REM # (Refer to Xapp1233 for additional indirect programming details)
REM ################################################################################
call C:\\Xilinx\\Vivado\\2016.1\\.\\bin\\vivado.bat -mode batch -source load_golden.tcl
if exist *isWriteableTest*.tmp del /F *isWriteableTest*.tmp
if exist vivado_*.backup.jou del /F vivado_*.backup.jou
if exist vivado_*.backup.log del /F vivado_*.backup.log
if exist vivado_*.str del /F vivado_*.str
if exist *isWriteableTest*.tmp del /F *isWriteableTest*.tmp
pause
