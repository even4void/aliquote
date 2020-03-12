---
title: "Lets get boosted"
date: 2020-03-12T13:44:39+01:00
draft: true
tags: ["statistics", "python"]
categories: ["2020"]
---

There has been a renewed interest in [Boosting](https://en.wikipedia.org/wiki/Boosting_%28machine_learning%29) techniques the past few years, possibly through Kaggle contests where it ranks among the [top](https://www.kdnuggets.com/2017/10/xgboost-top-machine-learning-method-kaggle-explained.html) algorithms currently in use. [LightGBM](https://papers.nips.cc/paper/6907-lightgbm-a-highly-efficient-gradient-boosting-decision-tree.pdf) and [XGBoost](https://arxiv.org/pdf/1603.02754.pdf) (and [CatBoost](http://learningsys.org/nips17/assets/papers/paper_11.pdf)) are probably the most used algorithms at the time of this writing. Boosting tree models have a number of advantages, indeed: [^1] they are (quite) easy to setup and to interpret, they deal with continuous and categorical predictors (or monotonic transformations thereof) whether there are missing values or not, they are not that much sensitive to outliers compared to other supervised learning approaches, and they can capture simple or higher-order interactions between features. They, however, suffer from higher variance and lack of stability (like almost any tree-based models) and have poorer predictive performance compared to, say, well regularized linear or GLM models.

[^1]: Murphy, P., Kevin. 2012. [_Machine Learning: A Probabilistic Perspective_](https://www.cs.ubc.ca/~murphyk/MLbook/). Cambridge, Massachusetts London, England: The MIT Press.
