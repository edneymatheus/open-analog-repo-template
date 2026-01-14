# Release Discipline (Governance for Tapeout-Ready Repos)

Open-source projects often stay in permanent “WIP”. Tapeout work cannot.
This document defines a lightweight release discipline so your repo always has a clear **review-ready** state.

---

## 1) What is considered “final” in this repo?

Only what is inside:

- `tapeout/delivery/`

Everything else is either:
- **source of truth** (`ip/`, `docs/`, `admin/`)
- **build output** (`sim/results/`, `artifacts/`, `verify/reports/`) → ignored by Git

**Rule:** if it’s not in `tapeout/delivery/`, it’s not a release candidate.

---

## 2) Naming conventions (recommended)

Inside `tapeout/delivery/`:

- `gds/<top_cell>.gds`
- `netlist/<top_cell>.spice` (or extracted netlist if applicable)
- `reports/drc_summary.txt`
- `reports/lvs_report.txt`
- `reports/pex_notes.txt` (or PEX summary)
- `docs/pinout.md`
- `docs/specifications.md`
- `docs/test_plan.md` (optional, but strongly recommended)

---

## 3) Versioning & tags

Use Git tags to mark review-ready releases:

- `v0.1.0` → first “Gold” template release
- `v0.1.1` → bugfix-only improvements
- `v0.2.0` → new features (new scripts, CI, more PDK helpers)

---

## 4) Definition of Done (DoD)

A release candidate must meet:

- `make smoke` PASS
- `admin/pinout_definition.csv` filled (single source of truth)
- `docs/specifications.md` contains Min/Typ/Max targets
- final deliverables are copied into `tapeout/delivery/` with correct names

---

## 5) Why this matters

- Reviewers don’t want to hunt for the “final” GDS
- Shuttles reject incomplete or messy submissions
- Your future self (and collaborators) will thank you
