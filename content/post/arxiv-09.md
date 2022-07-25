---
title: "ArXiving on July 2022"
date: 2022-07-24T10:09:25+01:00
draft: false
tags: ["readings", "arxiv"]
categories: ["2022"]
---

Here are a few papers that I read over the past months, in the CS and Stat category as usual.

### Marginal Effects for Non-Linear Prediction Functions (https://arxiv.org/abs/2201.08837)

For everything related to [marginal effects], I usually trust Stata margins command. By the way, there is a [dedicated book] for this very useful command written by Michael N. Mitchell. The present article deals with estimating marginal effects in the case of non-linear models, which usually involves derivatives as discussed in an [old post]. Here the authors argue in favor of forward differences, hence the approach coined "forward marginal effects."

### Better to be in agreement than in bad company: a critical analysis of many kappa-like tests assessing one-million 2x2 contingency tables (https://arxiv.org/abs/2203.09628)

I once gave a [brief overview] of recommend techniques for the cross tabulation of two categorical variables. This article goes a lot deeper by discussing agreement measures in 2x2 tables, inlcuding the cases of extreme tables where there's a high level of agreement or a large imbalance between cells. The authors suggest that Holley and Guilford’s G and Gwet’s AC1 are the best candidates, among many other agreement measures (Cohen’s kappa, Pearson’s r, Yule’s Q and Y, Scott’s $\pi$, Shankar and Bangdiwala’s B, Dice’s F1 and McNemar’s $\chi^2$).

### Selective inference for k-means clustering (https://arxiv.org/abs/2203.15267)

Unsupervised learning does not lead naturally to statistical inference, except maybe in the case of assessing clustering stability or choosing the optimal number of clusters. I discussed resampling-based appraoches in [another post]. However, with added constraints like in [Mclust], we can work out the likelihood and optimize the number of clusters, for instance. Another inferential issue is that of testing whether cluster members differ on average on some attributes. Usually, we don't test attributes that were used to build the partitioning: it is often meaningless since we are usually trying to maximize the separation between clusters based on those very specific attributes, and in any way this would lead to inflated Type I error rate. Most of the times, we establish and eventually test clustering profiles based on held out variables. In this paper, the authors propose a finite-sample p-value that controls the selective Type I error for a test of the difference in means between a pair of clusters obtained using k-means clustering.

### A tutorial for using propensity score weighting for moderation analysis: an application to smoking disparities among LGB adults (https://arxiv.org/abs/2204.03345)

This aricle is in fact mostly a tutorial on moderation analysis using PS weighting, and illustrations in Stata (inline code) and R (external package) are provided.

### Latent Trait Item Response Models for Continuous Responses (https://arxiv.org/abs/2204.03841)

Usually, latent trait models apply to categorical response variable (dichotomous or polytomous items, or rating scales). The objective is to build a continuous score reflecting the position of an individual on the ltent trait being measured. For a more detailed overview, see [my answer] on Cross Validated. This article deals with restricted continuous responses (e.g. positive only or interval-based responses), and extends [response time] models.

### Uniformly Valid Inference Based on the Lasso in Linear Mixed Models (https://arxiv.org/abs/2204.03887)

The authors use restricted maximum likelihood (REML) estimators to separate the estimation of the regression coefficients and covariance parameters in order to estimate fixed-effects with L1 penalization in Gaussian linear mixed models.

### The replication of non-inferiority and equivalence studies (https://arxiv.org/abs/2204.06960)

The authors use the [TOST] technique to analyze replication equivalence studies. A "success interval" for the relative effect size is used to compare the replicate to the original study effect.

### Flexible Marginal Models for Dependent Data (https://arxiv.org/abs/2204.07188)

An interesting paper to complement one [companion textbook] I worked on long time ago.

{{% music %}}Benny Golson • _Little Karin_{{% /music %}}

[marginal effects]: https://www.stata.com/features/overview/marginal-analysis/
[dedicated book]: https://www.stata.com/bookstore/interpreting-visualizing-regression-models/
[old post]: /post/interaction-terms-in-nonlinear-models/
[brief overview]: https://stats.stackexchange.com/a/4170/930
[another post]: /post/using-bootstrap-in-cluster-analysis/
[mclust]: https://mclust-org.github.io/mclust/index.html
[my answer]: https://stats.stackexchange.com/a/31842/930
[response time]: https://www.frontiersin.org/articles/10.3389/fpsyg.2019.00102/full
[tost]: https://pubmed.ncbi.nlm.nih.gov/9056588/
[companion textbook]: https://aliquote.org/pub/MDLD.pdf
