/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 23/11/23
E-mail        : andre.escariao1@gmail.com

Arquivo       : huffman_dec_env.svh
Descrição     : Ambiente do decodificador de Huffman. O ambiente declara um agente
huffman_dec_agent e uma interface huffman_dec_if. No método build_phase,
ele cria uma instância do agente, obtém a interface do banco de dados 
de configuração UVM e configura a interface para o agente. Se a obtenção
da interface falhar, ele emite uma mensagem fatal.
------------------------------------------------------------------*/
class huffman_dec_env extends uvm_env;
  `uvm_component_utils(huffman_dec_env)

  // Declare o agente
  huffman_dec_agent agent;

  // Declare a interface
  virtual huffman_dec_if intf;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Crie o agente
    agent = huffman_dec_agent::type_id::create("agent", this);

    // Obtenha a interface
    if (!uvm_config_db #(virtual huffman_dec_if)::get(this, "", "intf", intf)) begin
      `uvm_fatal("NOVINTF", "`uvm_config_db #(virtual huffman_dec_if)::get() failed")
    end

    // Configure a interface para o agente
    uvm_config_db #(virtual huffman_dec_if)::set(this, "agent", "intf", intf);
  endfunction
endclass

