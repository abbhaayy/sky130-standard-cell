# Automation Script: Magic DRC Execution
tech load sky130A
magic::open layout/sky130_inv.mag
drc style drc(full)
drc check
set drc_count [drc list count]

puts "===================================================="
puts " PHYSICAL SIGN-OFF: DRC EXECUTION COMPLETE "
puts " TOTAL DESIGN RULE VIOLATIONS: $drc_count "
puts "===================================================="
exit
