This repository contains custom-designed CMOS Standard Cell Library (Inverter, 2-Input NAND) implemented in the **SkyWater 130nm PDK (`sky130A`)**. The library is built following automated place-and-route (APR) grid constraints, featuring full Design Rule Checking (DRC) compliance, Layout versus Schematic (LVS) equivalence, and Parasitic Extraction (PEX) for timing closed post-layout performance analysis.

*Technical Highlights & Key Achievements
->Zero-DRC / Clean LVS Sign-off: 100% verification pass using Magic and Netgen engines.
->APR Integration Readiness: Strict track alignment and fixed pin placement on M1 routing grids.
->Reliability Engineering: Embedded $N$-well and $P$-substrate tap guards to eliminate CMOS latch-up.
->Parasitic Characterization: Back-annotated post-layout simulation highlighting interconnect $RC$ degradation.

*Library Architecture & Floorplan Strategy
+-------------------------------------------------------------+
| VDD Rail (Metal 1) - 0.48µm Width                          |
| [N-Well Tap Zone]                                           |
| +---------------------------------------------------------+ |
| | PMOS Region (W = 0.84µm, L = 0.15µm)                    | |
| +---------------------------------------------------------+ |
|   Routing Channel (Active Poly & Metal 1 Layer Interconnect) |
| +---------------------------------------------------------+ |
| | NMOS Region (W = 0.42µm, L = 0.15µm)                    | |
| +---------------------------------------------------------+ |
| [P-Substrate Tap Zone]                                      |
| VSS Rail (Metal 1) - 0.48µm Width                          |
+-------------------------------------------------------------+
|<--------------------- Cell Width (Variable) -------------->|

*Key Parameters 
Process Node: SkyWater 130nm CMOS (1.8VLogic Core)
Standard Cell Height: Fixed 2.72mu (8-track equivalent height)
   Transistor Aspect Ratios:
           PMOS: W/L = 840nm / 150nm
           NMOS: $W/L = 420nm / 150nm
           Sizing Rationale: 2:1  PMOS-to-NMOS beta ratio (W_p/W_n) to balance carrier mobility differences (mu_n approx 2.5 mu_p) and equalize rise/fall propagation delays.


*Verification & Physical Sign-Off Summary
1. Design Rule Checking (DRC)Verified using Magic VLSI against the complete sky130A techfile (minimum metal widths, poly enclosure, active spacing, and via overlap rules).
    Result: 0 DRC Violations2. 

2.Layout vs. Schematic (LVS)Layout netlists extracted using ext2spice and formally verified against schematic netlists using Netgen.
    Result: Subcircuits match uniquely. LVS Clean

3. Post-Layout Timing Impact (PEX Analysis)Post-layout SPICE extraction executed under nominal corner conditions (TT, 1.8V, 27^C) with a 10fF load capacitance (C_L)


Performance Metric,Ideal (Pre-Layout),Extracted (Post-Layout PEX),Layout Parasitic Overhead
Rise Propagation Delay (tpLH​),18.40ps,22.10ps,+20.10%
Fall Propagation Delay (tpHL​),15.20ps,17.80ps,+17.10%
Propagation Delay (tpd​),16.80ps,19.95ps,+18.75%




*Directory Organization
├── README.md                 # Architecture Overview & Verification Metrics
├── SPECIFICATIONS.md         # Cell Layout Constraints & Physical Rules
├── ENVIRONMENT.md            # EDA Setup, PDK Targets, and Tooling
├── schematics/               # Spice Reference Netlists
├── layout/                   # Magic Layout Files (.mag)
├── verification/             # DRC and LVS Tcl Sign-Off Scripts
└── simulation/               # Pre- and Post-Layout SPICE Testbenches





