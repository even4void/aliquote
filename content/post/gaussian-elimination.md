---
title: Gaussian elimination
date: 2020-03-24 18:41:28
draft: true
tags: ["math", "lisp"]
categories: ["2020"]
---

Gaussian elimination is probably one of the algorithm we hear about when taking a basic class in linear algebra. In essence, Gaussian elimination is a procedure that can solve $n$ linear equations in $n$ unknowns using on the order of $n^3$ arithmetic operations.[^1]

How does it works? The idea is to transform a linear system into an upper triangular system by applying simple linear transformation on the left, much like [Householder triangularization](https://en.wikipedia.org/wiki/Householder_transformation) in the case of QR factorization. Regarding operations that are permitted these are: swapping rows, adding one row onto another, and multiply every factor of one row with a constant.

Mathematica has built-in procedures to solve linear systems like this, e.g. `Solve` or `LinearSolve`, but there's also a `RowReduce` function that performs a version of Gaussian elimination.

[^1]: Lloyd N. Trefethen. [Numerical Analysis](http://people.maths.ox.ac.uk/trefethen/NAessay.pdf). See also Pr. L. N. Trefethen's [website](http://people.maths.ox.ac.uk/trefethen/), which is full of free resources.
