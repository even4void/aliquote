---
title: "Statistical learning and regression"
date: 2011-03-12T17:43:59+01:00
draft: false
tags: ["review", "statistics"]
categories: ["2011"]
---

Here is a short review of *Statistical Learning from a Regression Perspective*, by Richard A. Berk (Springer, 2008). There already exist some good reviews of this book, including the one by [John Maindonald](http://www.jstatsoft.org/v29/b12/paper) in the *Journal of Statistical Software*. Also, some answers to the exercises proposed in this book were made available by [Brian Kriegler](http://www.crim.upenn.edu/faculty/profiles/statistical_learning.html). Richard A. Berk also co-authored a nice paper on [Statistical Inference After Model Selection](http://www-stat.wharton.upenn.edu/%7Eberkr/selection%20copy.pdf) (PDF).

I did not take a lot of notes while reading the book, and I just skim over some of the chapters due to a clear lack of time in recent days (tons of papers to read, long overdue MSs to finish, profiling code, and beat my son on our iPhone games : smile : In my opinion, this textbook cannot be used as textbook for a course, I would prefer the [ESLII](http://www-stat.stanford.edu/~tibs/ElemStatLearn/) by Hastie and coll. In fact, Berk refers to it almost all the time in his book. However, I think it is a good complement for someone who already knows ML techniques and want to read a short overview with emphasis added.

## Take-away message

First, let me start with some of the conclusions raised by Richard A. Berk by the end of the book. (I am emphasizing part of these quotes.)

- "If a priori ignorance prevails about the f(X) as well, there may be *no sensible hypotheses* to test that were posed before the data were examined." That sounds well, indeed. If we don't know the functional relationship between an outcome and the predictors of interest (and these are only the predictors we have at hand, not necessarily the ones that participate to the data generation process!), what's the purpose of HT?
- "In practice, matters are usually worse. One will rarely have all of the required predictors, and it will be rare indeed for all of them to be well measured. Therefore, statistical learning applications will more *typically be exploratory and descriptive*, and occasionally be the basis for forecasting." This directly follows from the point raised above.
- Some of the tasks where SL might provide good performance: *discovering unexpected predictors*, *discovering which predictors matter*, *providing useful regression diagnostics*, *exploiting many predictors* while *avoiding overfitting issues*. There are important points here, in particular the fact that we can use ML techniques as a secondary tool in regression diagnostics. I tend to use ML as a way to isolate predictors of interest--in a certain sense, I am mainly interested in variable screening or feature selection--and not as a way to generate automatic prediction rules. But the fact is that an often neglected assumption in GLM is that the functional relationship between Y and X is know (and often assumed to be linear), such that any departure from this relationship will entail bad error estimate or even incorrect conclusions about model fit. This is largely discussed in Harrell's textbook, [*Regression Modeling Strategies*](http://biostat.mc.vanderbilt.edu/twiki/bin/view/Main/RmS).
- "Differences in performance that may be of methodological interest may also be of *no practical importance*." I really like this one because it reminds me of the number of papers that just show up how different classifiers are able to generalize on some test data, although they are just differing by a small amount of (often) less than 5%.
- "As noted many times, there is *no substitute for good data*. The fact that boosting, for example, can make a weak classifier much stronger, does not mean that boosting can make weak data stronger." A must-have-in-mind rule of thumb!
- "Neither the AIC or BIC take into account the number of parameters estimated for earlier models that were considered and rejected. Cross-validation can be compromised when the same dataset is used over and over. The independence between the training data and the test data is gradually lost." There was a nice series of papers by Anne-Laure Boulesteix and coll. on over-optimism in ML techniques commonly found in Bioinformatics research paper:

    - Boulesteix and Strobl, [Optimal classifier selection and negative bias in error rate estimation: An empirical study on high-dimensional prediction](http://www.biomedcentral.com/1471-2288/9/85), BMC Medical Research Methodology (2009) 9:85.
    - Boulesteix, [Over-optimism in bioinformatics research](http://bioinformatics.oxfordjournals.org/content/26/3/437.extract), Bioinformatics (2010) 26 (3): 437-439.
    - Jelizarow et al., [Over-optimism in bioinformatics: an illustration](http://bioinformatics.oxfordjournals.org/content/26/16/1990.abstract), Bioinformatics (2010) 26 (16): 1990-1998.

- "Much of the literature on statistical learning is formulated around some f(X). There is a real mechanism by which the data were generated. A key goal of a data analysis is to recover the data-generation function from a dataset. (...) more modest goals are likely to be appropriate. Perhaps most important, one will not have access to all of the requisite predictors, let alone predictors that are all well measured. In addition, various kinds of *data snooping* will often be difficult to avoid, and even the best adjustments for overfitting may prove insufficient." Again, let's keep honest with what we can do from underpowered studies (this is my case, at least), but try to provide useful summary of the data and provisory conclusions while acknowledging that this is merely in the hope of generating hypothesis that might be assessed prospectively in other studies. About data dredging specifically (that I addressed in a [question](http://stats.stackexchange.com/questions/3252/how-to-cope-with-exploratory-data-analysis-and-data-dredging-in-small-sample-stud) on [stats.stackexchange.com](http://stats.stackexchange.com)), here are two papers that I found very interesting:

    - Cole, [The hypothesis generating machine](http://www.jstor.org/stable/3702282), Epidemiology (1993) 4: 271-273.
    - Michels and Rosner, [Data trawling: to fish or not to fish](http://www.cceb.med.upenn.edu/pages/courses/EPI520/2006/Michels_Rosner_1996.pdf), The Lancet (1996) 348: 1152-1153.
  
- "Another error is to undertake statistical inference as part of a statistical learning analysis *when the p-values are not likely to make much sense*. The p-values may be wildly misleading because the data are not a random sample or random realization of anything, because the statistical learning procedure invalidates the required assumptions, and/or because the necessary sampling distributions are unknown or not credibly estimated." I really like this one because I too often feel that people need to put a p-value somewhere in a paper just as a way to weigh a given assertion against its alternative. It's also a rejoinder to the overused HT framework, which often prevails over exploratory data analysis.

## Overview 

*Chapter 1* is an essential read for everyone interested in getting the core idea of regression analysis. Interestingly, a distinction is made between estimation of the parameters of the functional relationship postulated between Y and X, and statistical inference or statistical learning (p. 7 and § 1.3).


*Chapter 2* deals with *splines and smoothers*. First, after a brief overview of polynomial and natural cubic splines, the author describes B-splines which allow for a cubic piece-wise fit while keeping some nice numerical properties before presenting penalzation methods (shrinkage, ridge regression, lasso, elasticnet, dantzig) deriving from the work of Hastie and Zou. However, I discovered *Rodeo* which stands for Regularization and Derivative Expectation Operator and is related to adaptive smoothing and the L1 penalization: the idea is to apply shrinkage to nonparametric regression in order to discard irrelevant predictors. More information can be found in
Lafferty, J. and Wasserman, L. (2008). [Rodeo: Sparse Greedy Nonparametric Regression](arxiv.org/pdf/0803.1709). *Annals of Statistics*, 26(1), 28-63.

Then comes an extended overview of smoothing splines (§ 2.4), which do not require that the number and location of knots are known or optimized through some measure of fit. They take the general form

$$ \text{RSS}(f,\lambda)=\sum_{i=1}^N\left[y_i-f(x_i)\right]^2+\lambda\int\left[f^{''}(t)\right]^2dt, $$

where $\lambda$ is a tuning parameter that can be chosen with common model selection procedures, e.g. by minimizing using N-fold cross-validation

$$ \text{CV}(\hat f\_{\lambda})=\sum\_{i=1}^N\left[y_i-\hat f_i^{(-i)}(x_i)\right]^2, $$

which amounts to optimize the tradeoff between bias and variance (in the fitted values). Examples of use can be found in the [mgcv](http://cran.r-project.org/web/packages/mgcv/index.html) package (see the `gam()` function), and this topic is largely covered in

1. Hastie, T.J. and Tibshirani, R.J. (1990). *Generalized Additive Models*. Chapman & Hall
2. Wood, S. (2006). *Generalized Additive Models. An Introduction with R*. Chapman & Hall

Locally weighted regression is another approach built upon nearest neighbor methods instead of the LM framework. A well-know example is the *lowess* smoother which also depends on a tuning parameter, namely the bandwidth (i.e., the total no. observations used to fit a local regression line). Again, a generalized CV statistic can be used to select the optimal one.

In multivariate settings, there also exist some kind of smoothers but now the main problems are (a) to find a good measure of neighborhood, and (b) to find a good way for visually assessing the results. Here, the GAM approach highlighted above prove to be the most interesting approach. The idea is that instead of considering all predictors, as in the classical GLM framework --- and when there are numerous, we might face the *curse of dimensionality* issue, we will be using linear combinations of them. So the conditional mean can be related to the $X_j$ as in the formula

$$ \bar Y\mid X = \alpha + \sum_{j=1}^p f_j(X_j) $$

where $\alpha$ is the intercept. 
 
*Chapters 4 and 5* are devoted to Bagging and Random Forests. The basic ideas are that (1) averaging over a collection of fitted values can help compensate for overfitting, and (2) a large number of fitting attempts can produce very flexible fitting functions able to respond to systematic, but highly localized, features of the data; altogether, (3) this might break the bias-variance tradeoff (pp. 169-170).

I already wrote some stuff on RFs, see [Visualizing what Random Forests really do](/post/visualizing-what-random-forests-really-do).
