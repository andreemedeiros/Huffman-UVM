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
class agent extends uvm_agent;
    
    typedef uvm_sequencer#(transaction_in) sequencer;
    sequencer  sqr;
    driver   drv;
    monitor  mon;

    uvm_analysis_port #(transaction_in) agt_req_port;
    uvm_analysis_port #(transaction_out) agt_resp_port;

    `uvm_component_utils(agent)

    function new(string name = "agent", uvm_component parent = null);
        super.new(name, parent);
        agt_req_port  = new("agt_req_port", this);
        agt_resp_port = new("agt_resp_port", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon = monitor::type_id::create("mon", this);
        sqr = sequencer::type_id::create("sqr", this);
        drv = driver::type_id::create("drv", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        mon.req_port.connect(agt_req_port);
        mon.resp_port.connect(agt_resp_port);
        drv.seq_item_port.connect(sqr.seq_item_export);
    endfunction
endclass: agent