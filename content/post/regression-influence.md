---
title: "Regression diagnostics and influence measures"
date: 2023-02-02T20:55:35+01:00
draft: false
tags: ["statistics", "python"]
categories: ["2023"]
---

In one of my [answer](https://stats.stackexchange.com/a/19293/930) on Cross Validated I discussed base R solution for diagnosing a regression model. Specifically, I said that "The function influence() (or its wrapper, influence.measures()) returns most of what we need for model diagnostic, including jacknifed statistics. As stated in Chambers and Hastie's Statistical Models in S (Wadsworth & Brooks, 1992), it can be used in combination to summary.lm(). One of the example provided in the so-called "white book" (pp. 130-131) allows to compute standardized (residuals with equal variance) and studentized (the same with a different estimate for SE) residuals, DFBETAS (change in the coefficients scaled by the SE for the regression coefficients), DFFIT (change in the fitted value when observation is dropped), and DFFITS (the same, with unit variance) measures without much difficulty."

All of this relies on linear algebra and does not require to perform matrix multiplication or inversions again and again. My impression is that few people really use influence measures (contrary to, say, variance influence factors) even if it may bring some insights into data or model quality. These are simple quantities, though. See one of my [old workshop](https://aliquote.org/cours/2012_biomed/04-linear-model.pdf) (in French) on statistical modeling (slide #13). For instance, the leverage statistic, or hat value, is defined for observation $i$ as

$$h_i = \frac{1}{n} + \frac{(x_i - \bar x)^2}{\sum_{i=1}^n (x_i - \bar x)^2} = \frac{1}{n} + \frac{(x_i - \bar x)^2}{(n-1)s_x^2}.$$

Note that there is no strict correspondence between outlying and high leverage observations. The mean leverage value is $(k+1)/n$, where $k$ is the number of parameters in the linear model. In the case of simple linear regression, $k=2$. The rule of thumb is that an observation must be carefully checked if $h_i > \frac{2(k+1)}{n}$, which is usually what dedicated statistical packages highlight when asking to print individual diagnostic data.

Fortunately, the Python statsmodels package provides [OLSResults.get_influence()](https://www.statsmodels.org/stable/generated/statsmodels.regression.linear_model.OLSResults.get_influence.html), which returns [everything we need](https://www.statsmodels.org/stable/generated/statsmodels.stats.outliers_influence.OLSInfluence.html#statsmodels.stats.outliers_influence.OLSInfluence).

Here is a sample [Python script](/pub/ols_influence.py) which demonstrates how to compute Cook's distance[^1] from a multiple regression model as illustrated in R's on-line help for `influence`.

![img](/img/fig-ols-influence.png)

{{% music %}}The Loyal Seas • _Last of the great machines_{{% /music %}}

[^1]: [Cook's distance](https://en.wikipedia.org/wiki/Cook%27s_distance) can also be defined in terms of leverage values.
