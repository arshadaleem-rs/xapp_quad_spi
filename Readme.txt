*************************************************************************
   ____  ____ 
  /   /\/   / 
 /___/  \  /   
 \   \   \/    © Copyright 2016 Xilinx, Inc. All rights reserved.
  \   \        This file contains confidential and proprietary 
  /   /        information of Xilinx, Inc. and is protected under U.S. 
 /___/   /\    and international copyright and other intellectual 
 \   \  /  \   property laws. 
  \___\/\___\ 
 
*************************************************************************

Vendor: Xilinx 
Current readme.txt Version: 1.1
Date Last Modified:  2JUN2016
Date Created: 5APR2016

Associated Filename: xapp1280-us-post-cnfg-flash-startupe3.zip
Associated Document: XAPP1280, UltraScale FPGA Post-Configuration Access 
		     of SPI Memory using STARTUPE3

Supported Device(s): UltraScale FPGAs
   
*************************************************************************

Disclaimer: 

      This disclaimer is not a license and does not grant any rights to 
      the materials distributed herewith. Except as otherwise provided in 
      a valid license issued to you by Xilinx, and to the maximum extent 
      permitted by applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE 
      "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL 
      WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
      INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, 
      NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and 
      (2) Xilinx shall not be liable (whether in contract or tort, 
      including negligence, or under any other theory of liability) for 
      any loss or damage of any kind or nature related to, arising under 
      or in connection with these materials, including for any direct, or 
      any indirect, special, incidental, or consequential loss or damage 
      (including loss of data, profits, goodwill, or any type of loss or 
      damage suffered as a result of any action brought by a third party) 
      even if such damage or loss was reasonably foreseeable or Xilinx 
      had been advised of the possibility of the same.

Critical Applications:

      Xilinx products are not designed or intended to be fail-safe, or 
      for use in any application requiring fail-safe performance, such as 
      life-support or safety devices or systems, Class III medical 
      devices, nuclear facilities, applications related to the deployment 
      of airbags, or any other applications that could lead to death, 
      personal injury, or severe property or environmental damage 
      (individually and collectively, "Critical Applications"). Customer 
      assumes the sole risk and liability of any use of Xilinx products 
      in Critical Applications, subject only to applicable laws and 
      regulations governing limitations on product liability.

THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS 
FILE AT ALL TIMES.

*************************************************************************

This readme file contains these sections:

1. REVISION HISTORY
2. OVERVIEW
3. SOFTWARE TOOLS AND SYSTEM REQUIREMENTS
4. DESIGN FILE HIERARCHY
5. INSTALLATION AND OPERATING INSTRUCTIONS
6. OTHER INFORMATION  
7. SUPPORT


1. REVISION HISTORY 

           	Readme  
Date       	Version      	Revision Description
=========================================================================
5APR2016		1.0          	Initial Xilinx release.
2JUN2016		1.1			Updated to target 2016.1 Vivado Design Suite.
=========================================================================



2. OVERVIEW

This readme describes how to use the files that come with XAPP1280

The reference design available demonstrates how to access the SPI flash 
post-configuration on the KCU105 Xilinx evaluation board. The STARTUPE3 
connectivity is shown, and Microblaze and AXI Quad SPI IP are used to 
demonstrate basic flash operations that are selected by the user from 
the UART interface.

The golden.bin image contains the full post-configuration reference design.
The update.bin image is a simple LED pattern used as a sample pattern for
programming by the full design.


3. SOFTWARE TOOLS AND SYSTEM REQUIREMENTS

* Xilinx Vivado 2016.1 or higher, Design Editiion with SDK

* Host computer with:
	* Two USB ports
	* Windows operating system supported by Vivado Design Suite
	* Tera Term terminal emulator program 
		- Follow the procedure in Tera Term Terminal Emulator 
                  Installation Guide (UG1036)
	* Silicon Labs Dual CP210x USB UART Drivers 
		- Silicon Labs CP210x USB-to-UART Installation Guide 
                  (UG1033)
	* Reference Design Files 
		- xapp1280-us-post-cnfg-flash-startupe3.zip  

* KCU105 evaluation board which includes:
	* Kintex UltraScale XCKU040-2FFVA1156E FPGA (U1)
	* Micron N25Q256A11E 256 Mb Quad SPI flash Memory (U35)
	* Four Micron EDY4016AABG-DR-F-D DDR4 512 MB Memories (U60-U63)
	* Power supply: 100–240 VAC input, 12 VDC 5.0A output 
          (included with KCU105)
	* Two USB cables, standard-A plug to micro-B plug


