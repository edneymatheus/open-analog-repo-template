#!/usr/bin/env bash
set -euo pipefail

# Stub: LVS runner (Netgen)
# Goal: establish a standard entry point and file locations.
# You will need to provide:
# - extracted netlist from layout (or a netgen setup)
# - schematic netlist (golden)
# - a PDK-specific setup file / rules

PROJECT_ROOT="${PROJECT_ROOT:-$(pwd)}"
OUT_DIR="${PROJECT_ROOT}/verify/reports"
mkdir -p "${OUT_DIR}"

echo "==> Running LVS (stub) with Netgen"
echo "    PROJECT_ROOT: ${PROJECT_ROOT}"
echo "    Output dir:   ${OUT_DIR}"
echo ""
echo "TODO: Provide the following inputs:"
echo "  - Layout netlist  (from extraction / PEX / netgen extraction)"
echo "  - Schematic netlist (golden)"
echo "  - PDK setup / rules"
echo ""
echo "Suggested convention:"
echo "  artifacts/extracted_netlists/<cell>_layout.spice"
echo "  artifacts/netlists/<cell>_schematic.spice"
echo ""
echo "Stub completed."
