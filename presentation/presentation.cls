\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{presentation}[2021/05/26 Presentation LaTeX class]

%\RequirePackage[l2tabu,orthodox]{nag} % turn on warnings because of bad style

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[t, aspectratio=169]{beamer}

\usetheme{CambridgeUS}
\usecolortheme{dolphin}
\useinnertheme{rectangles}
\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{enumerate items}[default]
\setbeamertemplate{section in toc}{{\usebeamercolor[fg]{structure}\inserttocsectionnumber.}~\inserttocsection}
\setbeamercolor{block title}{bg=structure.fg, fg=structure.bg}
\setbeamercolor{block title alerted}{bg=darkred, fg=structure.bg}
\setbeamercolor{block title example}{bg=darkgreen, fg=structure.bg}
\setbeamerfont{caption}{size=\tiny}

\graphicspath{{../thesis/chapter/main/}}


% packages
%% essentials and encoding
\RequirePackage[english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
%% features
\RequirePackage{amsmath,amssymb,mathtools,caption}
\RequirePackage[exponent-product=\cdot]{siunitx}
\RequirePackage[outdir=./]{epstopdf}
\RequirePackage{tikz}


% TIKZ stuff
\usetikzlibrary{shapes.geometric,arrows}
\tikzset{
	invisible/.style={opacity=0,text opacity=0},
    visible on/.style={alt=#1{}{invisible}},
    alt/.code args={<#1>#2#3}{%
      \alt<#1>{\pgfkeysalso{#2}}{\pgfkeysalso{#3}} % \pgfkeysalso doesn't change the path
    },
}
\tikzstyle{flowchart} = [rectangle, rounded corners, minimum width=0.9\textwidth, text centered, draw=black, fill=white]
\tikzstyle{arrow} = [thick,->,>=stealth]


% BibTeX stuff
\setbeamertemplate{bibliography item}[text]
\bibliographystyle{apalike}


% definitions
%% helps visualizing still missing references
\newcommand{\missing}{\colorbox{red}{\textbf{MISSING}}}

%% colors
\definecolor{darkgreen}{HTML}{35B035}
\definecolor{darkblue}{HTML}{3B3BC4}
\definecolor{verylightgrey}{HTML}{DDDDDD}

% graphical stuff
\renewcommand{\arraystretch}{1.8}

%% structural stuff
\let\oldcolumns\columns
\def\columns{\vspace{-\baselineskip}\oldcolumns[onlytextwidth]}

%% units
\newcommand{\powerunit}[1][]{\ensuremath{#1\,\frac{\si{\electronvolt}}{\SI{10.18}{fs}}}}
\newcommand{\timeunit}{\ensuremath{\,\SI{10.18}{fs}}}

%% infinitesimal elements
\newcommand{\dinf}{\ensuremath{\text{d}}}
\newcommand{\dx}[1][x]{\ensuremath{\dinf #1}}
\newcommand{\ddx}[1][x]{\ensuremath{\frac{\dinf}{\dinf #1}}}
\newcommand{\partdx}[2]{\ensuremath{\frac{\partial #1}{\partial #2}}}
\newcommand{\dt}[1][t]{\dx[#1]}

%% vector stuff
\newcommand{\rvec}[1]{\ensuremath{\left( \begin{array}{c}#1\end{array} \right)}}
\newcommand{\tvec}[1]{\ensuremath{\left( #1 \right)^\top}}
\newcommand{\uvec}[1]{\ensuremath{\underline{#1}}}
\newcommand{\umat}[1]{\ensuremath{\underline{ \underline{#1} }}}

%% operator and function stuff
\renewcommand{\Re}{\operatorname{Re}}
\renewcommand{\Im}{\operatorname{Im}}
\newcommand{\sinc}{\operatorname{sinc}}
\newcommand{\BigO}{\operatorname{\mathcal{O}}}

%% physics stuff
\newcommand{\kB}{\ensuremath{k_\text{B}}}
\newcommand{\kBT}{\ensuremath{k_\text{B}T}}
