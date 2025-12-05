\RequirePackage{xparse}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ukrainian Academic Document Class
% Template for essays, reports, and dissertations
% Version 1.0 (2025)
%
% Features:
% - Ukrainian language support (via fontspec + polyglossia)
% - Times New Roman font, 14pt base size
% - 1.5 line spacing
% - Margins per Ukrainian standards (25mm all sides)
% - Chapter/section formatting for academic documents
%
% Requirements: LuaLaTeX, Times New Roman font
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% === CLASS DEFINITION ===
\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\newcommand{\classname}{UkrainianAcademic}
\ProvidesClass{\classname}[2025/01/01 v1.0 Ukrainian Academic Document]
\providecommand{\baseclass}{book}
\RequirePackage{etoolbox}
\RequirePackage{xparse}

% === CLASS OPTIONS ===
\newbool{nolistspace}
\newbool{chapteroneline}
\newbool{listtoc}
\newbool{toctoc}
\newbool{parskip}
\newbool{hyperrefsupport}
\booltrue{hyperrefsupport}
\newbool{headsepline}
\newbool{consistentlayout}

\DeclareOption{nohyperref}{\boolfalse{hyperrefsupport}}
\DeclareOption{nolistspacing}{\booltrue{nolistspace}}
\DeclareOption{liststotoc}{\booltrue{listtoc}}
\DeclareOption{chapterinoneline}{\booltrue{chapteroneline}}
\DeclareOption{toctotoc}{\booltrue{toctoc}}
\DeclareOption{parskip}{\booltrue{parskip}}
\DeclareOption{headsepline}{\booltrue{headsepline}}
\DeclareOption{consistentlayout}{\booltrue{consistentlayout}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

\ProcessOptions\relax
\LoadClass{\baseclass}

% === FONTS ===
% Uses Times New Roman as required by Ukrainian academic standards
% Change \setmainfont{...} to use a different font
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

% === LINE SPACING ===
% 1.5 spacing is standard for Ukrainian academic documents
% Change to \singlespacing or \doublespacing if needed
\RequirePackage{setspace}
\onehalfspacing

% === FONT SIZES ===
% Base size is 14pt as required by Ukrainian standards
% Modify these values to change document font sizes
\renewcommand{\normalsize}{\fontsize{14}{18}\selectfont}
\renewcommand{\small}{\fontsize{12}{15}\selectfont}
\renewcommand{\footnotesize}{\fontsize{10}{12}\selectfont}
\renewcommand{\scriptsize}{\fontsize{8}{10}\selectfont}
\renewcommand{\tiny}{\fontsize{6}{7}\selectfont}
\renewcommand{\large}{\fontsize{16}{20}\selectfont}
\renewcommand{\Large}{\fontsize{18}{22}\selectfont}
\renewcommand{\LARGE}{\fontsize{20}{25}\selectfont}
\renewcommand{\huge}{\fontsize{24}{30}\selectfont}
\renewcommand{\Huge}{\fontsize{28}{35}\selectfont}

% === CHAPTER FORMATTING ===
% Customize chapter title appearance
\ProvideDocumentCommand{\abovechapterskip}{}{\vspace*{0pt}}
\ProvideDocumentCommand{\chapterbelowskip}{}{\vspace{24pt}}
\ProvideDocumentCommand{\chapterinbetweenskip}{}{}
\ProvideDocumentCommand{\autodot}{}{}
\ProvideDocumentCommand{\mdtChapapp}{}{}
\ProvideDocumentCommand{\chapteralign}{}{\centering}
\ProvideDocumentCommand{\chapterfont}{}{\Large\bfseries}
\ProvideDocumentCommand{\sectionfont}{}{\large\bfseries}

% === SECTION FORMATTING ===
\makeatletter
\def\section{\@startsection{section}{1}{\z@}{3.5ex \@plus 1ex \@minus .2ex}{2.3ex \@plus.2ex}{\sectionfont}}
\def\subsection{\@startsection{subsection}{2}{\z@}{3.25ex\@plus 1ex \@minus .2ex}{1.5ex \@plus .2ex}{\normalfont\large\bfseries}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{3.25ex\@plus 1ex \@minus .2ex}{1.5ex \@plus .2ex}{\normalfont\normalsize\bfseries}}

\ProvideDocumentCommand{\chapterprefixfont}{}{\Large\bfseries}
\DeclareDocumentCommand{\@makechapterhead}{ m }{%
	\abovechapterskip
	{\parindent \z@ \chapteralign \normalfont
		\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
		\ifbool{chapteroneline}{%
			\chapterfont \mdtChapapp\thechapter\autodot\enspace
		}{%
			\chapterprefixfont \@chapapp\space \thechapter
			\par\nobreak
			\chapterinbetweenskip
		}%
		\fi
		\fi
		\interlinepenalty\@M%
		\chapterfont #1\par\nobreak
		\chapterbelowskip
	}
	\thispagestyle{\chapter@p@gestyle}
}
\def\@makeschapterhead#1{%
	\abovechapterskip
	{\parindent \z@ \chapteralign
		\normalfont
		\interlinepenalty\@M
		\chapterfont  #1\par\nobreak
		\chapterbelowskip
	}
	\thispagestyle{\chapter@p@gestyle}
}
\makeatother

