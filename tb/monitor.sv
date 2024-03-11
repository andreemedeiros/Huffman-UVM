/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 23/11/23
E-mail        : andre.escariao1@gmail.com

Arquivo       : huffman_dec_monitor.svh
Descrição     : Monitor do decodificador de Huffman. O monitor declara
uma interface huffman_dec_if e uma porta de análise para transações 
huffman_dec_transaction. Ele define uma tarefa run_phase, que é um loop
infinito que monitora as saídas do DUT. Ele espera até que a saída seja
válida, cria uma nova transação, preenche a transação com os valores de
saída do DUT e envia a transação para a porta de análise.
------------------------------------------------------------------*/

class monitor extends uvm_monitor;

    interface_vif  vif;
    event begin_record, end_record;
    transaction_in tr_in;
    transaction_out tr_out;
    uvm_analysis_port #(transaction_in) req_port;
    uvm_analysis_port #(transaction_out) resp_port;
    `uvm_component_utils(monitor)
   
    function new(string name, uvm_component parent);
        super.new(name, parent);
        req_port = new ("req_port", this);
        resp_port = new ("resp_port", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
         if(!uvm_config_db#(interface_vif)::get(this, "", "vif", vif)) begin
            `uvm_fatal("NOVIF", "failed to get virtual interface")
        end
        tr_in = transaction_in::type_id::create("tr_in", this);
        tr_out = transaction_out::type_id::create("tr_out", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        fork
            collect_transactions(phase);
        join
    endtask

    virtual task collect_transactions(uvm_phase phase);
        forever begin

            @(posedge vif.clk) begin
                
                if(!vif.busy_o) begin
                    @(posedge vif.busy_o);
                    begin_tr(tr_in, "req");
                    tr_in.data = vif.dt_i;
                    req_port.write(tr_in);
                    @(negedge vif.clk);
                    end_tr(tr_in);
                end
                else if(vif.busy_o)begin
                    @(negedge vif.busy_o);
                    begin_tr(tr_out, "resp");
                    tr_out.result = vif.dt_o;
                    resp_port.write(tr_out);
                    @(negedge vif.clk);
                    end_tr(tr_out);
                end
            end
        end
    endtask
endclass