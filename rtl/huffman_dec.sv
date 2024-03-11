// RTL Decodificador Huffman

// Módulo Decodificador Huffman
module huffman_decoder (
  input clk,        // Sinal de clock
  input reset,      // Sinal de Reset
  input S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, // Bits de entrada serialisados
  output [4:0] symbol // Saída do número do símbolo identificado
);
  
  // Tabela de decodificação Huffman
  parameter SYMBOL_1 = 5'b00000;
  parameter SYMBOL_2 = 5'b00001;
  parameter SYMBOL_3 = 5'b00010;
  parameter SYMBOL_4 = 5'b00011;
  parameter SYMBOL_5 = 5'b00100;
  parameter SYMBOL_6 = 5'b00101;
  parameter SYMBOL_7 = 5'b00110;
  parameter SYMBOL_8 = 5'b00111;
  parameter SYMBOL_9 = 5'b01000;
  parameter SYMBOL_10 = 5'b01001;
  parameter SYMBOL_11 = 5'b01010;
  parameter SYMBOL_12 = 5'b01011;
  parameter SYMBOL_13 = 5'b01100;
  parameter SYMBOL_14 = 5'b01101;
  parameter SYMBOL_15 = 5'b01110;
  parameter SYMBOL_16 = 5'b01111;
  parameter SYMBOL_17 = 5'b10000;
  parameter SYMBOL_18 = 5'b10001;
  
  // Variáveis de estado
  reg [4:0] current_symbol; // Símbolo atual
  reg [3:0] bit_count;      // Número de bits lidos para o símbolo atual
  reg [4:0] next_symbol;    // Próximo símbolo a ser decodificado
  
  // Declaração dos estados da máquina de estados finita (FSM)
  parameter IDLE = 2'b00;     // Estado inicial, aguardando o início de um novo símbolo
  parameter READ_BIT = 2'b01; // Lendo os bits do símbolo
  parameter OUTPUT = 2'b10;   // Saída do símbolo decodificado
  
  reg [1:0] state; // Estado atual da FSM

always @(posedge clk) begin
  if (reset) begin
    state <= IDLE;            // Reinicia a FSM quando o sinal de reset é ativado
    current_symbol <= 0;      // Reinicia o símbolo atual
    bit_count <= 0;           // Reinicia o contador de bits
    symbol <= 0;              // Reinicia a saída do símbolo
  end else begin
    case (state)
      IDLE: begin
        // Aguarda o início de um novo símbolo
        if (S1 == 1'b0 && S2 == 1'b1) begin
          state <= READ_BIT;                  // Muda para o estado READ_BIT quando o início de um novo símbolo é detectado
          bit_count <= 1;                     // Reinicia o contador de bits para 1
          next_symbol <= 0;                   // Reinicia o próximo símbolo a ser decodificado
        end
      end
      READ_BIT: begin
        // Lê os bits sequencialmente
        next_symbol = {next_symbol, S1};
        bit_count = bit_count + 1;
        // Verifica se já leu todos os bits do símbolo
        if (bit_count == 5) begin
          state <= OUTPUT;
          current_symbol <= next_symbol;
        end
      end
      OUTPUT: begin
        // Retorna o símbolo decodificado
        symbol <= current_symbol;
        state <= IDLE;
      end
    endcase
  end
end
  
endmodule
