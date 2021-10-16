# LaTeX classe pour l'INSA de Toulouse

![](../banner.png)



## Installation

Pour l'installation il suffit de copier le contenu du dossier `src` dans
votre dossier texmf local (si vous avez installé miktex:
[TEXMF root directory](https://miktex.org/kb/texmf-roots), section
`Your own TEXMF root directories`, pour texlive c'est le dossier `~/texmf/tex/latex/<classe>`).

Dans le cas d'overleaf il suffit de copier le contenu du dossier
`src` à la racine de votre projet.

## Utilisation

Pour l'utiliser dans votre document il suffit d'ajouter `\documentclass[]{insa}`.
Vous pouvez aussi utiliser `\documentclass[livret]{insa}` pour pouvoir ajouter des pages blanches pour pouvoir
l'imprimer en recto verso.

Toutes les autres options seront passée à la classe chargée, donc vous pouvez
bien sur utiliser `a4paper`, `10pt` comme bon vous semble.

Pour la page de couverture, elle s'adapte à la taille choisie, mais n'a été
testé que sur le format `a4paper`, et `letter`, il se peut que le rendu soit
moins bon sur d'autre format.

### Démarage rapide

Voilà un entete complet pour démarrer rapidement :

```latex
\documentclass[a4paper]{insa}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[french]{babel}
\usepackage[top=3cm, bottom=3cm, left=3cm, right=3cm]{geometry}
```

## Comande

### Page de couverture

| | Commande de base |
| ------------------------------ | --- |
| `\maketitle`                   | Permet de générer la page de couverture (page avec les triangles coloré). |
| `\makecoverpage`               | Permet de générer la page de garde (page sans les triangles coloré). |
| `\makefourthcover`             | Permet de générer la quatrième de couverture. |

| | Option du document |
| ------------------------------ | --- |
| `\type{<Text>}`                | Utiliser pour indiquer le type du document. |
| `\titre{<Text>}`               | Utiliser pour indiquer le titre du document. |
| `\auteur{<Text>}`              | Utiliser pour indiquer le ou les auteur du document. |
| `\info{<Text>}`                | Utiliser pour indiquer des info supplémentaire (Promo, Groupe, Datte de soutenance...). |
| `\date{<Text>}`                | Utiliser pour redéfinition de la date (par défaut: "-  Version du {date du jour}  -"). |
| `\setcolorcustom{<R>,<G>,<B>}` | Utiliser pour modifier la couleur des triangle. |

Pour les couleur vous pouvez utiliser les couleurs prédéfinit de la charte graphique INSA :
`\setcolorinstitutionnel`, `\setcolorformation`, `\setcolorrecherche`,
`\setcolorinternational`, `\setcolorentreprise` et `\setcolorcampus`.

### Table des matière

| | Commande de base |
| ------------------------------- | --- |
| `\tableofcontents`              | Permet de générer la table des matière. |
| `\sectionwithoutnumber{<Text>}` | Permet de générer un Titre de section sans numérotation. |
| `\section{<Text>}`              | Permet de générer un Titre de section avec la numérotation. |
| `\subsection{<Text>}`           | Permet de générer un Titre de sous-section avec la numérotation. |

### Gestion des annexes

Pour générer la table des annexes il faut mettre `\dosecttoc{}` juste apres le `\begin{document}`.

| | Commande de base |
| ------------------------------- | --- |
| `\annexes{<Text>}`              | Permet de générer la table des annexes. |
| `\subsection{<Text>}`           | Permet de générer un Titre d'annexe. |
| `\enteteanexe`                  | Permet de changer l'entête pour qu'il soit cohérent avec les annexes. |


### Entête et pied de page

Pour générer les entête et pied de page il faut mettre `\pagestyle{fancy}` juste apres le `\begin{document}`.

| | Commande de base |
| ------------------------------- | --- |
| `\entete`                       | Permet de générer les entêtes. |
| `\pieddepage$`                  | Permet les pied de pages. |
| `\enteteanexe`                  | Permet de changer l'entête pour qu'il soit cohérent avec les annexes. |

## Packages chargés par défaut

Pour faire les pages de couvertures les packages `tikz` (et la librairie
`fadings`), `hyperref` et `xcolors`.

Pour la gestion des annexes le package `minitoc`.

Pour faire les entête et pied de page le package `fancyhdr`
