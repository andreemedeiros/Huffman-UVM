/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 23/11/23
E-mail        : andre.escariao1@gmail.com

Arquivo       : huffman_dec_driver.svh
Descrição     : Driver do decodificador de Huffman. Ele estende a classe
uvm_driver com a transação huffman_dec_transaction. O driver declara uma
interface huffman_dec_if. Ele define uma tarefa run_phase, que é um loop
infinito que dirige transações para o DUT. Ele recebe uma transação do 
sequenciador, dirige a transação para o DUT e indica que a transação foi 
concluída. A lógica para dirigir a transação depende do tipo da transação.
Se o tipo for TYPE1, ele escreve os dados da transação na interface. 
Se o tipo for TYPE2, ele lê o endereço da transação da interface. 
Para qualquer outro tipo, ele escreve os dados da transação na interface.
------------------------------------------------------------------*/
class huffman_dec_driver extends uvm_driver #(huffman_dec_transaction);
  `uvm_component_utils(huffman_dec_driver)

  // Declare a interface
  virtual huffman_dec_if intf;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    // Loop infinito para dirigir transações para o DUT
    forever begin
      // Receba uma transação do sequenciador
      seq_item_port.get_next_item(req);

      // Dirija a transação para o DUT
      // Adicione lógica para dirigir diferentes tipos de transações
      if (req.type == TYPE1) begin
        // Dirija uma transação do tipo 1
        intf.write(req.data);
      end else if (req.type == TYPE2) begin
        // Dirija uma transação do tipo 2
        intf.read(req.addr);
      end else begin
        // Dirija uma transação padrão
        intf.write(req.data);
      end

      // Indique que a transação foi concluída
      seq_item_port.item_done();
    end
  endtask
endclass

