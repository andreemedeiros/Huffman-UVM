/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 23/11/23
E-mail        : andre.escariao1@gmail.com

Arquivo       : huffman_dec_if.sv
Descrição     : Interface do decodificador de Huffman. A interface tem 
um relógio, um sinal de reset, uma entrada de 8 bits, uma saída de 8 
bits e um sinal de validade. Ele define um bloco de clocking chamado 
cb que é sensível ao flanco de subida do relógio. O bloco de clocking 
tem um atraso de entrada padrão de 1 passo e um atraso de saída padrão
de 1 passo. Ele define os sinais de reset, entrada, saída e validade 
como entradas e saídas do bloco de clocking.
------------------------------------------------------------------*/
interface huffman_dec_if(input logic clk);
  logic reset;
  logic [7:0] in;
  logic [7:0] out;
  logic valid;

  // Clocking block para sincronizar as operações do driver e do monitor
  clocking cb @(posedge clk);
    default input #1step output #1step;
    inout reset, in, out, valid;
  endclocking
endinterface

