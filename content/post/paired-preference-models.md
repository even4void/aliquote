---
title: "Paired preference models"
date: 2008-05-05T19:38:38+01:00
draft: false
tags: ["psychometrics"]
categories: ["2008"]
---

Much of this discussion is supported by [Agresti's book][book], *Categorical Data Analysis* (Wiley, 2002), and the overwhelming work of [Laura Thompson][Laura Thompson] who adapted the analysis with S-PLUS and R. However, some methods are rather specific of Psychometrics like the Facets Model presented in the first section.

## The psychometrician's way: Thurstone Model and the Partial Credit Model

Here, we shall focus on a more or less sophisticated way of assessing observers' preference in a ranking task, gathered from an article published by Tom Bramley in the *Journal of Applied Measurement* (2005, strong6(2)/strong: 202–223): [A Rank-Ordering Method for Equating Tests by Experts Judgment][A Rank-Ordering Method for Equating Tests by Experts Judgment]. According to Thurstone's paired comparisons model<sup>(1)</sup>, but see also [Wikipedia][Wikipedia], "pairs of object are compared with respect to a single attribute which is conceived as being represented in the judge's mind as a psychological latent trait." Following Bramley's notation, this is modeled as

$$ \ln \left[\frac{P\_{ij}}{1-P\_{ij}}\right] = B_i - B_j, $$

where $B_i$ and $B_j$ correspond to measures recorded for item $i$ and $j$, respectively. $P_{ij}$ can be conceived as the probability that item $i$ "beats" (i.e., is being ranked above than) item $j$ for any observer (it's just an odds). In contrast, with the Partial Credit Model (PCM), the model fitted is

$$ \ln\left[P\_{irk}/(1-P\_{ir(k+1)})\right] = B_i - D\_{rk}. $$

Now, the model becomes an adjacent-category model where $B_i$ is the measure for item $i$ and $D\_{rk}$ is the difficulty of scale category $k$ relative to category $k+1$ in ranking $r$.

## The Bradley-Terry Model for paired preferences

If we consider a square table whose $K$ entries refer to the number of times category $a$ is preferred to category $b$, after emptying the main diagonal, the B-T Model can be expressed as

$$ \log\frac{\Pi\_{ab}}{\Pi\_{ba}} = \beta_a - \beta_b, $$

where

$$ \Pi\_{ab} = \frac{\exp(\beta_a)}{\exp(\beta_a)-\exp(\beta_b)}, $$

is the probability that $a$ is preferred to $b$. It can be shown that the number $n_{ab}$ (people who prefer $a$ compared to $b$) follows a binomial distribution whose parameter is the above estimated probability.

The R package BradleyTerry includes the necessary code to carry out the test of such model. D. Firth also wrote an article in the *Journal of Statistical Software* (2005, 12(1)), [Bradley-Terry Models in R][Bradley-Terry Models in R]. As an example, let's consider the data on baseball season in the Eastern Division (Agresti, 2nd edition, p. 437) which are summarized in the following table. Values in parentheses represent SAS fit of B-T model.

<table border="0">
<tbody>
<tr>
<td>Winning Team</td>
<td>Milwaukee</td>
<td>Detroit</td>
<td>Toronto</td>
<td>New York</td>
<td>Boston</td>
<td>Cleveland</td>
<td>Baltimore</td>
</tr>
<tr>
<td>Milwaukee</td>
<td>—</td>
<td>7 (7.0)</td>
<td>9 (7.4)</td>
<td>7 (7.6)</td>
<td>7 (8.0)</td>
<td>9 (9.2)</td>
<td>11 (10.8)</td>
</tr>
<tr>
<td>Detroit</td>
<td>6 (6.0)</td>
<td>—</td>
<td>7 (7.0)</td>
<td>5 (7.1)</td>
<td>11 (7.6)</td>
<td>9 (8.8)</td>
<td>9 (10.5)</td>
</tr>
<tr>
<td>Toronto</td>
<td>4 (5.6)</td>
<td>6 (6.0)</td>
<td>—</td>
<td>7 (6.7)</td>
<td>7 (7.1)</td>
<td>8 (8.4)</td>
<td>12 (10.2)</td>
</tr>
<tr>
<td>New York</td>
<td>6 (5.4)</td>
<td>8 (5.9)</td>
<td>6 (6.3)</td>
<td>—</td>
<td>6 (7.0)</td>
<td>7 (8.3)</td>
<td>10 (10.1)</td>
</tr>
<tr>
<td>Boston</td>
<td>6 (5.0)</td>
<td>2 (5.4)</td>
<td>6 (5.9)</td>
<td>7 (6.0)</td>
<td>—</td>
<td>7 (7.9)</td>
<td>12 (9.8)</td>
</tr>
<tr>
<td>Cleveland</td>
<td>4 (3.8)</td>
<td>4 (4.2)</td>
<td>5 (4.6)</td>
<td>6 (4.7)</td>
<td>6 (5.1)</td>
<td>—</td>
<td>6 (8.6)</td>
</tr>
<tr>
<td>Baltimore</td>
<td>2 (2.2)</td>
<td>4 (2.5)</td>
<td>1 (2.8)</td>
<td>3 (2.9)</td>
<td>1 (3.2)</td>
<td>7 (4.4)</td>
<td>—</td>
</tr>
</tbody>
</table>

The data can be downloaded from here: <i class="fa fa-file-code-o fa-1x"></i> [baseball1987.dat][baseball1987.dat].

If we look at the result of the BT fit, we see that...

```r
baseball <- read.csv("baseball1987.dat", na.strings=".")
library(BradleyTerry)
bb.BT <- BTm(baseball ~ ..)
```

The results match those displayed in Table 10.11 of Agresti's book, where model estimates of $\beta_a$ (setting $\beta_7 = 0$, for Baltimore) and $\exp(\beta_a)$ (with the constraint $\sum_a \exp(\beta_a) = 1$).

```
Coefficients:
            Estimate Std. Error z value Pr(>|z|)    
..Boston      1.1077     0.3339   3.318 0.000908 *
..Cleveland   0.6839     0.3319   2.061 0.039345 *  
..Detroit     1.4364     0.3396   4.230 2.34e-05 *
..Milwaukee   1.5814     0.3433   4.607 4.09e-06 *
..New.York    1.2476     0.3359   3.715 0.000203 *
..Toronto     1.2945     0.3367   3.845 0.000121 *
```

Here, we see that the estimated probability that Boston won against New York is

$$ \Pi_{15}=\exp(\beta_1)/\big[\exp(\beta_1)+\exp(\beta_5)\big]=0.46, $$

or

```r
exp(coef(bb.BT))["..Boston"] / (exp(coef(bb.BT))["..Boston"] + 
  exp(coef(bb.BT))["..New.York"])
```

As proposed by L. Thompson, it is also possible to fit the B-T model using GLM and auxiliary variables, e.g.

```r
bb.BT2 <- glm(Freq ~ 1 + Milwaukee + Detroit + Toronto +
              NY + Boston + Cleveland, family=binomial)
summary(bb.BT2)
```

Finally, we might represent the data using a matrix-like representation, where
each cell reflect the actual frequency of wins, as suggested below. A more interesting plot would be to show the estimated probability, which is left as an exercise to the reader.

```r
library(lattice)
library(RColorBrewer)
levelplot(Freq~winner+loser, baseball,
          col.regions=brewer.pal(7,"Blues"), at=0:6)
```

{{< figure src="/img/20100418124621.png" >}}


## References

1. Thurstone, L.L. (1927). A law of comparative judgment. *Psychological Review*, 3, 273-286.
2. Andrich, D. (1978). <a href="http://apm.sagepub.com/cgi/reprint/2/3/451">Relationships between the Thurstone and Rasch approaches to item scaling</a>. *Applied Psychological Measurement*, 2(3), 451-462.
3. Luce, R.D. (1997). <i class="fa fa-file-pdf-o fa-1x"></i> <a href="http://www.imbs.uci.edu/personnel/luce/1997/Luce_BritishJofPsych_1997.pdf">Quantification and symmetry: Commentary on Michell, Quantitative science and the definition of measurement in psychology</a>. *British Journal of Psychology*, 88, 395-398.
4. Bradley, R.A. and Terry, M.E. (1952). Rank analysis of incomplete block designs I: The methods of paired comparisons. *Biometrika*, 39, 324-345.
5. Husson, F. and Causeur, D. (2004). <i class="fa fa-file-pdf-o fa-1x"></i> <a href="http://www.agro-montpellier.fr/sfds/CD/textes/husson1.pdf">Une extension bidimensionnelle du modèle de Bradley-Terry pour les comparaisons par paires</a>. *XXXVièmes journées de Statistique*, Montpellier, 24-28 mai 2004.
6. Conner, G.R. and Grant, C.P. (2000). <a href="http://citeseer.ist.psu.edu/conner99extension.html">An extension of Zermelo's model for ranking by paired comparisons</a>. *European Journal of Applied Mathematics*, 11, 227-245.


[book]: http://www.stat.ufl.edu/~aa/cda/cda.html
[Laura Thompson]: https://home.comcast.net/~lthompson221/
[A Rank-Ordering Method for Equating Tests by Experts Judgment]: http://www.aliquote.org/pub/Bramley_2005.pdf
[Wikipedia]: http://en.wikipedia.org/wiki/Law_of_comparative_judgment "Wikipedia"
[Bradley-Terry Models in R]: http://www.jstatsoft.org/v12/i01/paper
[baseball1987.dat]: http://www.aliquote.org/pub/baseball1987.dat
