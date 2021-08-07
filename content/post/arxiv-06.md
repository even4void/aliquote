---
title: "ArXiving on August 2021"
date: 2021-08-07T09:09:25+01:00
draft: false
tags: ["readings", "arxiv"]
categories: ["2021"]
---

Here are some papers that I read this week, in the CS and Stat category, plus random stuff that were mentioned on IRC or Hacker News.

### Distributions.jl: Definition and Modeling of Probability Distributions in the JuliaStats Ecosystem (https://arxiv.org/abs/1907.08611)

I reinstalled Julia (v1.6.1) a few months ago. Yet I haven't had enough time to learn the language again. I saw there's a native plotting backend, which is really great, and that there's some sort of JIT and on first load compiling capabilities. It is supposed to improve later execution of scripts or programs, but really on first launch it is sometimes a pain. However, the language looks much better now, although I keep thinking of the old Julia 0.4 that I used to use several years ago now. This article describes the [Distributions.jl](https://juliastats.org/Distributions.jl/stable/) package, which is part of the [JuliaStats](https://juliastats.org/) ecosystem. Note that this package allow to define and not only to manipulate pre-defined statistical distributions. Specifically, "a `Distribution` is an abstract type that takes two parameters: a `VariateForm` type which describes the dimensionality, and `ValueSupport` type which describes the discreteness or continuity of the support." I really need to give Julia another try, especially now that I can pretend to be a stat dilettante. And I would like to compare how Julia's Distribution package compared to [Boost](https://www.boost.org/doc/libs/1_65_1/libs/math/doc/html/dist.html)'s own routines.

### Principled, practical, flexible, fast: a new approach to phylogenetic factor analysis (https://arxiv.org/abs/2107.01246)

Yet another attempt at modeling uncertainty using a latent variable approach. This is a dense article about phylogenetic analysis of high-dimensional phenotypes using [BEAST](https://www.beast2.org/). Usually, some form of data reduction is used to decrease the space and time complexity of model fitting on such dataset. As in other statistical domains, the two main approaches consist in using either PCA-based or FA-based techniques. In the later case, we talk about phylogenetic factor analysis (PFA), and the authors discuss two alternative approaches to the existing methods which scale quadratically with the number of taxa and remain intractable for large trees. As I said, it is dense, and it's still being read on my side, especially since I'm looking into BEAST documentation at the same time. I only used it quickly two years ago before settling on the [ETE toolkit](/post/phylogenetic-python/).

### Preserving Diversity when Partitioning: A Geometric Approach (https://arxiv.org/abs/2107.04674)

This article deals with the idea of partitioning a sample of individuals having different characteristics (which define their diversity as a whole) into subgroup exhibiting a similar diversity index. The diversity index considered here was introduced by Simpson, and it corresponds to the inverse probability that two individuals are from the same type when taken uniformly at random, with replacement, from the community of interest. The paper is rather challenging, since it exposes the mathematical aspects of optimal partitioning and algorithm-related approaches. The authors' conclusions are that a perfect partition exists only when the number of parts k divides the gcd of b. We also design a polynomial time algorithm for the case of r = 2 types.

### Item Response Thresholds Models (https://arxiv.org/abs/2106.12784)

I'm no longer into psychometrics -- last workshop I organized was in 2016, last blog post around 2013, but this article resonated to me since I've been working on IRT models for polytomous item for quite a long time. Problem such as item with threshold reversals, response saturation, and the like were common pitfall at that time. Go take a look if you are versed into modern psychometrics.

### Comparison of Canonical Correlation and Partial Least Squares analyses of simulated and empirical data (https://arxiv.org/abs/2107.06867)

I haven't heard about multi-block methods for a long time, and this paper discusses the result of extensive simulation using incremental subsampling to assess sensitivity and reliability of those two techniques. From the abstract, the take-away message reads as follows: First, for data reasonable within and between block structure, CCA and PLS give comparable results, with equivalent sensitivity and false positive rate. Second, if there are high correlations within either block, this can compromise the reliability of CCA results. This known issue of CCA can be remedied with PCA before cross-block calculation. However, this assumes that the PCA structure is stable for a given sample. Third, statistical significance by null hypothesis testing does not guarantee that the results are reproducible, even with large sample sizes. This final outcome suggests that researchers should routinely assess both statistical significance and reproducibility for their data. I'm not surprised by these conclusions, since the within- and cross-block correlation structures plays an important role in both models, and often help in deciding which method to chose. Further, my own [past investigation](/post/multi-group-sem-pls/) were quite in agreement with the idea of varying stability of the results depending of these correlation structures and the sample size itself.

### Calibrating the scan statistic with size-dependent critical values: heuristics, methodology and computation (https://arxiv.org/abs/2107.08296)

### JAGS, NIMBLE, Stan: a detailed comparison among Bayesian MCMC software Authors (https://arxiv.org/abs/2107.09357)

It's been a long time since I last used JAGS, and I didn't install it on my last Macbook. I never heard of [NIMBLE](https://r-nimble.org/what-is-nimble) before reading this review. Apparently it supports Bayesian models written in BUGS (or it can compile models written using R syntax to C++). The Stan documentation is among the best free textbook available nowadays. Apparently, the compile time for Stan and NIMBLE is of the same magnitude (2-3 minutes), but NIMBLE appears faster at the runtime level compared to the two other candidates. Finally, NIMBLE seems to perform quite good when it comes to estimating parameters for mixture models.

### On matching-adjusted indirect comparison and calibration estimation (https://arxiv.org/abs/2107.11687)

The idea is that matching-adjusted indirect comparison, which is commonly used in RCTs to compare non-directly comparable pool of patients, share some resemblance with calibration estimation as used in survey sampling or epidemiological studies. This technique allows to use weights with minimal variance to balance covariates between the sample and target populations. In the case of RCTs, if a common treatment is available between the different samples, then it can be used as an anchor to analyze within-study differences, although this is not the main approach discussed in this article. The author provides extensive simulation results (R code available), and concludes that among the numerous approaches that can be used to construct appropriate weights, empirical likelihood weights allow to derive likelihood-based confidence intervals for treatment effect that are often more reliable than asymptotic ones.
