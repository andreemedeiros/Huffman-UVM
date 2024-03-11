# Variáveis
UVM_HOME := $(UVMHOME)
XRUN := xrun -64bit -uvm
SVSEED ?= random
UVM_VERBOSITY ?= UVM_LOW
UVM_TESTNAME ?= random_test
DEBUG ?= 0

XRUN_OPTS := -timescale 1ns/1ns -access +rwc -coverage all -covoverwrite +SVSEED=$(SVSEED)
TCL_SCRIPT := -input ../shm/shm.tcl 

# Adicione -gui para ativar a GUI
ifeq ($(GUI),1)
XRUN_OPTS += -gui
endif

# Adicione flags de depuração se DEBUG estiver definido
ifeq ($(DEBUG),1)
XRUN_OPTS += -debug
endif

UVM_OPTS := -uvmhome $(UVM_HOME) +UVM_VERBOSITY=$(UVM_VERBOSITY) +UVM_NO_RELNOTES +UVM_TESTNAME=$(UVM_TESTNAME) -covtest $(UVM_TESTNAME) \
            +uvm_set_config_int=*,recording_detail,1
TB_DIR := ./tb
RTL_DIR := ./rtl
INC_DIRS := -incdir $(TB_DIR) -incdir $(RTL_DIR)
FILES := $(TB_DIR)/pkg.sv \
         $(TB_DIR)/if.sv \
         $(RTL_DIR)/huffman_dec.sv \
         $(TB_DIR)/top.sv 

all: clean sim

sim: 
	@$(XRUN) $(INC_DIRS) $(FILES) \
		$(UVM_OPTS) $(XRUN_OPTS)

clean:
	@rm -rf xrun.* xcelium.d simv.daidir INCA_libs waves.shm dump.vcd cov_work/ *.history *.log *.key *.db mdv.log imc.log imc.key ncvlog_*.err *.trn *.dsn .simvision/ simvision* xcelium.d simv.daidir *.so *.o *.err

view_waves:
	simvision waves.shm &

help:
	@echo "Usage: make [TARGET] [VARIABLE=VALUE]"
	@echo ""
	@echo "Targets:"
	@echo "  sim         - Run simulation with the current configuration"
	@echo "  clean       - Clean up the simulation artifacts"
	@echo "  view_waves  - Open waveform viewer with the generated waveform file"
	@echo ""
	@echo "Variables:"
	@echo "  UVM_VERBOSITY - Set UVM verbosity level (default: UVM_LOW)"
	@echo "  UVM_TESTNAME  - Set UVM test name to run (default: random_test)"
	@echo "  SVSEED        - Set the seed for randomization (default: random)"
	@echo "  GUI           - Set to 1 to enable GUI mode in simulation (default: 0)"
	@echo "  DEBUG         - Set to 1 to enable debug flags (default: 0)"
