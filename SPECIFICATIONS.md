# Custom Standard Cell Physical Layout Guidelines

## 1. Physical Grid & Floorplan Rules
* **Cell Pitch Alignment:** All pin access points (\(A, B, Y\)) are snapped to the \(0.34\,\mu\text{m}\) horizontal and \(0.46\,\mu\text{m}\) vertical routing track intersections to ensure pin accessibility during APR.
* **Power Grid Interconnects:** \(V_{DD}\) and \(V_{SS}\) rails run horizontally along the top and bottom cell boundaries on Metal 1 with a fixed width of \(0.48\,\mu\text{m}\).
* **Cell Abutment:** Standard cells share power rail structures and well tap boundaries across adjacent instances.

## 2. Reliability & Substrate Engineering
* **Latch-Up Prevention:** Integrated continuous tap connections (\(N^+\) in \(N\)-well, \(P^+\) in \(P\)-substrate) placed at maximum intervals \(< 10\,\mu\text{m}\), fully exceeding foundry latch-up resistance rules.
* **Well Proximity Effect (WPE) Mitigation:** Transistors are placed at a constant offset relative to \(N\)-well edges to minimize threshold voltage (\(\Delta V_{th}\)) variations.
* **Diffusion Boundary Rules:** Shared diffusion nodes (e.g., connected drains) are merged to reduce output nodal capacitance and minimize diffusion perimeter parasitics.
