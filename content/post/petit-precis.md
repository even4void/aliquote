---
title: "Petit précis à déguster"
date: 2018-09-20T09:50:48+02:00
draft: false
description: ""
tags: ["readings", "math"]
categories: ["fr"]
---

À force de ne lire (et écrire) que des textes en anglais, j'avais fini par oublier le mot "précis" que l'on retrouve souvent dans les ouvrages scientifiques publiés en France. Le premier dictionnaire qui me tombe sous la main, en l'occurence le [Dictionnaire culturel en langue française](http://bit.ly/2Ox5pwt), m'indique que précis vient de *pressis* qui signifie résumé. D'autres termes fréquemment retrouvés dans les publications françaises sont abrégé, mémento ou encore aide-mémoire.

<!--more-->

![](/img/70115957.jpg)
![](/img/70115960.jpg)

J'ai découvert cette collection en flânant près de la librairie Eyrolles il y a quelques temps. De facture impeccable, ces petits ouvrages offrent un panorama à la fois pratique et historique, largement illustré, des concepts clés de l'algèbre ou de la géométrie. On retrouve d'ailleurs dans le précis d'algèbre des notions de géométrie élémentaire, qu'il s'agisse de trigonométrie ou de figures géométriques diverses telles que les solides de Platon et d'Archimède. Certains exposés restent relativement succincts, et dans tous les cas largement moins denses que ceux retourvés dans les ouvrages de Jean-Paul Delahaye, mais cela reste une lecture très agréable pour une soirée accompagnée d'un Médoc 2005 !

À titre d'illustration, voici un moyen pratique de développer un binômes de n'import quel ordre à l'aide de factorielles, et donc sans recourir au fameux "triangle de Pascal" qui devient vite fastidieux. L'astuce consiste à utiliser une formule permettant d'exprimer chaque coefficient sous la forme d'un rapport entre différentes factorielles : (somme des exposants)! / (premier exposant)! • (second exposant)! (x,y). Ceci nous donne dans le cas de l'expression $(x+y)^{13}$ :

$$ \frac{13!}{13!0!}x^{13} + \frac{13!}{12!1!}x^{12}y + \frac{13!}{11!2!}x^{11}y^2 + \dots $$

que l'on peut simplifier en :

$$ 1x^{13} + 13x^{12}y + 78x^{11}y^2 + \dots $$

Facile à vérifier avec Mathematica (`Expand[(x+y)^13]`). Si l'on préfère l'usage de combinaisons, les trois premiers termes du développement s'écrivent :

$$ {13 \choose 0}x^{13} + {13 \choose 1}x^{12}y + {13 \choose 2}x^{11}y^2 + \dots $$
