# Open Analog Repo Template (v0.1)

![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-beta-blue)
![Tools](https://img.shields.io/badge/tools-ngspice%20%7C%20magic%20%7C%20klayout-orange)

**A tapeout-ready directory structure for hierarchical analog IC design (Sky130 / IHP SG13G2 friendly).**

Stop reinventing the wheel for every project. This template provides a standardized, professional environment that separates **design**, **verification**, and **artifacts**, keeping your repository clean, reproducible, and scalable from Day 1.

---

## ⚡ Why use this template?

Most open-source analog tapeout projects fail at **integration and reproducibility**, not at transistor-level design. Common pitfalls include:

- Committing massive binary files (`.raw`, intermediate `.gds`, extraction leftovers) to Git  
- Hardcoded paths that break simulations across machines  
- Mixing testbenches with layout implementation and verification logs  
- No clear “Definition of Done” before packaging a tapeout candidate

**This template enforces:**
1. **Hierarchy:** `ip/` (design) vs `sim/` (functional verification) vs `verify/` (physical verification)
2. **Git Hygiene:** `.gitignore` blocks temporary EDA outputs while preserving configs/docs
3. **Environment as Code:** `env/` centralizes tool configs and PDK selection
4. **Release Discipline:** `tapeout/delivery/` is the only tracked, review-ready deliverable set

---

## 📂 Directory Structure

```text
open-analog-repo/
├── admin/            # Project management (schedules, pinouts, risks)
├── artifacts/        # [IGNORED] Intermediate build files (netlists, logs, temp GDS)
├── docs/             # Live documentation (specifications, test plan, release discipline)
├── env/              # Tool configuration (.magicrc, .xschemrc, .spiceinit, env.sh)
├── ip/               # Design Source Code (The "Truth")
│   ├── common/       #   -> Basic cells (inverters, mirrors)
│   ├── blocks/       #   -> Complex macros (OTA, LDO, PLL)
│   └── top/          #   -> Top-level integration
├── sim/              # Functional Verification
│   ├── tb/           #   -> Testbenches (.spice, .sch)
│   ├── run/          #   -> Run scripts / helpers
│   └── results/      #   -> [IGNORED] Simulation waveforms & logs (.raw, .log)
├── verify/           # Physical Verification (DRC, LVS, PEX)
│   ├── run/          #   -> Entry-point scripts (stubs)
│   └── reports/      #   -> [IGNORED] Intermediate verification logs
└── tapeout/          # Versioned Delivery Packages (GDS + Reports + Docs)
    └── delivery/
```

---

## ✅ Definition of Done (DoD)

A block is considered **tapeout-ready** when:

- [ ] `make smoke` passes (sanity sim works)
- [ ] `admin/pinout_definition.csv` is filled (single source of truth)
- [ ] `docs/specifications.md` contains Min/Typ/Max targets
- [ ] Final GDS is placed in `tapeout/delivery/gds/`
- [ ] Final DRC/LVS/PEX reports are placed in `tapeout/delivery/reports/`
- [ ] Pinout + specs are included in `tapeout/delivery/docs/`

---

## 🚀 Quick Start

You don't need a PDK installed to test this template. It includes a generic "Hello World" inverter using standard Ngspice models.

### 1) Initialize the Environment

```bash
source env/env.sh
```

### 2) Run the "Smoke Test"

```bash
make smoke
```

---

## 🛠️ Workflow Guide

### Adding a New Block
1. Create a folder in `ip/blocks/<block_name>/`
2. Place schematic (`.sch`) and layout (`.mag` / `.gds`) there
3. Add a local `README.md` describing pins, specs, and notes

### Running Simulations
Run from the project root using the `Makefile` or scripts in `sim/run/` to ensure paths resolve correctly. Outputs (`.raw`, `.log`) must go to `sim/results/` (ignored by Git).

### Customizing the PDK (Sky130 / IHP SG13G2)
1. Open `env/env.sh`
2. Set `PDK_ROOT` and `PDK` (example: `sky130A` or `ihp_sg13g2`)
3. Update `.spiceinit` and `.magicrc` in `env/` to point to the correct model/libs

**PDK Bridge:** see `docs/PDK_SETUP.md` for the step-by-step mapping per tool.

---

## 📦 Tapeout & Delivery

Do not commit intermediate GDS files or extraction leftovers. Keep them in `artifacts/` (ignored).

Only final, review-ready deliverables go into `tapeout/delivery/` (tracked by Git), for example:

- `tapeout/delivery/gds/<top_cell>.gds`
- `tapeout/delivery/reports/drc_summary.txt`
- `tapeout/delivery/reports/lvs_report.txt`
- `tapeout/delivery/docs/pinout.md`
- `tapeout/delivery/docs/specifications.md`

This folder acts as your release candidate and is the only place where "final" artifacts should live.

**Release Discipline:** see `docs/RELEASE_DISCIPLINE.md`.

---

## 📄 License

This template is open-source under the MIT License.  
Feel free to use it for academic, hobbyist, or commercial tapeouts.

**Maintained by:** Édney Freitas — *Open Analog Survival Kit*
