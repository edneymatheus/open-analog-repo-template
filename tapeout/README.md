\# Tapeout Delivery Manifest



This folder contains the \*\*versioned release candidates\*\* for the chip.

Only files that satisfy the Definition of Done (DoD) should be committed here.



\## 📦 Directory Structure



\* `delivery/gds/` -> The final, DRC-clean GDSII file (e.g., `top\_level\_v1.0.gds`).

\* `delivery/netlist/` -> CDL/Spice netlist for LVS check.

\* `delivery/reports/` -> Final sign-off reports (DRC/LVS/PEX summary).

\* `delivery/docs/` -> Datasheet and Pinout map.



\## ✅ Release Checklist



Before tagging a release commit, verify:



\- \[ ] GDS file matches the commit hash of the `ip/` folder.

\- \[ ] DRC Report shows \*\*0 Violations\*\* (or waived).

\- \[ ] LVS Report shows \*\*Netlist Match\*\*.

\- \[ ] Antenna Checks passed.

\- \[ ] Pinout CSV matches the GDS labels.



---

## Release Discipline

This repository treats `tapeout/delivery/` as the **only** review-ready location.

- Intermediate outputs belong in `artifacts/` (ignored)
- Final GDS + reports + docs belong in `tapeout/delivery/` (tracked)

See: `docs/RELEASE_DISCIPLINE.md`
