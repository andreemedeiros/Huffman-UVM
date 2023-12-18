-> Para executar o ambiente de verificação pode ser utilizado o comando "make" que executa o makefile contendo a execução de todos os arquivos.


*** Plano de verificação ***

- Introdução:

	- O objetivo é verificar a funcionalidade do decodificador de Huffman.

- Níveis de abstração:

	- O módulo será verificado como um todo, considerando suas entradas e saídas.

- Tecnologia de Verificação:

	- A verificação será realizada utilizando a metodologia UVM (Universal Verification Methodology) em um ambiente de verificação funcional.

- Modelo de referência a ser usado:

	- O modelo de referência será o próprio decodificador de Huffman.

- Transações:

	- As transações serão definidas pela classe huffman_dec_transaction.

- Fluxograma da verificação:

	- Inicia-se com a criação de um testbench.
	- Implementa-se o modelo de referência.
	- Implementa-se o sequenciador e conecta-se à entrada do modelo de referência.
	- Implementa-se o agente huffman_dec_agent dentro do ambiente do testbench e conecta-se o driver dele ao sequenciador e o monitor dele ao modelo de referência.
	- Implementa-se o comparador e conecta-se, de um lado, ao agente huffman_dec_agent, e, do outro lado, ao modelo de referência.
	- Conecta-se o agente huffman_dec_agent ao DUT (Device Under Test).

- Definições dos estímulos:

	- Os estímulos serão definidos pelas sequências de teste que serão enviadas ao DUT através do sequenciador.

- Cobertura:

	- A cobertura será monitorada pelo modelo de cobertura huffman_dec_coverage, que verificará se todas as partes do design foram exercitadas.

- Plano de recursos:

	- Será necessária uma licença Cadence/Xcelium para a simulação.

- Referências:

	- Documentação UVM, Cadence Xcelium.

