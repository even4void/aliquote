---
title: "lost + found 2023"
date: 2024-01-08T16:19:24+01:00
draft: false
tags: ["this"]
categories: ["2024"]
---

## Party More Party (2023-12-12)

- <https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-8-25>
- <https://www.zeileis.org/papers/Hothorn+Hornik+Zeileis-2006.pdf>
- <https://rdrr.io/github/nicolas-robette/moreparty/man/fastcforest.html>

But to my understanding rforest and fastcforest do not produce binary splits following the same procedure. While rforest chooses the feature and the value of the feature that minimizes the MSE in the resulting child nodes, fastcforest instead splits based on a statistical test to reject the null hypothesis of independence between the dependent variable and any of the features. Is that correct?

## Bridge sampling (2023-09-18)

- <https://www.tandfonline.com/doi/full/10.1080/00031305.2018.1562983>
- <https://mvuorre.github.io/posts/2017-01-02-how-to-compare-two-groups-with-robust-bayesian-estimation-using-r-stan-and-brms/>

R packages:

- <https://cran.r-project.org/web/packages/bridgesampling/>
- <https://discourse.mc-stan.org/t/bayesian-t-test-using-pystan/25126>

## How Many Bootstrap Replicates (2023-09-04)

- [How many bootstrap replicates are necessary?](https://pubmed.ncbi.nlm.nih.gov/20377449/)
- <https://stats.stackexchange.com/questions/80025/required-number-of-permutations-for-a-permutation-based-p-value>
- <https://www.webpages.uidaho.edu/~stevel/565/lectures/4%20Bootstrap.pdf>

The primary difference is that while bootstrap analyses typically seek to quantify the sampling distribution of some statistic computed from the data, permutation analyses typically seek to quantify the null distribution. That is, they seek to break whatever structure might be preset in a dataset, and quantify the kinds of patterns one expects to see by chance.

- <https://stats.stackexchange.com/a/344694>
- <https://stats.stackexchange.com/a/610115>

Maarten Buis on Stata list, <https://www.statalist.org/forums/forum/general-stata-discussion/general/293546-bootstrap-number-of-replications>

Stata's `bssize`

- Andrews, D. W. K. and M. Buchinsky. 2000. A three-step method for choosing the number of bootstrap
repetitions. Econometrica 68: 213-251.
- Poi, B. P. 2004. From the helpdesk: Some bootstrapping techniques. Stata Journal 4: 312-328

## Racket and its sqlite API (2023-02-18)

Everyone has its bindings for splite these days because, well, sqlite is great. There are two main packages for Racket that I know about: [db](https://docs.racket-lang.org/db/) and [sqlite-table](https://docs.racket-lang.org/sqlite-table/).

{{% music %}}Bauhaus • _Bela Lugosi's Dead_{{% /music %}}
