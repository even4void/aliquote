---
title: "lost+found 2023/2024"
date: 2025-01-01T20:51:15+01:00
draft: false
tags: ["this"]
categories: ["2025"]
---

## Customizing Mpv (2024-08-21)

Random links to elaborate on how I built my own Mpv config.

- <https://github.com/mpv-player/mpv/wiki/User-Scripts>
- <https://github.com/mpv-player/mpv/wiki/FAQ>
- <https://wiki.archlinux.org/title/Mpv>
- <https://kokomins.wordpress.com/2019/10/14/mpv-config-guide/>
- <https://github.com/iwalton3/default-shader-pack>

## On trend tests (2024-01-25)

A few weeks ago I discussed the [Cochran-Mantel-Haenszel test](/post/cochran-mantel-haenszel/). Another widely used test to assess linear trend in two-way tables is the Mantel-Haenszel trend test. There's a very interesting discussion about [trend tests](https://www.stata.com/support/faqs/statistics/test-for-trend/) on Stata FAQs, by William Sribney from StataCorp.

- <https://arxiv.org/pdf/2401.13010.pdf>
- <https://arxiv.org/pdf/2011.13758v1.pdf>

## Approximating sine (2024-01-25)

A few weeks ago I came across this blog post: [Approximating sin(x)](https://nes.is-a.dev/out/2022/approximating-sin.html).

> It functions very similarly to the taylor polynomial, except the constants have been replaced to achieve greather accuracy, (...)

Except this is not based on a Taylor expansion, but it rather relies on Chebyshev polynomials.

In [Polynomial Approximations to Elementary Functions](https://www.ams.org/journals/mcom/1954-08-047/S0025-5718-1954-0063487-2/S0025-5718-1954-0063487-2.pdf)

[Elementary Functions and Approximate Computing](https://hal.science/hal-02517784v2/document), see also [Computing Machine-Efficient Polynomial Approximations](https://perso.ens-lyon.fr/jean-michel.muller/TruncToms.pdf)

Remez algorithm, see [Dandelion: Certified Approximations of Elementary Functions](https://arxiv.org/abs/2202.05472)

## Generating all or next permutation (2024-01-12)

In a [previous post](/post/permutation-test-in-lisp/), I mention a way to suffle labels of a two-group dataset in order to carry out a permutation test. Usually, it's more efficient to randomize the highest level unit of an experimental design, i.e. rather than shuffling observations use the group level.

A recursive solution to the problem of generating all permutation of a given list or array is as follows:

```
If the length of Permutation equals the length of Array
    Permutation Found.
Else
    For each position ‘p’ from 0 till the length of Array
        If element at position ‘p’ has been taken
            Continue to check for next position.
        Mark position ‘p’ as Taken.
        Append the element at position ‘p’ to the Permutation.
        Generate_Permutation ( Permutation, Array, Positions )
        Remove the element at position ‘p’ from the Permutation.
        Mark position ‘p’ as Available.
```

- other algorithms
- heap

- domain-specific applications <https://rdrr.io/cran/permute/>
- Sedgewick and Wayne's algorithm <https://introcs.cs.princeton.edu/java/23recursion/Permutations.java.html>
- <https://en.wikipedia.org/wiki/Steinhaus%E2%80%93Johnson%E2%80%93Trotter_algorithm>

- base case
- Racket
- cl-permutation
- Rosetta code

- numpy and `itertools.permutations()`, <https://numpy.org/doc/stable/reference/random/generated/numpy.random.Generator.permutation.html#numpy.random.Generator.permutation>
- next permutation <https://www.nayuki.io/page/next-lexicographical-permutation-algorithm>
- stream, generator

Phillip Good (2004) _Permutation, Parametric, and Bootstrap Tests of Hypotheses_, New York: Springer-Verlag

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

{{% music %}}Sixth June • _Night Before_{{% /music %}}
