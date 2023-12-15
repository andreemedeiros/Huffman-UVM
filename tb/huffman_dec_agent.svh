/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 23/11/23
E-mail        : andre.escariao1@gmail.com

Arquivo: huffman_dec_agent.svh
Descrição: Agente do decodificador de Huffman. No método build_phase, 
o agente cria instâncias do driver, do monitor e do sequenciador. Ele 
então conecta o driver ao sequenciador. Ele também tenta obter a 
interface do banco de dados de configuração UVM. Se a obtenção falhar, 
ele emite uma mensagem fatal. No método connect_phase, o agente conecta 
o driver e o monitor à interface.
------------------------------------------------------------------*/

class huffman_dec_agent extends uvm_agent;
  `uvm_component_utils(huffman_dec_agent)

  // Declare o driver, o monitor e o sequenciador
  huffman_dec_driver driver;
  huffman_dec_monitor monitor;
  uvm_sequencer #(huffman_dec_transaction) sequencer;

  // Declare a interface
  virtual huffman_dec_if intf;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Crie o driver, o monitor e o sequenciador
    driver = huffman_dec_driver::type_id::create("driver", this);
    monitor = huffman_dec_monitor::type_id::create("monitor", this);
    sequencer = uvm_sequencer #(huffman_dec_transaction)::type_id::create("sequencer", this);

    // Conecte o driver ao sequenciador
    driver.sequencer = sequencer;

    // Obtenha a interface
    if (!uvm_config_db #(virtual huffman_dec_if)::get(this, "", "intf", intf)) begin
      `uvm_fatal("NOVINTF", "`uvm_config_db #(virtual huffman_dec_if)::get() failed")
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    // Conecte o driver e o monitor à interface
    driver.intf = intf;
    monitor.intf = intf;
  endfunction
endclass

