---
title: "QR decomposition and linear regression"
date: 2021-11-03T15:42:51+01:00
draft: true
tags: ["lisp", "statistics"]
categories: ["2021"]
---

Consider the problem where there's no direct solution to $Xb = y$, yet we may be looking for the best approximation of $y$ as a linear combination of the columns of $X$. One of the well-known application of this setting is the linear regression model, of course. Recall that the OLS solution is $\left(X^TX\right)^{-1}X^Ty$.

Rather than inverting the $X$ matrix, we will use QR decomposition, as R does, since we assume a full (column) rank matrix $X$. The QR decomposition reads $X=\underset{m\times n}{Q}\overset{n\times n}{R}$, where $Q^TQ=I_n$ (columns are orthonormal) and $R$ is an upper-triangular invertible matrix. Note that

$$ \left(X^TX\right)^{-1}X^Ty = \left(R^TQ^TQR\right)^{-1}R^TQ^Ty = \left(R^TR\right)^{-1}R^TQ^Ty = R^{-1}Q^Ty. $$

Let's implement this approach in Lisp using the [magicl](https://github.com/quil-lang/magicl) package, which provides low-level bindings to BLAS/LAPACK as well as a high-level interface with everything we need for common linear algebra problems (e.g., SVD, Cholesky or QR decomposition, etc.).

```lisp
(ql:quickload :magicl)
(setf *read-default-float-format* 'double-float)
(defparameter *X* (magicl:from-list '(3.0 2.0  2.0
                                      2.0 3.0 -2.0)
                                    '(2 3)))
```


