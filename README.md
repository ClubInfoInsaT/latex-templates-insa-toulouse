# LaTeX templates pour l'INSA de Toulouse

![](./imgs/banner.png)


## Templates

Si vous cherchez un projet, cliquez directement sur votre année, ou pour avoir une template générale, cliquez sur [Toutes années](./Templates/Toutes_années/).

 - [Toutes années](./Templates/Toutes_années/) : Templates générales
 - [1A](./Templates/1A/) : Templates spécifiques aux projets de première année.
 - [2A](./Templates/2A/) : Templates spécifiques aux projets de deuxième année.
 - [3A](./Templates/3A/) : Templates spécifiques aux projets de troisième année.
 - [4A](./Templates/4A/) : Templates spécifiques aux projets de quatrième année.
 - [5A](./Templates/5A/) : Templates spécifiques aux projets de cinquième année.

## Classe latex

### Installation

Pour l'installation il suffit de copier le contenu du dossier `texmf` dans
votre dossier texmf local (si vous avez installé miktex:
[TEXMF root directory](https://miktex.org/kb/texmf-roots), section
`Your own TEXMF root directories`, pour texlive c'est le dossier `~/texmf`).

### Utilisation

Pour l'utilisation il suffit d'utiliser la classe `insa`. Les options
disponibles sont:
 - `cours` - Utilise comme classe de base `book`
 - `td` - Utilise comme classe de base `article`
 - `tp` - Utilise comme classe de base `article`
 - `autre` - Utilise comme classe de base `article`

Toutes les autres options seront passée à la classe chargée, donc vous pouvez
bien sur utiliser `a4paper`, `10pt` comme bon vous semble.

Pour la page de couverture, elle s'adapte à la taille choisie, mais n'a été
testé que sur le format `a4paper` et `letter`, il se peut que le rendu soit
moins bon sur d'autre format.

### Page de couverture

Les macros utilisées normalement (`\title`, `\author`, `\date`) n'ont pas
d'effet, il faut utiliser à la place:
 - `\titre` - Défini le titre du document, qui sera écrit sous le type de
document (choisi par l'option de chargement)
 - `\uf` - Défini l'unité de formation, écrit en petit sous le titre, il peut
rester vide
 - `\auteur` - Défini l'auteur du document, écrit en bas au milieu
 - `\classe` - Défini le niveau correspondant au document
 - `\enseignant` - Défini les enseignants associés aux documents (celui qui fait le cours, organise le TD...)

Trois macros sont spécifiques à certaines options:
 - `\numeroTD` - Défini le numéro du TD si la classe est chargée avec l'option `td`
 - `\numeroTP` - Défini le numéro du TP si la classe est chargée avec l'option `tp`
 - `\type` - Permet de définir le type lorsque la classe est chargée avec l'option `autre`

## Contribution

Nous acceuillons toute remarque ou suggestion d'amélioration concernants ces templates.

Si vous avez créé une template qui n'est pas encore listée ici, n'hésitez pas à nous envoyer une pull request.

## Licenses

Ce projet est mis à disposition sous licence GPLv2.0.

