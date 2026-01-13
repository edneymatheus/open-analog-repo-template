# Open Analog Repo Template v0.1
# Targets: smoke, precheck, package, clean

# Configs
SPICE = ngspice
SPICE_FLAGS = -b
TB_DIR = sim/tb
RES_DIR = sim/results
DELIVERY_DIR = tapeout/delivery

.PHONY: help smoke precheck package clean

help:
	@echo "Open Analog Repo Template v0.1"
	@echo "------------------------------"
	@echo "  make smoke    -> Run 'Hello World' simulation to verify env"
	@echo "  make precheck -> Verify governance files (DoD readiness)"
	@echo "  make package  -> Assemble final files into tapeout/delivery/"
	@echo "  make clean    -> Remove temporary artifacts"

smoke:
	@echo "🚀 Running Smoke Test..."
	@mkdir -p $(RES_DIR)
	@$(SPICE) $(SPICE_FLAGS) $(TB_DIR)/tb_smoke.spice
	@echo "✅ Smoke Test Passed. Results in $(RES_DIR)/smoke_test.raw"

precheck:
	@echo "🔍 Running Governance Pre-Check..."
	@if [ -f "admin/pinout_definition.csv" ]; then echo "  [OK] Pinout definition found."; else echo "  [FAIL] Missing admin/pinout_definition.csv"; exit 1; fi
	@if [ -f "docs/specifications.md" ]; then echo "  [OK] Specs document found."; else echo "  [FAIL] Missing docs/specifications.md"; exit 1; fi
	@echo "✅ Pre-Check Complete. Ready for design."

package:
	@echo "📦 Assembling Tapeout Package..."
	@mkdir -p $(DELIVERY_DIR)/gds
	@mkdir -p $(DELIVERY_DIR)/reports
	@echo "   -> Copying Documentation..."
	@cp admin/pinout_definition.csv $(DELIVERY_DIR)/
	@cp docs/specifications.md $(DELIVERY_DIR)/
	@echo "⚠️  Reminder: Manually copy your FINAL GDS to $(DELIVERY_DIR)/gds/"
	@echo "✅ Package structure created in $(DELIVERY_DIR)"

clean:
	@echo "🧹 Cleaning workspace..."
	rm -rf artifacts/* sim/results/* verify/reports/*
	@echo "✨ Workspace clean."