# Automation Script: Netlist Extraction for LVS Equivalence
tech load sky130A
magic::open layout/sky130_inv.mag
extract all
ext2spice lvs
ext2spice
puts "===================================================="
puts " PHYSICAL SIGN-OFF: LVS NETLIST EXTRACTED "
puts "===================================================="
exit
