---
title: "Automated ML interpretation"
date: 2018-06-19T7:40:12+02:00
draft: false
tags: ["statistics", "python"]
categories: ["2018"]
---

Today I noticed that there is now a Python package "to explain the output of any machine learning model": [SHAP](https://github.com/slundberg/shap).

<!--more-->

I was already aware of [LIME](https://www.oreilly.com/learning/introduction-to-local-interpretable-model-agnostic-explanations-lime) and its [R interface](https://github.com/thomasp85/lime), but this one package is dedicated to (boosted) trees, including random forests. From what I have seen, the output looks more pretty compared to LIME but especially most engaging given the way it focus on interactive displays. Most notably, it includes dependence plots in addition to effect and summary plots which generalize partial dependence and feature importance plot over the entire sample. The SHAP value is more refined than importance measure as defined in Random Forest, for instance. Indeed it is not simply a permuted measure of accuracy gain in a classification task, but it summarizes the sum of the effects of each feature being introduced into a conditional expectation, taking into account the order in which features enter the model in the case of non-linear models.

There is an arXiv paper right there: [Consistent Individualized Feature Attribution for Tree Ensembles](https://arxiv.org/abs/1802.03888), as well as a [NIPS paper](http://papers.nips.cc/paper/7062-a-unified-approach-to-interpreting-model-predictions.pdf) (PDF). I think it is a very promising approach, like most interactive displays that enable the user to manipulate the data and the predictions while accounting for prediction uncertainty. In this respect, the many papers published by the [UW Interactive Data Lab](http://idl.cs.washington.edu) are among the best references I am aware of, see e.g. [Uncertainty Displays Using Quantile Dotplots or CDFs Improve Transit Decision-Making](http://idl.cs.washington.edu/papers/uncertainty-bus) or [Visualizing Dataflow Graphs of Deep Learning Models in TensorFlow](http://idl.cs.washington.edu/papers/tfgraph). In any case, boosting methods seem to take increasing precedence over random forests or SVMs.

<video width="480" height="320" controls="controls">
<source src="/img/shap.mp4" type="video/mp4">
</video>

This was also a good opportunity to try the [treeinterpreter](https://github.com/andosa/treeinterpreter) package which is quite nicely illustrated in the following blog post: [Interpreting random forests](http://blog.datadive.net/interpreting-random-forests/).
Finally, there is also [DALEX](https://github.com/pbiecek/DALEX/), which is an R package influenced by LIME that also focuses on Random Forest and XGBoost.
