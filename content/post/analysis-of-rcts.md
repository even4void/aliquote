---
title: "A recap' on the statistical analysis of RCTs"
date: 2010-09-01T12:46:38+01:00
draft: false
tags: ["readings", "statistics"]
categories: ["2010"]
---

Although not really related to RCTs per se, this note is a summary of an article coming from [Statistical Methods in Medical Research](http://smm.sagepub.com/), 2010 vol. 19(4), which is a special issue on Primary Care studies.

The abstract for the first article by Lancaster et al. reads:

> Trials carried out in primary care typically involve complex interventions that require considerable planning if they are to be implemented successfully. The role of the statistician in promoting both robust study design and appropriate statistical analysis is an important contribution to a multi-disciplinary primary care research group. Issues in the design of complex interventions have been addressed in the Medical Research Council’s new guidance document and over the past 7 years by the Royal Statistical Society’s Primary Health Care Study Group. With the aim of raising the profile of statistics and building research capability in this area, particularly with respect to methodological issues, the study group meetings have covered a wide range of topics that have been of interest to statisticians and non-statisticians alike. The aim of this article is to provide an overview of the statistical issues that have arisen over the years related to the design and evaluation of trials in primary care, to provide useful examples and references for further study and ultimately to promote good practice in the conduct of complex interventions carried out in primary care and other health care settings. Throughout we have given particular emphasis to statistical issues related to the design of cluster randomised trials.

Briefly, I shall focus on the following issues:

1. Choice of the randomization method (subjects allocation, use of clusters, sample size in treatment groups, covariates);
2. Conditional vs. marginal approach to analyse the outcome of interest in relation to the covariates.

## Choice of the randomization method

{{% alert note %}}
Oups, it looks like this has yet to be written.
{{% /alert %}}


## Model fitting

There are two broad class of models for fitting clusterized data: cluster-specific (CS) and population-averaged (PA) models. The first one belongs to the class of conditional model, whereas the second one follows from the marginal approach. Their interpretation remains the same in the case of linear and log-linear models, but in the case of a logistic link function, the use of a PA model results in attenuated regression coefficients for the covariates of interest, see below.<sup>(1)</sup>

If we consider an outcome Y, with expected value µ,and the link function g defined as

$$ g(\mu) = \eta = \beta_0 + \beta_1X + Z, $$

with $\mathbb E(Z) = 0$ and $\text{Var}(Z) = \sigma^2$, $Z$ independent of $X$, we have a CS model which measures the effect of $X$ variations on $Y$, while $Z$ is held constant. The variable $Z$ is just a random effect, and this amount to add an effect $Z_i$ to all outcomes belonging to the same cluster.

Then it can be shown that omitting the variable $Z$ yields a PA model,

$$ \eta = \beta_0^{\star} + \beta_1^{\star}X, $$

where we look at the average effect of $X$ over the range of $Z$, that is over all clusters. It should be noted that now errors are correlated but this can easily be accomodated when fitting the model. If we further assume that $\beta_1^\star \approx B\beta_1$, where $B$ stands for the bias factor, then Neuhaus and Jewell<sup>(1)</sup> show that $B = 1$ for linear and log-linear model; with $\mu = \text{logit}(\Pr(Y = 1 \mid X, Z))$ (logistic link), $B$ becomes:

$$ B = 1 - \frac{\sigma_Z^2}{\mathbb E(\mu)\big(1-\mathbb E(\mu)\big)} = 1 - \rho, $$

where $\rho$ stands for the within-cluster correlation (assuming $\beta_1 = 0$). As $\rho$ is usually $< 0.01$ in community-based studies, using a marginal model should not yield strong biases, because in this case $0 < B < 1$ and regression coefficients from the PA model are just a little bit shrinked.

How about estimation of model parameters? With a continuous outcome $y$, which is modeled as $y\_{ij} = \beta_0 + \beta_1X_i + \nu\_{ij}$, where $\nu\_{ij} = Z_i + \varepsilon\_{ij}$, we can think of $Z_i$ as nuisance parameters, and usual likelihood-based methods apply (using gaussian quadrature or Laplace approximation to eliminate the $Z_i$). Generally, we make the additional assumption of an exchangeable correlation structure, which amounts to consider that the variance-covariance matrix would remain the same if we exchange the within-cluster units.

It should be noted that we can also consider using a log-linear model which would give relative risks instead of odds-ratio.

### References

1. Neuhaus, J.M. and Jewell, N.P. (1993). A geometric approach to assess bias due to omitted covariates in generalized linear models. *Biometrika*, 80: 807-815.
