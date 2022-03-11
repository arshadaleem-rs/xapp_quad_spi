#
# Kintex-Ultrascale KCU105 Evaluation Platform (xcku040-ffva1156-2-e)
# Constraints needed by the system
#

set_property PACKAGE_PIN AL18 [get_ports ddr4_sdram_reset_n]
set_property BOARD_PART_PIN sysclk_300_n [get_ports sysclk_300_clk_n]
set_property IOSTANDARD LVDS [get_ports sysclk_300_clk_n]
set_property BOARD_PART_PIN sysclk_300_p [get_ports sysclk_300_clk_p]
set_property IOSTANDARD LVDS [get_ports sysclk_300_clk_p]
set_property PACKAGE_PIN AK16 [get_ports sysclk_300_clk_n]
set_property PACKAGE_PIN AK17 [get_ports sysclk_300_clk_p]
set_property BOARD_PART_PIN CPU_RESET [get_ports reset]
#
create_clock -period 3.332 [get_ports sysclk_300_clk_p]
#
set_property PACKAGE_PIN AN8 [get_ports reset]
set_property IOSTANDARD LVCMOS18 [get_ports reset]
set_property PACKAGE_PIN G25 [get_ports rs232_uart_rxd]
set_property IOSTANDARD LVCMOS18 [get_ports rs232_uart_rxd]
set_property PACKAGE_PIN K26 [get_ports rs232_uart_txd]
set_property IOSTANDARD LVCMOS18 [get_ports rs232_uart_txd]
#
set_property PACKAGE_PIN AP8 [get_ports {GPIO_LED[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[0]}]
set_property PACKAGE_PIN H23 [get_ports {GPIO_LED[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[1]}]
set_property PACKAGE_PIN P20 [get_ports {GPIO_LED[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[2]}]
set_property PACKAGE_PIN P21 [get_ports {GPIO_LED[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[3]}]
set_property PACKAGE_PIN N22 [get_ports {GPIO_LED[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[4]}]
set_property PACKAGE_PIN M22 [get_ports {GPIO_LED[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[5]}]
set_property PACKAGE_PIN R23 [get_ports {GPIO_LED[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[6]}]
set_property PACKAGE_PIN P23 [get_ports {GPIO_LED[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {GPIO_LED[7]}]
#
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
#
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
#IPROG options for loading the second bitream
set_property BITSTREAM.CONFIG.CONFIGFALLBACK Enable [current_design]
set_property BITSTREAM.CONFIG.TIMER_CFG 32'h00050000 [current_design]
# Golden Bitstream settings
set_property BITSTREAM.CONFIG.NEXT_CONFIG_REBOOT Enable [current_design]
set_property BITSTREAM.CONFIG.NEXT_CONFIG_ADDR 32'h00F50000 [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CFGBVS GND [current_design]
#
#
#CCLK delay is 1.0, 6.7 ns min/max for ultra-scale devices; refer Data sheet Consider the max delay for worst case analysis.
# DS922.(v1.0).page.no.69.table.87 for xcku040-ffva1156-2-e - TUSRCCLKO = 1.0 to 6.7nSec - STARTUPE3 USRCCLKO input port to CCLK pin output delay.
#Define a SCK Clock for the Quad SPI IP.
#create_generated_clock -name clk_sck -source [get_pins -hierarchical *axi_quad_spi_0/ext_spi_clk] -edges {3 5 7} -edge_shift {6.700 6.700 6.700} [get_pins -hierarchical *USRCCLKO]
#set_multicycle_path -setup -from clk_sck -to [get_clocks -of_objects [get_pins -hierarchical */ext_spi_clk]] 2
#set_multicycle_path -hold -end -from clk_sck -to [get_clocks -of_objects [get_pins -hierarchical */ext_spi_clk]] 1
#set_multicycle_path -setup -start -from [get_clocks -of_objects [get_pins -hierarchical */ext_spi_clk]] -to clk_sck 2
#set_multicycle_path -hold -from [get_clocks -of_objects [get_pins -hierarchical */ext_spi_clk]] -to clk_sck 1
## Max delay constraints are used to instruct the tool to place IP near to STARTUPE3 primitive.
#set_max_delay -datapath_only -from [get_pins -hier {*STARTUP*_inst/DI[*]}] 1.000
#set_max_delay -datapath_only -from [get_clocks mmcm_clkout1] -to [get_pins -hier *STARTUP*_inst/USRCCLKO] 1.000
#set_max_delay -datapath_only -from [get_clocks mmcm_clkout1] -to [get_pins -hier {*STARTUP*_inst/DO[*]}] 1.000

####################################################################################
# Constraints from file : 'design_1_axi_quad_spi_0_0_clocks.xdc'
####################################################################################

set_max_delay -datapath_only -from [get_clocks mmcm_clkout1] -to [get_pins -hier {*STARTUP*_inst/DTS[*]}] 1.000
#

create_generated_clock -name clk_sck -source [get_pins -hierarchical *axi_quad_spi_0/ext_spi_clk] -edges {3 5 7} -edge_shift {6.700 6.700 6.700} [get_pins -hierarchical *USRCCLKO]
set_multicycle_path -setup -from clk_sck -to [get_clocks -of_objects [get_pins -hierarchical */ext_spi_clk]] 2
set_multicycle_path -hold -end -from clk_sck -to [get_clocks -of_objects [get_pins -hierarchical */ext_spi_clk]] 1
set_multicycle_path -setup -start -from [get_clocks -of_objects [get_pins -hierarchical */ext_spi_clk]] -to clk_sck 2
set_multicycle_path -hold -from [get_clocks -of_objects [get_pins -hierarchical */ext_spi_clk]] -to clk_sck 1
set_max_delay -datapath_only -from [get_pins -hier {*STARTUP*_inst/DI[*]}] 1.000
set_max_delay -datapath_only -from [get_clocks mmcm_clkout1] -to [get_pins -hier *STARTUP*_inst/USRCCLKO] 1.000
set_max_delay -datapath_only -from [get_clocks mmcm_clkout1] -to [get_pins -hier {*STARTUP*_inst/DO[*]}] 1.000
set_max_delay -datapath_only -from [get_clocks mmcm_clkout1] -to [get_pins -hier {*STARTUP*_inst/DTS[*]}] 1.000
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
