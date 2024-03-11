/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 23/11/23
E-mail        : andre.escariao1@gmail.com

Arquivo       : huffman_dec_pkg.sv
Descrição     : Pacote do decodificador de Huffman. Ele define um pacote
para o decodificador de Huffman. Ele inclui arquivos de cabeçalho e 
importa os pacotes UVM e BVM. O pacote define um tipo de enumeração 
chamado transaction_type com os valores TYPE1 e TYPE2.
------------------------------------------------------------------*/
`include "uvm_macros.svh"

package huffman_dec_pkg;

  import uvm_pkg::*;
  import bvm_pkg::*;

  // Defina os tipos TYPE1 e TYPE2
  typedef enum {TYPE1, TYPE2} transaction_type;

  `include "huffman_dec_transaction.svh"
  `include "huffman_dec_sequence.svh"
  `include "huffman_dec_driver.svh"
  `include "huffman_dec_monitor.svh"
  `include "huffman_dec_agent.svh"
  `include "huffman_dec_env.svh"
  `include "huffman_dec_test.svh"

endpackage
