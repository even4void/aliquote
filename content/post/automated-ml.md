---
title: "Automated ML"
date: 2018-06-18T19:40:12+02:00
lastmod: 2018-06-18T19:40:12+02:00
draft: true
description: ""
tags: ["statistics", "python"]
categories: []
---

Today I noticed that there is now a Python package "to explain the output of any machine learning model": [SHAP](https://github.com/slundberg/shap).

<!--more-->

I was already aware of LIME, but this one package is dedicated to (boosted) trees, including random forests

There is an arXiv paper right there: [Consistent Individualized Feature Attribution for Tree Ensembles](https://arxiv.org/abs/1802.03888), as well as a [NIPS paper](http://papers.nips.cc/paper/7062-a-unified-approach-to-interpreting-model-predictions.pdf).


This was also a good opportunity to try the [treeinterpreter](https://github.com/andosa/treeinterpreter) package which is quite nicely illustrated in the following blog post: [Interpreting random forests](http://blog.datadive.net/interpreting-random-forests/).
