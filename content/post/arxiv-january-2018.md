---
title: "Recent readings on arXiv"
date: 2018-01-10T10:32:06+01:00
draft: false
tags: ["readings", "statistics", "arxiv"]
categories: ["2018"]
---

What's going on on arXiv these days?

Here is my [reading list](http://aliquote.org/pub/arxiv.bib) for the past couple of weeks.

### arXiv:1801.00631 [Deep Learning: A Critical Appraisal](https://arxiv.org/abs/1801.00631), Gary Marcus

This is a brief review of deep learning in the light of the "renewed interest" for artificial intelligence that emerged during the last two years. I believe it does not reflect the opinion of all researchers or practitioners, but anyway there are some interesting references in there, and as the author said this is deliberately oriented toward AI research, not machine learning or data science. The author summarizes ten concerns regarding deep learning, which essentially turn around the generalizability issue. Here are some of them: data hungriness and no capacity to learn abstractions, limited capacity to transfer knowledge (beyond the scope that was used to learn the model), no way to deal with hierarchical structure or open-ended inference, black-box approach, no or poorly integration of prior knowledge, unresolved causation _versus_ correlation issue and assumption of a stable world. In the last section, the author suggests some ideas to go forward: combined use of deep learning and unsupervised learning, use of hybrid model to integrate symbolic information, and gain more insights from cognitive psychology.

There was also a hot debate during NIPS 2017 on the interpretability issue in machine learning, see, e.g. [Yann Lecun's reply](https://www.reddit.com/r/MachineLearning/comments/7i1uer/n_yann_lecun_response_to_ali_rahimis_nips_lecture/) on Reddit.

### arXiv:1712.09988 [Orthogonal ML for Demand Estimation: High Dimensional Causal Inference in Dynamic Panels](https://arxiv.org/abs/1712.09988), Victor Chernozhukov • Matt Goldman • Vira Semenova • Matt Taddy

The authors discuss Machine Learning (ML) methods that can be used to facilitate model selection and the estimation of treatment effect in economic policy analysis. In particular, they emphasize the [double ML framework](https://economics.mit.edu/files/12591) which they previosuly demonstrated to be useful to partial out the influence of potential controls. Basically, this amounts to estimate log price and sales conditional on lagged values of those variables and then apply some penalization (e.g., Lasso) in a second stage where we want to explain heterogeneous demand elasticities by regressing residuals of the first model on indicators for location, channel, product or product type.

The study of heterogeneous treatment effects is not limited to econometrics but applies to observational data that have to deal with causal inference and the idea of "potential outcomes". It can be shown that the naive estimator of the average treatment effect (ATE) can be decomposed as the sum of E[δ<sub>i</sub>] and pre-treatment and treatment-effect heterogeneity biases (See [Heterogeneous Treatment Effect Analysis](https://www.stata.com/meeting/germany10/germany10_jann.pdf), by Jann, or [Estimating Heterogeneous Treatment Effects with Observational Data](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3591476), by Xie et al.). It is then essential to eliminate those bias, especially the first one.

### arXiv:1703.00864 [The Unreasonable Effectiveness of Structured Random Orthogonal Embeddings](https://arxiv.org/abs/1703.00864), Krzysztof Choromanski • Mark Rowland • Adrian Weller

This article deals with embedded methods in Machine Learning, but not really the one I was thinking about (i.e., embedded methods that perform variable selection during the learning phase of an ML algorithm) when I downloaded the paper. As many NIPS papers, it is rather technical and I had a very hard time following it. The core idea is that random ortho-matrices, that is structured gaussian or SD-product random matrices with orthogonal rows, can be used for dimensionality reduction (_via_ orthogonal [Johnson-Lindenstrauss Transform](https://en.wikipedia.org/wiki/Johnson–Lindenstrauss_lemma)) or improving mean squared error of prediction (_via_ angular kernel, which I never heard about before). I really have no idea of what I could potentially do with this theoretical contribution but it was a fun reading.

### arXiv:1801.00371 [Data Science vs. Statistics: Two Cultures?](https://arxiv.org/abs/1801.00371), Iain Carmichael • J.S. Marron

Personally, I never liked the term "data scientist" and I was quite happy with what Karl Broman put on his [blog post](https://kbroman.wordpress.com/2013/04/05/data-science-is-statistics/):

> If you’re analyzing data, you’re doing statistics. You can call it data science or informatics or analytics or whatever, but it’s still statistics.

(But see also his followup post, [I am a data scientist](https://kbroman.wordpress.com/2016/04/08/i-am-a-data-scientist/).)

{{< figure src="http://aliquote.org/pub/img/BfOTdpkIUAA0UXA.jpg-large.jpeg" >}}

In the present article, the authors define data science as the union of the following domains, after David Donoho's article, [50 Years of Data Science](http://www.tandfonline.com/doi/abs/10.1080/10618600.2017.1384734): (1) data gathering, preparation, and exploration, (2) data representation and transformation, (3) computing with data, (4) data modeling, (5) data visualization and presentation, and (6) science about data science.

Many blog or online discussion are referenced throughout the article, as well as more scholarly published work. The authors emphasize the need for effective teaching of scientific reasoning, data visualization and statistical computing, and the importance of reproducible research, including literate programming, unit testing, or versioning, in applied research. Differing paradigms are also highlighted in this text: [predictive and explanatory modeling](https://projecteuclid.org/download/pdf_1/euclid.ss/1009213726), [exploratory _versus_ explanatory approaches](http://www.aliquote.org/cours/2013_AS/docs/Tukey1980.pdf). I learned about the [80/20 rule](https://simplystatistics.org/2014/03/20/the-8020-rule-of-statistical-methods-development/) (this is not what I initially thought, that 80% of our time is spent in data munging and data exploration): "The basic idea is that the first reasonable thing you can do to a set of data often is 80% of the way to the optimal solution. Everything after that is working on getting the last 20%." The rest of the article is a rejoinder to Nolan and Lang's paper, [Computing in the statistics curricula](https://www.stat.berkeley.edu/~statcur/Preprints/ComputingCurric3.pdf). You might also be interested in reading this article by Hardin and coll.: [Data Science in Statistics Curricula: Preparing Students to "Think with Data"](http://www.stat.purdue.edu/~mdw/papers/paper032.pdf).

A final note: while I was looking for a certain reference _via_ Google, I found the following PeerJ paper: [Teaching stats for data science](https://peerj.com/preprints/3205/), written by Daniel T Kaplan. The ten building blocks (data tables, data graphics, model functions, model training, effect size and covariates, displays of distributions, bootstrap replication, prediction error, comparing models, generalization and causality) that the author recommend to start teaching "data science" are merely related to statistical computing and statistical inference, using the R statistical package, as far as I can tell, and so it is likely that the apparent lack of a consensual definition of data science still remain an open issue in 2018.

### arXiv:1801.00364 [Estimation and Inference of Treatment Effects with L<sub>2</sub>-Boosting in High-Dimensional Settings](https://arxiv.org/abs/1801.00364), Ye Luo • Martin Spindler

Per the paper abstract, the authors "give results for the valid inference of a treatment effect after selecting from among very many control variables and the estimation of instrumental variables with potentially very many instruments when post- or orthogonal L<sub>2</sub>-Boosting is used for the variable selection." There are some connections with the [arXiv:1712.09988](https://arxiv.org/abs/1712.09988) paper discussed above, in particular the estimation of treatment effect in high-dimensional settings relies on orthogonalized moment conditions, which are moment conditions imposed by a statistical model to estimate unknown parameters from a model using the [generalized method of moments](https://en.wikipedia.org/wiki/Generalized_method_of_moments).

### arXiv:1801.00753 [Probabilistic supervised learning](https://arxiv.org/abs/1801.00753), Frithjof Gressmann • Franz J. Király • Bilal Mateen • Harald Oberhauser

This is a very big paper (105 pp.) about probabilistic predictive modeling using supervised methods implemented in a Python library, [skpro](http://skpro.ml). This statistical library relies on [sklearn](http://scikit-learn.org/stable/) and [PyMC3](http://docs.pymc.io) and it basically allows (per the doc):

- a unified implementation and handling of supervised probabilistic prediction strategies
- strategy optimization through hyperparamter tuning and ensemble methods (e.g. bagging)
- comparison of frequentist and Bayesian prediction methods
- workflow automation

### arXiv:1404.4178v6 [Speeding Up MCMC by Efficient Data Subsampling](https://arxiv.org/abs/1404.4178), Matias Quiroz • Robert Kohn • Mattias Villani • Minh-Ngoc Tran

This is a slightly revised version of a paper submitted almost 4 years ago that deals with efficient sampling of posterior distribution using MCMC. So-called scalable MCMC relies on either the MapReduce scheme or subsampling approach, which the authors used in their article with the addition of pseudo-marginal MCMC in the case of intractable likelihood: "at each iteration the log-likelihood from n observations is estimated unbiasedly from a random subset with m ≪ n observations, and the resulting likelihood estimate is then bias corrected to obtain an approximately unbiased estimate of the likelihood."

### arXiv:1608.04481 [Lecture notes on randomized numerical linear algebra](https://arxiv.org/abs/1608.04481), Michael W. Mahoney

TL;DR
