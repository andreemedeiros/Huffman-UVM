/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 23/11/23
E-mail        : andre.escariao1@gmail.com

Arquivo       : huffman_dec_refmod.svh
Descrição     : Modelo de Referência Simplificado do Decodificador de 
Huffman. O modelo de referência tem um relógio, um sinal de reset, uma 
entrada de 6 bits e uma saída de 6 bits. Ele define um bloco always_ff
que é sensível ao flanco de subida do relógio ou ao flanco de subida do
reset. Se o reset estiver ativo, ele inicializa a saída para 0. Caso 
contrário, ele executa uma lógica de decodificação Huffman, que é 
implementada como um bloco case. Para cada valor possível da entrada, 
ele define um valor correspondente para a saída. Se a entrada não 
corresponder a nenhum dos casos, a saída é definida como 0.
------------------------------------------------------------------*/

// Modelo de Referência Simplificado o para o Decodificador Huffman
class huffman_dec_refmod(input logic clock, input logic reset, input logic [5:0] in, output logic [5:0] out);
    `uvm_component_utils(huffman_dec_refmod)
    always_ff @(posedge clock or posedge reset) begin
        if (reset) begin
            // Inicialize a saída
            out <= 6'b0;
        end else begin
            // Lógica de decodificação Huffman
            case (in)
                6'b000000: out <= 6'b000001;
                6'b000001: out <= 6'b000010;
                6'b000010: out <= 6'b000011;
                6'b000011: out <= 6'b000100;
                6'b000100: out <= 6'b000101;
                6'b000101: out <= 6'b000110;
                6'b000110: out <= 6'b000111;
                6'b000111: out <= 6'b001000;
                // Adicione mais casos conforme necessário
                default: out <= 6'b0; // Valor padrão se a entrada não corresponder a nenhum caso
            endcase
        end
    end
endclass
