# Physical Verification (verify/)

This folder is intentionally separated from `sim/`.

- `sim/`    → functional verification (schematic + post-layout sims)
- `verify/` → physical verification (DRC / LVS / PEX)

## Standard entry points

Use the scripts in `verify/run/` as your stable commands:

- `verify/run/run_drc_magic.sh`
- `verify/run/run_lvs_netgen.sh`
- `verify/run/run_pex_magic.sh`

These are **stubs on purpose**: they show the expected structure and where outputs should go.
Replace the TODO sections with PDK-specific commands for Sky130 / IHP SG13G2.

## Outputs

- Intermediate logs: `verify/reports/` (ignored by Git)
- Final reports (release candidate): `tapeout/delivery/reports/` (tracked by Git)
