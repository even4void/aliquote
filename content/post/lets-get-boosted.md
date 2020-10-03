---
title: "Lets get boosted"
date: 2020-10-04T08:44:39+01:00
draft: true
tags: ["statistics", "python"]
categories: ["2020"]
---

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
