---
title: "Algorithms for statistical computing"
date: 2024-01-08T12:44:33+01:00
draft: false
tags: ["review", "statistics"]
categories: ["2024"]
---

Here are very short reviews of books I have read or reread over the years, in no particular order.

- _Foundations of Statistical Algorithms_ (Weihs, Mersmann & Ligges, CRC Press 2014): I read this book three or four years ago, and I found it interesting although quite heavy on math. It includes a chapter on verification which is close to an experimental design of testing, as the authors said. Apart from one or two papers about Stata or SAS own verification routines and _Numerical Issues in Statistical Computing for the Social Scientist_, by Altman, Gill and McDonald (Wiley, 2004) that I mentioned in [this post](post/statistical-software-evaluation/), there are few books dedicated to this topic, AFAICT. Here, the authors focus on Linear Least Squares Solvers and the use of [condition numbers](/post/condition-number). Interestingly, Partial Least Squares is mentioned on several occasions, both from an algorithmic perspective (chapter 5) and when dealing with model selection in multivariate regression settings. Convex problems like coordinate descent and gradient-based or Quasi-Newton methods are discussed at length in chapter 4.

- _Algorithms for Data Science_ (Steele, Chandler & Reddy, Springer 2016): This is more a textbook about data analysis _per se_ rather than a summary of specialized algorithms for statistical computing, so I was a bit disappointed after a few chapters.

- _Numerical Methods of Statistics_ (Monahan, 2nd ed. Cambridge University Press 2011): I studied most of [R code](https://www4.stat.ncsu.edu/~monahan/nmos2/toc.html) (and I did some Fortran as well!) that comes along this textbook, and I learned a lot from the extended discussion and exercises. I long considered it the Numerical Recipes (in R) of statistics.

- _Elements of Statistical Computing_ (Thisted, Chapman and Hall 1988): One of the first textbook I used to teach statistical computing using R. Although it is a bit dated, it remains very relevant for most tasks at hand, and it features several algorithms that help sharpen our understanding of common implementation of, e.g., least-squares, bracketing methods in non-linear models, QR and SVD decomposition, or density estimators and smoothers.

- _Computational Statistics_ (Givens & Hoeting, Wiley 2nd ed. 2013): This is the book I read after the one written by Thisted. I seem to remember coming across it after seeing one of Chris Fonnesbeck or Radford Neale's (or both, maybe) course outline. It features many additional topics: markov chains, genetic algorithms and more generally dynamic programming, a full chapter on the bootstrap, and several sections on multivariate methods. Overall, it is more geared toward optimization and bayesian inference. [R code](https://www.stat.colostate.edu/computationalstatistics/) is available for this 2nd edition.

- _Computational Statistics_ (Gentle, Springer 2009): Christian Robert already wrote a [review](https://www.ceremade.dauphine.fr/~xian/Gentle.pdf) of this textbook. I have read several book written by Gentle, but this one remains my reference when both numerical computing and computational statistics are of interest.

{{% music %}}The John Butler Trio • _Life Ain't What It Seems_{{% /music %}}
