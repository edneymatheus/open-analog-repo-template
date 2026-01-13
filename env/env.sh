#!/bin/bash
# Environment Setup Script
# Usage: source env/env.sh

echo "🔧 Configuring Open Analog Environment..."

# 1. Project Root (Automatically detects where the script is located)
# This allows the user to clone to any folder without breaking anything.
export PROJECT_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
echo "   -> PROJECT_ROOT definido como: $PROJECT_ROOT"

#2. PDK Definition (We'll leave Sky130 as a commented example)
# export PDK_ROOT=/usr/local/share/pdk
# export PDK=sky130A
# echo "   -> PDK alvo: $PDK (em $PDK_ROOT)"

#3. Useful Aliases (Optional, but very "Pro")
# Makes typing 'magic' automatically load the correct rc file.
alias magic="magic -dnull -noconsole -rcfile $PROJECT_ROOT/env/.magicrc"
alias xschem="xschem --rcfile $PROJECT_ROOT/env/.xschemrc"

echo "✅ Setup complete. Ready to run 'make smoke'."