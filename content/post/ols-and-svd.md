---
title: "Solving OLS problem using SVD"
date: 2023-04-07T09:12:39+02:00
draft: true
tags: ["racket", "statistics"]
categories: ["2023"]
---

I came across a Racket package which aims to provide basic linear regression fitting utilities to Schemers. Unfortunately, it relies on the use of normal equations to solve the linear systems, which is rarely a good idea (think about what happens if the design matrix has a very irregular shape, or even [condition number](https://stats.stackexchange.com/a/343075)).

Direct methods (i.e., matrix decomposition) have been discussed beforehand, e.g. [here](/post/lisp-qr-regression/) (Lisp) and [here](/post/newton-raphson-racket/) (Racket). Here is another direct method which relies on the SVD. Considering the linear system $X\beta = y$, the idea is to decompose $X$ as $\underset{m\times m}{U}\overset{m\times n}{\Sigma}\underset{n\times n}{V^T}$, where $U$ and $V$ are unitary matrices, and $\Sigma$ is a diagonal matrix filled with 0 for rows $n+1,\dots,m$.[^1]

{{% music %}}Emma Ruth Rundle • _Blooms of Oblivion_{{% /music %}}

[^1]: The numbr of columns can also be reduced (i.e. discarding the smallest singular values).
