---
title: "RCS 15 years later"
date: 2019-09-05T19:09:07+02:00
draft: false
tags: ["misc", "fr"]
categories: []
---

Remember SVN, or even RCS? Before Git I have been a long-time user of the simplest version control that was available on my Mac, namely [RCS](https://en.m.wikipedia.org/wiki/Revision_Control_System). Nowadays, I use mostly Git, but there were times where things were much simpler, yet robust, although we didn't have things such as Github and the like.

<!--more-->

This morning, while I was putting some of my old notes into my Org directory ([quite painful](/micro/2019-09-05-15-37-38) upon reflection), I came across a short tutorial (in French) I wrote on RCS. I could not resits putting a little extract below. Note that it is also available on Github, but in case I change my mind and remove it from there in the future, here it is. (And yes, I converted it again, this time from Org to Markdown!)

---

On se propose d'illustrer les différentes commandes vues à propos de RCS dans le cadre de l'édition d'un petit document en $\LaTeX$. On édite le fichier avec son éditeur préféré, on le compile pour vérifier qu'il n'y a pas d'erreur, puis on le visionne avec `xdvi`. Généralement, on répète cette procédure à chaque fois que l'on fait des modifications sur le docuemnt, et à mesure que celui-ci grandit on est parfois amené à conserver une partie du document telle quelle et à développer une autre partie, puis à revenir sur l'ancienne partie, et cela nécessite de conserver une trace visible des modifications (à moins d'avoir une mémoire exceptionnelle). Plusieurs options permettent de gérer ce genre d'aléas de l'édition de document : on peut passer en commentaire une partie du texte tapé la veille, afin d'en conserver une trace, renommer le fichier `exemple.tex` en `exemple2.tex`, etc. Mais en utilisant RCS, on se passera de ces méthodes manuelles contraignantes, et on bénéficiera d'un contrôle des différentes versions du document, i.e. de son "évolution temporelle". Tout d'abord, on insérera dans un commentaire en tête ou en fin du document l'instruction `$Header: /home/chl/Documents/work4site/rcs.tut/rcs.txt,v 1.1 2005/08/10 14:19:25 chl Exp chl $`, ce qui donne à peu près ceci dans le source `exemple.tex` :

    % $Header: /home/chl/Documents/work4site/rcs.tut/rcs.txt,v 1.1 2005/08/10 14:19:25 chl Exp chl $
    \documentclass[a4paper,12pt]{article} \usepackage[latin1]{inputenc}
    \usepackage[francais]{babel}

    \begin{document}
    ...

Ensuite, on dépose la première version du fichier dans l'archive RCS à l'aide de la commande :

```bash
$ ci exemple.tex
```

Normalement, RCS affiche la suite de messages ci-dessous :

```bash
exemple.tex,v  <--  exemple.tex
enter description, terminated with single '.' or end of file:
NOTE: This is NOT the log message!
>>
```

Il suffit alors de suivre les instructions indiquées et de donner une plus ou moins brève description du projet à la suite de l'invite `>>`, puis de valider et de saisir un point `.` pour retourner sous le shell. RCS aura crée un fichier `exemple.tex,v` (vérifier avec la commande `ls`), qui contient les informations de version et le texte du fichier original. Par défaut, la version attribué est la `1.1` puisque cela correspond à la _racine_ du projet.

Afin de reprendre l'édition de notre document, il faut récupérer notre fichier en tapant :

```bash
$ co exemple.tex
```

(attention, on ne tape pas le nom du fichier tel qu'il apparaît dans le répertoire, i.e. `exemple.tex,v`)

On notera que cette fois, l'instruction `$Header: /home/chl/Documents/work4site/rcs.tut/rcs.txt,v 1.1 2005/08/10 14:19:25 chl Exp chl $` insérée en début de document a été remplacée à présent par `$Header: /home/chl/Documents/work4site/rcs.tut/exemple.tex,v 1.1 2005/08/10 11:20:11 chl Exp $` : elle indique le lieu où se trouve le fichier dans l'arborescence de votre système, le numéro de version, la date de dernière modification (i.e. en l'occurence d'archivage), l'auteur de la dernière modification et le statut du document (ici `Exp`, pour expérimental). Néanmois, si vous essayez d'effectuer des modifications sur le document, votre éditeur vous renverra un message d'erreur lors de l'enregistrement des modifications car le document est verouillé : on peut le lire, le compiler, mais pas modifier son contenu. Pour avoir un accès en écriture au fichier, il faut en fait taper la commande :

```bash
$ co -l exemple.tex
```

Cette fois-ci, RCS indique :

```bash
$ exemple.tex,v  -->  exemple.tex
revision 1.1 (locked)
done
```

Le fichier est verrouillé car vous l'avez extrait pour modifications. Toute personne qui tenterait de faire la même chose en même temps que vous se verrait ainsi prié d'attendre que vous ayez déverouillé l'archive. Bien évidemment, lorsque vous travaillez seul, il n'est pas très utile d'avoir un tel système de contrôle de l'édition par l'application d'un verrou à l'enreistrement : vous pouvez dans ce cas taper :

```bash
$ ci -l exemple.tex
```

lors du dépôt, ce qui vous évitera de taper `co -l` à chaque fois que vous souhaiterez rééditer le document. RCS se charge d'actualiser le fichier `exemple.tex,v` sans détruire le fichier sur lequel vous travaillez. La commande `rcs -U` permet également de libérer l'accès au fichier, de sorte que l'on peut travailler dessus sans le déverouiller au préalable.

Maintenant, on peut s'amuser à rajouter un paragraphe en fin de document, et à effectuer de nouveau l'archivage du document pour mettre à jour la version (après modifications, on devrait passer en version 1.2). Après avoir enregistré les modifications, il suffit de taper de nouveau `ci exemple.tex`, et on doit voir s'afficher :

```bash
$ exemple.tex,v  <--  exemple.tex
new revision: 1.2; previous revision: 1.1
enter log message, terminated with single '.' or end of file:
>>
```

On indique les modifications apportées à la suite de l'invite `>>`, on valide et on termine par un point `.` ; par exemple :

```bash
>> ajout de la section 3
>> .
done
```

Le fichier original `exemple.tex` a été de nouveau convertit en un fichier `exemple.tex,v` par RCS, et il est à présent verrouillé dans l'archive. Le numéro de version correspondant est bien `1.2` : c'est la version numéro 2 du tronc, directement dérivée de la racine (version 1.1). On vérifiera également en déverouillant l'archive pour édition (`co -l exemple.tex`) que le numéro de version a bien été mis à jour dans le source du document.

Pour visualiser l'ensemble des modifications qui ont été réalisées sur le document depuis sa création, il suffit de taper :

```bash
$ rlog exemple.tex
```
