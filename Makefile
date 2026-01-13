# Open Analog Repo Template v0.1 - Functional Version

# Configuração de Ferramentas
SPICE = ngspice
SPICE_FLAGS = -b

# Caminhos
TB_DIR = sim/tb
RES_DIR = sim/results

.PHONY: help smoke clean tapeout

help:
	@echo "Open Analog Repo Template v0.1"
	@echo "------------------------------"
	@echo "  make smoke   -> Simula o Inversor (Hello World) para validar o ambiente"
	@echo "  make clean   -> Limpa arquivos temporários (raw, log, etc)"
	@echo "  make tapeout -> Gera o pacote final (Placeholder)"

smoke:
	@echo "🚀 Iniciando Smoke Test..."
	@mkdir -p $(RES_DIR)
	@$(SPICE) $(SPICE_FLAGS) $(TB_DIR)/tb_smoke.spice
	@echo "✅ Smoke Test Finalizado. Resultados em $(RES_DIR)/smoke_test.raw"

clean:
	@echo "🧹 Limpando workspace..."
	rm -f artifacts/* rm -f $(RES_DIR)/*.raw $(RES_DIR)/*.out
	@echo "✨ Tudo limpo."

tapeout:
	@echo "📦 Montando pacote de entrega..."
	@echo "⚠️  Funcionalidade prevista para v0.2"