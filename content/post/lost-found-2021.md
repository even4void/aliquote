---
title: "lost+found 2021"
date: 2021-12-27T21:39:37+01:00
draft: false
tags: ["this"]
categories: ["2021"]
---

It is very unlikely these posts will ever end in anything other than rough drafts, so closing them right now.

## 2020-10-04

<small>I was about to benchmark some common statistical programs used to perform boosting, then forgot about it.</small>

There has been a renewed interest in [Boosting](https://en.wikipedia.org/wiki/Boosting_%28machine_learning%29) techniques over the past few years, possibly through Kaggle contests where it ranks among the [top](https://www.kdnuggets.com/2017/10/xgboost-top-machine-learning-method-kaggle-explained.html) algorithms currently in use. [LightGBM](https://papers.nips.cc/paper/6907-lightgbm-a-highly-efficient-gradient-boosting-decision-tree.pdf) and [XGBoost](https://arxiv.org/pdf/1603.02754.pdf) (and [CatBoost](http://learningsys.org/nips17/assets/papers/paper_11.pdf)) are probably the most used algorithms at the time of this writing.[^1] Packages are available for R, Python, [Clojure](micro/clojure-xgboost), and probably other scientific PLs.

Boosting tree models have a number of advantages.[^2] They are (quite) easy to setup and to interpret (for simple datasets), they deal with continuous and categorical predictors (or monotonic transformations thereof) whether there are missing values or not, they are not that much sensitive to outliers compared to other supervised learning approaches, and they can capture simple or higher-order interactions between features. They, however, suffer from higher variance and lack of stability (like almost any tree-based models) and have poorer predictive performance compared to, say, well regularized linear or GLM models.

The lead article is of course the one written by [Hastie](https://web.stanford.edu/~hastie/ElemStatLearn/) and [coll.](https://projecteuclid.org/euclid.aos/1013203451) in 2001, but see one of Hastie's [talk](https://web.stanford.edu/~hastie/TALKS/boost.pdf) (given at MIT in 2003). The H20 team also provides a nice [summary of the algorithm](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/data-science/gbm.html). Briefly, the idea of this ensemble method is to aggregate multiple classifiers built sequentially on a training dataset where individual weights are updated online. Classifiers are then weighted based on their own performance, before delivering an averaged decision.

In what follows, I'm going to use a dataset from the medical literature from the [UCI](https://archive.ics.uci.edu/ml/datasets/HCV+data) archive to fit a GBM using Python, with the help of the H2O package. It should be possible to use Spark (with MLlib) instead. Originally, I thought about using a data set from _Statistical Learning for Biomedical Data_ (Malley, Malley & Pajevic, Cambridge University Press, 2011), where the authors used Random Forest using subsampling to account for class imbalance. Unfortunately, I realized that the "Stroke-A dataset" is not in the public domain.[^3]

```python
import h2o
from h2o.estimators import H2OGradientBoostingEstimator
h2o.init()

stroke = h2o.import_file()
```

[^1]: More or less since I started drafting this post in April, 2020.
[^2]: Murphy, P., Kevin. 2012. [_Machine Learning: A Probabilistic Perspective_](https://www.cs.ubc.ca/~murphyk/MLbook/). Cambridge, Massachusetts London, England: The MIT Press.
[^3]: Other interesting datasets are available on the [Vanderbilt server](http://biostat.mc.vanderbilt.edu/wiki/Main/DataSets)/

## 2021-06-07

<small>Some rants against this "new" R (which will soon be called the modern R, but not as in _Modern Applied Statistics with S_).</small>

Something that has always struck me for years is that: Learning R is hard. However, I would say that it's like the Vim learning curve, not the Emacs's one, unless you learned it the rlang's way. You know, there's some business behind the "tidyverse" way of doing things. Above that, there are too much shortcuts to learn how to speak R. I'm not thinking of the R inferno or things like that, just the language itself.

For the record, I learned R when it was at version one, and I've been teaching R for biostatistics during almost 15 years. A crude estimate suggests that I was successful 30 to 40% of the time. Still, I believe I was a good teacher. However I should note that I was not teaching R the easy way, but rather how to think in R for statistical computing. Maybe statistical computing is the problem here.

{{% music %}}Alboran Trio • _Tema di pinicchio_{{% /music %}}
