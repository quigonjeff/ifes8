%%% Classe de documento para confecção de trabalhos acadêmicos do
%%% Instituto Federal do Espírito Santo (Ifes). Em conformidade com as
%%% normas estabelecidas no documento “Normas para Apresentação de
%%% Trabalhos Acadêmicos e Científicos: Documento Impresso e/ou
%%% Digital”, 7ª edição -- 2014.
%%% 
%%% Esta classe é baseada na classe abnTeX2 versão 1.9.6 de 26 de
%%% fevereiro de 2016 [http://www.abntex.net.br/], que por sua vez é
%%% baseada na classe memoir.
%%% 
%%% Autor: Prof. Jefferson O. Andrade <jefferson.andrade@ifes.edu.br>
%%% Data: 2016-02-14

\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{tccifes}[2016/03/25 Classe de trabalhos acadêmicos do Ifes]

\RequirePackage{ifthen}

%%% As opções de estilo de fontes são `arial' e `times'. Na verdade
%%% estas opções carregam as fontes Helvetica e Latin Modern, que são
%%% superiores tipograficamente às fontes Arial e Times New Roman,
%%% respectivamente.
\newboolean{IFEStimes}
\setboolean{IFEStimes}{true}

\DeclareOption{times}{\setboolean{IFEStimes}{true}}
\DeclareOption{arial}{\setboolean{IFEStimes}{false}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
\ProcessOptions\relax
\LoadClass{abntex2}


%%% Configuração das margens do documento.
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout


%%% Configura a fonte para serifada (Latin Modern) ou sem serifa
%%% (Helvética) conforme o valor da variável `times'. O padrão é
%%% `times=true'. 
\RequirePackage[T1]{fontenc}
\ifthenelse{\boolean{IFEStimes}}{
  \RequirePackage{lmodern}
}{
  \RequirePackage{helvet}
  \RequirePackage[helvet]{sfmath}
  \renewcommand{\familydefault}{\sfdefault}
}


%%% Reconfiguração dos tamanhos das fontes de legendas para “fonte
%%% reduzida”.
% \captionnamefont{\ABNTEXfontereduzida}
% \captiontitlefont{\ABNTEXfontereduzida}


%%% Nomes constantes
\newcommand{\declaracaodoautorname}{Declara\c{c}\~{a}o do Autor}

%%% Comandos de dados
\providecommand{\imprimircurso}{}
\newcommand{\curso}[1]{\renewcommand{\imprimircurso}{#1}}

\providecommand{\imprimirautorficha}{}
\newcommand{\autorficha}[1]{\renewcommand{\imprimirautorficha}{#1}}

%%% Numeração contínua de equações
\counterwithout{equation}{chapter}

%%% Redefinição do comando de impressão da capa
\renewcommand{\imprimircapa}{%
  \begin{capa}
    \center
    {\ABNTEXchapterfont\Large\MakeTextUppercase{\imprimirinstituicao}}\par
    {\ABNTEXchapterfont\Large\MakeTextUppercase{\imprimircurso}}
    
    \vspace*{2.5cm}

    {\ABNTEXchapterfont\large\MakeTextUppercase{\imprimirautor}}

    \vspace*{2.5cm}
    
    \begin{center}
      \ABNTEXchapterfont\bfseries\LARGE\MakeTextUppercase{\imprimirtitulo}
    \end{center}
    
    \vfill

    \large\imprimirlocal

    \large\imprimirdata

    \vspace*{1cm}
  \end{capa}
}


%%% Redefinição do comando de impressão da folha de rosto.
%%% Para esta parte do código é necessário que o caracter arroba `@'
%%% seja tratado como uma letra pelo LaTeX.
\makeatletter
\renewcommand{\folhaderostocontent}{
  \begin{center}
    {\ABNTEXchapterfont\Large\MakeTextUppercase{\imprimirautor}}

    \vspace*{2.5cm}

    {\ABNTEXchapterfont\bfseries\Large\MakeTextUppercase{\imprimirtitulo}}

    \vspace*{\fill}

    \abntex@ifnotempty{\imprimirpreambulo}{%
      \hspace{.45\textwidth}
      \begin{minipage}{.5\textwidth}
        \SingleSpacing
        \imprimirpreambulo
      \end{minipage}%
    }%

    \vspace{1.5cm}

    \hspace{0.45\textwidth}
    \begin{minipage}{0.5\textwidth}
      {\large\imprimirorientadorRotulo~\imprimirorientador}
      \abntex@ifnotempty{\imprimircoorientador}{%
        \par
        {\large\imprimircoorientadorRotulo~\imprimircoorientador}%
      }
    \end{minipage}

    \vspace*{\fill}

    {\large\imprimirlocal}
  
    \par
  
    {\large\imprimirdata}
    \vspace*{1cm}
  \end{center}
}
\makeatother

%%% ---
%%% Declaração do Autor
\newenvironment{declaracaodoautor}[1][\declaracaodoautorname]{%
  \pretextualchapter{#1}
}{\PRIVATEclearpageifneeded}
% ---



\endinput

%%% Local Variables:
%%% ispell-local-directory: "brasileiro"
%%% End:
