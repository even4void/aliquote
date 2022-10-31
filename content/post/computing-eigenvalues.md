---
title: "Computing eigenvalues using QR decomposition"
date: 2022-10-30T09:31:49+01:00
draft: false
tags: ["math", "racket"]
categories: ["2022"]
---

[Matthew Drury][] made a great job explaining how eigenvalues are usually computed, via the QR decomposition. This is an iterative algorithm which is available in Numpy, `numpy.linalg.qr`, while in R it is directly `qr`. We already discussed the QR decomposition in a [previous post][]. Basically, the idea is as follows: Let $X$ be a symmetric matrix, compute $X_k = Q_kR_k$, for $k=1,\dots,n$, and update $X_{k+1}=R_kQ_k$. The sequence of $X_n$ converges to a diagonal matrix $D$ of eigenvalues, such that the eigenvectors are the columns of $\prod_i Q_i$.

In Racket, using an example from [Rosetta][] we would write:

```racket
(require math)
(matrix-qr (matrix [[12 -51   4]
                    [ 6 167 -68]
                    [-4  24 -41]]))
(for/list
```


for(i in 1:30)
{
  d <- qr(X);
  Q <- qr.Q(d);
  pQ <- pQ %*% Q;
  X <- qr.R(d) %*% Q;
}

X = eigevvalues
pQ = eigenvectors


{{% music %}}Clan of Xymox • _A Day_{{% /music %}}

[Matthew Drury]: https://madrury.github.io/jekyll/update/statistics/2017/10/04/qr-algorithm.html
[previous post]: /post/lisp-qr-regression/
[Rosetta]: https://rosettacode.org/wiki/QR_decomposition#Racket
[3x3 matrices]: https://scicomp.stackexchange.com/questions/33410/fast-and-accurate-eigenvalue-computation-for-3x3-posdef-matrices

