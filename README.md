# Ambiente de verificação para o Decodificador de Huffman.

## Índice
- [Plano de Verificação](#Plano-de-Verificação)
- [Estrutura do ambiente UVM](#Estrutura-do-ambiente-UVM)
- [Recursos](#Recursos)
- [Simulação](#Simulação)
- [Autor](#Autor)
- [Licença](#Licença)

## Plano de Verificação

```
- O plano de verificação se encontra num arquivo PLAN dentro da pasta "tb".
```

## Estrutura do ambiente UVM
Ambiente básico de um testbench UVM.

![](png/tb.png)

### Recursos:

```
UVM 1.2

Licença Cadence/Xcelium.
```

## Simulação

Para utilizar a biblioteca UVM, adicione a linha de comando no bashrc:

```
vim ~/.bashrc
```

```
export UVMHOME="/Tools/cadence/XCELIUM2309/tools/methodology/UVM/CDNS-1.2"
```

Para iniciar a simulação utilize o comando make:

```
make
```

Para mais opções de simulação utilize o comando make help:

```
make help
```

Opções:
```
"Usage: make [TARGET] [VARIABLE=VALUE]"
""
"Targets:"
"  sim         - Run simulation with the current configuration"
"  clean       - Clean up the simulation artifacts"
"  view_waves  - Open waveform viewer with the generated waveform file"
""
"Variables:"
"  UVM_VERBOSITY - Set UVM verbosity level (default: UVM_LOW)"
"  UVM_TESTNAME  - Set UVM test name to run (default: random_test)"
"  SVSEED        - Set the seed for randomization (default: random)"
"  GUI           - Set to 1 to enable GUI mode in simulation (default: 0)"
"  DEBUG         - Set to 1 to enable debug flags (default: 0)"
```

## Autor

* **André Medeiros** - [André Medeiros](https://github.com/andreemedeiros)

Contribuição no projeto [Dec_Huffman_UVM](https://github.com/andreemedeiros/Dec_Huffman_UVM/graphs/contributors).

## Licença

Este projeto está licenciado sob a MIT License - veja a [LICENSE.md](LICENSE.md) para mais detalhes.
