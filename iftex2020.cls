\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{iftex2020}[2020/10/27 v2020 Classe IF para trabalhos academicos por Marcos Roberto Ribeiro]%

% ===============================================
% Tipos de documentos
% ===============================================
\newcommand{\TipoDoc}{monografia}%
\DeclareOption{monografia}{%
 \renewcommand{\TipoDoc}{monografia}%
}%

\DeclareOption{estagio}{%
 \renewcommand{\TipoDoc}{estagio}%
}%

% TODO: Demais tipos de documentos

% ===============================================
% Repassa demais opções a abntex2
% ===============================================
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}%
}%
\ProcessOptions\relax%

% ===============================================
% Herança da classe abntex2
% ===============================================
\LoadClass[12pt,a4paper,chapter=TITLE,english,brazil]{abntex2}%

% ===============================================
% Pacotes Usados
% ===============================================
\RequirePackage[T1]{fontenc}      % Seleção de códigos de fonte
\RequirePackage[utf8]{inputenc}   % Codificação de caracteres
\RequirePackage{morewrites}       % Resolve erro "No room..."
\RequirePackage{lmodern}          % Fonte Latin Modern
\RequirePackage{lastpage}         % Contagem de páginas
\RequirePackage{indentfirst}      % Indenta primeiro parágrafo
\RequirePackage{graphicx}         % Inclusão de imagens
\RequirePackage{caption}          % Definição dos captions
\RequirePackage{microtype}        % Melhorias de justificação
\RequirePackage{pdfpages}         % Inclusão de PDFs
\RequirePackage{hyphenat}         % Sem hifenização do Preâmbulo
\RequirePackage{amsmath,amsfonts} % Pacotes matemáticos
\RequirePackage{amssymb,amsthm}   % Pacotes matemáticos
\RequirePackage{url}              % URLs
\RequirePackage{cleveref}         % Correção de links para sub-equações
\RequirePackage{tikz}             % Desenhos
\RequirePackage{adjustbox}        % Reduzir / ampliação
\RequirePackage[style=abnt,noslsn, giveninits, %
extrayear, uniquename=false, uniquelist=minyear, %
backend=biber]{biblatex}          % Referências
\RequirePackage{csquotes}         % Correção de aspas em referências

% -----------------------------------------------
% Bibliotecas para desenho com tikz
% -----------------------------------------------
\usetikzlibrary{positioning}%

% ===============================================
% Configurações de nomes
% ===============================================

% Aliás para autor e título
\newcommand{\Autor}{\imprimirautor}%
\newcommand{\Titulo}{\imprimirtitulo}%
\newcommand{\Local}{\imprimirlocal}%

