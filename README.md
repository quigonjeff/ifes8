Classe LaTeX para Trabalhos Acadêmicos do Ifes
==============================================

Este repositório contém a classe para trabalhos acadêmicos em LaTeX
que implementa as “Normas para Apresentação de Trabalhos Acadêmicos e
Científicos: Documento Impresso e/ou Digital”, 7ª edição, de 2014 do
Instituto Federal do Espírito Santo (Ifes). A classe possibilita a
criação de um trabalho acadêmico completo, com inserção de elementos
pré-textuais (capa, folha de rosto, ficha catalográfica, epígrafe,
dedicatória, sumário e listas de figuras, tabelas, algoritmos, siglas
e símbolos), passando pelo corpo do texto e elementos pós-textuais
(índice remissivo, referências bibliográficas, apêndices e anexos).

A classe `ifes7.cls` é essencialmente uma customização da classe
=abntex2= juntamente com a inclusão e pré-configuração de alguns
outros pacotes necessários para implementar as normas do Ifes.
Assim sendo, esta classe depende da classe `abntex2`.

No manual, os usuários encontrarão informações sobre a utilização
desta classe, seus comandos e algumas boas práticas para que o
trabalho fique no formato desejado pela biblioteca.


Instalação
----------

A versão mais recente da classe pode sempre ser encontrada no GitHub.

Utilização
----------

A classe pode ser usada adicionando a linha

``` tex
\documentclass[12pt,times,a4paper,english,brazil,
chapter=TITLE,section=TITLE,subsection=TITLE]{ifes7}
```

no início do documento LaTeX. O manual descreve as funcionalidades da
classe. Dois modelos básicos prontos para compilação e alteração são
disponibilizados no repositório.

Licença
-------

Released under the LaTeX Project Public License v1.3c or later See
<http://www.latex-project.org/lppl.txt>.

