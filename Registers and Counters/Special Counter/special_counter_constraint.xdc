# Assign inputs/outputs to actual pins on the FPGA
set_property PACKAGE_PIN M15 [get_ports CLK]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {CLK}];
set_property PACKAGE_PIN F22 [get_ports Reset] 
set_property PACKAGE_PIN G22 [get_ports Enable]
set_property PACKAGE_PIN T22 [get_ports Q[0]]
set_property PACKAGE_PIN T21 [get_ports Q[1]]  
set_property PACKAGE_PIN U22 [get_ports Q[2]]  
 
# Define voltage levels (3.3 for LEDs and 1.8 for Switches)
set_property IOSTANDARD LVCMOS18 [get_ports CLK] 
set_property IOSTANDARD LVCMOS18 [get_ports Reset] 
set_property IOSTANDARD LVCMOS18 [get_ports Enable] 
set_property IOSTANDARD LVCMOS33 [get_ports Q[0]]
set_property IOSTANDARD LVCMOS33 [get_ports Q[1]] 
set_property IOSTANDARD LVCMOS33 [get_ports Q[2]] 
