
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment}]
##Pmod Header JB
#set_property -dict { PACKAGE_PIN T20   IOSTANDARD LVCMOS33 } [get_ports { seven_segment[0] }]; #IO_L15P_T2_DQS_34 Sch=JB1_p
#set_property -dict { PACKAGE_PIN U20   IOSTANDARD LVCMOS33 } [get_ports { seven_segment[1] }]; #IO_L15N_T2_DQS_34 Sch=JB1_N
#set_property -dict { PACKAGE_PIN V20   IOSTANDARD LVCMOS33 } [get_ports { seven_segment[2] }]; #IO_L16P_T2_34 Sch=JB2_P
#set_property -dict { PACKAGE_PIN W20   IOSTANDARD LVCMOS33 } [get_ports { seven_segment[3] }]; #IO_L16N_T2_34 Sch=JB2_N
set_property PACKAGE_PIN T20 [get_ports { seven_segment[0] }]; #IO_L15P_T2_DQS_34 Sch=JB1_p
set_property PACKAGE_PIN U20 [get_ports { seven_segment[1] }]; #IO_L15N_T2_DQS_34 Sch=JB1_N
set_property PACKAGE_PIN V20 [get_ports { seven_segment[2] }]; #IO_L16P_T2_34 Sch=JB2_P
set_property PACKAGE_PIN W20 [get_ports { seven_segment[3] }]; #IO_L16N_T2_34 Sch=JB2_N



##Pmod Header JC
set_property PACKAGE_PIN V15   [get_ports { seven_segment[4] }]; #IO_L10P_T1_34 Sch=JC1_P
set_property PACKAGE_PIN W15   [get_ports { seven_segment[5] }]; #IO_L10N_T1_34 Sch=JC1_N
set_property PACKAGE_PIN T11   [get_ports { seven_segment[6] }]; #IO_L1P_T0_34 Sch=JC2_P
set_property PACKAGE_PIN T10   [get_ports { seven_segment[7] }]; #IO_L1N_T0_34 Sch=JC2_N


# eight bits to display
# 0 => 011 1111
# 1 => 000 0110
# 2 => 101 1011
# 3 => 100 1111
# 4 => 110 0110
# 5 => 110 1101
# 6 => 111 1101
# 7 => 000 0111
# 8 => 111 1111
# 9 => 110 0111

