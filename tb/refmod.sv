/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 23/11/23
E-mail        : andre.escariao1@gmail.com

Arquivo       : huffman_dec_refmod.svh
Descrição     : Modelo de Referência Simplificado do Decodificador de 
Huffman. O modelo de referência tem um relógio, um sinal de reset, uma 
entrada de 6 bits e uma saída de 6 bits. Ele define um bloco always_ff
que é sensível ao flanco de subida do relógio ou ao flanco de subida do
reset. Se o reset estiver ativo, ele inicializa a saída para 0. Caso 
contrário, ele executa uma lógica de decodificação Huffman, que é 
implementada como um bloco case. Para cada valor possível da entrada, 
ele define um valor correspondente para a saída. Se a entrada não 
corresponder a nenhum dos casos, a saída é definida como 0.
------------------------------------------------------------------*/
import "DPI-C" context function int refmod_dec(int y);

// Modelo de Referência 
class refmod extends uvm_component;
    `uvm_component_utils(refmod)
    
    transaction_in tr_in;
    transaction_out tr_out;
    
    uvm_analysis_imp #(transaction_in, refmod) in;
    uvm_analysis_port #(transaction_out) out;
    
    event begin_refmodtask, begin_record, end_record;

    function new(string name = "refmod", uvm_component parent);
        super.new(name, parent);
        in = new("in", this);
        out = new("out", this);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        tr_out = transaction_out::type_id::create("tr_out", this);
    endfunction: build_phase
    
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        fork
            refmod_task();
            record_tr();
        join
    endtask: run_phase

    task refmod_task();
        forever begin
            @begin_refmodtask;
            tr_out = transaction_out::type_id::create("tr_out", this);
            -> begin_record;
            tr_out.result = refmod_dec(tr_in.data);
            #10;
            -> end_record;
            out.write(tr_out);
        end
    endtask : refmod_task

    virtual function write (transaction_in t);
        tr_in = transaction_in#()::type_id::create("tr_in", this);
        tr_in.copy(t);
       -> begin_refmodtask;
    endfunction

    virtual task record_tr();
        forever begin
            @(begin_record);
            begin_tr(tr_out, "refmod");
            @(end_record);
            end_tr(tr_out);
        end
    endtask
endclass: refmod
