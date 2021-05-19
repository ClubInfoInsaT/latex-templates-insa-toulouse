\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{insa}[2020/09/12 v1.0, Classe de base pour les documents associés à l'INSA]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Options                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Configuration du documents
\newif\ifinsa@livret
\insa@livretfalse
\def\insa@baseclass{article}

\DeclareOption{livret}{%
    \insa@livrettrue
	\def\insa@baseclass{article}%
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\insa@baseclass}}
\ProcessOptions\relax

\LoadClass{\insa@baseclass}
\newcommand{\sectionwithoutnumber}[1]{
    \section*{#1}
    \addcontentsline{toc}{section}{\protect\numberline{}#1}%
}

%%Variables
\newcommand{\insa@titre}{}
\newcommand{\titre}[1]{\gdef\insa@titre{#1}}
\newcommand{\insa@auteur}{}
\newcommand{\auteur}[1]{\gdef\insa@auteur{#1}}
\newcommand{\insa@info}{}
\newcommand{\info}[1]{\gdef\insa@info{#1}}
\def\insa@type{Cours}
\newcommand{\type}[1]{\gdef\insa@type{#1}}
\def\insa@date{-\hspace{0.25cm}Version du \today\hspace{0.25cm}-}
\renewcommand{\date}[1]{\gdef\insa@date{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Polices WIP                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\RequirePackage{fontspec}
%\newfontfamily\insa@verbfont{verb}[Path=meta/fonts/,%
%            ItalicFont=*-italic,%
%            BoldFont=*-regular,%
%            BoldItalicFont=*-regular-italic,%
%            Extension=.ttf,%
%            LetterSpace=6,%
%            WordSpace=1.5,
%            NFSSFamily=insafont]
%          
%          
% TODO  
% if titlefont
%\newcommand\insa@titlefont{\insa@verbfont}
% else
\newcommand\insa@titlefont{\normalfont}
% fi
%
% if documentfont
%\renewcommand{\rmdefault}{insafont}
%\renewcommand{\sfdefault}{insafont}
% fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Couleurs                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{hyperref}

\usetikzlibrary{fadings}

% Configurations
\hypersetup{
	colorlinks=true,
	linkcolor=black,
	filecolor=blue,
	urlcolor=blue,
}

% Color definition
\definecolor{insa@institutionnel}{RGB}{0,77,112}
\definecolor{insa@formation}{RGB}{155,14,70}
\definecolor{insa@recherche}{RGB}{32,137,150}
\definecolor{insa@international}{RGB}{127,151,152}
\definecolor{insa@entreprise}{RGB}{132,107,92}
\definecolor{insa@campus}{RGB}{226,147,0}

\definecolor{insa@rouge}{RGB}{228,38,24}

% Color command
\newcommand{\setcolorinstitutionnel}{\colorlet{insa@color}{insa@institutionnel}}
\newcommand{\setcolorformation}{\colorlet{insa@color}{insa@formation}}
\newcommand{\setcolorrecherche}{\colorlet{insa@color}{insa@recherche}}
\newcommand{\setcolorinternational}{\colorlet{insa@color}{insa@international}}
\newcommand{\setcolorentreprise}{\colorlet{insa@color}{insa@entreprise}}
\newcommand{\setcolorcampus}{\colorlet{insa@color}{insa@campus}}
\newcommand{\setcolorcustom}[1]{\definecolor{insa@color}{RGB}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Annexes                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{minitoc}
\newcommand{\annexes}[1]{
    \clearpage
    \sectionwithoutnumber{#1}
    \appendix
    \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
    \renewcommand{\stctitle}{} % Titre
    \renewcommand\thesubsection{\Alph{subsection}} % Numérotation
    \renewcommand{\stcSSfont}{} % Police normale, pas en gras
    \mtcsetrules{secttoc}{off} % Désactivation des lignes en haut et en bas de la table
    \secttoc
    \clearpage
    \pagenumbering{Roman}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entête                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
%\RequirePackage{lastpage}

\newcommand{\pieddepage}{
    \renewcommand\footrulewidth{1pt}
    \fancyfoot[L]{}
    \fancyfoot[C]{Page \thepage}
    \fancyfoot[R]{}
}

\newcommand{\entete}{
    \renewcommand\headrulewidth{1pt}
    \fancyhead[L]{}
    \fancyhead[C]{\textbf{\insa@type} : \insa@titre}
    \fancyhead[R]{}
}

\newcommand{\enteteanexe}{
    \renewcommand{\subsectionmark}[1]{\markboth{##1}{}} 
    \renewcommand\headrulewidth{1pt}
    \fancyhead[L]{}
    \fancyhead[C]{\textbf{Annexe \Alph{subsection}} : \leftmark}
    \fancyhead[R]{}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pages                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Page de couverture
\gdef\maketitle{%
	\begin{titlepage}
		\thispagestyle{empty}
		\noindent%
		\begin{tikzpicture}[remember picture,overlay,shift={(current page.south west)}]%
			%\draw[draw=none, fill=blue] (0,7) -- (16.7,15.75) -- (0,24.5) -- cycle;
			\draw[draw=none, path fading=east, left color=insa@color, right color=insa@color!10!white] (0,0.25\paperheight) -- (0.8\paperwidth,0.55\paperheight) -- (0,0.85\paperheight) -- cycle;
			\draw[draw=none, path fading=east, left color=insa@color, right color=insa@color!10!white] (0,0.35\paperheight) -- (0.7\paperwidth,0.6125\paperheight) -- (0,0.875\paperheight) -- cycle;
			\draw[draw=none, path fading=east, left color=insa@color, right color=insa@color!25!white] (\paperwidth,0.54\paperheight) -- (0.675\paperwidth,0.661875\paperheight) -- (\paperwidth,0.78375\paperheight) -- cycle;
			\draw[draw=none, path fading=east, left color=insa@color, right color=insa@color!60!white] (\paperwidth,0.58\paperheight) -- (0.35\paperwidth,0.82375\paperheight) -- (\paperwidth,1.0675\paperheight) -- cycle;
			
			\draw[draw=none, fill=insa@rouge] (0.33333\paperwidth,0) -- (0.33333\paperwidth,0.075\paperheight) -- (0.666666\paperwidth,0) -- cycle;
			
			\node[anchor=south east, align=right, text width=12cm] (type) at (0.975\paperwidth,0.425\paperheight)
			    {\insa@titlefont\textbf{\Huge{\insa@type}}};
			\node[anchor=north east, align=right, text width=12cm] (titre) at (type.south east) {\insa@titlefont\huge{\insa@titre}};
			\node[anchor=center, align=center, text width=12cm] at (0.5\paperwidth,0.2\paperheight) {\insa@titlefont%
				\ifx\insa@auteur\empty%
				\else%
				    \LARGE{\insa@auteur}\\
				\fi
				\ifx\insa@info\empty%
				\else%
				    \large{\insa@info}
				\fi
				\vspace{0.5cm}
				\begin{center}
					\insa@date
				\end{center}
			};
			\node[anchor=north west] at (0.075\paperwidth,0.975\paperheight) {\includegraphics[scale=0.25]{meta/Logo_INSAToulouse-quadri.eps}};
		\end{tikzpicture}
	\end{titlepage}
	\thispagestyle{empty}%
	\ifinsa@livret\hbox{}\newpage\fi%
	\thispagestyle{fancy}%
}

%% Page de garde
\gdef\makecoverpage{%
	\thispagestyle{empty}
	\noindent%
	\begin{tikzpicture}[remember picture,overlay,shift={(current page.south west)}]%
		
		
		\node[anchor=south east, align=right, text width=12cm] (type) at (0.975\paperwidth,0.425\paperheight)
		    {\insa@titlefont\textbf{\Huge{\insa@type}}};
		\node[anchor=north east, align=right, text width=12cm] (titre) at (type.south east) {\insa@titlefont\huge{\insa@titre}};
		\node[anchor=center, align=center, text width=12cm] at (0.5\paperwidth,0.2\paperheight) {\insa@titlefont%
			\ifx\insa@auteur\empty%
			\else%
			    \LARGE{\insa@auteur}\\
			\fi
			\ifx\insa@info\empty%
			\else%
			    \large{\insa@info}
			\fi
			\vspace{0.5cm}
			\begin{center}
				\insa@date
			\end{center}
		};
		\node[anchor=north west] at (0.075\paperwidth,0.975\paperheight) {\includegraphics[scale=0.25]{meta/Logo_INSAToulouse-ng.eps}};
	\end{tikzpicture}
	\hbox{}\newpage
	\thispagestyle{empty}%
	\ifinsa@livret\hbox{}\newpage\fi%
	\thispagestyle{fancy}%
	\setcounter{page}{1}
}

%% 4eme de couverture
\newcommand{\makefourthcover}{%
	\clearpage%
	% Ajout d'une page vide pour toujours avoir la page sur un verso
	\ifodd\thepage\else\hbox{}\newpage\fi%
	\pagenumbering{gobble}%
	\thispagestyle{empty}%
	\ifinsa@livret\hbox{}\newpage\fi%
	\noindent%
	\begin{tikzpicture}[remember picture, overlay, shift={(current page.south west)}]%
		\draw[draw=none, path fading=east, left color=insa@color, right color=insa@color!25!white] (\paperwidth,0.25\paperheight) -- (0.2\paperwidth,0.5425\paperheight) -- (\paperwidth,0.835\paperheight) -- cycle;
		\draw[draw=none, path fading=east, left color=insa@color, right color=insa@color!60!white] (0,0.55\paperheight) -- (0.333333333\paperwidth,0.6625\paperheight) -- (0,0.775\paperheight) -- cycle;
		\draw[draw=none, path fading=east, left color=insa@color, right color=insa@color!25!white] (0,0.6\paperheight) -- (0.65\paperwidth,0.825\paperheight) -- (0\paperwidth,1.05\paperheight) -- (0,\paperheight) -- cycle;

		\draw[draw=none, fill=insa@rouge] (0.33333\paperwidth,0) -- (0.33333\paperwidth,0.05\paperheight) -- (0.666666\paperwidth,0) -- cycle;
		
		\node[anchor=south west, align=left] (adresse) at (0.058\paperwidth,0.12\paperheight) {\insa@titlefont\textbf{INSA Toulouse}};
		\node[anchor=north west, align=left] at (adresse.south west) {\insa@titlefont135, Avenue de Rangueil \\ 31077 Toulouse Cedex 4 - France \\ \href{http://www.insa-toulouse.fr}{www.insa-toulouse.fr}};

		\node[anchor=south west] (ups) at (0.525\paperwidth,0.075\paperheight) {\includegraphics[height=0.04\paperheight, keepaspectratio]{meta/univ.png}};
		\node[anchor=south west] at (ups.south east) {\includegraphics[height=0.04\paperheight, keepaspectratio]{meta/ministere.png}};
	\end{tikzpicture}
}
