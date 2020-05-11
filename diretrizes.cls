\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{diretrizes}[2015/02/02]

% Repassa os parâmetros ao abntex2
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{abntex2}
}

\PassOptionsToClass{%
    % Opções da classe memoir
    12pt,                       % Tamanho da fonte
    openright,                 % Capítulos começam em página ímpar (insere página vazia caso preciso)
    a4paper,                    % Tamanho do papel
    sumario=abnt-6027-2012,     % Seleciona o sumário abnt-6027-2012
    % Opções da classe abntex2
    chapter=TITLE,              % Títulos de capítulos convertidos em letras maiúsculas
    section=TITLE,              % Títulos de seções convertidos em letras maiúsculas
    % Opções do pacote babel
    brazil,                     % Idioma do documento
    }{abntex2}

\ProcessOptions\relax
\LoadClass{abntex2}

\RequirePackage[brazilian,hyperpageref]{backref}        % Produzir índice nas referências
\RequirePackage{makeidx}                                % Produzir índice remissivo de palavras
\RequirePackage{chngcntr}

\usepackage{setspace}
\usepackage{caption}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONFIGURAÇÕES GERAIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Configurações do pacote backref
\renewcommand{\backrefpagesname}{Citado na(s) p\'agina(s):~}
% Texto padrão antes do número das páginas
\renewcommand{\backref}{}
% Define os textos da citação
\renewcommand*{\backrefalt}[4]{%
    \ifcase #1
        Nenhuma cita\c{c}\~ao no texto.
    \or
        Citado na p\'agina #2.
    \else
        Citado #1 vezes nas p\'aginas #2.
    \fi
}

% Define a numeração das equações de forma sequencial
\counterwithout{equation}{chapter}

% Redefine títulos
\renewcommand{\folhaderostoname}{Folha de Rosto}
\renewcommand{\folhadeaprovacaoname}{Folha de Aprova\c{c}\~ao}
\addto\captionsbrazil{%
    % Ajusta nomes padrões do babel
    \renewcommand{\bibname}{REFER\^ENCIAS}
    \renewcommand{\listadesiglasname}{LISTA DE ABREVIATURAS E SIGLAS}
    \renewcommand{\listadesimbolosname}{LISTA DE S\'IMBOLOS}
    \renewcommand{\listfigurename}{LISTA DE FIGURAS}
    \renewcommand{\listtablename}{LISTA DE TABELAS}
    % Ajusta nomes usados com a macro \autoref
    \renewcommand{\pageautorefname}{p\'agina}
    \renewcommand{\sectionautorefname}{SE{\c C}\~AO}
    \renewcommand{\subsectionautorefname}{SUBSE{\c C}\~AO}
    \renewcommand{\subsubsectionautorefname}{Subse{\c c}\~ao}
    \renewcommand{\paragraphautorefname}{Subse{\c c}\~ao}
}
\newcommand{\listofquadrosname}{LISTA DE QUADROS}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESTILO DE ELEMENTOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Elementos textuais
\renewcommand{\textual}{%
	
    %\pagenumbering{arabic} % Inicia a numeração em 1
	\setcounter{page}{10} 			%>>>INDICAR PAGINA DE INTRODUÇÂO
    \ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
        \pagestyle{plain}
    }
    {%
		\pagestyle{simple}
        %\pagestyle{abntheadings}
        \aliaspagestyle{chapter}{abntchapfirst}
    }
    \nouppercaseheads
    \bookmarksetup{startatroot}
}

%Elementos pós-textuais
\renewcommand{\postextual}{%
    \phantompart
    \renewcommand{\indexname}{\'Indice Remissivo}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMANDOS GERAIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Automatiza o processo de aspas
\newcommand{\aspas}[1]{``{#1}''}

% % % Citação direta 
\newenvironment{citacaodiretas}{%
  \begin{list}{}{%
    \small
    \setlength{\leftmargin}{4cm}
    \singlespacing
  }
  \item\relax
}{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMANDOS DE DADOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Comandos de dados - nome autor
\providecommand{\imprimirnomeautor}{}
\newcommand{\nomeautor}[1]{\renewcommand{\imprimirnomeautor}{#1}}

% Comandos de dados - nome autor
\providecommand{\imprimirtitulotb}{}
\newcommand{\titulotb}[1]{\renewcommand{\imprimirtitulotb}{#1}}

% Comandos de dados - departamento
\providecommand{\imprimirdepartamento}{}
\newcommand{\departamento}[1]{\renewcommand{\imprimirdepartamento}{#1}}

% Comandos de dados - abreviatura
\providecommand{\imprimirabreviatura}{}
\newcommand{\abreviatura}[1]{\renewcommand{\imprimirabreviatura}{#1}}

% Comandos de dados - programa
\providecommand{\imprimirprograma}{}
\newcommand{\programa}[1]{\renewcommand{\imprimirprograma}{#1}}

% Comandos de dados - modalidade
\providecommand{\imprimirmodalidade}{}
\newcommand{\modalidade}[1]{\renewcommand{\imprimirmodalidade}{#1}}

% Comandos de dados - subtítulo
\providecommand{\imprimirsubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\imprimirsubtitulo}{#1}}

% Comandos de dados - grau
\providecommand{\imprimirgrau}{}
\newcommand{\grau}[1]{\renewcommand{\imprimirgrau}{#1}}

% Comandos de dados - data apresentacao
\providecommand{\imprimirdataapresentacao}{}
\newcommand{\dataapresentacao}[1]{\renewcommand{\imprimirdataapresentacao}{#1}}

% Comandos de dados - local apresentacao
\providecommand{\imprimirlocalapresentacao}{}
\newcommand{\localapresentacao}[1]{\renewcommand{\imprimirlocalapresentacao}{#1}}

% Comandos de dados - ano apresentacao
\providecommand{\imprimiranoapresentacao}{}
\newcommand{\anoapresentacao}[1]{\renewcommand{\imprimiranoapresentacao}{#1}}
% Comandos de dados - mes
\providecommand{\imprimirmesapresentacao}{}
\newcommand{\mesapresentacao}[1]{\renewcommand{\imprimirmesapresentacao}{#1}}

% Comandos de dados - instituição do orientador
\providecommand{\imprimirinstOrientador}{}
\newcommand{\instOrientador}[1]{\renewcommand{\imprimirinstOrientador}{#1}}

% Comandos de dados - departamento orientador
\providecommand{\imprimirdepartamentoorientador}{}
\newcommand{\departamentoorientador}[1]{\renewcommand{\imprimirdepartamentoorientador}{#1}}

% Comandos de dados - titulacao coorientador
\providecommand{\imprimirtitulacaoorientador}{}
\newcommand{\titulacaoorientador}[1]{\renewcommand{\imprimirtitulacaoorientador}{#1}}

% Comandos de dados - instituição do coorientador
\providecommand{\imprimirinstCoorientador}{}
\newcommand{\instCoorientador}[1]{\renewcommand{\imprimirinstCoorientador}{#1}}

% Comandos de dados - departamento coorientador
\providecommand{\imprimirdepartamentocoorientador}{}
\newcommand{\departamentocoorientador}[1]{\renewcommand{\imprimirdepartamentocoorientador}{#1}}

% Comandos de dados - titulacao coorientador
\providecommand{\imprimirtitulacaocoorientador}{}
\newcommand{\titulacaocoorientador}[1]{\renewcommand{\imprimirtitulacaocoorientador}{#1}}

% Comandos de dados - nome examinador 1
\providecommand{\imprimirnmexamum}{}
\newcommand{\nmexamum}[1]{\renewcommand{\imprimirnmexamum}{#1}}

% Comandos de dados - instituição examinador 1
\providecommand{\imprimirinstexamum}{}
\newcommand{\instexamum}[1]{\renewcommand{\imprimirinstexamum}{#1}}

% Comandos de dados - departamento examinador 1
\providecommand{\imprimirdepartamentoexamum}{}
\newcommand{\departamentoexamum}[1]{\renewcommand{\imprimirdepartamentoexamum}{#1}}

% Comandos de dados - titulacao examinador 1
\providecommand{\imprimirtitulacaoexamum}{}
\newcommand{\titulacaoexamum}[1]{\renewcommand{\imprimirtitulacaoexamum}{#1}}

% Comandos de dados - nome examinador 2
\providecommand{\imprimirnomeexamdois}{}
\newcommand{\nomeexamdois}[1]{\renewcommand{\imprimirnomeexamdois}{#1}}

% Comandos de dados - instituição examinador 2
\providecommand{\imprimirinstexamdois}{}
\newcommand{\instexamdois}[1]{\renewcommand{\imprimirinstexamdois}{#1}}

% Comandos de dados - departamento examinador 2
\providecommand{\imprimirdepartamentoexamdois}{}
\newcommand{\departamentoexamdois}[1]{\renewcommand{\imprimirdepartamentoexamdois}{#1}}

% Comandos de dados - titulacao examinador 2
\providecommand{\imprimirtitulacaoexamdois}{}
\newcommand{\titulacaoexamdois}[1]{\renewcommand{\imprimirtitulacaoexamdois}{#1}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OBJETOS FLUTUANTES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Comando que trata a fonte nos objetos flutuantes
\renewcommand{\fonte}[1]{%
    \begin{SingleSpacing}\par\end{SingleSpacing}
    \centering\small{Fonte: #1}
}

% Comando que trata as notas nos objetos flutuantes
\renewcommand{\nota}[1]{%
    \begin{SingleSpacing}\par\end{SingleSpacing}
    \begin{tabular}{l p{.85\textwidth}}%
        Nota: & #1
    \end{tabular}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PARÁGRAFOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Tamanho da endentação do parágrafo
\setlength{\parindent}{1.5cm}

% Espaçamento entre um parágrafo e outro
\setlength{\parskip}{0.2cm}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FONTES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Redefinição de fontes
\renewcommand{\ABNTEXchapterfont}{\large\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\large}

\renewcommand{\ABNTEXpartfont}{\normalfont}
\renewcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

\renewcommand{\ABNTEXsectionfont}{\normalfont\MakeUppercase}
\renewcommand{\ABNTEXsectionfontsize}{\Large}

\renewcommand{\ABNTEXsubsectionfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}

\renewcommand{\ABNTEXsubsubsectionfont}{\normalfont\bfseries}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize\bfseries}

\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SUMÁRIO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Insere espaço entre os itens do sumário de diferentes capítulos
\setlength{\cftbeforechapterskip}{0.0em \@plus\p@}

\renewcommand*{\cftsectionfont}{\normalfont}
\renewcommand*{\cftpartfont}{\normalfont}
\renewcommand*{\cftsubsectionfont}{\normalfont\bfseries}
\renewcommand*{\cftsubsubsectionfont}{\normalfont}

% Alteração da indentação dos itens do sumário
\cftsetindents{section}{0pt}{20pt}
\cftsetindents{subsection}{0pt}{32pt}
\cftsetindents{subsubsection}{0pt}{42pt}

%\newcommand{\sumario}
%{
%        \thispagestyle{empty}
%        \setlength{\baselineskip}{1.0\baselineskip} % Espacamento: 0.7
%        \begin{center}
%                \textbf{SUM\'ARIO} \\ [0.5\baselineskip]
%        \end{center}
%        \@starttoc{toc}
%        \cleardoublepage
%        \newpage
%}

\newcommand{\sumario}
{	
		\setlength\cftpartnumwidth{\cftparagraphnumwidth}
		\setlength\cftchapternumwidth{\cftparagraphnumwidth}
		\setlength\cftsectionnumwidth{\cftparagraphnumwidth}
		\setlength\cftsubsectionnumwidth{\cftparagraphnumwidth}
		\setlength\cftsubsubsectionnumwidth{\cftparagraphnumwidth}
		\setlength\cftsectionindent{0pt}
		\setlength\cftsubsectionindent{0pt}
		\setlength\cftsubsubsectionindent{0pt}
		%\renewcommand{\cftpartfont}{\normalfont}
		%\renewcommand*{\cftsubsubsectionfont}{\bfseries}

		\thispagestyle{empty}
        \setlength{\baselineskip}{-2\baselineskip} % Espacamento: 0.7
        \begin{center}
                \large\textbf{SUM\'ARIO} \\ [1.5\baselineskip]
        \end{center}
        \@starttoc{toc}
        \cleardoublepage
        \newpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cria a lista de quadros
\newcommand{\quadroname}{Quadro}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}

\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEDICATÓRIA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewenvironment{dedicatoria}[1][]
{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\dedicatorianame}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{em}
        \begin{minipage}{.5\textwidth}
            \begin{OnehalfSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}	
{%       
		\end{OnehalfSpacing}
        \end{minipage}
        \end{em}
    \end{flushright}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EPIGRAFE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewenvironment{epigrafe}[1][]
{%
    \ifthenelse{\equal{#1}{}}{%
        \PRIVATEbookmarkthis{\epigraphname}
    }{\pretextualchapter{#1}}

    \vspace*{\fill}

    \begin{flushright}
        \begin{minipage}{.5\textwidth}
            \begin{OnehalfSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}
{%
            \end{OnehalfSpacing}
        \end{minipage}
    \end{flushright}
}

\newenvironment{autorepigrafe}[1][]
{%
    \vspace*{-1,5cm}
		\begin{flushright}
            \begin{OnehalfSpacing}
                \setlength\parindent{0pt}
                \setlength\parskip{12pt}
}
{%
            \end{OnehalfSpacing}
		   \end{flushright}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AGRADECIMENTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{agradecimento}{
    \newpage %%cria nova pagina
    \thispagestyle{empty}%%limpa estilo da pagina
    \normalsize %Muda tamanho da fonte

    \begin{center}
	     \large\textbf{AGRADECIMENTOS}
    \end{center}%Alinhamento centralizado
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RESUMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{RESUMO}{
    \newpage %%cria nova pagina
    \thispagestyle{empty}%%limpa estilo da pagina
    \normalsize %Muda tamanho da fonte

    \begin{center}
	    \large\textbf{RESUMO}
    \end{center}%Alinhamento centralizado
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ABSTRACT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{ABSTRACT}{
	\newpage %%cria nova pagina
    \thispagestyle{empty}%%limpa estilo da pagina
    \normalsize %Muda tamanho da fonte

    \begin{center}
	     \large\textbf{ABSTRACT}
    \end{center}%Alinhamento centralizado
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FORMATACAO DAS PAGINAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definicao das margens e espaçamentos
%\setlrmarginsandblock{3cm}{2cm}{*} % externa / interna
%\setulmarginsandblock{3cm}{2cm}{*} % superior / inferior

%\checkandfixthelayout

% Recuo do paragrafo
\setlength{\parindent}{1.5 cm} % normativo citatanto o valor de 1,25 qto 1,5cm
% sem espaco entre os paragrafos
\setlength{\parskip}{0.5 cm}

% Espacamentos nos titulos:
% chapter
\setlength{\beforechapskip}{0 cm} %com 0 nao funcionou
\setlength{\afterchapskip}{1.0 cm} % antes do titulo de capitulo


\captionsetup{justification=raggedright, labelfont=bf, textfont=bf, font=footnotesize, singlelinecheck=false}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FORMATACAO DAS REFERENCIAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand*{\backreflastsep}{, }
\renewcommand*{\backreftwosep}{, }
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{%
  \ifcase #1 %
   \relax %
  \or
   \relax %
  \else
   \relax %
  \fi%
}