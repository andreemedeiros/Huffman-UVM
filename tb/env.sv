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

class env extends uvm_env;

    agent       mst;
    scoreboard  sb;
    coverage    cov;
    
    `uvm_component_utils(env)

    function new(string name, uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mst = agent::type_id::create("mst", this);
        sb = scoreboard::type_id::create("sb", this);
        cov = coverage::type_id::create("cov",this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        mst.agt_req_port.connect(cov.req_port);
        mst.agt_resp_port.connect(sb.ap_comp);
        mst.agt_req_port.connect(sb.ap_rfm);
    endfunction
endclass