---
title: "High-dimensional data analysis in cancer research"
date: 2010-08-09T21:31:24+01:00
draft: false
tags: ["readings", "statistics"]
categories: ["2010"]
---

This is a recent book co-edited by Xiaochun Li and Ronghui Xu (Springer, 2009) about feature selection and model validation in the context of oncological studies. More precisely, the seven chapters cover (snip).

Here is a small simulation with LASSO penalization. The following picture depicts the coefficients estimated from simple univariate linear regression (x-axis) plotted against those estimated with LARS algorithm (LASSO mode). R code is shown below:

{{< gist even4void 517006 >}}

Basically, I simulated a set of p=100 predictors, with s=20 variables (symmetrically correlated at 0.3) associated to the Y outcome. Then, I would like to see if LASSO penalization allows to recover the true associated Xs. Clearly, it seems to works quite well, except for some predictors which would be judged significant through univariate testing (although in this case, correcting for multiple comparisons with, e.g., Bonferroni, would yield an alpha of 5e-04).

{{< figure src="/img/20100810122359.png" >}}

The next figure illustrates some nice properties of splines fitting. The code used to produce this picture follows.

{{< gist even4void 515249 >}}

{{< figure src="/img/20100809114609.png" >}}
