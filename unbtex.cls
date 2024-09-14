%%
%% UnBTeX: A class for bachelor, master, and doctoral thesis at the
%% University of Brasilia (UnB), Brazil
%% Version 1.5.2 2024/07/04
%% Copyright (C) 2021-2024 by Henrique C. Ferreira <hcferreira@unb.br>
%%
%% This class file may be distributed and/or modified under the conditions
%% of the LaTeX Project Public License, either version 1.3 of this license
%% or (at your option) any later version. The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%%
%% This package consists of the file unbtex.cls and the bibliographic style 
%% files located in the unbtexcite directory.
%% Template files: unbtex-example.pdf, unbtex-example.tex, and files within
%% unbtex-example directory.
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unbtex}[2024/07/04 v1.5.2 Modelo da Universidade de Brasília baseado em abnTeX2]

% ------------------------------------------------------------------------
% Opções para a classe
% ------------------------------------------------------------------------

% ---
% Opção para definição de idioma principal
% ---
\def\idioma{brazil} % Português por default
\DeclareOption{idioma=brazil}{\def\idioma{brazil}}
\DeclareOption{idioma=english}{\def\idioma{english}}
% ---

% ---
% Opção para definição de estilo de referências bibliográficas
% ---
\def\bibsty{alf} % Autor-data por default
\DeclareOption{bib=alf}{\def\bibsty{alf}}
\DeclareOption{bib=num}{\def\bibsty{num}}
% ---

% ---
% Repassa demais opções à classe abntex2
% ---
\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{abntex2}
}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,onecolumn,openright]{abntex2}
% ---

% ------------------------------------------------------------------------
% Configurações básicas
% ------------------------------------------------------------------------

% ---
% Pacotes matemáticos
% ---
\RequirePackage{mathtools} % Melhoria nas equaões
\RequirePackage{amsthm} % Para configuração de ambientes do tipo teorema
% ---

% ---
% Pacotes de fontes tipográficas
% ---
\RequirePackage{stickstootext} % Fonte principal (Stix2)
\RequirePackage[stickstoo,vvarbb]{newtxmath} % Fonte matemática (Stix2)
\RequirePackage[scale=0.90]{tgheros} % Fonte sans serif (TeX Gyre Heros)
\RequirePackage[scale=1]{inconsolata} % Fonte monoespaçada
% ---

% ---
% Pacotes para figuras
% ---
\RequirePackage[captionskip=8pt]{subfig} % Permite fazer subfiguras
%\RequirePackage[skip=8pt]{subcaption} % Permite fazer subfiguras
% ---

% ---
% Cores verde e azul UnB
% http://www.marca.unb.br/arquivosdigitais/files/guia_pratico/guia_pratico.pdf
% ---
% Define cores da UnB
\RequirePackage[dvipsnames]{xcolor}
\definecolor{verdeunb}{cmyk}{1,0,1,0.2}
\definecolor{azulunb}{cmyk}{1,0.65,0,0.35}

% Cores nos títulos
\renewcommand{\tocheadstart}{}
\renewcommand{\ABNTEXchapterfont}{\bfseries\color{verdeunb}\sffamily}
\renewcommand{\ABNTEXsubsectionfont}{}
% ---

% ---
% Configurações para tabelas
% ---
\RequirePackage{multirow} % Para combinar linhas nas tabelas
\RequirePackage{colortbl} % Permite alterar cores de linhas e células das tabelas
\arrayrulecolor{verdeunb} % Define a cor das linhas das tabelas
\setlength\arrayrulewidth{0.6pt} % Define a espessura das linhas das tabelas

% Alinhamento em colunas com especificação de largura
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
% ---

% ---
% Configurações do texto
% ---
\RequirePackage{indentfirst} % Indenta o primeiro parágrafo de cada seção.
\RequirePackage{microtype} % Para melhorias de justificação
\RequirePackage{icomma} % Configura casas decimais separadas por vírgula
\setlength{\parindent}{3em} % Tamanho da indentação da primeira linha do parágrafo
\frenchspacing % Retira espaço extra entre as frases (após o ponto final)
\setlength{\parskip}{3pt plus 1pt minus 1pt} % Espaço entre parágrafos
\pdfminorversion=7 % Configuração da versão do arquivo pdf produzido

% Configurações das margens e cabeçalho
\AtBeginDocument{
\setlrmarginsandblock{3cm}{2cm}{*} % Margens esquerda e direita
\setulmarginsandblock{3cm}{2cm}{*} % Margens superior e inferior
\checkandfixthelayout[nearest] % Implementa as margens
\pagestyle{myheadings} % Cabeçalho com linha e numeração da página
}

% Espaçamento para notas de rodapé
\setlength{\skip\footins}{20pt plus 2pt minus 2pt} % Espaço entre o texto e as notas de rodapé
\addtolength{\footnotesep}{2pt} % Espaço entre as notas de rodapé
\renewcommand*{\footnoterule}{\kern-3pt \hrule width 5cm \kern 2.6pt} % Tamanho do traço superior (5cm)

% Ajusta espaço entre texto e figuras/tabelas
\setlength{\textfloatsep}{18pt plus 2pt minus 2pt} % Espaçamento entre texto e floats no topo/base da página
\setlength{\floatsep}{12pt plus 2pt minus 2pt} % Espaçamento entre floats
\setlength{\intextsep}{14pt plus 2pt minus 2pt} % Espaçamento entre texto e floats no meio da página

% Ajusta espaçamento nos ambientes itemize, enumerate, description e alineas
\setlist[itemize]{topsep=0pt,itemsep=0pt,leftmargin=\parindent}
\setlist[enumerate]{topsep=0pt,itemsep=0pt,leftmargin=\parindent}
\setlist[description]{topsep=0pt,itemsep=0pt,leftmargin=\parindent}
\setlist[alineas,1]{label={\alph*)},topsep=0pt,itemsep=0pt,leftmargin=\parindent}%

