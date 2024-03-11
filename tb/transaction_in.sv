/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 23/11/23
E-mail        : andre.escariao1@gmail.com

Arquivo       : huffman_dec_transaction.svh
Descrição     : Transação do decodificador de Huffman. Estende a classe 
uvm_sequence_item. A transação declara uma variável de entrada de 8 bits.
Ele chama o construtor da classe base com o nome fornecido. Ele também
define um método convert2string que retorna uma representação de string 
da transação. A representação de string é a string "in=" seguida pelo 
valor da entrada formatado como um número decimal.
------------------------------------------------------------------*/

class transaction_in extends uvm_sequence_item;
  rand bit [7:0] data;

  function new(string name = "");
    super.new(name);
  endfunction

  `uvm_object_param_utils_begin(transaction_in)
    `uvm_field_int(data, UVM_UNSIGNED)
  `uvm_object_utils_end

  function string convert2string();
    return $sformatf("{data = %d}",data);
  endfunction
endclass

