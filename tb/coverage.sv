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
class huffman_dec_coverage extends uvm_subscriber #(huffman_dec_transaction);
  `uvm_component_utils(huffman_dec_coverage)

  // Declare os bins de cobertura
  covergroup cg_input @(posedge intf.clk);
    coverpoint in {
      bins range[0:31] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
    }
  endgroup

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void write(huffman_dec_transaction t);
    // Atualize a cobertura com base na transação
    cg_input.sample();
  endfunction
endclass