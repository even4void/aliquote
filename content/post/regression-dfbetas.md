---
title: "Regression and DFBETAS"
date: 2023-07-11T20:55:58+01:00
draft: true
tags: ["statistics"]
categories: ["2023"]
---

In a previous post, we discussed how influence measures can provide some insights on data quality or model fit. There are various [cutoff values](https://www.sfu.ca/sasdoc/sashtml/stat/chap55/sect38.htm) that are used to interpret each of these quantities, e.g., $\text{Cook's d} > 4/(n-k-1)$, $\text{DFFITS} > 2\sqrt{p/n}$, $\text{DFBETAS} > 2/\sqrt{n}$. The latter emphasizes regression coefficients themselves.[^1]

Considering a linear predictor $\beta_0 + \sum_{j=1}^k\beta_jx$, the DFBETA value for the $j$th coefficient for the $i$th observation is $\hat\beta_j - \hat\beta_j^{(-i)}$, where $\hat\beta_j^{(-i)}$ is the $j$th coefficient of the regression estimated without the $i$th observation. It's mostly the jacknife approach to validating a regression model by discarding one observation at a time. From a computational perspective, it is not necessary to compute all $n$ full model since we can rely on [linear algebra](https://stats.stackexchange.com/a/19293) to relate OLS fit for all $n$ observations to that of any based on $n-1$ observations.[^2] Often times, absolute values of DFBETAs are considered instead of signed values, and it is also common to standardize those values since their scale depend on that of the variable of interest. Standardization is done by dividing DFBETAs by the corresponding standard deviation of the $i$th-deleted regression model, and statistical packages often refer to them as DFBETAS instead of DFBETA (note the extra S).

The threshold or reference value, $2/\sqrt{n}$, can be seen as a size-adjusted influence effect accounting for the standard error estimate of the corresponding coefficient. In effect, it amounts to highlight the same theoretical number of influnetial points regardless of sample size, much like when using standardized residuals and referring their distribution to a Student $t$ or $\mathcal{N}$ distribution.

In what follows, I will generate an artificial dataset and plot the proportion of DFBETAS values exceeding the $2/\sqrt{n}$ threshold for varying sample sizes.

{{% music %}}Grateful Dead • _Viola Lee BLues_{{% /music %}}

[^1]: This post is largely inspired by [Detecting Influential Points in Regression with DFBETA(S)](https://data.library.virginia.edu/detecting-influential-points-in-regression-with-dfbetas/).
[^2]: Belsley, D. A., Kuh, E., and Welsch, R. E. (1980). _Regression diagnostics: Identifying influential data and sources of collinearity_. John Wiley & Sons.
