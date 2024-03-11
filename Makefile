# Makefile para compilar e executar com o xrun

# Nome dos arquivos SV (coloque os nomes reais aqui)
SV_FILES = huffman_dec_pkg.sv huffman_dec.sv huffman_dec_if.sv huffman_dec_transaction.svh huffman_dec_driver.svh huffman_dec_monitor.svh huffman_dec_agent.svh huffman_dec_env.svh huffman_dec_sequence.svh huffman_dec_test.svh huffman_dec_top.sv huffman_dec_refmod.svh



# Comando para compilar e executar
xrun:
	xrun -sv $(SV_FILES)

# Comando para limpar arquivos temporários
clean:
	rm -rf INCA_libs xcelium.d simv simv.daidir csrc ucli.key xrun.history

# Define a regra "all" para compilar e executar
all: xrun

# Define a regra padrão quando "make" é executado sem argumentos
.DEFAULT_GOAL := all
