---
title: "ArXiving on July 2019"
date: 2019-07-28T17:42:46+02:00
draft: false
tags: ["readings", "arxiv"]
categories: ["2019"]
---

Here is a quick wrap up of my latest readings on arXiv. In no particular order, as usual.

<!--more-->

### SciPy 1.0—Fundamental Algorithms for Scientific Computing in Python (Virtanen et al., 2019) [arXiv:1907.10121v1](https://arxiv.org/abs/1907.10121)

Everyone doing scientific computing in Python knows [ScipPy](https://scipy.org), which reaches its v1 a few months ago, after years of development. Of course, [this milestone](https://docs.scipy.org/doc/scipy/reference/release.1.0.0.html) was more of new stage in the continuous work that drives the Scipy package since its inception. In this paper, the authors explains the motivation behind SciPy, its relation with the numerical and graphical ecosystem already available in Python or under development (Numpy, IPython), what its 16 submodules containand why open-source developement for scientific computing using a general-purpose language really matters. Like R, a significant part of the Scipy package features Fortran and C code. Note that this paper does not discuss the scikit-\* packages, which surely contributed over the years to enhance the data science stack available in Python.

> This remains a distinguishing feature of Python for science, and one of the reasons why it has been so successful in the realm of data science: instead of adding general features to a language designed for numerical and scientific computing, here scientific features are added to a general purpose language.

![Scipy development](/img/2019-07-28-18-21-30.png)

### Techniques for Automated Machine Learning (Chen et al., 2019) [arXiv:1907.08908v1](https://arxiv.org/abs/1907.08908)

While I first learned about automated ML and related techniques [via H2O.ai](http://docs.h2o.ai/h2o/latest-stable/h2o-docs/automl.html) and a [few other packages](/post/automated-ml/), it looks like the rise of AI-related research (e.g., deep learning), the need to combine several classifiers (like in ensemble methods) or to apply complex preprocessing or feature enginering steps before building up a reliable model, and probably a bit of black-boxing all call for new method of managing ML models. In short, automated ML allows to build flexible pipeline that can perform automatic tuning of feature engineering, model hyperparameters, or even the deep learning machinery itself. Reinforcement learning and evolutionary algorithms (the same techniques we were hearing from back in the late era of AI in the 90's) are popular techniques for automated ML, especially in the case of feature engineering. This review remains quite technical, and assumes you are already a good ML practitioner, IMHO.

### ∂P : A Differentiable Programming System to Bridge Machine Learning and Scientific Computing (Innes et al., 2019) [arXiv:1907.07587v2](https://arxiv.org/abs/1907.07587)

[Julia](https://julialang.org) is a nice language, but I have never really been able to get involved in it. I mean, there are so many things that changed between version 0.4, 0.5, then 0.6, and now 0.7/1.0 that I didn't really have time to follow or relearn what I was doing at the beginning (i.e., when everything had to be installed manually from Github). Anyway, it is a good thing that there are some good contenders to R or Python on the Market. In this paper, the authors describes ∂P, which is a system built on top of Julia to perform automatic differentiation--you know, that [little thing](http://www.robots.ox.ac.uk/~tvg/publications/talks/autodiff.pdf) that is used to transform code for one function into code for the derivative of that function. I am not particularly involved in AD, but I always find interesting to read about the potential of a PL in a particular field of applications, even if it is not my business--call this curiosity, or procrastination, or whatever. Some parts are very technical, either on the math side or on the Julia-related data structures, but the examples cover neural networks, computer vision, financial derivatives, and even quantum ML (never heard of it before reading that paper), and they are quite illustrative of how the ∂P system actually works.

### Generalised linear models for prognosis and intervention: Theory, practice, and implications for machine learning (Arnold et al., 2019) [arXiv:1906.01461](https://arxiv.org/abs/1906.01461)

As I said in my [previous post](/post/tech-review-july-2019/), the all-in-one blind approach to ML has been challenged by Frank Harrell and 'traditional' statisticians at numerous occasions. Maybe, as some used to say, that Breiman's "two cultures" paper hasn't aged so well after all. This article deals with the application of GLMs in prognosis research, where statisticians are more concerned with prediction than explanation.

> In health research, ML is often hailed as the new frontier of data analytics which, combined with big data, will purportedly revolutionise delivery of healthcare (e.g. through ‘personalised medicine’), provide new and important insights into disease processes, and ultimately lead to more informed public health policy and clinical decision-making.

This is indeed making a strong case of ML in health research, and I haven't heard of any significant result in this direction so far. But gain, go check Frank Harrell discussion on this hot topic. The authors, however, chose to discuss the subtle issue of conflating prediction with causation, which even in the case of regression models is often overlooked: GLMs remain blind to the causal structure of the data, so do ML models. The authors then provide a thorough exposition of how to select and parameterize covariates in a predictive or causal model, and how each model may be assessed and interpreted in turn. It turns out that ML reasearch should also take into account this fine distinction, for "much of the promise of ML is predicated on prediction which prioritises the strength of (undirected) associations over the causal structures that give rise to them, and subsequently prioritises data-driven over theory-driven model selection."

### Please Stop Permuting Features An Explanation and Alternatives (Hooker et al., 2019) [arXiv:1905.03151v1](https://arxiv.org/abs/1905.03151)

TLDR; When features in the training set exhibit statistical dependence, permutation methods can be highly misleading when applied to the original model.

Permutation-based measures of variable importance, partial dependence plots, and individual conditional expectation plots are cheap and parameter-free techniques to assess the predictive support of variables, or features, in a given ML algorithm. However, they are known to exhibit serious flaws when there exist intercorrelations between features. I used to illustrate some of the problem of partial dependence in a [previous talk](/pub/mva_clinres.pdf). Alternatives do exist, though, e.g. permutation measures of variable importance based on conditional distribution, leave-one-covariate-out technique, but they stick to the permute-and-repredict framework, while retraining a model after permuting feature of interest might provide an interesting way to reduce the importance of correlated features, albeit at a larger computational cost.
