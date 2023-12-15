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
class huffman_dec_transaction extends uvm_sequence_item;
  `uvm_object_utils(huffman_dec_transaction)

  // Declare a variável de entrada
  bit [7:0] in;

  function new(string name = "");
    super.new(name);
  endfunction

  // Função para converter a transação em uma string
  virtual function string convert2string();
    return $sformatf("in=%0d", in);
  endfunction
endclass


