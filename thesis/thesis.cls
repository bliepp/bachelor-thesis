\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2021/03/15 Thesis LaTeX class]

\RequirePackage[l2tabu,orthodox]{nag} % turn on warnings because of bad style

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{{scrbook}}}
\ProcessOptions\relax
\LoadClass[a4paper,twoside=semi,parskip=half,bibliography=totoc]{scrbook}


% don't use float package, it messes KOMA script up
% try !ht instead of H, if it does not work, just leave it as it is

% packages
%% lmodern: Latin Modern Font instead of Computer Modern (more glyphs)
%% grffile: like graphicx but with more file names
%% xspace: use in macros to automatically insert context based space

%% essentials and encoding
\RequirePackage[ngerman]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
%% features
\RequirePackage{lmodern,grffile,xcolor,caption,tcolorbox}
\RequirePackage{amsmath,amssymb,mathtools}
\RequirePackage{multicol,enumerate,xspace,subcaption}
\RequirePackage[locale=DE,exponent-product=\cdot]{siunitx}
\RequirePackage[colorinlistoftodos,ngerman]{todonotes}
%\RequirePackage{showframe}
\RequirePackage[hyphens]{url}
\RequirePackage{hyperref}
\hypersetup{
	colorlinks=true,	% set true if you want colored links
	linktoc=all,    	% set to all if you want both sections and subsections linked
	linkcolor=black, 	% choose some color if you want links to stand out
	citecolor=black,
	urlcolor=black,
}


% graphical stuff
\renewcommand{\arraystretch}{1.8}


% BibTeX stuff
\bibliographystyle{ieeetr-de}


% definitions
%% helps visualizing still missing references
\newcommand{\missing}{\colorbox{red}{\textbf{MISSING}} }

%% colors
\definecolor{darkgreen}{HTML}{35B035}
\definecolor{darkblue}{HTML}{3B3BC4}
\definecolor{verylightgrey}{HTML}{DDDDDD}

%% units
\newcommand{\powerunit}[1][]{\ensuremath{#1\,\frac{\si{\electronvolt}}{\SI{10.18}{fs}}}\xspace}
\newcommand{\timeunit}{\ensuremath{\,\SI{10.18}{fs}}\xspace}

%% infinitesimal elements
\newcommand{\dinf}{\ensuremath{\text{d}}\xspace}
\newcommand{\dx}[1][x]{\ensuremath{\dinf #1}\xspace}
\newcommand{\ddx}[1][x]{\ensuremath{\frac{\dinf}{\dinf #1}}\xspace}
\newcommand{\partdx}[2]{\ensuremath{\frac{\partial #1}{\partial #2}}\xspace}

\newcommand{\dt}[1][t]{\dx[#1]}
\newcommand{\fwhm}{\ensuremath{\text{FWHM}}\xspace}

%% vector stuff
\newcommand{\rvec}[1]{\ensuremath{\left( \begin{array}{c}#1\end{array} \right)}\xspace}
\newcommand{\tvec}[1]{\ensuremath{\left( #1 \right)^\top}\xspace}
\newcommand{\uvec}[1]{\ensuremath{\underline{#1}}\xspace}
\newcommand{\umat}[1]{\ensuremath{\underline{ \underline{#1} }}\xspace}

%% operator and function stuff
\renewcommand{\Re}{\operatorname{Re}}
\renewcommand{\Im}{\operatorname{Im}}
\newcommand{\sinc}{\operatorname{sinc}}
\newcommand{\BigO}{\operatorname{\mathcal{O}}}
