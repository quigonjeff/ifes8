%%% Classe de documento para confecção de trabalhos acadêmicos do
%%% Instituto Federal do Espírito Santo (Ifes). Em conformidade com as
%%% normas estabelecidas no documento “Normas para Apresentação de
%%% Trabalhos Acadêmicos e Científicos: Documento Impresso e/ou
%%% Digital”, 8ª edição -- nov/2017.
%%% 
%%% Esta classe é baseada na classe abnTeX2 versão 1.9.6 de 26 de
%%% fevereiro de 2016 [http://www.abntex.net.br/], que por sua vez é
%%% baseada na classe memoir.
%%%
%%% Para a versão mais recente desta classe verifique:
%%% https://github.com/quigonjeff/ifes8
%%% 
%%% Autor: Prof. Jefferson O. Andrade <jefferson.andrade@ifes.edu.br>
%%% Data: 2018-02-22

\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{ifes8}[2021/07/01 Classe de trabalhos academicos do Ifes]

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
\LoadClass[12pt,a4paper,chapter=TITLE,section=TITLE]{abntex2}

\RequirePackage{hyperref}

\RequirePackage{enumitem}

\RequirePackage{ragged2e}

\RequirePackage[fleqn]{amsmath}

\RequirePackage{subcaption}


%%% Configuração das margens do documento.
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout


%%% Redefinição dos cabeçalhos
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{}
\makeoddhead{abntheadings}{}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{abntheadings}{0pt}{0pt}


%%% Configuração do espaçamento entre títulos e texto
\setlength{\afterchapskip}{0pt}

%%% Configuração do alinhamento da 1ª linha dos parágrafos.
\setlength{\parindent}{0mm}

%%% Espaçamento entre parágrafos
\setlength{\parskip}{12pt}

%%% Espaçamento entre itens de listas
\setlist{parsep=12pt,leftmargin=1.2em}

%%% Pelas normas do Ifes, as equações devem ser alinhadas à esquerda
\setlength{\mathindent}{0pt}

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
\captionnamefont{\ABNTEXfontereduzida}
\captiontitlefont{\ABNTEXfontereduzida}


%%% Formatação dos títulos: partes, capítulos, seções, subseções e
%%% subsubseções
\renewcommand{\ABNTEXchapterfont}{\fontseries{b}\selectfont}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize}
\renewcommand{\ABNTEXsectionfont}{\fontseries{m}\selectfont}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsectionfont}{\fontseries{b}\selectfont}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsubsectionfont}{\fontseries{m}\selectfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsubsubsectionfont}{\fontshape{it}\selectfont}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}


%%% Converte o título das seções para maiúsculas na TOC.
%%% Infelizmente, não funciona para seções. Vide manual da classe memoir.
% \makeatletter
% \ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{
%   \settocpreprocessor{section}{%
%     \let\tempf@rtoc\f@rtoc%
%     \def\f@rtoc{%
%       \texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
%   }
% }{}
% \makeatother

\addtolength{\cftlastnumwidth}{-1em}

\ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{%
  
  \cftsetindents{part}{0em}{\cftlastnumwidth}
  \cftsetindents{chapter}{0em}{\cftlastnumwidth}
  \cftsetindents{section}{0em}{\cftlastnumwidth}
  \cftsetindents{subsection}{0em}{\cftlastnumwidth}
  \cftsetindents{subsubsection}{0em}{\cftlastnumwidth}
  \cftsetindents{paragraph}{0em}{\cftlastnumwidth}
  \cftsetindents{subparagraph}{0em}{\cftlastnumwidth}
  % 
  \renewcommand{\tocprintchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{0em}{\cftlastnumwidth}}}
  % 
  \renewcommand{\tocinnonumchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}%
    \cftinserthook{toc}{A}}
  % 
  \renewcommand{\tocprintchapternonum}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}}
  % 
  \renewcommand{\tocpartapendices}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
    \cftinserthook{toc}{A}}
  % 
  \renewcommand{\tocpartanexos}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
    \cftinserthook{toc}{A}}
  % 

  % 
  % Fontes das entradas do sumario
  % 
  \renewcommand{\cftpartfont}{\bfseries\normalsize}
  % 
  \renewcommand{\cftchapterfont}{\bfseries\normalsize}
  \renewcommand{\cftchapterpagefont}{\cftchapterfont}
  % 
  \renewcommand{\cftsectionfont}{\mdseries\normalsize}
  \renewcommand{\cftsectionpagefont}{\cftsectionfont}
  % 
  \renewcommand{\cftsubsectionfont}{\bfseries\normalsize}
  \renewcommand{\cftsubsectionpagefont}{\mdseries\cftsubsectionfont}
  % 
  \renewcommand{\cftsubsubsectionfont}{\mdseries\normalsize}
  \renewcommand{\cftsubsubsectionpagefont}{\cftsubsubsectionfont}
  % 
  \renewcommand{\cftparagraphfont}{\itshape\mdseries\normalsize}
  \renewcommand{\cftparagraphpagefont}{\cftparagraphfont}
  % 
  \setlength{\cftbeforechapterskip}{0em}
}{}


