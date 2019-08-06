---
title: "Newton-Raphson algorithm in Racket"
date: 2019-08-05T21:31:22+02:00
draft: true
tags: ["racket", "statistics"]
categories: []
---

Here is an implementation of the Newton-Raphson algorithm in Rcaket Scheme.

<!--more-->

Our motivation is to implement a toy example of logistic regression, where the parameters of the statistical model are estimated using Newton-Raphson iterative algorithm. This approach basically looks [like this](https://gist.github.com/dirkschumacher/7acfb6f9a72bb940634d8f9e9c867dd0) in R:

```r
logistic.reg <- function(X, y) {
  beta <- rep.int(0, ncol(X))
  for (i in seq_len(25)) {
    b_old <- beta
    alpha <- X %*% beta
    p <- 1 / (1 + exp(-alpha))
    W <- as.numeric(p * (1 - p))
    XtX <- crossprod(X, diag(W) %*% X)
    score <- t(X) %*% (y - p)
    delta <- solve(XtX, score)
    beta <- beta + delta
  }
  return(beta)
}
```

In this end, we would like to estimate model parameters for the dataset plotted below (observed and fitted values; see handout 3 in the [rstats-biostats](https://github.com/even4void/rstats-biostats) project for R code and a brief description of the data):

![2019-08-06-10-02-00.png](/img/2019-08-06-10-02-00.png)

Other than basic mathematical operators and functions, the most important piece of code we need is an equivalent of `crossprod`, the matrix [cross-product](https://en.wikipedia.org/wiki/Cross_product), and `solve`, which is used to solve a system of equations. Luckily, both procedures are available in [racket/math](https://docs.racket-lang.org/math/matrices.html). The above code can thus be translated litteraly using untyped Racket as follows:

```Lisp
#lang racket
(require math/matrix)
(define logistic-reg (x y))
```
