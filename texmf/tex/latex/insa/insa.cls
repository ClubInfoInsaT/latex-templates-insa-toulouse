\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{insa}[2020/09/12 v1.0, Classe de base pour les documents associés à l'INSA]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Options                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifinsa@td
\insa@tdfalse
\newif\ifinsa@tp
\insa@tpfalse
\newif\ifinsa@autre
\insa@autretrue

\DeclareOption{td}{%
	\def\insa@type{Travaux dirigés}%
	\def\insa@baseclass{article}%
	\insa@tdtrue%
}

\DeclareOption{tp}{%
	\def\insa@type{Travaux pratiques}%
	\def\insa@baseclass{article}%
	\insa@tptrue%
}

\DeclareOption{autre}{%
	\insa@autretrue%
}

\DeclareOption{cours}{%
	\def\insa@type{Cours}%
	\def\insa@baseclass{report}%
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\insa@baseclass}}
\ExecuteOptions{cours}
\ProcessOptions\relax

\LoadClass{\insa@baseclass}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tailles                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Couleurs                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{xcolor}
\RequirePackage{tikz}
\usetikzlibrary{fadings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Couleurs                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{insa@bleu}{RGB}{52,83,111}
\definecolor{insa@rouge}{RGB}{226,50,46}


\newcommand{\insa@titre}{}
\newcommand{\titre}[1]{\gdef\insa@titre{#1}}

\newcommand{\insa@auteur}{}
\newcommand{\auteur}[1]{\gdef\insa@auteur{#1}}

\newcommand{\insa@uf}{}
\newcommand{\uf}[1]{\gdef\insa@uf{#1}}

\newcommand{\insa@classe}{}
\newcommand{\classe}[1]{\gdef\insa@classe{#1}}

\newcommand{\insa@enseignant}{}
\newcommand{\enseignant}[1]{\gdef\insa@enseignant{#1}}

\ifinsa@td
\newcommand{\insa@numeroTD}{}
\newcommand{\numeroTD}[1]{\gdef\insa@numeroTD{#1}}
\fi

\ifinsa@tp
\newcommand{\insa@numeroTP}{}
\newcommand{\numeroTP}[1]{\gdef\insa@numeroTP{#1}}
\fi

\ifinsa@autre
\newcommand{\type}[1]{\gdef\insa@type{#1}}
\fi

\gdef\maketitle{%
	\begin{titlepage}
		\thispagestyle{empty}
		\noindent%
		\begin{tikzpicture}[remember picture,overlay,shift={(current page.south west)}]%
			%\draw[draw=none, fill=blue] (0,7) -- (16.7,15.75) -- (0,24.5) -- cycle;
			\draw[draw=none, path fading=east, left color=insa@bleu, right color=insa@bleu!10!white] (0,0.25\paperheight) -- (0.8\paperwidth,0.55\paperheight) -- (0,0.85\paperheight) -- cycle;
			\draw[draw=none, path fading=east, left color=insa@bleu, right color=insa@bleu!10!white] (0,0.35\paperheight) -- (0.7\paperwidth,0.6125\paperheight) -- (0,0.875\paperheight) -- cycle;
			\draw[draw=none, path fading=east, left color=insa@bleu, right color=insa@bleu!25!white] (\paperwidth,0.54\paperheight) -- (0.675\paperwidth,0.661875\paperheight) -- (\paperwidth,0.78375\paperheight) -- cycle;
			\draw[draw=none, path fading=east, left color=insa@bleu, right color=insa@bleu!60!white] (\paperwidth,0.58\paperheight) -- (0.35\paperwidth,0.82375\paperheight) -- (\paperwidth,1.0675\paperheight) -- cycle;
			
			\draw[draw=none, fill=insa@rouge] (0.33333\paperwidth,0) -- (0.33333\paperwidth,0.075\paperheight) -- (0.666666\paperwidth,0) -- cycle;
			
			\node[anchor=south east, align=right, text width=12cm] (type) at (0.975\paperwidth,0.425\paperheight) {\textbf{%
					\Huge{%
						\insa@type%
						\ifinsa@td%
							\ifx\insa@numeroTD\empty%
							\else%
								~---~\insa@numeroTD%
							\fi%
						\fi%
						\ifinsa@tp%
							\ifx\insa@numeroTP\empty%
							\else%
								~---~\insa@numeroTP
							\fi%
						\fi%
					}%
				}%
			};
			\node[anchor=north east, align=right, text width=12cm] (titre) at (type.south east) {\LARGE{\insa@titre}};
			\node[anchor=north east, align=right, text width=12cm] (uf) at (titre.south east) {\insa@uf\\\insa@classe};
			\node[anchor=center, align=center, text width=12cm] at (0.5\paperwidth,0.2\paperheight) {%
				Rédigé par: \\%
					\insa@auteur%
				\ifx\insa@enseignant\empty%
				\else%
					\\%
					Enseignant: \insa@enseignant%
				\fi%
				\vspace{1cm}
				
				\begin{center}
					-\hspace{0.25cm}Version du \today\hspace{0.25cm}-
				\end{center}
			};
			\node[anchor=north west] at (0.075\paperwidth,0.975\paperheight) {\includegraphics[scale=0.25]{meta/logo_insat.pdf}};
		\end{tikzpicture}
	\end{titlepage}
}