%%% Nomes constantes
\newcommand{\declaracaodoautorname}{Declara\c{c}\~{a}o do Autor}
\newcommand{\listadeabreviaturasname}{Lista de abreviaturas}
\renewcommand{\listadesiglasname}{Lista de siglas}
\renewcommand{\listfigurename}{Lista de Figuras}

%%% Comandos de dados
\providecommand{\imprimircurso}{}
\newcommand{\curso}[1]{\renewcommand{\imprimircurso}{#1}}

\providecommand{\imprimirautorficha}{}
\newcommand{\autorficha}[1]{\renewcommand{\imprimirautorficha}{#1}}

%%% Numeração contínua de equações
\counterwithout{equation}{chapter}


% ---
% Lista de abreviaturas e siglas
\newenvironment{abreviaturas}{%
  \pretextualchapter{\listadeabreviaturasname}
  \begin{symbols}
}{%
  \end{symbols}
  \cleardoublepage
}
% ---


%%% ---
%%% List of symbol
\newenvironment{isymbols}{%
  \list{}% empty label
  {%
    \setlength{\topsep}{\baselineskip}
    \setlength{\partopsep}{0pt}
    \setlength{\itemsep}{0.5\baselineskip}
    \setlength{\parsep}{0pt}
    \setlength{\leftmargin}{2em}
    \setlength{\rightmargin}{0em}
    \setlength{\listparindent}{1em}
    \setlength{\itemindent}{0em}
    \setlength{\labelwidth}{0em}
    \setlength{\labelsep}{2em}
  }
}{\endlist}
\newcommand{\simb}[1]{\item[#1]\mbox{}}
%%% ---


% ---
% Lista de simbolos
\renewenvironment{simbolos}{%
  \pretextualchapter{\listadesimbolosname}
  \begin{isymbols}
}{%
  \end{isymbols}
  \cleardoublepage
}
% ---


%%% ---
\newcommand{\quadroname}{Quadro}
\newfloat{quadro}{loq}{\quadroname}
\newcommand{\listadequadrosname}{Lista de quadros}
\newlistof{listadequadros}{loq}{\listadequadrosname}
\newlistentry{quadro}{loq}{0}
\renewcommand{\cftquadroname}{\quadroname\space} 
\renewcommand{\cftquadroaftersnum}{\hfill\textendash\hfill}
%%% ---



%%% Redefinição do comando de impressão da capa
\renewcommand{\imprimircapa}{%
  \begin{capa}
    \center
    {\ABNTEXchapterfontsize\MakeTextUppercase{\imprimirinstituicao}}\\
    %\vspace{1\baselineskip}
    {\ABNTEXchapterfontsize\MakeTextUppercase{\imprimircurso}}\\
    %
    \vspace{3.0cm}
    %
    {\ABNTEXchapterfont\ABNTEXchapterfontsize\MakeTextUppercase{\imprimirautor}}\\
    %
    \vspace*{6.0cm}
    %
    \begin{center}
      \ABNTEXchapterfont\ABNTEXchapterfontsize\MakeTextUppercase{\imprimirtitulo}\\
    \end{center}
    %
    \vfill
    %
    \ABNTEXsectionfontsize\imprimirlocal\\
    \ABNTEXsectionfontsize\imprimirdata\\

    %\vspace*{1cm}
  \end{capa}
}

%%% Redefinição do comando de impressão da folha de rosto.
%%% Para esta parte do código é necessário que o caracter arroba `@'
%%% seja tratado como uma letra pelo LaTeX.
\makeatletter
\renewcommand{\folhaderostocontent}{
  \begin{center}
    {%\ABNTEXchapterfont
    \ABNTEXchapterfontsize\MakeTextUppercase{\imprimirautor}}\\
    %
    \vspace{4.5cm}
    %
    \begin{center}
    {\ABNTEXchapterfont\ABNTEXchapterfontsize\MakeTextUppercase{\imprimirtitulo}}\\
    \end{center}
    %
    \vfill
    %
    \abntex@ifnotempty{\imprimirpreambulo}{%
      \hspace{.45\textwidth}
      \begin{minipage}{.5\textwidth}
        \SingleSpacing
        {\footnotesize{\imprimirpreambulo}}
      \end{minipage}%
    }%
    \\%
    \vspace{0.5cm}
    %
    \hspace{0.45\textwidth}
    \begin{minipage}{0.5\textwidth}
      {\ABNTEXsectionfontsize\imprimirorientadorRotulo~\imprimirorientador}
      \abntex@ifnotempty{\imprimircoorientador}{%
        \par
        {\ABNTEXsectionfontsize\imprimircoorientadorRotulo~\imprimircoorientador}%
      }
    \end{minipage}
    \\%
    \vfill
    %
    \vspace*{1.5cm}
    {\ABNTEXsectionfontsize\imprimirlocal}\\
    {\ABNTEXsectionfontsize\imprimirdata}\\
  \end{center}
}
\makeatother


%%% ---
%%% Declaração do Autor
\newenvironment{declaracaodoautor}[1][\declaracaodoautorname]{%
  \pretextualchapter{#1}
}{\PRIVATEclearpageifneeded}
% ---

%%% Configura o pacote hyperref
\makeatletter
\hypersetup{
  pdftitle={\@title},
  pdfauthor={\@author},
  pdfsubject={\imprimirpreambulo},
  pdfkeywords={PALAVRAS}{CHAVE}{EM}{PORTUGUES},
  pdfcreator={LaTeX with abnTeX2},
  hidelinks
}
\makeatother

\renewcommand{\fonte}[2][\fontename]{%
  \par\RaggedRight{\footnotesize{#1: #2}}
}

\renewcommand{\nota}[2][\notaname]{
  \par\RaggedRight{\footnotesize{#1: #2}}
}



%%% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%%% Comandos LaTeX que devem ser executados após o início do corpo do
%%% documento, i.e., após o \begin{document}.
%%%   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\AtBeginDocument{%
  \setlength{\abovecaptionskip}{5pt} % espaçamento antes da legenda de
                                % tabelas/figuras 
  \setsecnumformat{\csname the#1\endcsname\space}  % Formata o número das seções
                                % de acordo com a norma
  \renewcommand{\afterchapternum}{\hspace{-4pt}}  % Ajusta o espaçamento após o
                                % título dos capítulos
  \captionsetup{justification=justified,singlelinecheck=false} % ajusta a
                                % formatação da legendas das figuras à norma
}

%%% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%%% Definição de comando específicos da classe do Ifes.
%%% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%%% O código abaixo é um RTP (Recurso Técnico Provisório, vulgo gambiarra) para
%%% fazer com que os títulos de seções ficassem em maiúsculas na TOC (Sumário).
\let\ifesoldsection\section
\renewcommand{\section}[1]{\ifesoldsection{\uppercase{#1}}}

%%% Define o comando \imprimesumario
\providecommand{\imprimirsumario}{}
\renewcommand{\imprimirsumario}{
  \renewcommand{\contentsname}{SUMÁRIO}%
  \pdfbookmark[0]{\contentsname}{toc}%
  \tableofcontents*%
}

%%% O título da seção primária “Referências” tem que ser alterado para ficar
%%% todo em maiúsculas (porque sim, aparentemente...)
\providecommand{\bibname}{}
\renewcommand{\bibname}{REFERÊNCIAS}

%%% O título da divisão de parte de  “Apêndices” tem que ser alterado para ficar
%%% todo em maiúsculas (também porque sim...)
\providecommand{\apendicesname}{}
\renewcommand{\apendicesname}{APÊNDICES}

%%% Define o comando \ifestex
\providecommand{\ifestex}{}
\renewcommand{\ifestex}{Ifes\TeX}

%%% Define o valor padrão para o rótulo de orientadora
\providecommand{\orientadoraname}{}
\renewcommand{\orientadoraname}{Orientadora:}

%%% Define o comando \orientadora
\providecommand{\orientadora}{}
\renewcommand{\orientadora}[2][\orientadoraname]{\orientador[#1]{#2}}

%%% Define o valor padrão para o rótulo de orientadora
\providecommand{\coorientadoraname}{}
\renewcommand{\coorientadoraname}{Coorientadora:}

%%% Define o comando \orientadora
\providecommand{\coorientadora}{}
\renewcommand{\coorientadora}[2][\coorientadoraname]{\coorientador[#1]{#2}}

\endinput

%%% Local Variables:
%%% ispell-local-directory: "brasileiro"
%%% End:
