---
title: "ArXiving on June 2021"
date: 2021-07-08T08:19:25+01:00
draft: false
tags: ["readings", "arxiv"]
categories: ["2021"]
---

Here are some papers that I read this week, in the CS and Stat category, plus random stuff that were mentioned on IRC or Hacker News.

### Scalable Econometrics on Big Data -- The Logistic Regression on Spark (https://arxiv.org/abs/2106.10341)

I managed to try some Spark and [H20](/post/python-h2o/) examples a long time ago, but this was really for toy projects. I'm usually happy with R or Stata for statistical modeling. However, this article brings interesting insights into large scale data processing using Spark, together with an empirical study of Python+Spark ML versus R in the case of logistic regression. Apparently, the new Spark ML library exposes two different versions of the logistic regression, one direct method (`ml.classification.LogisticRegression`) and the general linear model approach (`ml.regression.GeneralizedLinearRegression`).

### maars: Tidy Inference under the 'Models as Approximations' Framework in R (https://arxiv.org/abs/2106.11188)

Another article dealing with statistical modeling, this time under the OLS framework. Precisely, this article is about a new R package, `maars`, which offer resampling-based variance estimators and pretty printing of summary results, along tidy syntax. I've never been a great fan of the tidy family of foo's, but your mileage may vary. The visual diagnostic addons ("focal slope" and "nonlinearity detection") are probably the best aspects of this package.

### Choosing the Estimand When Matching or Weighting in Observational Studies (https://arxiv.org/abs/2106.10577)

> Commonly used estimands include the average treatment effect in the treated (ATT), the average treatment effect in the untreated (ATU), the average treatment effect in the population (ATE), and the average treatment effect in the overlap (i.e., equipoise population; ATO). Each estimand has its own assumptions, interpretation, and statistical methods that can be used to estimate it. This article provides guidance on selecting and interpreting an estimand to help medical researchers correctly implement statistical methods used to estimate causal effects in observational studies and to help audiences correctly interpret the results and limitations of these studies.

With a background in experimental design and behavioral measurement, it took me a long time to get familiar with econometric and epidemiological vocabulary when I was working as a biostatistician in the past 15 years. That being said, this article offers an overview of the different types of estimands available, and how to decide which one to use depending on the question at hand. For instance, "if the question concerns a policy of withholding treatment from those who would currently receive it, this suggests the ATT is of interest. If the question concerns a policy of expanding treatment to those who would not currently receive it, the ATU may be of interest. If the question concerns a policy that would require all patients to be treated or to be untreated, the ATE may be of interest. If the question concerns a policy of prescribing treatment for patients under uncertainty, the ATO may be of interest."

### A Bibliography of Combinators (https://arxiv.org/abs/2106.11729)

Stephen Wolfram published lengthy posts on his "personal blog", and here is a bibliography memento on combinators, lambda calculus & Co. available on arXiv. See also [Combinators: A Centennial View](https://www.wolfram-media.com/products/combinators-a-centennial-view.html).

### Robust Regression Revisited: Acceleration and Improved Estimation Rates (https://arxiv.org/abs/2106.11938)

This article presents the theoretical implications of contaminated data points in computing maximum-likelihood estimates for parameters of a regression model. So-called highly robust regression is then used as it proved to be a "flexible model of corruption and can be used to study both truly adversarial data poisoning attacks (where e.g. part of the dataset is sourced from malicious respondents), as well as model misspecification, where the generative $D_{X_y}$ does not exactly satisfy our distributional assumptions, but is close in total variation to a distribution that does." The article is rather technical, but I learned, for instance, that there exists a nearly-linear time algorithm for robust linear regression with residual variance bounded by $\sigma^2$.

### Inference in High-dimensional Linear Regression (https://arxiv.org/abs/2106.12001)

In the $n\ll p$ settings, parameter estimation in a regression model becomes complicated. There are tons of approaches to perform variable selection or to reduce the dimensionality of the dataset, and in this case the authors discuss a marginalization approach to this problem: each regression parameter is estimated while treating every other parameters as nuisance factors, much like when residualizing predictors of poor interest (e.g., a set of common covariates). The interesting part of this approach is that the regression coefficients remain on their original scale, unlike regression coefficients estimated using Lasso or Ridge penalties.
