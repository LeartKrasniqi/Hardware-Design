# Assign inputs/outputs to actual pins on the FPGA
set_property PACKAGE_PIN F22 [get_ports addr[0]] 
set_property PACKAGE_PIN G22 [get_ports addr[1]] 
set_property PACKAGE_PIN H22 [get_ports addr[2]]
set_property PACKAGE_PIN F21 [get_ports addr[3]]
set_property PACKAGE_PIN V22 [get_ports data[0]]
set_property PACKAGE_PIN W22 [get_ports data[1]]  
set_property PACKAGE_PIN U19 [get_ports data[2]]
set_property PACKAGE_PIN U14 [get_ports data[3]]      

# Define voltage levels (3.3 for LEDs and 1.8 for Switches)
set_property IOSTANDARD LVCMOS18 [get_ports addr[0]] 
set_property IOSTANDARD LVCMOS18 [get_ports addr[1]] 
set_property IOSTANDARD LVCMOS18 [get_ports addr[2]] 
set_property IOSTANDARD LVCMOS18 [get_ports addr[3]] 
set_property IOSTANDARD LVCMOS33 [get_ports data[0]]
set_property IOSTANDARD LVCMOS33 [get_ports data[1]] 
set_property IOSTANDARD LVCMOS33 [get_ports data[2]] 
set_property IOSTANDARD LVCMOS33 [get_ports data[3]] 
