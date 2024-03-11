#include <stdio.h>
extern "C" int refmod_dec(int x)
{

  if (reset)
  {
    // Inicialize a saída
    out = 0b000000;
  }
  else
  {
    // Lógica de decodificação Huffman
    switch (in)
    {
    case 0b000000:
      out = 0b000001;
      break;
    case 0b000001:
      out = 0b000010;
      break;
    case 0b000010:
      out = 0b000011;
      break;
    case 0b000011:
      out = 0b000100;
      break;
    case 0b000100:
      out = 0b000101;
      break;
    case 0b000101:
      out = 0b000110;
      break;
    case 0b000110:
      out = 0b000111;
      break;
    case 0b000111:
      out = 0b001000;
      break;
    // Adicione mais casos conforme necessário
    default:
      out = 0b000000; // Valor padrão se a entrada não corresponder a nenhum caso
    }
  }

  return out;
}
