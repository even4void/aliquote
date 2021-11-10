---
title: "QR factorization and linear regression"
date: 2021-11-03T15:42:51+01:00
draft: true
tags: ["lisp", "statistics"]
categories: ["2021"]
---

Consider the problem where there's no direct solution to $Xb = y$, yet we may be looking for the best approximation of $y$ as a linear combination of the columns of $X$. One of the well-known application of this setting is the linear regression model, of course. Recall that the OLS solution is $\left(X^TX\right)^{-1}X^Ty$.

Rather than inverting the $X$ matrix, we will use QR decomposition, as R does, since we assume a full (column) rank matrix $X$. The QR decomposition reads $X=\underset{m\times n}{Q}\overset{n\times n}{R}$, where $Q^TQ=I_n$ (columns are orthonormal) and $R$ is an upper-triangular invertible matrix. Note that

$$ \left(X^TX\right)^{-1}X^Ty = \left(R^TQ^TQR\right)^{-1}R^TQ^Ty = \left(R^TR\right)^{-1}R^TQ^Ty = R^{-1}Q^Ty. $$

In the end, we only really need to solve $Rx = \bar y$, where $y$ is rotated as $\bar y = Q^Ty$, and $R$ is triangular, using backward substitution.

More information can be found in this [on-line course](https://inst.eecs.berkeley.edu/~ee127/sp21/livebook/l_ols_ls_def.html) and this longer article on the Stan website: [The QR Decomposition For Regression Models](https://mc-stan.org/users/documentation/case-studies/qr_regression.html). For a more detailed treatment, I would suggest [Numerical Methods of Statistics](https://www4.stat.ncsu.edu/~monahan/nmos2/toc.html) (2nd ed.), by John F. Monahan, especially for the connection with Householder transformations (§5.6.).

Let's implement this approach in Lisp using the [magicl](https://github.com/quil-lang/magicl) package, which provides low-level bindings to BLAS/LAPACK as well as a high-level interface with everything we need for common linear algebra problems (e.g., SVD, Cholesky or QR decomposition, etc.). Other CL libraries are available but I like this one because it is actively maintained by working heroes, including Robert Smith (@stylewarning), who also happens to play piano.

We also need a toy dataset, which will be a subset of one the dataset used by Selvin in his book on S+ (see [here](https://aliquote.org/pub/MABMUSPlus/) for a collection of plots and a recap' of the exercises). Here is a quick glance at the dataset:

![img](/img/selvin-reg.png)
<small>[Gnuplot script](/img/selvin-reg.gp)</small>

Let's first try to input the data:

```lisp
(ql:quickload :magicl)
(setf *read-default-float-format* 'double-float)
(defparameter *y* (magicl:from-list '(9.1 8.9 8.5 7.4 7.5 7.3 6.7 6.5 7.2 6.5 6.6 7.1) '(12 1)))
(defparameter *X* (magicl:from-list '(35 0
                                      29 0
                                      34 0
                                      32 0
                                      28 0
                                      28 0
                                      24 1
                                      24 1
                                      28 1
                                      26 1
                                      26 1
                                      26 1)
                                    '(12 2)))
```

The instruction `(magicl:qr *X*)` should return the two matrices $Q$ and $R$ discussed above. We can use built-in facilities to compute $\bar y$, but solving $Rx = \bar y$ requires to write a back substitution procedure since there is no real MATLAB-like "solve" procedure available in magicl. Fortunately, there's one available on Rosetta:

```lisp
(defun solve-upper-triangular (R b)
  (let* ((n (cadr (array-dimensions R)))
         (x (make-array `(,n 1) :initial-element 0.0d0)))

    (loop for k from (- n 1) downto 0
       do (setf (aref x k 0)
                (/ (- (aref b k 0)
                      (loop for j from (+ k 1) to (- n 1)
                         sum (* (aref R k j)
                                (aref x j 0))))
                   (aref R k k))))
    x))
```

Then, using the same notation as above, we can write:

```lisp
;; Get R and Q
(solve-upper-triangular (magicl:@ R x) (magicl:@ (magicl:transpose Q) y))
```