% -----------------------------------------------
% Instituição
% -----------------------------------------------
\newcommand{\SiglaInstituicao}{IFMG}%
\newcommand{\InstituicaoCurto}{Instituto Federal Minas Gerais}%
\newcommand{\InstituicaoCompleto}{Instituto Federal de Educação, Ciência e Tecnologia de Minas Gerais}%
\renewcommand{\instituicao}[3]{%
  \renewcommand{\SiglaInstituicao}{#1}%
  \renewcommand{\InstituicaoCurto}{#2}%
  \renewcommand{\InstituicaoCompleto}{#3}%
}%

% -----------------------------------------------
% Unidade (Campus)
% -----------------------------------------------
\newcommand{\Unidade}{Campus Bambu\'i}%
\newcommand{\unidade}[1]{%
  \renewcommand{\Unidade}{#1}%
}%

% -----------------------------------------------
% Empresa (para estágios)
% -----------------------------------------------
\newcommand{\EmpresaEstagio}{Empresa}%
\newcommand{\empresaestagio}[1]{%
  \renewcommand{\EmpresaEstagio}{#1}%
}%

% -----------------------------------------------
% Horas (para estágios)
% -----------------------------------------------
\newcommand{\HorasEstagio}{0}%
\newcommand{\horasestagio}[1]{%
  \renewcommand{\HorasEstagio}{#1}%
}%

% -----------------------------------------------
% Curso e Título obtido
% -----------------------------------------------
\newcommand{\Curso}{}%
\newcommand{\TituloCurso}{}%
\newcommand{\TipoCurso}{}%
\newcommand{\curso}[3]{%
  \renewcommand{\TituloCurso}{#1}%
  \renewcommand{\TipoCurso}{#2}%
  \renewcommand{\Curso}{#3}%
}%

% -----------------------------------------------
% Redefinição de Orientador
% -----------------------------------------------
\newcommand{\GeneroOrientador}{o}%
\newcommand{\RotuloOrientador}{Orientador}%
\newcommand{\Orientador}{}%
\newcommand{\generoorientador}[1]{\renewcommand{\Orientador}{#1}}%
\renewcommand{\orientador}[2][M]{%
  \renewcommand{\Orientador}{#2}%
  \ifthenelse{\equal{#1}{M}}{%
    \renewcommand{\GeneroOrientador}{o}%
    \renewcommand{\RotuloOrientador}{Orientador}%
  }{%
    \renewcommand{\GeneroOrientador}{a}%
    \renewcommand{\RotuloOrientador}{Orientadora}%
  }%
}%

% -----------------------------------------------
% Redefinição de coorientador
% -----------------------------------------------
\newcommand{\GeneroCoorientador}{o}%
\newcommand{\RotuloCoorientador}{Coorientador}%
\newcommand{\Coorientador}{}%
\newcommand{\generocoorientador}[1]{\renewcommand{\Coorientador}{#1}}%
\renewcommand{\coorientador}[2][M]{%
  \renewcommand{\Coorientador}{#2}%
  \ifthenelse{\equal{#1}{M}}{%
    \renewcommand{\GeneroCoorientador}{o}%
    \renewcommand{\RotuloCoorientador}{Coorientador}%
  }{%
    \renewcommand{\GeneroCoorientador}{a}%
    \renewcommand{\RotuloCoorientador}{Coorientadora}%
  }%
}%

\newcommand{\InstituicaoCoorientador}{{\SiglaInstituicao} -- {\Unidade}}%
\newcommand{\instituicaocoorientador}[1]{%
  \renewcommand{\InstituicaoCoorientador}{#1}%
}%

% -----------------------------------------------
% Membros da banca
% -----------------------------------------------
% Comando para definição dos membros da banca
\newcount\@membrobancaconta\@membrobancaconta0%
\newcommand\membrobanca[2]{%
  \global\@namedef{NomeMembroBanca:\expandafter\the\@membrobancaconta}{#1}%
  \global\@namedef{LocalMembroBanca:\expandafter\the\@membrobancaconta}{#2}%
  \global\advance\@membrobancaconta by 1%
}%

% ===============================================
% Preâmbulos
% ===============================================
% Estágio
\newcommand{\PreambuloEstagio}{%
  Relatório de estágio do Curso de {\TipoCurso} em {\Curso} do {\InstituicaoCompleto} -- {\Unidade}, sob a orientação d{\GeneroOrientador} {\Orientador}.%
  O Estágio foi realizado na instituição {\EmpresaEstagio} e teve a duração de {\HorasEstagio} horas.%
}%

% Monografia
\newcommand{\PreambuloMonografia}{%
Trabalho de conclusão de curso apresentado ao Curso de {\TipoCurso} em {\Curso} do {\InstituicaoCompleto} -- {\Unidade} para obtenção do grau de {\TituloCurso} em {\Curso}.%
}%

\DeclareRobustCommand{\Preambulo}{%
  \ifthenelse{\equal{\TipoDoc}{monografia}}{%
    \PreambuloMonografia%
  }{}%
  \ifthenelse{\equal{\TipoDoc}{estagio}}{%
    \PreambuloEstagio%
  }{}%
}%

% ===============================================
% Redefinição do comando de data (dia, mês, ano)
% ===============================================
\renewcommand{\date}[3]{%
  \gdef\@day{#1}%
  \gdef\@month{#2}%
  \gdef\@year{#3}%
  \gdef\@date{\@day~de~\@month~de~\@year}%
}%
\date{\number\day}{\monthname}{\number\year}%

% ===============================================
% Resumo
% ===============================================
\renewcommand{\resumo}[1]{%
  \newcommand{\textoresumo}{#1}%
}%
\newcommand{\palavraschave}[1]{%
  \newcommand{\textopalavraschave}{#1}%
}%

\newcommand{\GeraResumo}{%
  \ifthenelse{\isundefined{\textoresumo}}{}{%
    \pretextualchapter{Resumo}%
    \noindent%
    \textoresumo%
    \par%
    \vspace{\onelineskip}%
    \ifthenelse{\isundefined{\textopalavraschave}}{}{%
      \noindent\textbf{Palavras-chave:} \textopalavraschave%
    }%
    \thispagestyle{empty}%
    \cleardoublepage%
  }%
}%

% ===============================================
% Abstract
% ===============================================
\renewcommand{\abstract}[1]{%
  \newcommand{\textoabstract}{#1}%
}%
\newcommand{\keywords}[1]{%
  \newcommand{\textokeywords}{#1}%
}%

\newcommand{\GeraAbstract}{%
  \ifthenelse{\isundefined{\textoabstract}}{}{%
    \pretextualchapter{Abstract}%
    \noindent%
    \textoabstract%
    \par%
    \vspace{\onelineskip}%
    \ifthenelse{\isundefined{\textokeywords}}{}{%
      \noindent\textbf{Keywords:} \textokeywords%
    }%
    \thispagestyle{empty}%
    \cleardoublepage%
  }%
}%

% ===============================================
% Ficha catalográfica
% ===============================================
\newcommand{\ficha}[1]{%
  \newcommand{\arquivoficha}{#1}%
}%

% ===============================================
% Lista de siglas
% ===============================================

\newcommand{\listacronymname}{Lista de abreviaturas e siglas}%
\newcommand{\listasiglas}[1]{%
  \DeclareRobustCommand{\ListaSiglas}{#1}%
}%

\newcommand{\GeraListaSiglas}{%
  \ifthenelse{\isundefined{\ListaSiglas}}{}{%
    \thispagestyle{empty}%
    \pagestyle{empty}%
    \pretextualchapter{\listacronymname}%
    \ListaSiglas%
    \cleardoublepage%
  }%
}%

% ===============================================
% Lista de símbolos
% ===============================================

\newcommand{\listsymbolname}{Lista de símbolos}%
\newcommand{\listasimbolos}[1]{%
  \DeclareRobustCommand{\ListaSimbolos}{#1}%
}%

\newcommand{\GeraListaSimbolos}{%
  \ifthenelse{\isundefined{\ListaSimbolos}}{}{%
    \thispagestyle{empty}%
    \pagestyle{empty}%
    \pretextualchapter{\listsymbolname}%
    \ListaSimbolos%
    \cleardoublepage%
  }%
}%


% ===============================================
% URLs na mesma fonte do texto e quebra correta
% ===============================================

\urlstyle{same}%
\setcounter{biburlnumpenalty}{100}%
\setcounter{biburlucpenalty}{100}%
\setcounter{biburllcpenalty}{100}%

% ===============================================
% Citações e referências
% ===============================================

% Remoção de < e > nas URLs
\DeclareFieldFormat{url}{\bibstring{urlfrom}\addcolon\addspace\url{#1}}%

% --------------------------------------------------

% Citações explícitas
\newcommand{\citet}{\textcite}%

% --------------------------------------------------

% Citações de fontes de figuras, tabelas, etc.
\DeclareCiteCommand{\citefonte}[]%
{\usebibmacro{cite:init}%
 \usebibmacro{prenote}}%
{\usebibmacro{citeindex}%
 \usebibmacro{cite}}%
{}%
{\usebibmacro{postnote}}%

% --------------------------------------------------

\DeclareCiteCommand*{\citefonte}[]%
{\usebibmacro{cite:init}%
 \usebibmacro{prenote}}%
{\usebibmacro{citeindex}%
 \usebibmacro{citeyear}}%
{}%
{\usebibmacro{postnote}}%

% --------------------------------------------------

\DeclareMultiCiteCommand{\citefontes}[]%
{\citefonte}{\setunit{\multicitedelim}}%

% --------------------------------------------------

\renewcommand{\fonte}[2][\fontename]{%
  \begingroup%
    \vspace{1pt plus 0pt minus 1pt}%
    \par\footnotesize%
     {\fontename}: #2\par%
  \endgroup%
}%

% --------------------------------------------------

% Coloca et al. em itálico
\newcommand*{\mkandothers}{\itshape}%
\renewbibmacro*{name:andothers}{%
  \ifboolexpr{%
    test {\ifnumequal{\value{listcount}}{\value{liststop}}}%
    and%
    test \ifmorenames%
  }%
  {\ifnumgreater{\value{liststop}}{1}%
    {\finalandcomma}%
    {}%
    \andothersdelim\bibstring[\mkandothers]{andothers}}%
  {}}%
% --------------------------------------------------

% Correção em trabalhos de eventos
\DeclareBibliographyDriver{inproceedings}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{author/translator+others}%
  \setunit{\labelnamepunct}%
  \usebibmacro{title}%
  \newunit%
  \newblock%
  \printlist{language}%
  \newunit%
  \newblock%
  \usebibmacro{byauthor}%
  \newunit%
  \newblock%
  \usebibmacro{in:eventtitle/organization/editor}%
  \setunit*{\addspace}% \setunit*{\addcomma\addspace}%
  \newblock%
  \printfield{number}%
  \setunit*{\adddot\addcomma\addspace}%
  \newblock%
  \printeventdate%
  \setunit*{\addcomma\addspace}%
  \printfield{venue}%
  \newunit%
  \newblock%
  \usebibmacro{maintitle+booktitle}%
  \newunit%
  \newblock%
  \usebibmacro{byeditor+others}%
  \newunit%
  \newblock%
  \ifboolexpr{%
    test {\iffieldundef{booktitle}}%
    and%
    test {\iffieldundef{maintitle}}%
  }%
	{}%
	{\usebibmacro{publisher+location+date}}%
  \newunit%
  \newblock%
  \iffieldundef{maintitle}%
    {\printfield{volume}%
     \printfield{part}}%
    {}%
  \newunit%
  \newblock%
  \printfield{volumes}%
  \newunit%
  \newblock%
  \usebibmacro{series+number}%
  \newunit%
  \newblock%
  \printlist{organization}%
  \newunit%
  \newblock%
  \usebibmacro{chapter+pages}%
  \newunit%
  \printfield{pagetotal}%
  \newunit%
  \newblock%
  \printfield{note}%
  \newblock%
  \printunit{\addperiod\addspace}%
  \iftoggle{bbx:isbn}%
    {\printfield{isbn}}%
    {}%
  \newunit%
  \newblock%
  \usebibmacro{doi+eprint+url}%
  \newunit%
  \newblock%
  \usebibmacro{addendum+pubstate}%
  \setunit*{\bibpagerefpunct}%
  \newblock%
  \usebibmacro{pageref}%
  \setunit*{\addperiod\addspace}%
  \newunit%
  \newblock%
  \iftoggle{bbx:related}%
    {\usebibmacro{related:init}%
     \usebibmacro{related}}%
    {}%
  \usebibmacro{finentry}%
}%

% Correção de eventos
\DeclareBibliographyDriver{proceedings}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{organization/eventtitle}%
  \setunit*{\addspace}% \setunit*{\addcomma\addspace}%
  \printfield{number}%
  \setunit*{\adddot\addcomma\addspace}%
  \printeventdate%
  \setunit{\addcomma\addspace}%
  \usebibmacro{venue}%
  \newunit%
  \newblock%
  \usebibmacro{maintitle+title}%
  \newunit%
  \newblock%
  \usebibmacro{byeditor+others}%
  \newunit%
  \newblock%
  \usebibmacro{publisher+location+date}%
  \newunit%
  \newblock%
  \iffieldundef{maintitle}%
    {\printfield{volume}%
     \printfield{part}}%
    {}%
  \newunit%
  \newblock%
  \printfield{volumes}%
  \newunit%
  \newblock%
  \printfield{note}%
  \newblock%
  \printunit{\addperiod\addspace}%
  \printlist{organization}%
  \newunit%
  \newblock%
  \usebibmacro{chapter+pages}%
  \newunit%
  \printfield{pagetotal}%
  \newunit%
  \newblock%
  \iftoggle{bbx:isbn}%
    {\printfield{isbn}}%
    {}%
  \newunit%
  \newblock%
  \usebibmacro{doi+eprint+url}%
  \newunit%
  \newblock%
  \usebibmacro{addendum+pubstate}%
  \setunit*{\bibpagerefpunct}%
  \newblock%
  \usebibmacro{pageref}%
  \setunit*{\addperiod\addspace}%
  \newunit%
  \newblock%
  \iftoggle{bbx:related}%
    {\usebibmacro{related:init}%
     \usebibmacro{related}}%
    {}%
  \usebibmacro{finentry}%
}%

% Destaque do título em legislação
\DeclareFieldFormat[legislation]{title}{%
  \iftoggle{ittitles}{%
    \addspace\mkbibemph{#1}\isdot%
  }{%
    \addspace\mkbibbold{#1}\isdot%
  }%
}%

% Correção em jornais
\renewbibmacro*{journal}{%
  \iffieldundef{journaltitle}%
    {}%
    {\printtext[journaltitle]{%
       \printfield[titlecase]{journaltitle}%
       \iffieldendswithpunct{journaltitle}{%
          \setunit{\addspace}%
       }{%
          \setunit{\subtitlepunct}%
       }%
       \printfield[normalfont]{journalsubtitle}}}%
}%

% Redefinição do título das referências
\defbibheading{bibliography}[REFERÊNCIAS]{%
 \chapter*{#1}%
 \markboth{#1}{#1}%
 \phantomsection\addcontentsline{toc}{chapter}{REFERÊNCIAS}%
}%

% Correção da abreviação de páginas
\DeclareFieldFormat*{pages}{p. #1}%

% Espaçamento simples entre linhas e um linha entre referências
\AtBeginBibliography{%
  \SingleSpacing%
  \parskip0.5em%
}%

% ===============================================
% Definições de comprimento
% ===============================================
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{120mm}%
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}%
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{120mm}%
\setlength{\parindent}{2cm}%
\setlength{\ABNTEXsignwidth}{12cm}%

% ===============================================
% Estilos de divisões
% ===============================================

% Tamanos e estilos
\renewcommand{\ABNTEXchapterfont}{}%
\renewcommand{\ABNTEXpartfontsize}{\bfseries\normalsize}%
\renewcommand{\ABNTEXchapterfontsize}{\bfseries\normalsize}%
\renewcommand{\ABNTEXsectionfontsize}{\bfseries\normalsize}%
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}%
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}%
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}%
\renewcommand{\ABNTEXsubsectionfont}{\itshape\bfseries}%
\renewcommand{\ABNTEXsubsubsectionfont}{}%
\renewcommand{\ABNTEXsubsubsubsectionfont}{\itshape}%
\renewcommand{\ABNTEXfontereduzida}{\small}%
\renewcommand{\cftsubsectionfont}{\itshape\bfseries}%
\renewcommand{\cftpartfont}{\bfseries\normalsize}%

% Recuo de citações longas
\setlength{\ABNTEXcitacaorecuo}{4cm}%

% Espaçamento após título de capítulo
\setlength{\afterchapskip}{1em}%
\setlength{\aftersecskip}{1em}%
\setlength{\aftersubsecskip}{1em}%
\setlength{\aftersubsubsecskip}{1em}%

% Equações com numeração contínua
\counterwithout{equation}{chapter}%
% Numerar sub-sub-seções
\setsecnumdepth{subsubsection}%

% Espaços entre números e títulos no sumário
\setlength{\cftlastnumwidth}{4em}%
\setlength{\cftsectionnumwidth}{\cftlastnumwidth}%
\setlength{\cftsubsectionnumwidth}{\cftlastnumwidth}%
\setlength{\cftsubsubsectionnumwidth}{\cftlastnumwidth}%
% ===============================================
% Flutuantes
% ===============================================

% Redução dos espaços entre os rótulos
\setlength{\abovecaptionskip}{1pt}%
\setlength{\belowcaptionskip}{1pt}%

% ===============================================
% Algoritmos, Códigos e Quadros
% ===============================================
% Algoritmos
\newcommand{\algoritmonome}{Algoritmo}%
\newcommand{\listalgoritmonome}{Lista de algoritmos}%
\newlistof{listofalgoritmos}{loa}{\listalgoritmonome}%
\newfloat{algoritmo}{loa}{\algoritmonome}%
\newlistentry{algoritmo}{loa}{0}%
\renewcommand{\cftalgoritmoname}{\algoritmonome\space}%
\renewcommand*{\cftalgoritmoaftersnum}{\hfill\textendash\hfill}%
% Códigos
\newcommand{\codigonome}{C\'odigo}%
\newcommand{\listcodigonome}{Lista de C\'odigos}%
\newlistof{listofcodigos}{loc}{\listcodigonome}%
\newfloat{codigo}{loc}{\codigonome}%
\newlistentry{codigo}{loc}{0}%
\renewcommand{\cftcodigoname}{\codigonome\space}%
\renewcommand*{\cftcodigoaftersnum}{\hfill\textendash\hfill}%
% Quadros
\newcommand{\quadronome}{Quadro}%
\newcommand{\listquadronome}{Lista de Quadro}%
\newlistof{listofquadros}{loq}{\listquadronome}%
\newfloat{quadro}{loq}{\quadronome}%
\newlistentry{quadro}{loq}{0}%
\renewcommand{\cftquadroname}{\quadronome\space}%
\renewcommand*{\cftquadroaftersnum}{\hfill\textendash\hfill}%

% ===============================================
% Cabeçalho, rodapé e estilos de páginas
% ===============================================

% Estilo de página
\makepagestyle{paginasimples}%
\makeoddhead{paginasimples}{}{}{\footnotesize\thepage}%
\makeevenhead{paginasimples}{\footnotesize\thepage}{}{}%

% Configuração de páginas pré-textuais
\renewcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}%
  \pagestyle{empty}%
  \aliaspagestyle{cleared}{empty}%
  \aliaspagestyle{part}{empty}%
}%
\renewcommand{\frontmatter}{\pretextual}%

% Configuração de páginas textuais
\renewcommand{\textual}{%
  \pagestyle{paginasimples}%
  \aliaspagestyle{part}{abntchapfirst}%
  \aliaspagestyle{chapter}{abntchapfirst}%
  \aliaspagestyle{cleared}{paginasimples}%
  \nouppercaseheads%
}%

% Aliás para comando de páginas pós-textuais
\renewcommand{\backmatter}{\postextual}%

% ===============================================
% Elementos Pré-Textuais
% ===============================================

% -----------------------------------------------
% Capa
% -----------------------------------------------
\newcommand{\Capa}{%
  \pdfbookmark[0]{Capa}{}%
  \thispagestyle{empty}%
  \noindent%
  \begin{center}%
    \MakeUppercase{{\InstituicaoCompleto} -- {\Unidade}}%
    {%
      \par%
      \MakeUppercase{{\TipoCurso} em {\Curso}}%
      \par%
      \vspace*{3em}%
      \Autor%
    }%
    \vfill%
    {\large{\textbf{\MakeUppercase{\Titulo}}}}%
    \vfill%
    {\Local}\par%
    {\@year}%
    \cleardoublepage%
  \end{center}%
}%

% -----------------------------------------------
% Folha de Rosto
% -----------------------------------------------
\renewcommand{\folhaderostocontent}{%
  \setcounter{page}{1}%
  \begin{center}%
    {\MakeUppercase{\Autor}}%
    \vfill%
    {\large{\textbf{\MakeUppercase{\Titulo}}}}%
    \vspace*{5em}\par%
    \hspace{.5\textwidth}%
    \begin{minipage}{.5\textwidth}%
        {\Preambulo}%
        \ifthenelse{\not\equal{\Orientador}{}}{%
          \par\vspace*{\baselineskip}%
          {\RotuloOrientador}: {\Orientador}\\%
        }{}%
        \ifthenelse{\not\equal{\Coorientador}{}}{%
          {\RotuloCoorientador}: {\Coorientador}\\%
        }{}%
    \end{minipage}%
    \vfill%
    {\Local}\par%
    {\@year}%
  \end{center}%
}%

\newcommand{\GeraFolhaRosto}{%
  \ifthenelse{\isundefined{\arquivoficha}}{%
    \imprimirfolhaderosto{}%
  }{%
    \imprimirfolhaderosto*{}%
      \begin{fichacatalografica}%
        \includepdf[pages={1}]{\arquivoficha}%
      \end{fichacatalografica}%
  }%
}%

% -----------------------------------------------
% Folha de aprovação
% -----------------------------------------------
\newcommand{\assinaturas}[1]{%
  \newcommand{\AssinaturasAprovacao}{#1}%
}%

% Folha de aprovação impressa para assinatura%
\newcommand{\ImprimirFolhaAprovacao}{%
  \begin{folhadeaprovacao}%
  \begin{center}%
    {\Autor}%
    \vfill%
    {\large{\textbf{\MakeUppercase{\Titulo}}}}%
    \vfill%
    \hspace{.5\textwidth}%
    \begin{minipage}{.5\textwidth}%
        {\Preambulo}%
    \end{minipage}%
    \vspace*{3em}%
    \par{Aprovado em {\@day} de {\@month} de {\@year} pela banca examinadora:}%
    \par%
    \vspace*{1em}%
    \ifthenelse{\not\equal{\Orientador}{}}{%
      {\Orientador} -- {\SiglaInstituicao} -- {\Unidade} -- ({\RotuloOrientador})\\%
    }{}%
    \ifthenelse{\not\equal{\Coorientador}{}}{%
      {\Coorientador} -- {\InstituicaoCoorientador} -- ({\RotuloCoorientador})\\%
    }{}%
    \count1=0%
    \@whilenum \count1<\@membrobancaconta \do {%
        {\csname NomeMembroBanca:\the\count1 \endcsname} %
        -- {\csname LocalMembroBanca:\the\count1 \endcsname} \\%
      \advance\count1 by 1%
    }%
    \ifthenelse{\isundefined{\AssinaturasAprovacao}}{}{%
      \includegraphics[width=\linewidth]{\AssinaturasAprovacao}%
    }%
    \vfill%
    {\Local}\par%
    {\@year}%
  \end{center}%
  \end{folhadeaprovacao}%
}% fim da \ImprimirFolhaAprovacao

\newcommand{\GeraFolhaAprovacao}{%
    \ImprimirFolhaAprovacao%
}%


% -----------------------------------------------
% Dedicatória
% -----------------------------------------------
\newcommand{\textodedicatoria}[1]{%
  \DeclareRobustCommand{\TextoDedicatoria}{#1}%
}%

\newcommand{\GeraDedicatoria}{%
  \ifthenelse{\isundefined{\TextoDedicatoria}}{}{%
    \begin{dedicatoria}%
        \vspace*{\fill}%
        \centering%
        \noindent%
        \textit{\TextoDedicatoria}%
        \vspace*{\fill}%
    \end{dedicatoria}%
  }%
}%

% -----------------------------------------------
% Agradecimentos
% -----------------------------------------------
\newcommand{\textoagradecimentos}[1]{%
  \newcommand{\Agradecimentos}{#1}%
}%

\newcommand{\GeraAgradecimentos}{%
  \ifthenelse{\isundefined{\Agradecimentos}}{}{%
    \begin{agradecimentos}%
      \Agradecimentos%
    \end{agradecimentos}%
  }%
}%

% -----------------------------------------------
% Epígrafe
% -----------------------------------------------
\newcommand{\textoepigrafe}[1]{%
  \newcommand{\Epigrafe}{#1}%
}%

\newcommand{\GeraEpigrafe}{%
\ifthenelse{\isundefined{\Epigrafe}}{}{%
    \begin{epigrafe}%
      \vspace*{\fill}%
      \begin{flushright}%
        \textit{\Epigrafe}%
      \end{flushright}%
    \end{epigrafe}%
  }%
}%

% ===============================================
% Listas e Sumário
% ===============================================

% -----------------------------------------------
% Lista de ilustrações
% -----------------------------------------------
\newcommand{\listafiguras}{%
  \newcommand{\IncluiListaIlustracoes}{TRUE}%
}%
\addto\captionsbrazil{%
  \renewcommand{\listfigurename}{Lista de figuras}%
}%

\newcommand{\GeraListaIlustracoes}{%
  \ifthenelse{\isundefined{\IncluiListaIlustracoes}}{}{%
    \pretextualchapter{\listfigurename}%
    \@starttoc{lof}%
    \cleardoublepage%
   }%
}%

% -----------------------------------------------
% Lista de quadros
% -----------------------------------------------
\newcommand{\listaquadros}{%
  \newcommand{\IncluiListaQuadros}{TRUE}%
}%
\addto\captionsbrazil{%
  \renewcommand{\listquadronome}{Lista de quadros}%
}%

\newcommand{\GeraListaQuadros}{%
  \ifthenelse{\isundefined{\IncluiListaQuadros}}{}{%
    \pretextualchapter{\listquadronome}%
    \@starttoc{loq}%
    \cleardoublepage%
   }%
}%

% -----------------------------------------------
% Lista de tabelas
% -----------------------------------------------
\newcommand{\listatabelas}{%
  \newcommand{\InluiListaTabelas}{TRUE}%
}%
\addto\captionsbrazil{%
  \renewcommand{\listtablename}{Lista de tabelas}%
}%

\newcommand{\GeraListaTabelas}{%
  \ifthenelse{\isundefined{\InluiListaTabelas}}{}{%
    \pretextualchapter{\listtablename}%
    \@starttoc{lot}%
    \cleardoublepage%
  }%
}%

% -----------------------------------------------
% Lista de algoritmos
% -----------------------------------------------
\newcommand{\listaalgoritmos}{%
  \newcommand{\IncluirListaAlgoritmos}{TRUE}%
}%

\newcommand{\GeraListaAlgoritmos}{%
  \ifthenelse{\isundefined{\IncluirListaAlgoritmos}}{}{%
    \pretextualchapter{\listalgoritmonome}%
    \@starttoc{loa}%
    \cleardoublepage%
  }%
}%


% -----------------------------------------------
% Lista de códigos
% -----------------------------------------------
\newcommand{\listacodigosnome}{Lista de códigos}%
\newcommand{\listacodigos}{%
  \newcommand{\IncluiListaCodigos}{TRUE}%
}%

\newcommand{\GeraListaCodigos}{%
  \ifthenelse{\isundefined{\IncluiListaCodigos}}{}{%
    \pretextualchapter{\listacodigosnome}%
    \@starttoc{loc}%
    \cleardoublepage%
  }%
}%


% -----------------------------------------------
% Sumário
% -----------------------------------------------
% Espaço entre entradas de partes no sumário
\setlength{\cftbeforepartskip}{0em}%
\newcommand{\Sumario}{%
  \pretextualchapter{\contentsname}%
  \thispagestyle{empty}%
  \pagestyle{empty}%
  \@starttoc{toc}%
  \cleardoublepage%
}%

% -----------------------------------------------
% Anexos e apêndices (deve ficar antes da definição do \maketitle)
% -----------------------------------------------
\renewcommand{\anexosname}{ANEXOS}%
\renewcommand{\apendicesname}{APÊNDICES}%

\renewcommand{\partapendices}{%
  \part*{\apendicesname}%
  \addcontentsline{toc}{chapter}{\apendicesname}%
}%

\renewcommand{\partanexos}{%
  \part*{\anexosname}%
  \addcontentsline{toc}{chapter}{\anexosname}%
}%

\renewcommand{\postextual}{%
  \bookmarksetup{startatroot}%
  \phantomsection%
  \renewcommand{\tocpartapendices}{%
    \addtocontents{toc}{\cftsetindents{part}{0em}{0em}}%
    \cftinserthook{toc}{A}%
  }%
  \renewcommand{\tocpartanexos}{%
    \addtocontents{toc}{\cftsetindents{part}{0em}{0em}}%
    \cftinserthook{toc}{A}%
  }%
  \renewcommand{\tocinnonumchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{0em}{3em}}%
    \cftinserthook{toc}{A}%
  }%
  \renewcommand{\tocprintchapternonum}{%
    \addtocontents{toc}{\cftsetindents{chapter}{0em}{0em}}%
  }%
}%

% ===============================================
% Redefinição do \maketitle
% ===============================================
\renewcommand{\maketitle}{%
  \pretextual%
  \Capa%
  \GeraFolhaRosto%
  \GeraFolhaAprovacao%
  \GeraDedicatoria%
  \GeraAgradecimentos%
  \GeraEpigrafe%
  \GeraResumo%
  \ifthenelse{\not\equal{\TipoDoc}{estagio}}{%
    \GeraAbstract%
  }{}%
  \GeraListaIlustracoes%
  \GeraListaQuadros%
  \GeraListaTabelas%
  \GeraListaAlgoritmos%
  \GeraListaCodigos%
  \GeraListaSiglas%
  \GeraListaSimbolos%
  \Sumario%
  % Formatação de páginas textuais
  \mainmatter%
}%

% -----------------------------------------------
% Configurações de aparência do PDF final
% -----------------------------------------------
\AtBeginDocument{%
 \makeatletter%
 \hypersetup{%
     pdftitle={\@title},%
     pdfauthor={\@author},%
     bookmarksdepth=4,%
     breaklinks=true%
 }%
 \makeatother%
}%

% -----------------------------------------------
% Ambientes baseados em teoremas
% -----------------------------------------------
\theoremstyle{definition}%
\newtheorem{corolario}{Corolário}%
\newtheorem{definicao}{Definição}%
\newtheorem{exemplo}{Exemplo}%
\newtheorem{lema}{Lema}%
\newtheorem{observacao}{Observação}%
\newtheorem{proposicao}{Proposição}%
\newtheorem{teorema}{Teorema}%
\newenvironment{demonstracao}{\begin{proof}[Demonstração]}{\end{proof}}%

% -----------------------------------------------
% Evita violação de margens
% -----------------------------------------------
\sloppy%
