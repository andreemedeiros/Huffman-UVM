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

class sequence_in extends uvm_sequence #(transaction_in);
    `uvm_object_utils(sequence_in)

    function new(string name="sequence_in");
        super.new(name);
    endfunction: new

    task body;
        transaction_in tr;

        forever begin
            tr = transaction_in::type_id::create("tr");
            start_item(tr);
            assert(tr.randomize());
            finish_item(tr);
        end
    endtask: body
endclass: sequence_in