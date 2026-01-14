#!/bin/bash
# Environment Setup Script
# Usage: source env/env.sh
#
# Philosophy: Environment as Code
# - PROJECT_ROOT is auto-detected
# - PDK_ROOT / PDK are configured here (single source of truth)
# - Tool launchers (aliases) point to repo-local rc files

echo "🔧 Configuring Open Analog Environment..."

# 1) Project Root (clone anywhere, it still works)
export PROJECT_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
echo "   -> PROJECT_ROOT: $PROJECT_ROOT"

# 2) PDK Selection (optional for smoke test)
# Uncomment ONE of the examples below or set these variables in your shell profile.
#
# --- Example A: Sky130 ---
# export PDK_ROOT=/path/to/pdks
# export PDK=sky130A
#
# --- Example B: IHP SG13G2 ---
# export PDK_ROOT=/path/to/ihp_pdks
# export PDK=ihp_sg13g2
#
# If PDK_ROOT and PDK are set, tool rc files can reference them.
if [[ -n "${PDK_ROOT:-}" && -n "${PDK:-}" ]]; then
  echo "   -> PDK: $PDK (PDK_ROOT=$PDK_ROOT)"
else
  echo "   -> PDK: (not set)  | Smoke test will run with generic models."
fi

# 3) Tool launchers (repo-local configs)
# Makes typing 'magic' and 'xschem' always use your project configs.
alias magic="magic -dnull -noconsole -rcfile $PROJECT_ROOT/env/.magicrc"
alias xschem="xschem --rcfile $PROJECT_ROOT/env/.xschemrc"

echo "✅ Setup complete. Ready to run 'make smoke'."
