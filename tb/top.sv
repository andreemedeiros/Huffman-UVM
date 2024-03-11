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
  import pkg::*;

  logic clk;
  logic rst;

  initial begin
    clk = 0;
    rst = 1;
  end

  always #10 clk = !clk;

  // Declare a interface e o DUT
  interface_if dut_if(.clk(clk), .rst(rst));

  huffman_dec dut(
              .clk_i(clk),
              .rstn_i(rst),
              .S(SX),
  );

  initial begin
    `ifdef XCELIUM
       $recordvars();
    `endif
    `ifdef VCS
       $vcdpluson;
    `endif
    `ifdef QUESTA
       $wlfdumpvars();
       set_config_int("*", "recording_detail", 1);
    `endif

    uvm_config_db#(interface_vif)::set(uvm_root::get(), "*", "vif", dut_if);

    run_test("simple_test");
  end

endmodule

