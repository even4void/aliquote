---
title: "This week in Stata: Extended Regression Models"
date: 2019-07-18T13:14:45+02:00
draft: true
tags: ["statistics", "stata"]
categories: ["stata-tutor"]
---

Per Stata Corp. announcement back in 2017, [Extended Regression Models](https://www.stata.com/new-in-stata/extended-regression-models/) (ERM) are a class of models that encompasses linear regression, (ordered) probit model and interval regression. In what follows, I shall discuss what ERMs are good for, how they can be used in practice, and how they compare to other approaches to fitting multiple equation models.

<!--more-->

You will find a [series of short videos](https://www.youtube.com/watch?v=bPhNq6RYd-I) by Chuck Huber who highlights the idea of ERMs on Youtube. And of course, there is the Stata [ERM] manual, [available on-line](https://www.stata.com/manuals/erm.pdf) (PDF), where as always you will find about 50 pages of extended discussion on ERMs and how they are implemented in Stata.

Extended Regression Models can be viewed as an extension of two-part models, available via the [`-tpm-`](https://www.stata.com/statalist/archive/2012-11/msg00033.html) or [`-twopm-`](https://ideas.repec.org/c/boc/bocode/s457538.html) commands in Stata, instrumental variable and 2SLS models (`-ivreg-`) and simultaneous equations. These models allow to account for endogenous covariates, nonrandom treatment assignment and Heckman-type sample selection for data missing not at random. Biostatisticians often view the Heckman model as a technique to handle lost to follow-up (predictors correlated to right censoring while leaving the outcome unaffected) or non random missing values in health survey. 

## Endogeneity and instrumental variables

First, a bit of vocabulary (which is very specific to the econometric field). I will just assume that you are familiar with ordinary least squares and the general(ized) linear model, and not too picky with mathematical notation that I often simplify for the sake of clarity. If you are looking for a more formal treatment of endogeneity, two-stage estimation or the use of instrumental variables in regression modeling, the [Woolwridge](https://www.cengage.com/c/introductory-econometrics-a-modern-approach-6e-wooldridge/9781305270107) and [Greene](http://pages.stern.nyu.edu/~wgreene/Text/econometricanalysis.htm)'s textbooks on Econometric Analysis are considered as references in this field. That being said, an *exogenous variable*, say $X$, in a regression model is what we commonly consider as a simple independent or explanatory variable, or a predictor of a given response or dependent variable, or outcome $Y$ for short. It is supposed to be barely related (read, correlated) to other explanatory variables entering the model and it is supposed to be fixed (and oftentimes measured without error) in the model. The errors, $\varepsilon$, reflect departure from a perfect fit. As nicely put on a [Cross Validated thread](https://stats.stackexchange.com/a/59639), the OLS approach to fitting such a relationship amounts to assume that $X$ causes $Y$, $\varepsilon$ cause $Y$, $\varepsilon$ does not cause $X$, $Y$ does not cause $X$, and nothing which causes $\varepsilon$ also causes $X$. An *endogenous variable*, on the contrary, is a variable whose values are partially determined by other exogenous variables, or it is correlated with contemporaneous errors (i.e., there could also exist a correlation with past or future errors as in time series). 

Consider a simple model $y_i = \beta_1x\_{1i} + \beta_2x\_{2i} + \varepsilon_i$, for $i = 1, \dots, n$, where $x_1$ and $x_2$ are two explanatory variables, $x_2$ being an endogenous variable. The fact that $\text{Cov}(x\_{2i}, \varepsilon_i) \neq 0$ implies among other things that $\mathbb E(\varepsilon_i\mid x\_{2i}) \neq 0$, and that the OLS estimator is biased and inconsistent. Here is a working example:

```stata
clear
set seed 101
set obs 100
gen x1 = rnormal()
gen x2 = rnormal()
gen u  = 2*rnormal() + 1.5*x2
gen y  = 2*x1 + 3*x2 + u
```

Here are the results of a simple OLS model:


```stata
. regress y x1 x2

      Source |       SS           df       MS      Number of obs   =       100
-------------|----------------------------------   F(2, 97)        =    251.12
       Model |  1977.54295         2  988.771476   Prob > F        =    0.0000
    Residual |  381.928563        97  3.93740787   R-squared       =    0.8381
-------------|----------------------------------   Adj R-squared   =    0.8348
       Total |  2359.47151        99  23.8330456   Root MSE        =    1.9843

------------------------------------------------------------------------------
           y |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------|----------------------------------------------------------------
          x1 |   1.872049   .2160607     8.66   0.000     1.443228    2.300869
          x2 |   4.466416   .2306744    19.36   0.000     4.008591    4.924241
       _cons |   .4787588   .1988712     2.41   0.018     .0840545    .8734631
------------------------------------------------------------------------------
```

As can be seen from the above results, we are off by a certain amount for the "true" regression coefficient for `x2`.

[forbidden regression](https://www.stata.com/statalist/archive/2008-05/msg01130.html)

http://econometricstutorial.com/2015/03/instrumental-variables-find-the-bad-guys-stata/

See also [Using mlexp to estimate endogenous treatment effects in a probit model](https://blog.stata.com/2015/11/05/using-mlexp-to-estimate-endogenous-treatment-effects-in-a-probit-model/)

```stata
probit X1 X2 X3 Z1 Z2
predict X1hat, p
ivregress 2sls Y X2 X3 (X1 = Z1 Z2 X1hat)
```

## Extending the regression framework

Back to our question of the day. Among the "complications" that we can encounter in regression modeling and that affect the functional part of the statistical model or the resulting estimates, there are:

1. *endogenous covariates*, which arise in case of reverse causation (changes in the response variable affect values of the predictor; see [Causal inference in statistics: An overview](https://projecteuclid.org/euclid.ssu/1255440554), by Judea Pearl), omitted variable that affects both the response and/or a predictor of interest (e.g., $\text{Cov}(x_i, u_i) = 0$ would be a correct specification if a certain predictor hadn't been omitted from the model), or measurement error at the level of the predictor (e.g., when you are asked in a survey how much money you spend overall for leisure last week);
2. (endogenous) sample selection, 
3. treatment assignment

A two-stage OLS model can be used to solve (1)

Stata has everything needed to fit such models in the linear regression settings and in other case as well (e.g., `-cdsimeq-` for two-stage probit least squares, or `-heckman-` for the [Heckman selection model](https://en.wikipedia.org/wiki/Heckman_correction)). Let $Y^\star$ be the outcome of interest but we observe $Y=Y^\star$ when the unobserved variable $U^\star$ takes only some values among the possible range. In other words, $Y$ is truncated and estimate model parameters using $f(Y\mid U^\star)$. In practice, truncation arises when the sample represents only a subset of the target population, (e.g., a sample of individuals with incomes below or above some threshold), or there may be some hidden and incidental truncation which results in $Y^\star$ not being observed for all individuals. Latent variable models, especially the [Tobit model](https://polisci.osu.edu/sites/polisci.osu.edu/files/selection_models.pdf), are well suited to this kind of data. The Heckman model, as orignally proposed, assumes the bivariate normality of $Y^\star$ and $U^\star$, while the Heckman two-step estimator is more robust although both approaches are highly sensitive to high correlation between the outcome and selection equations.[^1] The ERM approach is there to ensure that you can still obtain valid and unbiased estimates in the case where all the above conditions occur at the same time.

http://www.soderbom.net/lecture15final.pdf

The `-etregress-` was used in Stata 14 to estimate a linear regression model that incorporates a binary endogenous variable related to treatment allocation. It is still available in version 15 and it is called an "endogenous treatment-regression model"


## Learn more



[The Extended Switching Regression Model: Allowing for Multiple Latent State Variables](http://www.bgu.ac.il/~wettstn/esr_1.pdf) (PDF)

[XTIVREG2: Stata module to perform extended IV/2SLS, GMM and AC/HAC, LIML and k-class regression for panel data models](https://ideas.repec.org/c/boc/bocode/s456501.html)


[^1]: Puhani, P. A. (2000). [The Heckman Correction for Sample Selection and Its Critique](https://onlinelibrary.wiley.com/doi/abs/10.1111/1467-6419.00104). *Journal of Economic Surveys*, 14, 53–68.

{{% music %}}My Bloody Valentine • *Isn't Anything*{{% /music %}}
