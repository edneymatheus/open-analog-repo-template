# Open Analog Repo Template (v0.1)

![License](https://img.shields.io/badge/license-MIT-green) ![Status](https://img.shields.io/badge/status-stable-blue) ![Tools](https://img.shields.io/badge/tools-ngspice%20|%20magic%20|%20klayout-orange)

**A tapeout-ready directory structure for hierarchical analog IC design.**

Stop reinventing the wheel for every project. This template provides a standardized, professional environment that separates design, verification, and artifacts, ensuring your repository remains clean and scalable from Day 1.

---

## ⚡ Why use this template?

Analog design projects often fail due to directory chaos, not circuit issues. Common pitfalls include:
* Committing massive binary files (`.raw`, `.gds`) to Git.
* Hardcoded paths breaking simulation on different machines.
* Mixing testbenches with physical implementation.

**This template solves this by enforcing:**
1.  **Hierarchy:** Strict separation between `ip` (design), `sim` (functional verification), and `verify` (physical verification).
2.  **Git Hygiene:** A battle-tested `.gitignore` that blocks EDA temporary files while preserving critical config.
3.  **Environment as Code:** Centralized `env/` scripts to handle PDK paths and tool configurations.

---

## 📂 Directory Structure

```text
open-analog-repo/
├── admin/           # Project management (schedules, pinouts, risks)
├── artifacts/       # [IGNORED] Intermediate build files (netlists, logs)
├── docs/            # Live documentation (specifications, datasheets)
├── env/             # Tool configuration (.magicrc, .xschemrc, env.sh)
├── ip/              # Design Source Code (The "Truth")
│   ├── common/      #   -> Basic cells (inverters, mirrors)
│   ├── blocks/      #   -> Complex macros (OTA, LDO, PLL)
│   └── top/         #   -> Top-level integration
├── sim/             # Functional Verification
│   ├── tb/          #   -> Testbenches (.spice, .sch)
│   └── results/     #   -> [IGNORED] Simulation waveforms (.raw)
├── tapeout/         # Versioned Delivery Packages (GDS + Reports)
└── verify/          # Physical Verification (DRC, LVS, PEX)
```
## 🚀 Quick Start

You don't need a PDK installed to test this template. It comes with a generic "Hello World" inverter using standard Ngspice models.

### 1. Initialize the Environment
This sets up the `PROJECT_ROOT` variable, allowing tools to use relative paths.
```bash
source env/env.sh
```

### 2. Run the "Smoke Test"
This executes a `make` command that:
1.  Finds the inverter netlist in `ip/common/`.
2.  Runs a transient simulation using `sim/tb/tb_smoke.spice`.
3.  Checks the output and prints a PASS/FAIL message.

```bash
make smoke
```

*Expected Output:*
```text
🚀 Starting Smoke Test...
✅ TEST PASS: Inverter is switching! Delay = 5.23e-11
✅ Smoke Test Finished. Results in sim/results/smoke_test.raw
```

## 🛠️ Workflow Guide

### Adding a New Block
1.  Create a new folder in `ip/blocks/<block_name>`.
2.  Place schematic (`.sch`) and layout (`.mag` or `.gds`) there.
3.  Create a `README.md` inside that folder describing the block's pins and specs.

### Running Simulations
Always run simulations from the project root using the `Makefile` or scripts in `sim/run/` to ensure relative paths resolve correctly. Results (`.raw`, `.log`) are automatically directed to `sim/results/` (which is ignored by Git).

### Customizing the PDK
To use a real PDK (like Sky130 or IHP SG13G2):
1.  Open `env/env.sh`.
2.  Uncomment and set the `PDK_ROOT` and `PDK` variables.
3.  Update the `.spiceinit` and `.magicrc` in the `env/` folder to point to your PDK's libs.

---

## 📦 Tapeout & Delivery

Never commit intermediate GDS files to the root.
* **Intermediate:** Run verification; logs go to `artifacts/`.
* **Final Delivery:** When a block is ready, copy the clean GDS and final reports to `tapeout/delivery/`. This folder *is* tracked by Git and serves as your release candidate.

---

## 📄 License

This template is open-source under the [MIT License](LICENSE).
Feel free to use it for academic, hobbyist, or commercial tapeouts.

**Maintained by:** [Your Name/Handle] - *Open Analog Survival Kit*