% === NUMBERING ===
% Equations, tables, figures numbered per chapter (e.g., 1.1, 1.2, 2.1)
\renewcommand{\theequation}{\thechapter.\arabic{equation}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}

\makeatletter
\@addtoreset{equation}{chapter}
\@addtoreset{table}{chapter}
\@addtoreset{figure}{chapter}
\makeatother

% === UNNUMBERED CHAPTERS ===
% Use \addchap{Title} for unnumbered chapter with TOC entry
\ProvideDocumentCommand{\addchap}{ s o m }{%
	\chapter*{#3}%
	\markboth{}{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addchaptertocentry{#3}%
			\markboth{\MakeMarkcase{#3}}{\MakeMarkcase{#3}}%
		}{%
			\addchaptertocentry{#2}%
			\markboth{\MakeMarkcase{#2}}{\MakeMarkcase{#2}}%
		}%
	}%
}%

\ProvideDocumentCommand{\addsec}{ s o m }{%
	\section*{#3}%
	\markright{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{section}{#3}%
			\markright{\MakeMarkcase{#3}}%%
		}{%
			\addcontentsline{toc}{section}{#2}%
			\markright{\MakeMarkcase{#2}}%
		}%
	}%
}%

% === LIST OPTIONS ===
\ifbool{parskip}{\RequirePackage{parskip}}{}

\ifbool{listtoc}{%
	\patchcmd{\listoftables}{\@starttoc{lot}}{%
		\addchaptertocentry{\listtablename}\@starttoc{lot}%
	}{}{}%
	\patchcmd{\listoffigures}{\@starttoc{lof}}{%
		\addchaptertocentry{\listfigurename}\@starttoc{lof}%
	}{}{}%
}

\ifbool{toctoc}{%
	\patchcmd{\tableofcontents}{\@starttoc{toc}%
}{%
	\addchaptertocentry{\contentsname}\@starttoc{toc}}{}{}%
}

\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}

\ifbool{nolistspace}{
	\patchcmd{\listoffigures}{%
		\@starttoc{lof}
	}{%
		\begingroup%
		\singlespace\@starttoc{lof}\endgroup%
	}{}{}%
	\patchcmd{\listoftables}{%
		\@starttoc{lot}
	}{%
		\begingroup%
		\singlespace\@starttoc{lot}\endgroup%
	}{}{}%
	\patchcmd{\tableofcontents}{%
		\@starttoc{toc}
	}{%
		\begingroup%
		\singlespace\@starttoc{toc}\endgroup%
	}{}{}%
}{}

% === REQUIRED PACKAGES ===
\RequirePackage{scrbase}
\RequirePackage{scrhack}
\RequirePackage{longtable}
\RequirePackage{siunitx}
\RequirePackage{graphicx}
\graphicspath{{images/}{./}}
\RequirePackage{booktabs}

% === CAPTIONS ===
% Table and figure caption formatting
\RequirePackage{caption}
\captionsetup{
    labelsep=period,
    font=small,
    labelfont=bf,
    textfont=normal,
    justification=centerlast,
    singlelinecheck=false,
    margin=10pt
}
\captionsetup[table]{position=top}
\captionsetup[figure]{position=bottom}

% === DOCUMENT METADATA COMMANDS ===
% Use these in your main.tex to set document information
\NewDocumentCommand{\thesistitle} { o m }{%
 \IfValueTF{#1}{\def\shorttitle{#1}}{\def\shorttitle{#2}}%
 \def\@title{#2}%
 \def\ttitle{#2}%
}
\makeatletter
\DeclareDocumentCommand{\author}{m}{\newcommand{\authorname}{#1}\renewcommand{\@author}{#1}}
\NewDocumentCommand{\supervisor}{m}{\newcommand{\supname}{#1}}
\NewDocumentCommand{\examiner}{m}{\newcommand{\examname}{#1}}
\NewDocumentCommand{\degree}{m}{\newcommand{\degreename}{#1}}
\NewDocumentCommand{\specialty}{m}{\newcommand{\specialtyname}{#1}}
\NewDocumentCommand{\field}{m}{\newcommand{\fieldname}{#1}}
\NewDocumentCommand{\addresses}{m}{\newcommand{\addressname}{#1}}
\NewDocumentCommand{\university}{m}{\newcommand{\univname}{#1}}
\NewDocumentCommand{\department}{m}{\newcommand{\deptname}{#1}}
\NewDocumentCommand{\group}{m}{\newcommand{\groupname}{#1}}
\NewDocumentCommand{\faculty}{m}{\newcommand{\facname}{#1}}
\NewDocumentCommand{\subject}{m}{\newcommand{\subjectname}{#1}}
\NewDocumentCommand{\keywords}{m}{\newcommand{\keywordnames}{#1}}
\NewDocumentCommand{\keywordseng}{m}{\newcommand{\keywordnameseng}{#1}}
\makeatother

% === UTILITY COMMANDS ===
\newcommand{\checktoopen}{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\ifdef{\phantomsection}{\phantomsection}{}%
}

\NewDocumentCommand{\bhrule}{}{\typeout{--------------------}}
\NewDocumentCommand{\tttypeout}{m}{\bhrule\typeout{\space #1}\bhrule}

\newcommand{\HRule}{\rule{.9\linewidth}{.6pt}}
\newcommand{\decoRule}{\rule{.8\textwidth}{.4pt}}

\setcounter{tocdepth}{3}
\ProvideDocumentCommand{\addchaptertocentry}{ m }{%
	\addcontentsline{toc}{chapter}{#1}%
}

% === SPECIAL ENVIRONMENTS ===

% Ukrainian abstract
\NewDocumentEnvironment{ukrainianabstract}{}{%
    \chapter*{АНОТАЦІЯ}
    \addcontentsline{toc}{chapter}{Анотація}
    \markboth{АНОТАЦІЯ}{АНОТАЦІЯ}
}{}

% English abstract
\NewDocumentEnvironment{englishabstract}{}{%
    \chapter*{ABSTRACT}
    \addcontentsline{toc}{chapter}{Abstract}
    \markboth{ABSTRACT}{ABSTRACT}
}{}

% === ABBREVIATIONS ===
% Configurable abbreviations section title
\newcommand{\abbrevname}{ПЕРЕЛІК УМОВНИХ ПОЗНАЧЕНЬ}
\NewDocumentCommand{\setabbrevname}{m}{\renewcommand{\abbrevname}{#1}}

\NewDocumentEnvironment{abbreviations}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\abbrevname}}{\addchap*{\abbrevname}}
	\begin{longtable}{#1}
	}{%
	\end{longtable}
	\addtocounter{table}{-1}
	\ifbool{nolistspace}{\endgroup}{}
}

% === COLORS ===
\usepackage{xcolor}
\colorlet{mdtRed}{red!50!black}

% === MARGINS ===
% Ukrainian standard: 25mm on all sides
% Modify these values to change page margins
\RequirePackage{geometry}
\geometry{
    left=25mm,
    right=25mm,
    top=20mm,
    bottom=20mm,
    headheight=4ex,
    includehead,
    includefoot
}

\raggedbottom

% === TEXT QUALITY ===
\doublehyphendemerits=10000
\brokenpenalty=10000
\widowpenalty=9999
\clubpenalty=9999
\interfootnotelinepenalty=9999

% === HEADERS AND FOOTERS ===
\RequirePackage[markcase=used]{scrlayer-scrpage}
\providepairofpagestyles{thesisSimple}{%
	\clearpairofpagestyles%
	\automark[chapter]{chapter}
	\ifoot{}
	\ofoot[\pagemark]{\pagemark}
}
\ihead{}
\ohead{}
\pagestyle{thesisSimple}
\providepairofpagestyles[thesisSimple]{thesis}{%
	\automark*[section]{}%
}
\providepairofpagestyles[thesisSimple]{review}{%
	\ofoot[\shorttitle/\authorname]{\shorttitle/\authorname}
	\ifoot[\today]{\today}
}
\pagestyle{thesis}
\ifbool{headsepline}{\KOMAoption{headsepline}{true}}{}
\PreventPackageFromLoading[\ClassError{\classname}{Package `fancyhdr' is
incompatible\MessageBreak with this class}{The pagesyles are defined
	using package `scrlayer-scrpage', please consult the\MessageBreak
KOMA-script documentation for details.}]{fancyhdr}

\makeatletter
\newcommand{\blank@p@gestyle}{empty}
\newcommand{\chapter@p@gestyle}{plain}
\makeatother
\NewDocumentCommand{\blankpagestyle}{ m }{%
	\ClassWarning{\classname}{\string\blankpagestyle\space is
	obsolete,\MessageBreak use \string\setblankpagestyle \space  instead}\renewcommand{\blank@p@gestyle}{}{#1}
}
\NewDocumentCommand{\setblankpagestyle}{ m }{\renewcommand{\blank@p@gestyle}{#1}}
\NewDocumentCommand{\setchapterpagestyle}{ m }{\renewcommand{\chapter@p@gestyle}{#1}}

\DeclareDocumentCommand\cleardoublepage{}{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\thispagestyle{\blank@p@gestyle}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}

% === HYPERLINKS ===
\ifbool{hyperrefsupport}{%
\AtEndPreamble{\RequirePackage{hyperref}
\hypersetup{pdfpagemode={UseOutlines},
bookmarksopen=true,
bookmarksopenlevel=0,
hypertexnames=false,
colorlinks=false,
citecolor=blue,
linkcolor=black,
urlcolor=mdtRed,
pdfstartview={FitV},
unicode,
breaklinks=true,
}

\pdfstringdefDisableCommands{%
	\let\\\space%
}
	}
}{%nothing
}

\endinput
