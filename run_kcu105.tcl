################################################################
# Vivado script to generate the Xapp1280 reference design
################################################################
#start_gui
set path [pwd]
create_project project_1 {./project_1} -part xcku040-ffva1156-2-e -force
set_property board_part xilinx.com:kcu105:part0:1.0 [current_project]
#set_property BOARD_PART xilinx.com:kcu105:part0:1.1 [current_project]
set_property target_language VHDL [current_project]
source /home/arshadaleem/work/FPGA_development/xapp1280-us-post-cnfg-flash-startupe3/Xapp_QUAD_SPI/source/design_1.tcl

##################################################################
# DESIGN PROCs
##################################################################

regenerate_bd_layout
save_bd_design

import_files -norecurse /home/arshadaleem/work/FPGA_development/xapp1280-us-post-cnfg-flash-startupe3/Xapp_QUAD_SPI/source/design_1_wrapper.vhd
update_compile_order -fileset sources_1
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

add_files -fileset constrs_1 -norecurse /home/arshadaleem/work/FPGA_development/xapp1280-us-post-cnfg-flash-startupe3/Xapp_QUAD_SPI/source/kcu105.xdc
import_files -fileset constrs_1 /home/arshadaleem/work/FPGA_development/xapp1280-us-post-cnfg-flash-startupe3/Xapp_QUAD_SPI/source/kcu105.xdc


generate_target  {synthesis  implementation}  [get_files  ./project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]

save_bd_design
reset_run synth_1
launch_runs synth_1
wait_on_run synth_1

launch_runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1

file mkdir ./project_1/project_1.sdk
write_hwdef -force  -file ./project_1/project_1.sdk/design_1_wrapper.hdf

file copy -force ./project_1/project_1.runs/impl_1/design_1_wrapper.sysdef ./project_1/project_1.sdk/design_1_wrapper.hdf

launch_sdk -workspace [pwd]/project_1/project_1.sdk -hwspec [pwd]/project_1/project_1.sdk/design_1_wrapper.hdf
