/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 23/11/23
E-mail        : andre.escariao1@gmail.com

Arquivo       : huffman_dec_test.svh
Descrição     : Teste do decodificador de Huffman. Ele estende a classe
uvm_test. O teste declara um ambiente huffman_dec_env. No construtor, 
ele chama o construtor da classe base com o nome e o componente pai 
fornecidos. No método build_phase, ele cria uma instância do ambiente. 
Ele define duas tarefas, run_test1 e run_test2, cada uma das quais cria 
uma sequência e a inicia no sequenciador do agente no ambiente. Na tarefa 
run_phase, ele levanta uma objeção para indicar que o teste está em andamento,
executa as duas tarefas de teste e então solta a objeção para indicar que o 
teste está concluído.
------------------------------------------------------------------*/
class simple_test extends uvm_test;
  env env_h;
  sequence_in seq;

  `uvm_component_utils(simple_test)

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_h = env::type_id::create("env_h", this);
    seq = sequence_in::type_id::create("seq", this);

  endfunction

  task run_phase(uvm_phase phase);
    seq.start(env_h.mst.sqr);
  endtask: run_phase

endclass
