# Template rapport de stage 1A

Template pour le rapport de stage ouvrier reprenant la nouvelle charte graphique (2022).

Cette template est disponible pour copie sur [Overleaf](https://www.overleaf.com/read/pfwwsrkpcwxp).

Étapes pour la copier :
- Se connecter sur [Overleaf](https://www.overleaf.com/login)
- Ouvrir la [template](https://www.overleaf.com/read/pfwwsrkpcwxp)
- Cliquer sur `Menu` en haut à gauche puis `Copy Project` (dans actions)

![image](https://user-images.githubusercontent.com/23584745/210329797-4ba228f3-d10e-4ea1-acf5-a48714deba46.png)

À gauche on a les différents fichiers. Les principaux sont :
- `main.tex` : le fichier principal
- `content.tex` : contient l'essentiel du contenu
- `main_variables.tex` : contient les variables à modifier (notamment texte de couverture, adresses...)
- `logo.png` : logo de l'entreprise
- `remerciements.tex`
- `graphics` : dossier contenant les images utilisées dans le rapport
- `questionnaires.pdf` : pdf des questionnaires innovation/sécurité
- `cover` : dossier contenant la disposition de la couverture

Il est possible de se familiariser avec LaTeX en consultant la [documentation sur Overleaf](https://www.overleaf.com/learn).

## Modification de la couverture

Pour changer titres et adresses, il faut modifier les variables dans `main_variables.tex`.

Pour changer le logo de l'entreprise il suffit de remplacer le fichier logo.png en utilisant le bouton upload (
![image](https://user-images.githubusercontent.com/23584745/210332412-ecf8a616-d41d-469f-a1ea-bf8329d2ec45.png)
) en haut à gauche.

On peut ensuite changer sa taille en modifiant l'échelle (scale) dans le fichier `cover/cover_in.tex` la ligne 

```latex
\node[anchor=north west] at (2.3,21.5) {\includegraphics[scale=1.00]{\varlogo}};
```
Par exemple `scale=0.50` réduira sa taille de moitié.

### Modifier l'emplacement

On peut modifier l'emplacement des titres, adresses, logo en jouant avec la position du noeud.
Dans l'exemple ci-dessus, le logo est situé à `(2.3,21.5)`. La première valeur correspond à la
position sur l'axe horizontal. On modifie ici encore le fichier `cover/cover_in.tex`.

En [apprendre plus](https://www.overleaf.com/learn/latex/TikZ_package) sur le packet `tikz`.

## Modification du contenu du rapport

