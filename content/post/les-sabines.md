---
title: "Les Sabines"
date: 2021-04-12T20:03:53+02:00
draft: true
tags: ["math", "fr"]
categories: ["2021"]
---
Dans le *Passe-muraille*, il y a une nouvelle intitulée *Les Sabines* dans laquelle Marcel Aymé raconte l'histoire d'une femme ayant le don d'ubiquité.

> Il y avait à Montmartre, dans la rue de l'Abreuvoir, une jeune femme prénommée Sabine, qui possédait le don d'ubiquité. Elle pouvait à son gré se multiplier et se trouver en même temps, de corps et d'esprit, en autant de lieux qu'il lui plaisait souhaiter. Comme elle était mariée et qu'un don si rare n'eût pas manqué d'inquiéter son mari, elle s'était gardée de lui en faire la révélation et ne l'utilisait guère que dans son appartement, aux heures où elle y était seule.

C'est en fait une collègue et amie qui m'a parlé de cette nouvelle car l'auteur fait une prédiction intéressante : l'héroïne ayant le don d'ubiquité, il prédit que leur nombre augmente selon une suite géométrique de raison 2.7 : "Bientôt, la malheureuse ubiquiste fut saisie d'une frénésie de luxure et eut des amants sur tous les points du globe. Le  nombre en augmentait au rythme  d'une  progression géométriquedont la raison était 2,7."

Les suites géométriques croissantes de ce type (i.e., de raison $r > 1$) représentent la version discrète des lois de croissance exponentielle. On supposera juste que l'ensemble des valeurs prises par une telle loi discrète est fini ou infini mais dénombrable. On résume ce type d'accroissement par la relation de récurrence $q_{n+1} = rq_n$, ou alors $q_n = r q_{n-1} = r^2q_{n-2} = \dots = q_0r^n$, où $q_0$ désigne le terme initial de la dite suite. Si l'on prend trois termes consécutifs au hasard, $x < y < z$, parmi cette suite, on observe que $y = rx$ et $z = ry = r^2x$, d'où $y^2 = xz$ : $y$ est bien la *moyenne géométrique* de $x$ et $z$.

A partir de la formule de récurrence énoncée ci-dessus, il n'est pas difficile d'exprimer la raison d'une suite dont le premier terme est $q_0 = a$ : on trouve $r = \left( \frac{q_n}{a} \right)^\frac{1}{n-1}$. En d'autres termes, si l'on connaît le premier et le dernier terme d'une suite géométrique de $n$ termes, on en déduit facilement sa raison à partir de la racine $n$-ième du rapport entre le dernier et le premier terme (ce qui permet par la même occasion de constituer n'importe quelle suite de nombres espacés de manière proportionnelle entre deux nombres donnés).

Marcel Aymé indique que le nombre total de sosies de l'héroïne est de 67000, ce qui suggère que la durée totale d'évolution de cette héroïne est de