4. DESIGN FILE HIERARCHY

The directory structure underneath this top-level folder is described 
below:

|
|
run_kcu105.bat - creates reference design project.
run_kcu105.tcl - called by the batch file to create project.
|
\Ready_To_Download
 |
 +----- 
 |		Contains the scripts necessary to create the SDK proejct.
 |		Includes the scripts needed to program the reference design 
 | 		golden.bin into the SPI flash address 0x0000000 to configure 
 | 		the FPGA for the demonstration. 
 |
 |		
 |		+--make_download_files.bat/.tcl - 
 |                 Creates the update.bin/golden.bin from the project
 |		+--load_golden.bat/.tcl
 |                 Programs the SPI flash with Vivado Device Programmer 
 |                 script as a starting point for the demonstration
 |		+--golden.bin
 |                 Pre-generated image that includes the reference design
 |		   and LED0 blinking pattern for identification
 |		+--update.bin
 |                 LED1 blinking pattern for identification
 |		+--golden.bit 
 |                 Optional image can be used to load FPGA via JTAG to 
 |                 verify board functionality or image.
 |		+--update.bit
 |                 Optional image can be used to load FPGA via JTAG to 
		   verify board functionality or image	     
\Source
 |
 +----- 
 |       Contains the vhdl, tcl scripts, c-code and linker scripts needed 
 |       for the reference design.
 |
 |		+--design_1_wrapper.vhd -top level vhdl file
 |		+--kcu105.xdc		-constraints file 
 |		+--flash_qspi_rw.c	-c-code reference file
 |		+--lscript.ld		-linker script 
 |		+--xmd_idcode.tcl	-XMD debugger script to get SPI flash ID 
 |		+--jtag_to_qspi.tcl	-Vivado Device Programmer script 
 |                               	 targeting the jtag to axi.
 |


5. INSTALLATION AND OPERATING INSTRUCTIONS 

If you do not already have these installed, then:

1) Install the Xilinx Vivado 2016.1 or later tools.
2) Install Tera Term (v4.87 recommended)
3) Install UART drivers
4) Setup KCU105 board as described in Xapp1280 "Set Up KCU105 Board" section
5) Download the reference design files as described in Xapp1280 
   "Download Reference Design Files" section

Option1: For quick demonstration (~15 minutes) using pre-generated files 
	 Start with the Xapp1280 section "Configure FPGA with golden.bin"
	 1) run load_golden.bat to program the image into the SPI flash  
	 2) setup Tera Term - Serial port to 115200, select Standard COM PORT
	 3) run SPI flash operations, select from UART, see Xapp1280 screen shots


Option2: For a more in-depth look (>1.5hr) at SDK and c-code run 
	 Start with section "Generate Reference Design Project" 
	 1) run the run_kcu105.bat to build the SDK project
	 2) run make_download_files.bat
	 3) run load_golden.bat
	 4) setup Tera Term - Serial port to 115200 and select Standard COM PORT
	 5) run SPI flash operations, select from UART - see Xapp1280 screen shots


6. OTHER INFORMATION   


	1) Warnings
		* Pre-generated images will be overwritten when the project 
		  generation is run.
    		* There is one related critical warning related to the STARTUPE3
                  use with the AXI_QUAD_SPI IP coreon this design that is expected 
                  and can be safely ignored:

[Place 30-73] Invalid constraint on register 'design_1_i/axi_quad_spi_0/U0/QSPI_ENHANCED_MD_GEN.QSPI_CORE_INTERFACE_I/LOGIC_FOR_MD_12_GEN.SPI_MODE_CONTROL_LOGIC_I/RATIO_NOT_EQUAL_4_GENERATE.SCK_O_NQ_4_NO_STARTUP_USED.SCK_O_NE_4_FDRE_INST'. It has the property IOB=TRUE, but it is not driving or driven by any IO element.

		* Not all flash operations have been optimized for performance


	2) Demonstration Considerations 
		* Tera Term v4.87 is recommended and used for testing the reference design.
		* Refer to the Xapp1280 "Checklist and Debug Tips" for common oversights.
		* Optional - standalone operations 
		   * Erase requires selection "1" at the menu prompt 
		   * Blank Check and Read require a byte# as input. 
		     The nearest page to the byte# is displayed (minimum of 256 bytes).
		 
	3) Fixes

	4) Known Issues
	


7. SUPPORT

To obtain technical support for this reference design, go to 
www.xilinx.com/support to locate answers to known issues in the Xilinx
Answers Database.  
