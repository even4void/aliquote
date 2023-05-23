---
title: "Computing eigenvalues using QR decomposition"
date: 2022-12-28T09:31:49+01:00
draft: false
tags: ["math", "racket"]
categories: ["2022"]
---

[Matthew Drury][] made a great job explaining how eigenvalues are usually computed, via the QR decomposition. This is an iterative algorithm which is available in Numpy, `numpy.linalg.qr`, while in R it is directly `qr`. We already discussed the QR decomposition in a [previous post][]. Basically, the idea is as follows: Let $X$ be a symmetric matrix, compute $X_k = Q_kR_k$, for $k=1,\dots,n$, and update $X_{k+1}=R_kQ_k$. The sequence of $X_n$ converges to a diagonal matrix $D$ of eigenvalues, such that the eigenvectors are the columns of $\prod_i Q_i$.

In Racket, the very first iteration would read:

```racket
(require math)
(define X0 (matrix [[12 -51   4]
                    [ 6 167 -68]
                    [-4  24 -41]]))
(define X (matrix+ X0 (matrix-transpose X0)))
; (define D (diagonal-matrix '(1 1 1)))
(define D (identity-matrix 3))
(define-values (Q R) (matrix-qr X))
(define D (matrix* D Q))
(define X (matrix* R Q))
```

Wrap the above code in a function, iterate 20 to 30 times and then the $X$ matrix should contain the eigenvalues on its diagonal.

Of note, the Householder method for computing the QR decomposition in Racket is available on [Rosetta][].

{{% alert note %}}
<small>[2023-05-23]</small><br>
For other numerical approaches to computing eigenvectors and eigenvalues, see this excellent blog post by Marc Khoury: [Numerical Algorithms for Computing Eigenvectors](https://marckhoury.github.io/blog/numerical-algorithms-for-computing-eigenvectors).
{{% /alert %}}

{{% music %}}Clan of Xymox • _A Day_{{% /music %}}

[matthew drury]: https://madrury.github.io/jekyll/update/statistics/2017/10/04/qr-algorithm.html
[previous post]: /post/lisp-qr-regression/
[rosetta]: https://rosettacode.org/wiki/QR_decomposition#Racket
[3x3 matrices]: https://scicomp.stackexchange.com/questions/33410/fast-and-accurate-eigenvalue-computation-for-3x3-posdef-matrices
