/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 23/11/23
E-mail        : andre.escariao1@gmail.com

Arquivo       : huffman_dec_top.sv
Descrição     : Top level do decodificador de Huffman. O módulo declara
um relógio, uma interface e o DUT. No bloco initial, o módulo inicializa
o relógio para 0 e então o alterna a cada 10 unidades de tempo. Ele então
configura a interface para o teste UVM usando o banco de dados de 
configuração UVM. Se a configuração falhar, ele emite uma mensagem fatal.
Em seguida, ele executa o teste UVM chamado "huffman_dec_test".
------------------------------------------------------------------*/
module huffman_dec_top;
   import uvm_pkg::*;
   import test_pkg::*;

  // Declare o relógio
  reg clk;

  // Declare a interface e o DUT
  huffman_dec_if intf(.clk(clk));
  huffman_dec dut(intf);

  initial begin
    // Inicialize o relógio
    clk = 0;
    forever #10 clk = ~clk;

    // Configure a interface para o teste UVM
    if (!uvm_config_db #(virtual huffman_dec_if)::set(null, "*", "intf", intf)) begin
      $fatal("Falha ao definir interface");
    end

    // Execute o teste UVM
    run_test("huffman_dec_test");
  end
endmodule

