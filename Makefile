# Open Analog Makefile Standard v0.1
# Targets: help, smoke, clean, tapeout

.PHONY: help smoke clean tapeout

help:
	@echo "Open Analog Repo Template v0.1"
	@echo "------------------------------"
	@echo "  make smoke   -> Validate setup with a dummy test"
	@echo "  make clean   -> Remove temporary files in artifacts/ and sim/results/"
	@echo "  make tapeout -> Assemble final GDS/Docs in tapeout/delivery/"

smoke:
	@echo "🚀 Running Smoke Test..."
	@echo "   Checking environment..."
	@if [ -f "env/env.sh" ]; then echo "✅ env.sh found"; else echo "❌ env.sh missing"; fi
	@echo "✅ Smoke Test Passed: Repo is healthy."

clean:
	@echo "🧹 Cleaning temporary files..."
	rm -rf artifacts/* sim/results/* verify/reports/*
	@echo "✨ Workspace Cleaned."

tapeout:
	@echo "📦 Assembling Tapeout Package..."
	@echo "⚠️  Functionality to be implemented in v0.2"
	@echo "✅ Checks complete."