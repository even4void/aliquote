---
title: "Newton-Raphson algorithm in Racket"
date: 2019-08-05T21:31:22+02:00
draft: true
tags: ["racket", "statistics"]
categories: []
---

Here is an implementation of the Newton-Raphson algorithm in Rcaket Scheme.

<!--more-->

Our goal is to implement a toy example of logistic regression, where the parameters of the statistical model are estimated using Newton-Raphson iterative algorithm. This approach basically looks [like this](https://gist.github.com/dirkschumacher/7acfb6f9a72bb940634d8f9e9c867dd0) in R:

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

The Newton algorithm is a root finding method, usually employed with a univariate function, $f$, for which we want to find, say, its maximum. Let us assume that $f'$ is continuously differentiable, and that $f''(x^{\star})\neq 0$, with $x^{\star}$ the root we are looking for. Maximising $f$ amounts to find the root of $f'(x)$, and at each step we will approximate $f'(x^{\star})$ with the linear Taylor expansion $f'(x^{\star})\approx f'(x^{(t)}) + \left(x^{\star}-x^{(t)}\right)f''(x^{(t)})$ ($=0$). As can be seen, the derivative $f'$ is approximated by its tangent at $x^{(t)}$, so that we willl approximate its root by the root of the tangent line. Hence, we have:

$$ x^{\star} = x^{(t)} - \frac{f'(x^{(t)})}{f''(x^{(t)})} = x^{(t)} + h^{(t)}, $$

where $h^{(t)}$ is a refinement to the current guess at step $t$, $x^{(t)}$. The updating equation for Newton-Raphson is then simply $x^{(t+1)}=x^{(t)}+h^{(t)}$, which is the very last line in the for loop in the R function above. Note that $h^{(t)} = -\frac{f'(x^{(t)}}{f''(x^{(t)}}$. In this particular case, this optimization problem also amounts to finding the MLE $\hat\theta$, where $\theta$ is the parameter of interest in the statistical model, and $f$ is the likelihood function.[^1] It can be shown that the Newton's method has quadratic convergence, which means that the precision of the solution will usually double with each iteration.[^2]

In the end, we would like to estimate the parameters of the logistic model fitted to the dataset shown below (observed and fitted values; see handout 3 in the [rstats-biostats](https://github.com/even4void/rstats-biostats) project for R code and a brief description of the data):

![2019-08-06-10-02-00.png](/img/2019-08-06-10-02-00.png)

Other than basic mathematical operators and functions, the most important piece of code we need is an equivalent of `crossprod`, the matrix [cross-product](https://en.wikipedia.org/wiki/Cross_product), and `solve`, which is used to solve a system of equations. Luckily, both procedures are available in [racket/math](https://docs.racket-lang.org/math/matrices.html). The above code can thus be translated litteraly using untyped Racket as follows:

```Lisp
#lang racket
(require math/matrix)
(define logistic-reg (x y))
```

[^1]: Still in the case of an MLE problem, replacing $-f''(\theta^{(t)})$ in the denominator with the expected Fisher information evaluated at $\theta^{(t)}$, $I(\theta^{(t)})$, yields the Fisher scoring method, which has the same asymptotic properties as Newton's method, although the latter works generally better to refine the last estimates.
[^2]: Givens, G.H. and Hoeting, J.A. _Computational Statistics_ (2nd ed.), Wiley, 2013.
