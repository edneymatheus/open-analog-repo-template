# Open Analog Repo Template (v0.1)

A **tapeout-ready** structure for hierarchical analog design using open-source EDA tools (Magic, KLayout, Ngspice, Xschem).

## Why this structure?
Analog projects often fail due to directory chaos, not circuit issues. This template:
1.  **Separates** design (`ip/`) from verification (`sim/`, `verify/`).
2.  **Protects** your git repo from heavy binary files via a pre-configured `.gitignore`.
3.  **Standardizes** the environment with `env/` scripts.

## Folder Structure
* `admin/`: Schedules, pinouts, and risk registers.
* `env/`: Tool configuration files (`.magicrc`, `.xschemrc`).
* `ip/`: Hierarchical design (Common -> Blocks -> Top).
* `tapeout/`: Versioned delivery packages (GDS + Reports).

## Quick Start
1.  Clone this repository.
2.  Run `source env/env.sh` to load paths.
3.  Run `make smoke` to verify the setup.