% Numeração por capítulo das figuras e tabelas
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}\numberwithin{figure}{chapter}
\renewcommand{\thetable}{\thechapter.\arabic{table}}\numberwithin{table}{chapter}

% Modifica o tamanho da fonte e espaçamento entre linhas no ambiente verbatim
\RequirePackage{fvextra}
\renewenvironment{verbatim}{\VerbatimEnvironment
  \begin{Verbatim}[fontsize=\small,baselinestretch=1.1]%
}{%
  \end{Verbatim}
}%
\fvset{listparameters=\setlength{\topsep}{6pt}\setlength{\partopsep}{0pt}}
% ---

% ---
% Configurações do Sumário
% ---
\settocdepth{subsection}
\setlength{\cftbeforechapterskip}{5pt plus 1pt minus 1pt}
\setlength{\cftbeforepartskip}{10pt plus 2pt minus 2pt}

% Corrige fontes tipográficas dos anexos e apêndices no sumário
\ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{
\renewcommand{\cftpartfont}{\bfseries\sffamily}
\renewcommand{\cftpartpagefont}{\bfseries\sffamily}
\renewcommand{\cftchapterfont}{\bfseries\sffamily}
\renewcommand{\cftsectionfont}{\bfseries\sffamily}
}{
\renewcommand{\cftpartfont}{\bfseries\sffamily}
\renewcommand{\cftchapterfont}{\bfseries\sffamily}
\renewcommand{\cftpartpagefont}{\bfseries\sffamily}
\renewcommand{\cftchapterpagefont}{\bfseries\sffamily}
}
% Corrige warning do pacote hyperref para sumário ABNT
\renewcommand{\PRIVATEapendiceconfig}[2]{%
 \setboolean{abntex@apendiceousecao}{true}%
 \renewcommand{\appendixname}{#1}
 \ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{
   %\renewcommand{\appendixtocname}{\uppercase{#2}}}{%
   \renewcommand{\appendixtocname}{\texorpdfstring{\MakeTextUppercase{#2}}{#2}}}{%
  \renewcommand{\appendixtocname}{#2}
  }
 \renewcommand{\appendixpagename}{#2}
 \switchchapname{#1}
 \renewcommand*{\cftappendixname}{#1 \space}
}
% Corrige nome dos anexos nas referências cruzadas
\renewcommand{\anexos}{%
 \cftinserthook{toc}{AAA}
 %\PRIVATEapendiceconfig{\anexoname}{\anexosname}
 \PRIVATEapendiceconfig{\Anexoname}{\Anexosname}
 \appendix
 \renewcommand\theHchapter{anexochapback.\arabic{chapter}}
}
\renewenvironment{anexosenv}{%
 \cftinserthook{toc}{AAA}
 %\PRIVATEapendiceconfig{\anexoname}{\anexosname}
 \PRIVATEapendiceconfig{\Anexoname}{\Anexosname}
 \crefalias{appendix}{annex}
 \begin{appendix}
 \renewcommand\theHchapter{anexochapback.\arabic{chapter}}
}{%
 \end{appendix}
 \setboolean{abntex@apendiceousecao}{false}
 \bookmarksetup{startatroot}
}
% ---

% ---
% Configurações das legendas
% ---
% Legenda das figuras/tabelas na parte superior, tamanho da fonte e espaçamento
\captionsetup{figureposition=t,font={small},skip=10pt}

% Espaçamento vertical do comando \legend
\renewcommand{\legend}[1]{%
  \M@gettitle{#1}%
  \memlegendinfo{#1}%
  \par
  \begingroup
     \@parboxrestore
     \if@minipage
       \@setminipage
     \fi
     \ABNTEXfontereduzida
     \captionsetup{aboveskip=0pt,belowskip=6pt}
     \captiondelim{\mbox{}}
     \@makecaption{}{\ABNTEXfontereduzida #1}\par
  \endgroup
}
% Espaçamento vertical do comando \fonte
% Também define o espaçamento do comando \nota
\renewcommand{\fonte}[2][\fontename]{%
  \M@gettitle{#2}%
  \memlegendinfo{#2}%
  \par
  \begingroup
     \@parboxrestore
     \if@minipage
       \@setminipage
     \fi
     \ABNTEXfontereduzida
     \captionsetup{aboveskip=0pt,belowskip=6pt}
     \captiondelim{\ABNTEXcaptionfontedelim}
     \@makecaption{\ABNTEXfontereduzida #1}{\ignorespaces\ABNTEXfontereduzida #2}\par
  \endgroup
}
% ---

% ---
% Configurações do pacote hyperref
% ---
\hypersetup{%
    pdfstartview=FitH,
    breaklinks=true, 
    colorlinks=true,
    allcolors=azulunb,
    linktocpage,
    bookmarksdepth=4
}
% ---

% ---
% Pacotes para inserir algoritmos
% ---
\RequirePackage[chapter]{algorithm} 
\RequirePackage{algpseudocode}
% Fix anchor names for algorithm lines
\newcounter{Halgorithmic}
\AtBeginEnvironment{algorithmic}{\stepcounter{Halgorithmic}}
\ExpandArgs{c}\renewcommand{theHALG@line}{\arabic{Halgorithmic}.\arabic{ALG@line}}
% ---

% ---
% Pacote para inserir códigos de programação
% ---
\RequirePackage{listings}

% Julia (Linguagem não reconhecida automaticamente pelo pacote listings)
\lstdefinelanguage{Julia}%
    {morekeywords={abstract,break,case,catch,const,continue,do,else,elseif,%
    end,export,false,for,function,immutable,import,importall,if,in,%
    macro,module,otherwise,quote,return,switch,true,try,type,typealias,%
    using,while},%
    sensitive=true,%
    alsoother={\$},%
    morecomment=[l]\#,%
    morecomment=[n]{\#=}{=\#},%
    morestring=[s]{"}{"},%
    morestring=[m]{'}{'},%
}[keywords,comments,strings]%

\definecolor{mygreen}{RGB}{28,172,0} % Color values Red, Green, Blue
\definecolor{mylilas}{RGB}{170,55,241}

\lstset{%
    basicstyle=\linespread{1.1}\ttfamily\footnotesize,
    numbers=left,%
    numberstyle={\scriptsize \color{black}}, % Size of the numbers
    numbersep=9pt, % This defines how far the numbers are from the text
    backgroundcolor=\color{gray!10},
    tabsize=2,
    frame=single,
    rulecolor=\color{black!30},
    %title=\lstname,
    captionpos=t,
    belowcaptionskip=10pt,
    escapeinside={\%*}{*)},
    breaklines=true,%
    breakatwhitespace=true,
    framextopmargin=2pt,
    framexbottommargin=2pt,
    keywordstyle=\color{blue},%
    morekeywords=[2]{1}, keywordstyle=[2]{\color{black}},
    identifierstyle=\color{black},%
    stringstyle=\color{mylilas},
    commentstyle=\color{mygreen},%
    extendedchars=true,
    inputencoding=utf8,
    showstringspaces=false,% Without this there will be a symbol in the places where there is a space
    literate={á}{{\'a}}1 {ã}{{\~a}}1 {é}{{\'e}}1 {ç}{{\c{c}}}1 {â}{{\^a}}1 {õ}{{\~o}}1 {ú}{{\'u}}1 {ó}{{\'o}}1 {í}{{\'i}}1 {Í}{{\'I}}1 
}
% ---

% ---
% Pacote para remissões internas
% ---
\IfStrEq{\idioma}{brazil}
{\RequirePackage[nameinlink,noabbrev,brazilian]{cleveref}}{\RequirePackage[nameinlink,noabbrev,english]{cleveref}}
\crefname{annex}{\anexoname}{\anexosname}
\Crefname{annex}{\Anexoname}{\Anexosname}
\crefname{listing}{\codigoname}{\codigosname}
\Crefname{listing}{\Codigoname}{\Codigosname}
\crefname{subsection}{\subsectionname}{\subsectionsname}
\Crefname{subsection}{\Subsectionname}{\Subsectionsname}
% ---

% ---
% Definição de ambientes teorema, exemplo, demonstração, etc.
% ---
\RequirePackage{mdframed}

\theoremstyle{definition}
\mdfdefinestyle{plainSty}{hidealllines=true,backgroundcolor=verdeunb!10}
\newmdtheoremenv[style=plainSty]{theorem}{\thname}[chapter] % Teorema
\newmdtheoremenv[style=plainSty]{lemma}{\lmname}[chapter] % Lema
\newmdtheoremenv[style=plainSty]{proposition}{\prname}[chapter] % Proposição
\newmdtheoremenv[style=plainSty]{corollary}{\crname}[chapter] % Corolário

\theoremstyle{definition}
\mdfdefinestyle{defnSty}{hidealllines=true,backgroundcolor=azulunb!10}
\newmdtheoremenv[style=defnSty]{definition}{\dfname}[chapter] % Definição
\newmdtheoremenv[style=defnSty]{assumption}{\aptname}[chapter] % Hipótese
\newmdtheoremenv[style=defnSty]{axiom}{\axname}[chapter] % Axioma
\newmdtheoremenv[style=defnSty]{conjecture}{\cjcname}[chapter] % Conjectura
\newmdtheoremenv[style=defnSty]{property}{\prpname}[chapter] % Propriedade
\newmdtheoremenv[style=defnSty]{example}{\expname}[chapter] % Exemplo
\newmdtheoremenv[style=defnSty]{exercise}{\excname}[chapter] % Exercício
\newmdtheoremenv[style=defnSty]{problem}{\prbname}[chapter] % Proplema

\theoremstyle{remark}
\let\proof\relax
\let\endproof\relax
\newmdtheoremenv[linecolor=azulunb,linewidth=1pt,hidealllines=false]{remark}{\rmname}[chapter] % Observação

\newtheoremstyle{myproof}{\topsep}{\topsep}{}{}{\bfseries}{}{ }{\thmname{#1} \thmnote{#3}}
\theoremstyle{myproof}
\let\proof\relax
\let\endproof\relax
\newmdtheoremenv[linecolor=verdeunb,linewidth=1pt,hidealllines=false]{proof}{\proofname.} % Prova
\AtEndEnvironment{proof}{\hfill$\square$}
\newmdtheoremenv[linecolor=azulunb,linewidth=1pt,hidealllines=false]{solution}{\sltname.} % Solução
% ---

% ---
% Referências bibliográficas
% ---
% Lista na bibliografia o número das páginas em que cada referência é citada
\RequirePackage[hyperpageref]{backref}
\AtBeginDocument{
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{\ifcase#1\nocitation\or\citedp~#2.\else\citedpp~#2.\fi}
% Retira os limitadores < e > dos hiperlinks
\addtociteoptionlist{abnt-url-package=url}
\def\UrlLeft{}
\def\UrlRight{}
\urlstyle{same}
}
% Gera as referências bibliográficas de acordo com as normas da ABNT
\newcommand{\bibhang}[1]{\setlength{\bibindent}{#1}}
\IfStrEq{\bibsty}{alf}{% Estilo autor-data
\RequirePackage[alf,abnt-etal-list=0,abnt-etal-cite=3,abnt-emphasize=bf,bibjustif]{abntex2cite}
\renewcommand{\@biblabel}[1]{}%
\IfStrEq{\idioma}{brazil} % Seleciona o arquivo de estilo de citação
{\bibliographystyle{unbtexcite/unbtex-alf-pt}}{\bibliographystyle{unbtexcite/unbtex-alf-en}}
}{%
\IfStrEq{\bibsty}{num}{% Estilo numérico
\RequirePackage[num,abnt-etal-list=0,abnt-emphasize=bf,bibjustif]{abntex2cite}
\RequirePackage{cite} % Para ordenar, comprimir e colocar entre colchetes os números nas citações
\renewcommand{\@biblabel}[1]%
{%
\ifthenelse{\equal{#1}{}}{}%
{%
% Para números entre colchetes na lista de referências
%\def\biblabeltext{{\citenumstyle #1\hspace{\biblabelsep}}}%
\def\biblabeltext{{\citenumstyle[#1]\hspace{\biblabelsep}}}%
\settowidth{\ABCIauxlen}{\biblabeltext}%
\ifthenelse{\lengthtest{\ABCIauxlen<\minimumbiblabelwidth}}%
{\setlength{\ABCIauxlen}{\minimumbiblabelwidth-\ABCIauxlen}}%
{\setlength{\ABCIauxlen}{0cm}}%
%{\biblabeltext\hspace{\ABCIauxlen}}%
\parbox[t]{\bibindent}{\raggedleft\biblabeltext\hspace{\ABCIauxlen}}%
}}%
\renewcommand{\citeonline}[2][] % Redefine \citeonline como \cite
{\ifthenelse{\equal{#1}{}}{\cite{#2}}{\cite[#1]{#2}}}
\IfStrEq{\idioma}{brazil} % Seleciona o arquivo de estilo de citação
{\bibliographystyle{unbtexcite/unbtex-num-pt}}{\bibliographystyle{unbtexcite/unbtex-num-en}}
}}
% ---

% ---
% Listas de abreviaturas/siglas/símbolos
% ---
\IfStrEq{\idioma}{brazil}
{\RequirePackage[portuguese]{nomencl}}{\RequirePackage[english]{nomencl}}
%\RequirePackage[refpage]{nomencl} % Para imprimir página onde o símbolo foi registrado
%\def\pagedeclaration#1{\dotfill\hyperlink{page.#1}{\nobreakspace#1}\par}
\renewcommand{\nomname}{\listadesiglasname} % Nome da lista de siglas
\setlength{\nomitemsep}{-\parsep} % Espaço entre os itens das listas
% Imprime os títulos das listas e dos grupos
\newcommand{\nomenclheader}[1]{\section*{\hspace*{-\leftmargin}\large#1}}
\renewcommand\nomgroup[1]{%
  \IfStrEqCase{#1}{%
   {A}{\vspace{-38pt}\nomenclheader{}} % Lista de abreviaturas e siglas
   {B}{\cleardoublepage % Quebra de página
       \pretextualchapter{\hspace{-\leftmargin}\listadesimbolosname} % Lista de símbolos
       \vspace{-10pt}\nomenclheader{\nomBname}} % Símbolos romanos
   {C}{\nomenclheader{\nomCname}} % Símbolos gregos
   %{Letra}{\nomenclheader{Nome do grupo}} % Acrescente, se necessário, outros grupos
   {X}{\nomenclheader{\nomXname}} % Sobrescritos
   {Z}{\nomenclheader{\nomZname}} % Subscritos
   % Grupos podem ser alterados ou adicionados
  }%
}
% Ajusta a largura do rótulo nas listas de abreviaturas/siglas/símbolos
\RequirePackage{xpatch}
\xapptocmd\thenomenclature{\let\@item\nomencl@item\def\nomencl@width{0pt}}{}{}
\let\nomencl@item\@item
\xpretocmd\nomencl@item{\nomencl@measure{#1}}{}{}
\def\nomencl@measure#1{%
  \sbox0{#1}%
  \ifdim\wd0>\nomencl@width\relax
    \edef\nomencl@width{\the\wd0}%
  \fi
}
\xapptocmd\endthenomenclature{%
  \immediate\write\@mainaux{\global\nomlabelwidth\nomencl@width\relax}%
}{}{}
% ---

% ---
% Ajusta a indentação das listas de figuras e de tabelas
% ---
%\RequirePackage{tocbasic} % Já carregado pelo pacote nomencl
\DeclareTOCStyleEntry[
    indent=0pt,
    entrynumberformat=\entrynumberwithprefix{\figurename},
    dynnumwidth,
]{tocline}{figure}

\DeclareTOCStyleEntry[
    indent=0pt,
    entrynumberformat=\entrynumberwithprefix{\tablename},
    dynnumwidth,
]{tocline}{table}
\newcommand\entrynumberwithprefix[2]{#1~#2\thinspace\hfill}
% ---

% ---
% Citacao direta com mais de 3 linhas - ABNT NBR 10520/2002 - 5.3
% Corrige tamanho do recuo do ambiente citacao do abntex2 para 4cm
% ---
\ifthenelse{\equal{\ABNTEXistwocolumn}{true}}{%
 \setlength{\ABNTEXcitacaorecuo}{1.8cm}
}{% else
 \setlength{\ABNTEXcitacaorecuo}{4cm}
}
\renewenvironment*{citacao}[1][default]{%
  \begin{adjustwidth}{\ABNTEXcitacaorecuo}{0mm}%
  \ABNTEXfontereduzida%
  \begin{SingleSpace}%
  \ifthenelse{\not\equal{#1}{default}}{\itshape\selectlanguage{#1}}{}%
}{%
  \end{SingleSpace}%
  \end{adjustwidth}}
% ---

% ---
% Define o texto dos rótulos de acordo com o idioma principal selecionado
% ---
\AtBeginDocument{
\IfStrEq{\idioma}{brazil}{
\selectlanguage{brazil}
\renewcommand{\listfigurename}{Lista de figuras}
\renewcommand{\bibname}{Referências}
\renewcommand{\apendicename}{Apêndice}
\renewcommand{\anexoname}{anexo}\renewcommand{\anexosname}{anexos}
\newcommand{\Anexoname}{Anexo}\newcommand{\Anexosname}{Anexos}
\newcommand{\subsectionname}{subseção}\newcommand{\subsectionsname}{subseções}
\newcommand{\Subsectionname}{Subseção}\newcommand{\Subsectionsname}{Subseções}
\renewcommand{\lstlistingname}{Código}
\newcommand{\codigoname}{código}\newcommand{\codigosname}{códigos}
\newcommand{\Codigoname}{Código}\newcommand{\Codigosname}{Códigos}
\renewcommand{\ALG@name}{Algoritmo}
\newcommand{\thname}{Teorema}
\newcommand{\lmname}{Lema}
\newcommand{\prname}{Proposição}
\newcommand{\crname}{Corolário}
\newcommand{\aptname}{Hipótese}
\newcommand{\dfname}{Definição}
\newcommand{\axname}{Axioma}
\newcommand{\cjcname}{Conjectura}
\newcommand{\prpname}{Propriedade}
\newcommand{\expname}{Exemplo}
\newcommand{\excname}{Exercício}
\newcommand{\prbname}{Problema}
\newcommand{\sltname}{Solução}
\newcommand{\rmname}{Observação}
\renewcommand{\proofname}{Demonstração}
\newcommand{\nocitation}{Nenhuma citação no texto.}
\newcommand{\citedp}{Citado na p.}
\newcommand{\citedpp}{Citado nas pp.}
\newcommand{\nomBname}{Símbolos romanos}
\newcommand{\nomCname}{Símbolos gregos}
}{
\selectlanguage{english}
\renewcommand{\listfigurename}{List of figures}
\renewcommand{\listtablename}{List of tables}
\renewcommand{\bibname}{References}
\renewcommand{\apendicename}{Appendix}\renewcommand{\apendicesname}{Appendices}
\renewcommand{\anexoname}{annex}\renewcommand{\anexosname}{annexes}
\newcommand{\Anexoname}{Annex}\newcommand{\Anexosname}{Annexes}
\newcommand{\subsectionname}{subsection}\newcommand{\subsectionsname}{subsections}
\newcommand{\Subsectionname}{Subsection}\newcommand{\Subsectionsname}{Subsections}
\renewcommand{\lstlistingname}{Code}
\newcommand{\codigoname}{code}\newcommand{\codigosname}{codes}
\newcommand{\Codigoname}{Code}\newcommand{\Codigosname}{Codes}
\renewcommand{\ALG@name}{Algorithm}
\newcommand{\thname}{Theorem}
\newcommand{\lmname}{Lemma}
\newcommand{\prname}{Proposition}
\newcommand{\crname}{Corollary}
\newcommand{\aptname}{Assumption}
\newcommand{\dfname}{Definition}
\newcommand{\axname}{Axiom}
\newcommand{\cjcname}{Conjecture}
\newcommand{\prpname}{Property}
\newcommand{\expname}{Example}
\newcommand{\excname}{Exercise}
\newcommand{\prbname}{Problem}
\newcommand{\sltname}{Solution}
\newcommand{\rmname}{Remark}
\renewcommand{\proofname}{Proof}
\newcommand{\nocitation}{No citations.}
\newcommand{\citedp}{Cit. on p.}
\newcommand{\citedpp}{Cit. on pp.}
\newcommand{\nomBname}{Roman letters}
\newcommand{\nomCname}{Greek letters}
}}
% ---

% ------------------------------------------------------------------------
% Informações do trabalho
% ------------------------------------------------------------------------

% Autores
\newcommand{\autori}[3][]{\def\autorinome{#2}\def\autorisobrenome{#3}}
\newcommand{\autorii}[3][]{\def\autoriinome{#2}\def\autoriisobrenome{#3}}

% Código Cutter
\newcommand{\numerocutter}[1]{\def\imprimircutter{#1}}

% Orientadores
\renewcommand{\orientador}[4][]{\def\orientname{#1}\def\orienttitulo{#2}\def\orientnome{#3}\def\orientsobrenome{#4}}
\renewcommand{\coorientador}[4][]{\def\coorientname{#1}\def\coorienttitulo{#2}\def\coorientnome{#3}\def\coorientsobrenome{#4}}

% Tipo de trabalho
\newcommand{\tipocurso}[1]{\def\imprimircurso{#1}}

% Informação adicional do trabalho
\newcommand{\publicacao}[1]{\def\imprimirpublicacao{#1}}

% Instituição
\renewcommand{\instituicao}[3][]{\def\instituicaoi{#1}\def\instituicaoii{#2}\def\instituicaoiii{#3}}

% data
\newcommand{\dia}[1]{\def\imprimirdia{#1}}
\newcommand{\mes}[1]{\def\imprimirmes{#1}}
\newcommand{\ano}[1]{\def\imprimirano{#1}}

% Membros da banca
\newcommand{\membrodabancai}[1]{\def\membrodabancainome{#1}}
\newcommand{\membrodabancaii}[1]{\def\membrodabancaiinome{#1}}
\newcommand{\membrodabancaiii}[1]{\def\membrodabancaiiinome{#1}}
\newcommand{\membrodabancaiv}[1]{\def\membrodabancaivnome{#1}}
\newcommand{\membrodabancav}[1]{\def\membrodabancavnome{#1}}
\newcommand{\membrodabancaifuncao}[1]{\def\membrodabancaifuncaonome{#1}}
\newcommand{\membrodabancaiifuncao}[1]{\def\membrodabancaiifuncaonome{#1}}
\newcommand{\membrodabancaiiifuncao}[1]{\def\membrodabancaiiifuncaonome{#1}}
\newcommand{\membrodabancaivfuncao}[1]{\def\membrodabancaivfuncaonome{#1}}
\newcommand{\membrodabancavfuncao}[1]{\def\membrodabancavfuncaonome{#1}}

% Palavras-chave
\newcommand{\pchavei}[1]{\def\pchaveinome{#1}}
\newcommand{\kwordi}[1]{\def\kwordinome{#1}}
\newcommand{\pchaveii}[1]{\def\pchaveiinome{#1}}
\newcommand{\kwordii}[1]{\def\kwordiinome{#1}}
\newcommand{\pchaveiii}[1]{\def\pchaveiiinome{#1}}
\newcommand{\kwordiii}[1]{\def\kwordiiinome{#1}}
\newcommand{\pchaveiv}[1]{\def\pchaveivnome{#1}}
\newcommand{\kwordiv}[1]{\def\kwordivnome{#1}}
\newcommand{\pchavev}[1]{\def\pchavevnome{#1}}
\newcommand{\kwordv}[1]{\def\kwordvnome{#1}}
% ---

% ---
% Imprime capa
% ---
\renewcommand{\imprimircapa}{%
\hypersetup{pageanchor=false}
\setlrmargins{*}{*}{1} % Margens laterais iguais para a capa
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout[fixed]
  \begin{capa}%
    \center
    \AddToShipoutPicture*{\BackgroundPic}
    \vspace*{7.5cm}
    {\LARGE\sffamily\bfseries\instituicaoi \\ \instituicaoii \\
    \abntex@ifnotempty{\instituicaoiii}{\instituicaoiii}\par}
    \vfill
    \begin{center}
    % Define o tamanho da fonte do título
    \autotitle[4]{\bfseries\imprimirtitulo}
    \titleformat\bfseries \imprimirtitulo\par
    \end{center}
    \normalfont
    \vfill
    {\Large\autorinome\ \autorisobrenome \\
    \abntex@ifnotempty{\autoriinome}{\autoriinome\ \autoriisobrenome}\par}
    \vfill\vfill
    \begin{center}
    \color{white}{\sffamily\large\MakeUppercase \imprimirtipotrabalho \\[2pt]
    \MakeUppercase\imprimircurso \\
    % Define o espaçamento vertical entre o nome do curso e o local (Brasília)
    \autotitle[1]{\MakeUppercase\imprimircurso}
    \ifdefined\decvspace \vspace{2pt} \else \vspace{20pt} \fi
    \imprimirlocal \\ \imprimirano\par}
    \end{center}
  \end{capa}
% Reestabelece as margens
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout[nearest]
\cleardoublepage
\hypersetup{pageanchor=true}
}

% Figura de fundo da capa
\RequirePackage{pdfpages} % Também funciona com o pacote eso-pic
\newcommand\BackgroundPic{%
    \put(0,0){%
	\parbox[b][\paperheight]{\paperwidth}{%
	\vfill
	\centering	\includegraphics[width=\paperwidth,height=\paperheight,keepaspectratio]{capa_fundo.pdf}%
	\vfill
	}
    }
}
% ---

% ---
% Imprime folha de rosto 
% ---
\renewcommand{\folhaderostocontent}{%
\begin{center}
    {\LARGE\sffamily\bfseries \instituicaoi \\ \instituicaoii \\ 
    \abntex@ifnotempty{\instituicaoiii}{\instituicaoiii}\par}
    \vfill\vfill

\begin{center}
% Define o tamanho da fonte do título
\ifthenelse{\equal{\imprimirtituloestrangeiro}{}}
{\autotitle[4]{\bfseries\imprimirtitulo}{\color{verdeunb}\titleformat\bfseries \imprimirtitulo\par}}
{\autotitle[4]{\bfseries\imprimirtituloestrangeiro}{\color{verdeunb}\titleformat\bfseries \imprimirtituloestrangeiro\par}}
\end{center}
\vfill

{\Large\autorinome\ \autorisobrenome \\
\abntex@ifnotempty{\autoriinome}{\autoriinome\ \autoriisobrenome}\par}
\vfill

\abntex@ifnotempty{\imprimirpreambulo}{%
    \begin{flushright}
    \begin{minipage}{.5\textwidth}
    {\SingleSpacing
    \begin{otherlanguage*}{brazil}
    \imprimirpreambulo
    \end{otherlanguage*}}
    \end{minipage}%
    \end{flushright}
}%
\vfill

{\large \orientname: \orienttitulo\ \orientnome\ \orientsobrenome \\
\abntex@ifnotempty{\coorientnome}{\coorientname: \coorienttitulo\ \coorientnome\ \coorientsobrenome}\par}
\vfill

{\sffamily\large\abntex@ifnotempty{\imprimirpublicacao}{\imprimirpublicacao \\ \vfill} \imprimirlocal \\ \imprimirano\par}
\end{center}
}
% ---

% ---
% Imprime ficha catalográfica
% ---
% https://bce.unb.br/servicos/elaboracao-de-fichas-catalograficas/
\newcommand{\cutter}{\IfInteger{\imprimircutter}{&}{}}
\renewcommand{\fichacatalografica}{%
\thispagestyle{empty}{%
\ifthenelse{\equal{\imprimirpublicacao}{}}{}{
\begin{OnehalfSpace}
{\noindent\sffamily\large REFERÊNCIA BIBLIOGRÁFICA}\par
\noindent\MakeUppercase\autorisobrenome, \autorinome \ifthenelse{\equal{\autoriinome}{}}{.}{;~\MakeUppercase\autoriisobrenome, \autoriinome.} {\bfseries\StrDel{\imprimirtitulo}{\\}}. \begin{otherlanguage*}{brazil}\imprimirtipotrabalho\ (\imprimircurso)\ifthenelse{\equal{\imprimirpublicacao}{}}{}{,~\imprimirpublicacao} -- \ifthenelse{\equal{\instituicaoiii}{}}{}{\instituicaoiii,~}\instituicaoii, \instituicaoi, \imprimirlocal, \thelastpage~p. \imprimirano.\end{otherlanguage*}
\end{OnehalfSpace}}
\IfInteger{\imprimircutter}{\setlength{\fboxsep}{10pt}}{\setlength{\fboxsep}{18pt}}
\vspace*{\fill}
{\small
{\SingleSpacing
\begin{center}
{\sffamily\large FICHA CATALOGRÁFICA} \\[18pt]
\fbox{\begin{minipage}[t][7.5cm]{12.5cm}
\IfInteger{\imprimircutter}{\begin{tabular}{p{1.25cm} p{10.25cm}}}{} \cutter
\autorisobrenome, \autorinome. \\
\IfInteger{\imprimircutter}{\StrChar{\autorisobrenome}{1}\imprimircutter\StrChar{\imprimirtitulo}{1}[\SUBtemp]\MakeLowercase{\SUBtemp}}{} \cutter
\hspace*{2em}\noindent \StrDel{\imprimirtitulo}{\\} ~/ \begin{otherlanguage*}{brazil}{\autorinome\ \autorisobrenome; \ifthenelse{\equal{\autoriinome}{}}{}{\autoriinome\ \autoriisobrenome;} \MakeLowercase\orientname\ \orientnome\ \orientsobrenome \ifthenelse{\equal{\coorientnome}{}}{.}{;~\MakeLowercase\coorientname\ \coorientnome\ \coorientsobrenome.} \texttt{-{}-} \imprimirlocal, \imprimirano.}\end{otherlanguage*} \\ \cutter
\hspace*{2em}\noindent \thelastpage~p. \\ \cutter
\\ \cutter
\hspace*{2em}\noindent\begin{otherlanguage*}{brazil}\imprimirtipotrabalho\ (\imprimircurso)\ \texttt{-{}-} \instituicaoi, \imprimirano.\end{otherlanguage*} \\ \cutter
\\ \cutter
\hspace*{2em}\noindent\IfStrEq{\idioma}{brazil}{1. \pchaveinome. 2. \pchaveiinome. 3. \pchaveiiinome. \ifthenelse{\equal{\pchaveivnome}{}}{}{4. \pchaveivnome. \ifthenelse{\equal{\pchavevnome}{}}{}{5. \pchavevnome.}}}{1. \kwordinome. 2. \kwordiinome. 3. \kwordiiinome. \ifthenelse{\equal{\kwordivnome}{}}{}{4. \kwordivnome. \ifthenelse{\equal{\kwordvnome}{}}{}{5. \kwordvnome.}}}%
\begin{otherlanguage*}{brazil}{\ifthenelse{\equal{\autoriinome}{}}{\ifthenelse{\equal{\coorientnome}{}}{I. \orientsobrenome, \orientnome, orient. II. Título.}{I. \orientsobrenome, \orientnome, orient. II. \coorientsobrenome, \coorientnome, coorient. III. Título.}}{\ifthenelse{\equal{\coorientnome}{}}{I. \autoriisobrenome, \autoriinome. II. \orientsobrenome, \orientnome, orient. III. Título.}{I. \autoriisobrenome, \autoriinome. II. \orientsobrenome, \orientnome, orient. III. \coorientsobrenome, \coorientnome, coorient. IV. Título.}}}\end{otherlanguage*}
\IfInteger{\imprimircutter}{\end{tabular}}{}
\end{minipage}}
\end{center}
}}
\newpage
}}
% ---

% ---
% Imprime folha de aprovação
% ---
\newcommand{\signlinewidth}[1]{\setlength{\ABNTEXsignwidth}{#1}}
\newcommand{\imprimirfolhadeaprovacao}{%
\begin{folhadeaprovacao}
\begin{center}
    {\Large\sffamily\bfseries\instituicaoi \\ \instituicaoii \\
    \abntex@ifnotempty{\instituicaoiii}{\instituicaoiii}\par}
    \vfill
    \begin{center}
    % Define o tamanho da fonte do título
    \autotitle[1]{\bfseries\StrDel{\imprimirtitulo}{\\}}
    \ifthenelse{\equal{\titleformat}{\large}}
    {\color{verdeunb}\Large\bfseries \StrDel{\imprimirtitulo}{\\}\par}
    {\color{verdeunb}\titleformat\bfseries \StrDel{\imprimirtitulo}{\\}\par}
    \end{center}
    \vfill

{\large\autorinome\ \autorisobrenome \\[2pt]
\abntex@ifnotempty{\autoriinome}{\autoriinome\ \autoriisobrenome}\par}
\vfill

\abntex@ifnotempty{\imprimirpreambulo}{%
    \begin{flushright}
    \begin{minipage}{.5\textwidth}
    {\SingleSpacing
    \begin{otherlanguage*}{brazil}
    \imprimirpreambulo
    \end{otherlanguage*}}
    \end{minipage}%
    \end{flushright}
}%
\vspace{24pt}

\raggedright{Trabalho aprovado. \imprimirlocal, \imprimirdia\ de \imprimirmes\ de \imprimirano:}
{%
    \assinatura{\textbf{\membrodabancainome} \\ \membrodabancaifuncaonome} 
    \assinatura{\textbf{\membrodabancaiinome} \\ \membrodabancaiifuncaonome} 
    \assinatura{\textbf{\membrodabancaiiinome} \\ \membrodabancaiiifuncaonome} 
    \abntex@ifnotempty{\membrodabancaivnome}{\assinatura{\textbf{\membrodabancaivnome} \\ \membrodabancaivfuncaonome}}
    \abntex@ifnotempty{\membrodabancavnome}{\assinatura{\textbf{\membrodabancavnome} \\ \membrodabancavfuncaonome}}
}
\end{center}
\end{folhadeaprovacao}
}
% ---

\RequirePackage{scontents}
% ---
% Imprime dedicatória
% ---
\newenvsc{DedicatoriaAutorI}[store-env=dedicatoriaautori]
\newenvsc{DedicatoriaAutorII}[store-env=dedicatoriaautorii]
\newcommand{\imprimirdedicatoria}{
\begin{dedicatoria}
\centering
\vspace*{\fill}

% Primeiro autor
{\itshape\getstored{dedicatoriaautori}}

\ifthenelse{\equal{\autoriinome}{}}{}{
\vspace{1cm}
\autorinome\ \autorisobrenome \par
\vspace*{\fill}

% Segundo autor
{\itshape\getstored{dedicatoriaautorii}}

\vspace{1cm}
\autoriinome\ \autoriisobrenome
}
\vspace*{\fill}
\end{dedicatoria}
}
% ---

% ---
% Imprime agradecimentos
% ---
\newenvsc{AgradecimentosAutorI}[store-env=agradecimentosautori]
\newenvsc{AgradecimentosAutorII}[store-env=agradecimentosautorii]
\newcommand{\idiomaagradecimentos}[1]{\def\acklang{#1}}

\newcommand{\imprimiragradecimentos}{
% Define o título da seção de agradecimentos
\IfStrEq{\acklang}{brazil}{
\renewcommand{\agradecimentosname}{Agradecimentos}
}{% Caso os agradecimentos sejam escritos em inglês
\renewcommand{\agradecimentosname}{Acknowledgements}}

\begin{agradecimentos}

% Primeiro autor
\getstored{agradecimentosautori}

\ifthenelse{\equal{\autoriinome}{}}{}{
\vspace{1cm}
\hfill \autorinome\ \autorisobrenome
\vspace{1cm}

% Segundo autor
\getstored{agradecimentosautorii}

\vspace{1cm}
\hfill \autoriinome\ \autoriisobrenome
}
\end{agradecimentos}
}
% ---

% ---
% Imprime epígrafe
% ---
\newenvsc{Epigrafe}[store-env=epigrafe]
\newcommand{\imprimirepigrafe}{
\begin{epigrafe}
\getstored{epigrafe}
\end{epigrafe}
}
% ---

% ---
% Imprime resumo (em português)
% ---
\newenvsc{Resumo}[store-env=resumo]
\newcommand{\imprimirresumo}{
\newpage
\setlength{\absparsep}{\parsep}
\begin{resumo}[Resumo]\vspace{\baselineskip}
\begin{otherlanguage*}{brazil}
\getstored{resumo}
\vspace{\onelineskip}

{\sffamily\bfseries Palavras-chave:} \pchaveinome. \pchaveiinome. \pchaveiiinome. \ifthenelse{\equal{\pchaveivnome}{}}{}{\pchaveivnome. \ifthenelse{\equal{\pchavevnome}{}}{}{\pchavevnome.}}
\end{otherlanguage*}
\end{resumo}
}
% ---

% ---
% Imprime resumo (em inglês)
% ---
\newenvsc{Abstract}[store-env=abstract]
\newcommand{\imprimirabstract}{
\newpage
\setlength{\absparsep}{\parsep}
\begin{resumo}[Abstract]\vspace{\baselineskip}
\begin{otherlanguage*}{english}
\getstored{abstract}
\vspace{\onelineskip}
 
{\sffamily\bfseries Keywords:} \kwordinome. \kwordiinome. \kwordiiinome. \ifthenelse{\equal{\kwordivnome}{}}{}{\kwordivnome. \ifthenelse{\equal{\kwordvnome}{}}{}{\kwordvnome.}}
\end{otherlanguage*}
\end{resumo}
}
% ---

% ---
% Define o tamanho da fonte tipográfica do título
% ---
\newbox\testbox
\newdimen\testblskip
\newcommand*{\testlines}[1]{%
    \setbox\testbox\hbox to\textwidth{\vbox{\centering\testfontsize #1\global\testblskip\baselineskip\par}}%
}
\newcommand*{\autotitle}[2][]{% \autotitle{número de linhas}{texto do título}
% \huge
    \let\testfontsize\huge\sffamily\testlines{#2}%
    \ifdim\ht\testbox>#1\testblskip
% \LARGE
        \let\testfontsize\LARGE\sffamily\testlines{#2}%
        \ifdim\ht\testbox>#1\testblskip
% \Large
            \let\testfontsize\Large\sffamily\testlines{#2}%
            \ifdim\ht\testbox>#1\testblskip
% \large
                \let\testfontsize\large\sffamily\testlines{#2}%
                \ifdim\ht\testbox>#1\testblskip
                    \newcommand{\decvspace}{}
                \fi
            \fi
        \fi
    \fi
    \newcommand{\titleformat}{\testfontsize}
}
% ---