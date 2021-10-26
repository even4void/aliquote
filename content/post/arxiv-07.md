---
title: "ArXiving on October 2021"
date: 2021-10-23:09:25+01:00
draft: false
tags: ["readings", "arxiv"]
categories: ["2021"]
---

Here are some papers that I read this week, in the CS and Stat category, plus random stuff that were mentioned on IRC or Hacker News.

### Accuracy, precision, and agreement statistical tests for Bland-Altman method (https://arxiv.org/abs/2108.12937)

I've used Bland-Altman plots a lot when I was working on diagnostic tests and psychometric measurement. Interestingly, few medics really understood how to interpret those kind of graphical displays, and how they are used in [method comparison](https://stats.stackexchange.com/a/2834/930) studies. I suspect they also dislike this approach since it does not provide formal tests of hypothesis. Here we go, with three tests for accuracy, precision and agreement.

### Generalized nearly isotonic regression (https://arxiv.org/abs/2108.13010)

Fond memories of Jan de Leeuw's (and the GIFI nom de plume) own work.

### Lagged couplings diagnose Markov chain Monte Carlo phylogenetic inference (https://arxiv.org/abs/2108.13328)

### A Q-Q plot aids interpretation of the False Discovery Rate (https://arxiv.org/abs/2109.02118)

A simple yet efficient graphical method to assess significant p-values computed using Benjamini-Hochberg approach.

> The FDR is a property of a set of p-values, not of any individual value.

### Dynamic Network regression (https://arxiv.org/abs/2109.02981)

This article deals with [Fréchet regression](https://projecteuclid.org/journals/annals-of-statistics/volume-47/issue-2/Fr%c3%a9chet-regression-for-random-objects-with-Euclidean-predictors/10.1214/17-AOS1624.short) on network data, using the corresponding space of graph Laplacians (with no restriction on their rank). It has two applications (NY taxi trips after COVID-19 and dynamic networks in aging brains) which I found quite interesting. Such an approach might prove superior to classical data mining on spatio-temporal data structures since we can capture both the structure and weight information of a networks given relevant covariates, and assess the quality of adjustement for projected trends.

### High Performance Implementation of the Hierarchical Likelihood for Generalized Linear Mixed Models. An Application to estimate the potassium reference range in massive Electronic Health Records datasets (https://arxiv.org/abs/1910.08179)

Not much of an interest for me except that it deals with Potassium reference level which is a subject I have been familiar with (for personal reason, unfortunately) for several years now. This remains, however, an interesting simulation study for mixed-effects models and big data aficionados.

### Distcomp: Comparing distributions (https://arxiv.org/abs/2110.02327)

This paper introduces a Stata command that allows to compare empirical CDFs. Contrary to the Kolmogorov-Smirnov approach, `distcomp` allows to test the equality of the distribution functions point by point., using appropriate FWER control, and displays ranges of values in which the distributions' difference is statistically significant.

