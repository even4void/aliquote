---
title: "Solving OLS problem using SVD"
date: 2023-04-07T09:12:39+02:00
draft: false
tags: ["racket", "statistics"]
categories: ["2023"]
---

I came across a Racket package which aims to provide basic linear regression fitting utilities to Schemers. Unfortunately, it relies on the use of normal equations to solve the linear systems, which is rarely a good idea (think about what happens if the design matrix has a very irregular shape, or even [condition number](https://stats.stackexchange.com/a/343075)). Moreover, it is not very flexible regarding data i/o, but that's not the point of this post.

Direct methods (i.e., matrix decomposition) have been discussed beforehand, e.g. [here](/post/lisp-qr-regression/) (Lisp) and [here](/post/newton-raphson-racket/) (Racket). Here is another direct method which relies on the SVD. Considering the linear system $X\beta = y$, the idea is to decompose $X$ as $\underset{m\times m}{U}\overset{m\times n}{\Sigma}\underset{n\times n}{V^T}$, where $U$ and $V$ are unitary matrices, and $\Sigma$ is a diagonal matrix filled with 0 for rows $n+1,\dots,m$.[^1]  Then, $\hat\beta$ is obtained as $V^T\Sigma^{-1}U^Ty$. See [The QR Algorithm Computes Eigenvalues and Singular Values](https://blogs.mathworks.com/cleve/2019/08/05/the-qr-algorithm-computes-eigenvalues-and-singular-values/) to learn more about the relationship between the QR and SVD matrix decompositions.

To sum up, although solving normal equations is usually the fastest method, its squared condition number renders it less stable; QR decomposition is more stable at the expense of a larger cost, and SVD works well even in case $X$ is rank-deficient.

Here is a direct application in Racket, using the same example we used in a [previous post](/post/newlisp-ols/). I'll be using the excellent [flomat](https://docs.racket-lang.org/manual-flomat/) package by Axel Søgaard.[^2]

```racket
#lang racket
(require flomat csv-reading)

(define (import file)
  (csv->list ((make-csv-reader-maker
               '((seperator-chars #\,)
                 (quote-char . #f))) (open-input-file file))))

(define data (map (lambda (xs) (map string->number xs)) (cdr (import "/home/chl/tmp/birthwt.csv"))))
(define xs (matrix (map (lambda (xs) (list-ref xs 1)) data)))
(define ys (matrix (map (lambda (xs) (list-ref xs 9)) data)))

(define X (augment xs (flomat-ones (nrows xs) 1)))
(define-values (U S V) (svd X))
(times V (inv (diag S)) (transpose (sub U 0 0 (nrows U) 2)) ys)
;; => (flomat: ((12.429712027714643) (2655.74446970517)))
```

Note that the above procedure returns a full matrix (m x m) for U, but we don't really need the extra columns, hence the subsetting to the first two columns of $U$. For the record, we got the following results using Newlisp:

```lisp
(gsl:QR-solve xs y)
;; => (2655,744469705172 12,4297120277146)
```

The Python version follows:

```python
import numpy as np
import pandas

data = pandas.read_csv("/home/chl/tmp/birthwt.csv")

x = np.c_[np.ones(data.shape[0]), data["age"]]
y = data["bwt"]
U,S,V = np.linalg.svd(x, full_matrices=False)
V.T @ np.linalg.inv(np.diag(S)) @ U.T @ y
# => array([2655.74446971,   12.42971203])
```

{{% music %}}Emma Ruth Rundle • _Blooms of Oblivion_{{% /music %}}

[^1]: The number of columns can also be reduced (i.e. discarding the smallest singular values).
[^2]: If you get an error regarding a missing libgfortran (likely v3), be sure to install the latest version of the sci package which includes a [fix](https://github.com/soegaard/sci/pull/14) for Ubuntu 22.04.
