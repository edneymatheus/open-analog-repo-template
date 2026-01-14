#!/usr/bin/env bash
set -euo pipefail

# Stub: PEX runner (Magic extraction or PDK-provided flow)
# Goal: make post-layout extraction discoverable and repeatable.

PROJECT_ROOT="${PROJECT_ROOT:-$(pwd)}"
OUT_DIR="${PROJECT_ROOT}/verify/reports"
mkdir -p "${OUT_DIR}"

echo "==> Running PEX (stub)"
echo "    PROJECT_ROOT: ${PROJECT_ROOT}"
echo "    Output dir:   ${OUT_DIR}"
echo ""
echo "TODO: Choose your PEX method:"
echo "  - Magic extraction (ext2spice) for simple RC"
echo "  - PDK-provided extraction for accurate results (if available)"
echo ""
echo "Recommended conventions:"
echo "  artifacts/extracted_netlists/<cell>_pex.spice"
echo "  sim/post_layout/ uses the extracted netlist"
echo ""
echo "Stub completed."
