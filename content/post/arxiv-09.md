---
title: "ArXiving on July 2022"
date: 2022-07-24T10:09:25+01:00
draft: true
tags: ["readings", "arxiv"]
categories: ["2022"]
---

Here are a few papers that I read over the past months, in the CS and Stat category as usual.

### Marginal Effects for Non-Linear Prediction Functions (https://arxiv.org/abs/2201.08837)

For everything related to [marginal effects], I usually trust Stata margins command. By the way, there is a [dedicated book] for this very useful command written by Michael N. Mitchell. The present article deals with estimating marginal effects in the case of non-linear models, which usually involves derivatives as discussed in an [old post]. Here the authors argue in favor of forward differences, hence the approach coined "forward marginal effects."

### Better to be in agreement than in bad company: a critical analysis of many kappa-like tests assessing one-million 2x2 contingency tables (https://arxiv.org/abs/2203.09628)

I once gave a [brief overview] of recommend techniques for the cross tabulation of two categorical variables. This article goes a lot deeper by discussing agreement measures in 2x2 tables, inlcuding the cases of extreme tables where there's a high level of agreement or a large imbalance between cells. The authors suggest that Holley and Guilford’s G and Gwet’s AC1 are the best candidates, among many other agreement measures (Cohen’s kappa, Pearson’s r, Yule’s Q and Y, Scott’s $\pi$, Shankar and Bangdiwala’s B, Dice’s F1 and McNemar’s $\chi^2$).

### New algorithms for computing the least trimmed squares estimator (https://arxiv.org/abs/2203.10387)

### Selective inference for k-means clustering (https://arxiv.org/abs/2203.15267)

Unsupervised learning does not lead naturally to statistical inference, except maybe in the case of assessing clustering stability or choosing the optimal number of clusters. I discussed resampling-based appraoches in [another post]. However, with added constraints like in [Mclust], we can work out the likelihood and optimize the number of clusters, for instance. In this article, the authors describe

### A tutorial for using propensity score weighting for moderation analysis: an application to smoking disparities among LGB adults (https://arxiv.org/abs/2204.03345)

### Latent Trait Item Response Models for Continuous Responses (https://arxiv.org/abs/2204.03841)

### Uniformly Valid Inference Based on the Lasso in Linear Mixed Models (https://arxiv.org/abs/2204.03887)

### The replication of non-inferiority and equivalence studies (https://arxiv.org/abs/2204.06960)

### Flexible Marginal Models for Dependent Data (https://arxiv.org/abs/2204.07188)

{{% music %}}Benny Golson • _Little Karin_{{% /music %}}

[marginal effects]: https://www.stata.com/features/overview/marginal-analysis/
[dedicated book]: https://www.stata.com/bookstore/interpreting-visualizing-regression-models/
[old post]: /post/interaction-terms-in-nonlinear-models/
[brief overview]: https://stats.stackexchange.com/a/4170/930

[another post]:
[Mclust]:
