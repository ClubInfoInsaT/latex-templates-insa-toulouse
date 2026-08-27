%% -----------------------------------------------------------------
%% INSAToulouse.cls
%% Description : Classe de document pour des rapports INSA Toulouse
%% Auteur : Baptiste Rébillard <rebillar@insa-toulouse.fr>
%% Dépôt : https://github.com/ClubInfoInsaT/latex-templates-insa-toulouse
%% License : GNU General Public License v2.0
%% -----------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{insa}[2026/08/11 Classe pour Rapport de PFE INSA Toulouse]

\LoadClass[12pt,a4paper]{report}

% ── Packages ─────────────────────────────────────────────────────────────────
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\RequirePackage{tikz}
\RequirePackage{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{csquotes}
\RequirePackage{tocloft}
\RequirePackage{float}
\RequirePackage{helvet}
\RequirePackage[T1]{fontenc}
\RequirePackage[french]{babel}
\RequirePackage{eso-pic}   % \AddToShipoutPicture
\RequirePackage[toc, section=section, numberedsection=false]{glossaries}
\RequirePackage{lmodern} % (Font shape not available)
\RequirePackage{etoolbox}
\RequirePackage[style=ieee]{biblatex}
\RequirePackage{etoolbox}

\newbool{showtlssec}
\boolfalse{showtlssec}
\newcommand{\enabletlssec}{\booltrue{showtlssec}}
% ── Mise en page ─────────────────────────────────────────────────────────────
\geometry{
    left=3cm,
    right=3cm,
    top=2cm,
    bottom=3.5cm
}

% ── En-têtes et pieds de page ────────────────────────────────────────────────
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[R]{\thepage}
\fancyfoot[L]{{\itshape \leftmark}}
% ── Fond de page récurrent ───────────────────────────────────────────────────
\newcommand\BackgroundPic{
    \put(0,0){
        \includegraphics[width=\paperwidth,height=\paperheight]{assets/template_page.pdf}
    }
}

% ── Foormattage des chapitres ────────────────────────────────────────────────
\definecolor{insaaccent}{HTML}{E52713}  % rouge INSA Toulouse
\titleformat{\chapter}[block]
  {\normalfont\sffamily\raggedleft}           % tout aligné à droite
  {%
    \textcolor{insaaccent}{\fontsize{20}{20}\selectfont\bfseries\MakeUppercase{\chaptername}}%
    \hspace{0.5em}%
    \textcolor{insaaccent}{\fontsize{25}{25}\selectfont\bfseries\thechapter}%
  }
  {0pt}
  {%
    \\[-0.2ex]%
    \fontsize{22}{26}\selectfont\bfseries%
  }
  [%
    \vspace{0.4ex}%
    \textcolor{insaaccent}{\rule{\linewidth}{2pt}}%
    \vspace{1ex}%
  ]
\titlespacing*{\chapter}{0pt}{-20pt}{20pt}
% ── Formatage des sections ───────────────────────────────────────────────────
\titleformat{\section}
  {\sffamily\LARGE\bfseries\MakeUppercase}
  {\thesection}{1em}{}

\titleformat{\subsection}
  {\Large\bfseries\itshape}
  {\thesubsection}{1em}{}

\addto\captionsfrench{
    \renewcommand{\listfigurename}{Liste des figures}%
    \renewcommand{\listtablename}{Liste des tableaux}%
}

% ── Commandes utilitaires ────────────────────────────────────────────────────
\newcommand{\psection}[1]{\phantomsection\section*{#1}\addcontentsline{toc}{section}{#1}}
\newcommand{\pchapter}[1]{\phantomsection\chapter*{#1}\addcontentsline{toc}{chapter}{#1}}

% Marqueur visuel pour les éléments à remplir
\newcommand{\aremplir}{{\LARGE \bfseries \textcolor{red}{A REMPLIR}}}

% Environnement boîte à largeur fixe (retour à la ligne automatique)
\newenvironment{custombox}[1]{%
    \begin{minipage}{#1}
}{\end{minipage}}

% ── Variables du document (à définir dans main.tex) ──────────────────────────
\newcommand{\titre}[1]{\def\@titre{#1}}
\newcommand{\imagecouverture}[1]{\def\@imagecouverture{#1}}
\newcommand{\firstcouverture}[1]{\def\@firstcouverture{#1}}
\newcommand{\secondcouverture}[1]{\def\@secondcouverture{#1}}

% Valeurs par défaut
\titre{Nom du document}
\imagecouverture{example-image}
\firstcouverture{}
\secondcouverture{}

% ── Page de couverture (\makecover) ──────────────────────────────────────────
\definecolor{couleurcarre}{HTML}{F3F0EC}

\newcommand{\makecover}{
    \pagenumbering{Roman}
    \setcounter{page}{1}
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture, overlay]
        \node[anchor=south west, inner sep=0] at (current page.south west) {
            \includegraphics[width=\paperwidth,height=\paperheight]{assets/template_first_page.pdf}
        };
        \fill[fill=couleurcarre]([xshift=-4.7cm, yshift=-4.5cm]current page.north east) rectangle ++(3.5cm, 3.5cm);
        \node at (3, -4)   {\Large \bfseries \MakeUppercase{\sffamily \@titre}};
        \node at (6.3, -7)   {\large \@firstcouverture};
        \node at (6.3, -18.7)  {\@secondcouverture};
        \node at (14.47,-0.3){\includegraphics[width=3cm]{\@imagecouverture}};

        
        % LOGO TLS-SEC
        \ifbool{showtlssec}{%
            \node[anchor=south, inner sep=0, yshift=2.5cm] at (current page.south) {
                \includegraphics[height=1.0cm]{assets/tls-sec-logos/n7.png} \hspace{0.5cm}
                \includegraphics[height=1.0cm]{assets/tls-sec-logos/insa.png} \hspace{0.5cm}
                \includegraphics[height=1.0cm]{assets/tls-sec-logos/enac.png}
            };
            \node[anchor=east, inner sep=0, xshift=-1.6cm, yshift=-0.6cm] at (current page.east) {
                \includegraphics[height=3.0cm]{assets/tls-sec-logos/tls-sec.png}
            };
        }{}        
    \end{tikzpicture}
    \newpage
    \AddToShipoutPicture{\BackgroundPic}
}

% ── Page de garde intérieure (\makepagegarde) ─────────────────────────────────
\newcommand{\makepagegarde}{
    \begin{tikzpicture}[remember picture, overlay]
        \fill[fill=couleurcarre]([xshift=-4.7cm, yshift=-4.5cm]current page.north east) rectangle ++(3.5cm, 3.5cm);
        \node at (3, -4)   {\Large \bfseries \MakeUppercase{\sffamily \@titre}};
        \node at (6.3, -7)   {\large \@firstcouverture};
        \node at (6.3, -18.7)  {\@secondcouverture};
        \node at (14.47,-0.3){\includegraphics[width=3cm]{\@imagecouverture}};

        
        % LOGO TLS-SEC
        \ifbool{showtlssec}{%
            \node[anchor=south, inner sep=0, yshift=2.5cm] at (current page.south) {
                \includegraphics[height=1.0cm]{assets/tls-sec-logos/n7.png} \hspace{0.5cm}
                \includegraphics[height=1.0cm]{assets/tls-sec-logos/insa.png} \hspace{0.5cm}
                \includegraphics[height=1.0cm]{assets/tls-sec-logos/enac.png}
            };
            \node[anchor=east, inner sep=0, xshift=-1.6cm, yshift=-0.6cm] at (current page.east) {
                \includegraphics[height=3.0cm]{assets/tls-sec-logos/tls-sec.png}
            };
        }{}
    \end{tikzpicture}
    \newpage
}

% ── Sommaire (\makesommaire) ──────────────────────────────────────────────────
\newcommand{\makesommaire}{
    \pchapter{SOMMAIRE}
    \@starttoc{toc} % Remplace \tableofcontents pour ne pas générer de titre automatique
    \newpage
    \pagenumbering{arabic}
    \setcounter{page}{1}
}

% ── Dernière page (\makebackcover) ───────────────────────────────────────────
% URL LinkedIn sans encodage % (évite que % soit interprété comme commentaire)
\newcommand{\linkedinINSA}{https://www.linkedin.com/school/insa-toulouse/}

\newcommand{\makebackcover}{
    \newpage
    \ClearShipoutPicture     % supprime le fond récurrent (template_page.pdf)
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture, overlay]
        \node[anchor=south west, inner sep=0] at (current page.south west) {
            \includegraphics[width=\paperwidth,height=\paperheight]{assets/template_last_page.pdf}
        };
        \node at (12.3, -14) {
            \parbox{\textwidth}{
                \sffamily\large
                \textbf{INSA TOULOUSE}\\
                135 avenue de Rangueil\\
                31400 Toulouse
                \vspace{0.6em}\\
                Tel: +33 (0)5 61 55 95 13\\
                \href{https://www.insa-toulouse.fr/}{\textbf{www.insa-toulouse.fr}}
            }
        };
        \node at (5.2, -16.25) {\href{https://www.facebook.com/INSAToulouse/}{\includegraphics[width=0.8cm]{assets/carre.png}}};
        \node at (6.31, -16.25) {\href{https://www.instagram.com/insatoulouse/}{\includegraphics[width=0.8cm]{assets/carre.png}}};
        \node at (7.42, -16.25) {\href{\linkedinINSA}{\includegraphics[width=0.8cm]{assets/carre.png}}};
        \node at (8.54, -16.25) {\href{https://www.youtube.com/user/insatoulouse}{\includegraphics[width=0.8cm]{assets/carre.png}}};
    \end{tikzpicture}
}

% ── Backmatter : figures, tableaux, glossaire (\makebackmatter) ───────────────
\newcommand{\makebackmatter}{
    \newpage
    \pchapter{Liste des figures et tableaux}
    \vspace{-5em}
    \listoffigures
    \vspace{-1em}
    \listoftables
}

\newcommand{\makeglossaire}{
    \newpage
    \pchapter{Glossaire}
    {\renewcommand{\glossarysection}[2][]{} % Masque le titre automatique
    \printglossaries}
}

% ── Annexes ──────────────────────────────────────────────────────────────────
\appto{\appendix}{
    % S'assure que le mot utilisé dans les titres est "Annexe"
    \renewcommand{\chaptername}{\appendixname}
    
    % Ajoute "Annexe " devant la lettre dans le sommaire (TOC)
    \addtocontents{toc}{\protect\renewcommand{\protect\cftchappresnum}{\appendixname\ }}
    
    % Augmente l'espace dans le sommaire pour que "Annexe A" ne chevauche pas le titre
    \addtocontents{toc}{\protect\addtolength{\protect\cftchapnumwidth}{1.7cm}}
}
