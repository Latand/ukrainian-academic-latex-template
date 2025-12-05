%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ukrainian Academic Document Class
% Version 1.0 (2025)
%
% Requirements: LuaLaTeX only (not pdfLaTeX)
%
% Features:
% - Ukrainian language support (polyglossia + fontspec)
% - Times New Roman / Liberation Serif, 14pt base
% - 1.5 line spacing
% - Margins: left/right 25mm, top/bottom 20mm
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

% === FONTS AND LANGUAGE ===
% Uses Times New Roman or Liberation Serif (free alternative for CI/Docker)
\RequirePackage{fontspec}
\RequirePackage{polyglossia}
\setdefaultlanguage{ukrainian}
\setotherlanguage{english}

\IfFontExistsTF{Times New Roman}{
    \setmainfont{Times New Roman}
    \setsansfont{Times New Roman}
    \setmonofont{Courier New}[Scale=0.9]
    \newfontfamily\cyrillicfont{Times New Roman}
    \newfontfamily\cyrillicfontsf{Times New Roman}
    \newfontfamily\cyrillicfonttt{Courier New}[Scale=0.9]
}{
    \setmainfont{Liberation Serif}
    \setsansfont{Liberation Sans}
    \setmonofont{Liberation Mono}[Scale=0.9]
    \newfontfamily\cyrillicfont{Liberation Serif}
    \newfontfamily\cyrillicfontsf{Liberation Sans}
    \newfontfamily\cyrillicfonttt{Liberation Mono}[Scale=0.9]
}

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

% === CHAPTER AND SECTION FORMATTING ===
% Using titlesec for consistent formatting
\RequirePackage{titlesec}

% Chapter: "РОЗДІЛ 1. НАЗВА" centered, uppercase
\titleformat{\chapter}{\Large\bfseries\centering}
  {\MakeUppercase{РОЗДІЛ~\thechapter.}}{1em}{\MakeUppercase}
\titlespacing*{\chapter}{0pt}{0pt}{0.5\baselineskip}

% Sections
\titleformat{\section}{\large\bfseries}{\thesection}{1em}{}
\titlespacing*{\section}{0pt}{0.5\baselineskip}{0.5\baselineskip}

\titleformat{\subsection}{\normalsize\bfseries}{\thesubsection}{1em}{}
\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0.25\baselineskip}

\titleformat{\subsubsection}{\normalsize\bfseries}{\thesubsubsection}{1em}{}
\titlespacing*{\subsubsection}{0pt}{0.5\baselineskip}{0.25\baselineskip}

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
% Core metadata (used in titlepage and PDF)
\NewDocumentCommand{\thesistitle} { o m }{%
 \IfValueTF{#1}{\def\shorttitle{#1}}{\def\shorttitle{#2}}%
 \def\@title{#2}%
 \def\ttitle{#2}%
}
\makeatletter
\DeclareDocumentCommand{\author}{m}{\newcommand{\authorname}{#1}\renewcommand{\@author}{#1}}
\NewDocumentCommand{\supervisor}{m}{\newcommand{\supname}{#1}}
\NewDocumentCommand{\university}{m}{\newcommand{\univname}{#1}}
\NewDocumentCommand{\faculty}{m}{\newcommand{\facname}{#1}}
\NewDocumentCommand{\department}{m}{\newcommand{\deptname}{#1}}
\NewDocumentCommand{\specialty}{m}{\newcommand{\specialtyname}{#1}}
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
% Ukrainian standard: left/right 25mm, top/bottom 20mm
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
\hypersetup{
    pdfpagemode={UseOutlines},
    bookmarksopen=true,
    bookmarksopenlevel=0,
    hypertexnames=false,
    hidelinks,
    pdfstartview={FitV},
    unicode,
    breaklinks=true,
}
\pdfstringdefDisableCommands{\let\\\space}
}
}{}

\endinput
