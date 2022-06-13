---
title: "Du paradoxe des anniversaires"
date: 2022-06-12T21:20:39+02:00
draft: false
tags: ["math", "fr", "mathematica"]
categories: ["2022"]
---

Petite note de synthèse rédigée à l'attention de mon fils pour son grand oral du BAC.

Le paradoxe des anniversaires, qui n'en est pas vraiment un, s'intéresse à la probabilité que deux personnes soient nées le même jour, plus précisément au nombre de personnes que l'on doit interroger avant que la probabilité de rencontrer deux personnes nées le même jour soit supérieure ou égale à 50 %.

Les hypothèses que l'on fera sont les suivantes : l'année comporte 365 jours et on néglige les années bisextiles.

On notera $p(n)$ la probabilité que au moins deux personnes prises parmi $n$ soient nées le même jour, et $n(p)$ le nombre de personnes nécessaires pour obtenir une probabilité $p$ donnée.

Le paradoxe vient du fait que les gens s'imaginent que la probabilité recherchée porte sur l'événement "deux personnes sont nées un même jour donné", comme dans la question "quelle est la probabilté que le jour du grand oral de maths tombe le jour de mon anniversaire, en supposant que celui-ci puisse être organisé n'importe quel jour de l'année". On va considérer le complémentaire de cette probabilité, ce qui nous évite d'énumérer tous les cas, et le soustraire de 1, et on dénotera $n$ le nombre de personnes attendues. On cherche donc $n$ tel que :

$$ 1-\left(\frac{364}{365}\right)^n = \frac{1}{2}. $$

La résolution de cette équation montre que si $n=253$, alors la probabilité recherchée est $> 1/2$. Qu'en est-il s'il l'on ne considère pas de date d'anniversaire fixe dans l'année ? C'est le problème énoncé plus haut.

Le plus simple est encore une fois de passer par le complémentaire en se demandant quelle est la probabilité que toutes les personnes interrogées ait un jour d'anniversaire différent.[^1] Par dénombrement, on constate que le nombre de cas où $n$ personnes ont des anniversaires différents équivaut à un arrangement de $n$ objets pris parmi 365, soit $\frac{365!}{(365-n)!}$. Pour chaque personne il y a 365 possibilités de jour d'anniversaire, et donc comme il y a $n$ personnes il y a au total $365^n$ choix possibles. Le nombre de cas où $n$ personnes ont des anniversaires différents divisé par le nombre de possibilités donne donc la probabilité que tout le monde soit né un jour différent. Le complémentaire de cette probabilité équivaut à la probabilité de l'événement "au moins deux personnes sont nées le même jour", soit :

$$ p(n) = 1 - \frac{365!}{(365-n)!} \cdot \frac{1}{365^n}. $$

```mathematica
 In[2]= N[1 - 365! / ((365-23)!365^23)]
out[2]= 0.507297
```

```mathematica
 In[3] = p[k_] := 1 - 365! / ((365-k)!365^k);
         Plot[p[k], {k, 1, 100}, GridLines -> {{23}, {p[23]}}];
         Table[N[p[k]], {k, 22, 25}]
Out[3] = {0.475695,0.507297,0.538344,0.5687}
                   ^^^^^^^^
```

{{< fluid_imgs "pure-u-1-3|/img/fig-birthday.png" >}}

L'expression $p(n)$ ci-dessus peut être approximée par $1-e^{-\frac{n^2}{2|E|}}$. Cette approximation s'obtient par le développement limité de $e^x = 1 + x + \mathcal{o}(x)$ pour $x$ au voisinage de 0. Comme discuté sur Wikipédia, ceci donne une approximation du nombre de personnes nécessaires pour avoir une probabilité $p$ d'observer au moins deux personnes avec le même jour d'anniversaire :

$$ n(p) \approx \sqrt{2\cdot 365\\;\text{ln}\left(\frac{1}{1-p}\right)}. $$

```mathematica
 In[4]= n[k_] := Sqrt[2 365 Log[1 / (1-k)]];
        Table[N[n[k]], {k, 0.4, 0.6, 0.1}]
Out[4]= {19.3107,22.4944,25.863}
                 ^^^^^^^
```

Il existe d'autres approximations, et également d'autres façon de poser le problème (p.ex., nombre moyen de personnes nécessaires pour observer une paire d'anniversaires identiques, en supposant un échantillonnage avec ou sans remise).

Le paradoxe des anniversaires trouve des applications dans divers domaines, puisqu'il suffit de remplacer le concept de jour d'anniversaire par n'importe quel élément pris dans un entier dénombrable, par exemple des mots de passe générés aléatoirement.

{{% alert note %}}
<small>[2022-06-13]</small><br>
Exemples d'application en bioinformatique :

- [Quantifying bacterial evolution in the wild: a birthday problem for Campylobacter lineages](https://www.biorxiv.org/content/10.1101/2020.12.02.407999v2)
- [Degenerate Primer IDs and the birthday problem](https://europepmc.org/article/PMC/3361375)
- [The genomic birthday paradox: how much is enough? ](https://pubmed.ncbi.nlm.nih.gov/26239817/)
  {{% /alert %}}

[^1]:
    Le paradoxe des anniversaires se généralise au problème suivant : si l'on considère un ensemble $E$ fini, quelle est la probabilité $p(n)$ que parmi $n$ éléments tirés uniformément et de manière indépendante dans $E$, deux éléments au moins soient identiques. On montre que celle-ci vaut :
    $$ p(n) = 1 - \frac{|E|!}{(|E|-n)!} \cdot \frac{1}{|E|^n}. $$

{{% music %}}The Vaselines • _Jesus Wants Me for a Sunbeam_{{% /music %}}
