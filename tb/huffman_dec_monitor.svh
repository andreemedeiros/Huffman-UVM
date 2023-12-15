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
class huffman_dec_monitor extends uvm_monitor;
  `uvm_component_utils(huffman_dec_monitor)

  // Declare a interface
  virtual huffman_dec_if intf;

  // Declare a análise port
  uvm_analysis_port #(huffman_dec_transaction) ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    huffman_dec_transaction tr;

    // Loop infinito para monitorar as saídas do DUT
    forever begin
      // Espere até que a saída seja válida
      @(posedge intf.valid);

      // Crie uma nova transação
      tr = huffman_dec_transaction::type_id::create("tr");

      // Preencha a transação com os valores de saída do DUT
      tr.out = intf.out;

      // Envie a transação para a análise port
      ap.write(tr);
    end
  endtask
endclass

