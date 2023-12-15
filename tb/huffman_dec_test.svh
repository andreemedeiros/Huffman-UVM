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
class huffman_dec_test extends uvm_test;
  `uvm_component_utils(huffman_dec_test)

  huffman_dec_env env;

  function new(string name = "huffman_dec_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = huffman_dec_env::type_id::create("env", this);
  endfunction

  virtual task run_test1();
    huffman_dec_sequence seq1;
    seq1 = huffman_dec_sequence::type_id::create("seq1");
    seq1.start(env.agent.sequencer);
  endtask

  virtual task run_test2();
    huffman_dec_sequence seq2;
    seq2 = huffman_dec_sequence::type_id::create("seq2");
    seq2.start(env.agent.sequencer);
  endtask

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    run_test1();
    run_test2();
    phase.drop_objection(this);
  endtask

endclass

