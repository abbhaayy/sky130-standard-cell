# EDA Infrastructure & Physical Verification Stack

## Open-Source EDA Toolchain

| Discipline | Platform / Tool | Version Target | Primary Objective |
| :--- | :--- | :--- | :--- |
| **Process Kit** | SkyWater `sky130A` | Latest Revision | Open-Source 130nm CMOS PDK |
| **Schematic Entry** | Xschem | v3.4.5+ | Transistor-Level Netlist Generation |
| **Custom Layout** | Magic VLSI | v8.3.380+ | Polygon Editing, Layer Placement & DRC |
| **LVS Engine** | Netgen | v1.5.240+ | Netlist Topology Equivalence Checking |
| **SPICE Engine** | ngspice | v38+ | Transient & Delay Characterization |

## Reproduction Commands

```bash
# 1. Run Design Rule Check (DRC)
magic -noc -dnull verification/run_drc.tcl

# 2. Extract Layout Netlist for LVS
magic -noc -dnull verification/run_lvs.tcl

# 3. Execute Netgen LVS Verification
netgen -batch lvs simulation/tb_inverter_post.spice schematics/inverter.spice sky130A_setup.tcl reports/lvs_inverter.log

# 4. Run Post-Layout Simulation Analysis
ngspice -b simulation/tb_inverter_post.spice
