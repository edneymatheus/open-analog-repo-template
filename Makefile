# Open Analog Repo Template v0.1
# Targets: help, smoke, precheck, package, clean

SPICE       ?= ngspice
SPICE_FLAGS ?= -b
TB_FILE     ?= sim/tb/tb_smoke.spice
RES_DIR     ?= sim/results
ART_DIR     ?= artifacts
VERIFY_REP  ?= verify/reports
DELIVERY    ?= tapeout/delivery

.PHONY: help smoke precheck package clean

help:
	@echo "Open Analog Repo Template v0.1"
	@echo "------------------------------"
	@echo "Targets:"
	@echo "  make smoke     -> Run 'Hello World' ngspice smoke test"
	@echo "  make precheck  -> Smoke test + basic repo sanity checks"
	@echo "  make package   -> Create tapeout/delivery structure and copy docs"
	@echo "  make clean     -> Remove generated artifacts (kept out of git)"
	@echo ""
	@echo "Tip: source env/env.sh (optional) before running."

smoke:
	@echo "🚀 Starting Smoke Test..."
	@mkdir -p $(RES_DIR)
	@$(SPICE) $(SPICE_FLAGS) -o $(RES_DIR)/smoke_test.log $(TB_FILE) >/dev/null || true
	@grep -q "TEST PASS" $(RES_DIR)/smoke_test.log && \
		echo "✅ TEST PASS: Inverter is switching!" || \
		(echo "❌ TEST FAIL: Check $(RES_DIR)/smoke_test.log" && exit 1)
	@echo "✅ Smoke Test Finished. Results in $(RES_DIR)/smoke_test.raw"

precheck: smoke
	@echo "🔎 Running repo precheck..."
	@test -f admin/pinout_definition.csv || (echo "❌ Missing: admin/pinout_definition.csv" && exit 1)
	@test -f docs/specifications.md || (echo "❌ Missing: docs/specifications.md" && exit 1)
	@test -f docs/pinout.md || (echo "❌ Missing: docs/pinout.md" && exit 1)
	@echo "✅ Precheck OK."

package:
	@echo "📦 Assembling Tapeout Package..."
	@mkdir -p $(DELIVERY)/gds $(DELIVERY)/reports $(DELIVERY)/docs
	@echo "   -> Copying docs + pinout definition..."
	@cp admin/pinout_definition.csv $(DELIVERY)/docs/
	@cp docs/specifications.md $(DELIVERY)/docs/
	@cp docs/pinout.md $(DELIVERY)/docs/
	@echo "⚠️  Reminder: Manually copy your FINAL GDS to $(DELIVERY)/gds/"
	@echo "✅ Package structure created in $(DELIVERY)"

clean:
	@echo "🧹 Cleaning workspace..."
	@mkdir -p $(ART_DIR) $(RES_DIR) $(VERIFY_REP)
	@find $(ART_DIR) -mindepth 1 -not -name .keep -delete
	@find $(RES_DIR) -mindepth 1 -not -name .keep -delete
	@find $(VERIFY_REP) -mindepth 1 -not -name .keep -delete
	@echo "✨ Workspace clean."
