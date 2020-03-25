---
title: Gaussian elimination
date: 2020-03-24 18:41:28
draft: false
tags: ["math", "racket"]
categories: ["2020"]
---

Gaussian elimination is probably one of the algorithm we hear about when taking a basic class in linear algebra. In essence, Gaussian elimination is a procedure that can solve $n$ linear equations in $n$ unknowns using on the order of $n^3$ arithmetic operations.[^1]

How does it works? The idea is to transform a linear system, $Ax=b$, where $A$ is an $n\times n$ matrix and $x$ and $b$ are column vectors of size $n$, into an upper triangular system by applying simple linear transformation on the left, much like [Householder triangularization](https://en.wikipedia.org/wiki/Householder_transformation) in the case of QR factorization. Regarding operations that are permitted these are: swapping rows, adding one row onto another, and multiply every factor of one row with a constant. Consider the [following example](https://people.richland.edu/james/lecture/m116/matrices/pivot.html):

$$
\begin{align}
3x + 2y - 4z & =  \phantom{1}3\cr
2x + 3y + 3z & = 15\cr
5x - 3y + \phantom{3}z & = 14
\end{align}
$$

You could do this by hand, by following the [helpful tips](https://people.richland.edu/james/lecture/m116/matrices/pivot.html) from the site where this example originates from, but Mathematica has built-in procedures to solve linear systems like this, e.g. `Solve` or `LinearSolve`, and there's also a `RowReduce` function which acts like Gaussian elimination. Here's what we get:

![Mathematica solution](/img/2020-03-25-19-29-57.png)

This is not the only algorithm used in matrix factorizations, of course. Indeed, modern statistical computing rely on [LU decomposition](https://en.wikipedia.org/wiki/LU_decomposition) or [QR factorization](https://en.wikipedia.org/wiki/QR_decomposition). The latter is what used in R for linear regression models, for instance. The QR decomposition of a real square matrix $A$ is a decomposition of $A$ as $A=QR$, where $Q$ is an orthogonal matrix (i.e., $Q^TQ=I$) and $R$ in an upper triangular matrix. Furthermore, if $A$ is [nonsingular](https://mathworld.wolfram.com/NonsingularMatrix.html), this decomposition is unique. Such a factorization can be found using the [Gram-Schmidt](https://en.wikipedia.org/wiki/Gram–Schmidt_process) procedure.

Solving linear systems is quite easy in Racket thanks to the `math` module. Here is one way to find the solution of the above system (which is mostly what we did in [another post](post/newton-raphson-racket/)):

```racket
#lang racket
(require math/matrix)

(define A
  (matrix [[3.0  2.0  -4.0]
           [2.0  3.0  3.0]
           [5.0  -3.0  1.0]]))
(define b (col-matrix [3.0 15.0 14.0]))
(matrix-solve A b)
```

Luckily, Racket also provides some [row-based algorithms](https://docs.racket-lang.org/math/matrix_row-alg.html), including Gauss elimination. So here is what we get using `matrix-gauss-elim`:

```racket
(define Ab (matrix-augment (list A b)))
(matrix-gauss-elim Ab)
```

[^1]: Lloyd N. Trefethen. [Numerical Analysis](http://people.maths.ox.ac.uk/trefethen/NAessay.pdf). See also Pr. L. N. Trefethen's [website](http://people.maths.ox.ac.uk/trefethen/), which is full of free resources.
