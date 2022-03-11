REM ################################################################################
REM # Vivado batch file to create the Xapp1280 reference design project.
REM # This batch file uses the default Xilinx installation path.
REM #
REM # This batch file is run from a command prompt at the Xapp_QUAD_SPI directory.
REM ################################################################################
call C:\\Xilinx\\Vivado\\2016.1\\.\\bin\\vivado.bat -mode batch -source run_kcu105.tcl
del *.jou
del *.log
pause

