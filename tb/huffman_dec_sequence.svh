/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 23/11/23
E-mail        : andre.escariao1@gmail.com

Arquivo       : huffman_dec_sequence.svh
Descrição     : Sequenciador do decodificador de Huffman. Ele define uma
tarefa body, que cria uma nova transação e preenche a transação com valores
de entrada para o DUT. Ele faz isso em um loop, criando uma nova transação
para cada valor de i de 0 a 31. Para cada transação, ele chama start_item 
para iniciar a transação e finish_item para finalizá-la.
------------------------------------------------------------------*/
class huffman_dec_sequence extends uvm_sequence #(huffman_dec_transaction);
  `uvm_object_utils(huffman_dec_sequence)

  function new(string name = "huffman_dec_sequence");
    super.new(name);
  endfunction

  virtual task body();
    huffman_dec_transaction tr;

    // Crie uma nova transação
    tr = huffman_dec_transaction::type_id::create("tr");

    // Preencha a transação com os valores de entrada para o DUT
    for (int i = 0; i < 32; i++) begin
      tr.in = i;
      start_item(tr);
      finish_item(tr);
    end
  endtask

endclass

