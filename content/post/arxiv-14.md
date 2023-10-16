---
title: "ArXiving on October 2023"
date: 2023-10-13T12:24:09+02:00
draft: true
tags: ["readings", "arxiv"]
categories: ["2023"]
---

### Fisher's Pioneering work on Discriminant Analysis and its Impact on AI (https://arxiv.org/abs/2309.04774v1)

It's a little bit funny to see the name of Ronald Fisher associated to AI in the title of scientific paper, especially since AI now means LLMs and other brilliant foundations for the future millennium. Anyway, the iris dataset is used to illustrate the use of a discriminant function (as the ratio of squared mean and variance) to demonstrate whether "when we use the linear compound of the four measurements most appropriate for discriminating three such species, the mean value for _I. versicolor_ takes an intermediate value and, if so, whether it differs twice as much from _I. setosa_ as from _I. virginica_, as might be expected, if the effect of genes are simply additive, in a hybrid between a diploid and a tetraploid species." [^1] Hence, a genetic hypothesis, which can be exploited to find the optimal linear combination of population means, $\mu_1 -3\mu2 + 2\mu_3 = 0$ (respectively, setosa, versicola and virginica), was at the heart of Fisher's seminal paper, like many of his other contributions. Sadly, the iris dataset is mostly used in the context of unsupervised classification (k-means, for instance), as if people forgot that it relies at its heart on a well-defined hypothesis (much like people forgot or still ignore that Student (Gosset's nom de plume) developed his test while working in a brewery). It seems the point of the authors is the notion of a discriminating rule, which, when applied to AI problems, amounts to a supervised approach that aims to find a "rule to separate distinct populations, and then to use that rule (or a different classification scheme) to allocate a new observation to the given populations."

### A compendium of data sources for data science, machine learning, and artificial intelligence (https://arxiv.org/abs/2309.05682)

This article summarizes a long list of data repositories spanning a dozen or so domains (including satellite data or sports, for instance). I will keep it on hand just in case I need some dataset one day.

### Demystifying Statistical Matching Algorithms for Big Data (https://arxiv.org/abs/2309.05859)

Propensity scoring is widely used in the absence of a controlled experiment, e.g. in observational studies, where as the authors say matching is used to pair treated and control units with similar value of potential confounders (aka, the propensity score). Usually, matching is done with replacement, that is a control is paired to several treated units (1-to-n matching, with replacement). There are [other estimators](https://www.stata.com/features/causal-inference/) (e.g., inverse probability weighting or doubly robust methods), though. [Oversampling and replacement strategies](https://bmcmedresmethodol.biomedcentral.com/articles/10.1186/s12874-021-01454-z) may alter the balance between bias and variance. In the case of matching without replacement, greedy approaches are used; in Stata, there's a command `calipmatch` which does the job for you, while in R the /de facto/ packages are probably `Matching` and `MatchIt`. In this paper, the authors review alternative approaches, namely optimal statistical matching (linear balanced and unbalanced assignment problem, maximum cardinality matching, and minimal cost matching).

### Subgroup detection in linear growth curve models with generalized linear mixed model (GLMM) trees (https://arxiv.org/abs/2309.05862)

Here is another paper by Achim Zeilis on regression trees. This time, it deals with "extended" GLMMs for identifying subgroups in growth curve modeling. Recursive partitioning is performed

### A Change-Point Approach to Estimating the Proportion of False Null Hypotheses in Multiple Testing (https://arxiv.org/abs/2309.10017)

### A New Bootstrap Goodness-of-Fit Test for Normal Linear Regression Models (https://arxiv.org/abs/2309.10614)

### Pseudo-Bayesian unit level modeling for small area estimation under informative sampling (https://arxiv.org/abs/2309.12119)

### Unveiling Challenges in Mendelian Randomization for Gene-Environment Interaction (https://arxiv.org/abs/2309.12152)

{{% music %}}Public Image Ltd • _Rise_{{% /music %}}

[^1]: Fisher, R. A. (1936) The use of multiple measurements in taxonomic problems. _Ann. Eugen._, 7, 179–188.
