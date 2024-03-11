/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 23/11/23
E-mail        : andre.escariao1@gmail.com

Arquivo       : huffman_dec_coverage.svh
Descrição     : Modelo de cobertura para o decodificador de Huffman. 
A classe huffman_dec_coverage estende a classe uvm_subscriber com a 
transação huffman_dec_transaction. Ela define um grupo de cobertura 
cg_input que é amostrado no flanco de subida do relógio. O grupo de 
cobertura tem um ponto de cobertura in que tem bins para todos os 
possíveis valores de entrada. No método write, ele atualiza a cobertura
com base na transação, amostrando o grupo de cobertura.
------------------------------------------------------------------*/
class coverage extends uvm_component;

  `uvm_component_utils(coverage)

  transaction_in req;
  uvm_analysis_imp#(transaction_in, coverage) req_port;

  int min_tr;
  int n_tr = 0;

  event end_of_simulation;

  function new(string name = "coverage", uvm_component parent= null);
    super.new(name, parent);
    req_port = new("req_port", this);
    req=new;
    min_tr = 10000;
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase (phase);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    @(end_of_simulation);
    phase.drop_objection(this);
  endtask: run_phase

  
  function void write(transaction_in t);
    n_tr = n_tr + 1;
    if(n_tr >= min_tr)begin
      ->end_of_simulation;
    end
  endfunction: write

endclass : coverage