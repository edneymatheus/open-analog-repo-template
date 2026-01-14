# Tapeout Delivery Manifest

This folder contains the **versioned release candidates** for the chip.

Only files that satisfy the Definition of Done (DoD) should be committed here.

## 📦 Directory Structure

- `delivery/gds/` -> Final, DRC-clean GDSII file (e.g., `top_level_v1.0.gds`)
- `delivery/reports/` -> Final verification summaries (DRC/LVS/PEX)
- `delivery/docs/` -> Pinout + specifications + any test notes

## ✅ Release Checklist (before tagging)

- [ ] Final GDS exists in `delivery/gds/`
- [ ] DRC summary shows **0 violations** (or documented waivers)
- [ ] LVS summary shows **netlist match**
- [ ] Antenna checks passed (if applicable)
- [ ] `admin/pinout_definition.csv` matches GDS labels
- [ ] `docs/specifications.md` is complete (Min/Typ/Max targets)

## Naming Suggestions

- GDS: `chipname_top_vX.Y.gds`
- Reports: `drc_vX.Y.txt`, `lvs_vX.Y.txt`, `pex_vX.Y.txt`
- Tag: `vX.Y` (matches the delivery contents)
