---
title: "This week in Stata: Extended Regression Models"
date: 2018-04-06T13:14:45+02:00
draft: true
keywords: []
description: "The Stata Tutor series are short introduction to Stata features, with occasional comparison to other available software (R, Python, Stan, etc.)."
tags: ["statistics", "stata"]
categories: ["stata-tutor"]
---

Per Stata Corp. announcement back in 2017, [Extended Regression Models](https://www.stata.com/new-in-stata/extended-regression-models/) (ERM) are a class of models that encompasses linear regression, (ordered) probit model and interval regression. In what follows, I shall discuss what ERMs are good for, how they can be used in practice, and how they compare to other approaches to fitting multiple equation models.

<!--more-->

You will find a [series of short videos](https://www.youtube.com/watch?v=bPhNq6RYd-I) by Chuck Huber who highlights the idea of ERMs on Youtube. And of course, there is the Stata [ERM] manual, [available on-line](https://www.stata.com/manuals/erm.pdf) (PDF), where as always you will find about 50 pages of extended discussion on ERMs and how they are implemented in Stata.

Extended Regression Models can be viewed as an extension of two-part models, available via the [`-tpm-`](https://www.stata.com/statalist/archive/2012-11/msg00033.html) or [`-twopm-`](https://ideas.repec.org/c/boc/bocode/s457538.html) commands in Stata, instrumental variable and 2SLS models (`-ivreg-`) and simultaneous equations.

## Endogeneity and instrumental variables

First, a bit of vocabulary (which is very specific to the econometric field). I will just assume that you are familiar with ordinary least squares and the general(ized) linear model, and not too picky with mathematical notation that I often simplify for the sake of clarity. If you are looking for a more formal treatment of endogeneity, two-stage estimation or the use of instrumental variables in regression modeling, the [Woolwridge](https://www.cengage.com/c/introductory-econometrics-a-modern-approach-6e-wooldridge/9781305270107) and [Greene](Econometric Analysis)'s textbooks on Econometric Analysis are considered as references in this field. That being said, an *exogenous variable* in a regression model is what we commonly consider as a simple independent or explanatory variable, or a predictor (of a given response or dependent variable, or outcome) for short. It is supposed to be barely related (read, correlated) to other explanatory variables entering the model and it is supposed to be fixed (and oftentimes measured without error) in the model. An *endogenous variable*, on the contrary, is a variable whose values are partially determined by other exogenous variables, or it is correlated with contemporaneous errors (i.e., there could also exist a correlation with past or future errors as in time series). 

Consider a simple model $y_i = \beta_1x\_{1i} + \beta_2x\_{2i} + u_i$, for $i = 1, \dots, n$, where $x_1$ and $x_2$ are two explanatory variables, $x_2$ being an endogenous variable. The fact that $\text{Cov}(x\_{2i}, u_i) \neq 0$ implies among other things that $\mathbb E(u_i\mid x\_{2i}) \neq 0$, and that the OLS estimator is biased and inconsistent.

## Extending the regression framework

Back to our question of the day. Among the "complications" that we can encounter in regression modeling and that affect the functional part of the statistical model or the resulting estimates, there are:

1. *endogenous covariates*, which arise in case of reverse causation (changes in the response variable affect values of the predictor; see [Causal inference in statistics: An overview](https://projecteuclid.org/euclid.ssu/1255440554), by Judea Pearl), omitted variable that affects both the response and/or a predictor of interest (e.g., $\text{Cov}(x_i, u_i) = 0$ would be a correct specification if a certain predictor hadn't been omitted from the model), or measurement error at the level of the predictor (e.g., when you are asked in a survey how much money you spend overall for leisure last week); 2. (endogenous) sample selection, 
3. treatment assignment

A two-stage OLS model can be used to solve (1)

Stata has everything needed to fit such models in the linear regression settings and in other case as well (e.g., `-cdsimeq-` for two-stage probit least squares, or `-heckman-` for the [Heckman selection model](https://en.wikipedia.org/wiki/Heckman_correction)). The ERM approach is there to ensure that you can still obtain valid and unbiased estimates in the case where all the above conditions occur at the same time.


The `-etregress-` was used in Stata 14 to estimate a linear regression model that incorporates a binary endogenous variable related to treatment allocation. It is still available in version 15 and it is called an "endogenous treatment-regression model"


## Illustration

Finally, here is a working example.


### References

{{% music %}}My Bloody Valentine • *Isn't Anything*{{% /music %}}
