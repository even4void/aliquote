---
title: "Student's t distribution"
date: 2021-11-19T21:23:27+01:00
draft: false
tags: ["statistics", "racket"]
categories: ["2021"]
---

In a previous post, we discussed how p-values are computed in the case of [Student t-test](/post/computing-student-t/) in LispStat, R, Stata and Python. John Monahan has more to say about the Student's t distribution in his book _Numerical Methods in Statistics_,[^1] and how it can be approximated.

Specifically, let's denote $Q(t\mid k) = \Pr(X > t)$, assuming $X$ follows a Student's t distribution with $k$ df. As we noted earlier, the fact that $k$ ($\eta$ in our previous post) is an integer or not plays a role when one looks for an analytical solution. If $k$ is an integer, Abramowitz and Stegun gave the following formula:[^2]

$$ Q(t\mid k) =
\begin{cases}
\frac{1}{2} - \frac{\theta}{\pi}, \quad k=1 \cr
\frac{1}{2} - \frac{1}{\pi}\left[\theta + \sin\theta\left(\cos\theta + \frac{2}{3}\cos^3\theta + \dots + \frac{2\times 4\times\dots\times (k-3)}{1\times 3\times\dots\times (k-2)}\cos^{k-2}\theta\right)\right], \quad k\ \text{odd} \cr
\frac{1}{2} - \sin\theta\left[1 + \frac{1}{2}\cos^2\theta + \frac{1\times 3}{2\times 4}\cos^4\theta + \dots + \frac{1\times 3\times\dots\times (k-3)}{2\times 4\times\dots\times (k-2)}\cos^{k-2}\theta\right], \quad k\ \text{even}
\end{cases}
$$

where $\theta = \text{arctan}(t/\sqrt{k})$.[^3] With large value of $k$, the incomplete beta function may be used as follows:

$$ Q(t\mid k) = \frac{1}{2}I_x(k/2,1/2) \quad \text{for}\\; x = k/(k+t^2). $$

Note that the use of a Beta distribution was also at hand in our previous post. Furthermore, for large value of $t$, some of the trigonometric expressions above may be avoided by using the fact that $\sin(\theta) = 1/\sqrt{1+w}$ and $\cos(\theta) = \sqrt{\frac{w}{1+w}}$, with $w=k/t^2$. When $k$ is even, we have:

$$ Q(t\mid k) = \frac{\sqrt{1+w} - B}{2\sqrt{1+w}}, \quad \text{where}\ B = \sum_{j=1}^{n/2-1} c_j\left(\frac{w}{1+w}\right)^j $$

with $c_j = (2j-1)c_{j-1}/(2j)$, and $c_0 = 1$. To avoid cancellation, we can use the following power series: $\sqrt{1+w} = 1 + \frac{1}{2}w - \frac{1}{8}w^2 + \frac{1}{16}w^3 - \frac{5}{128}w^4 + \frac{7}{256}w^5 - \dots$, which allows to compute $\sqrt{1+w}-B$ by matching powers of $w$.

Similarly, when $k$ is odd,

$$ Q(t\mid k) = \frac{1}{\pi}\left[\frac{\pi}{2} - \text{arctan}\left\(\frac{t}{\sqrt{k}}\right) - \frac{\sqrt{w}}{1+w}\sum_{j=1}^{(n-3)/2} d_jw^j\right], $$

where $d_j = 2jd_{j-1}/(2j+1)$ and $d_0 = 1$. Again, the following series can be used: $\sqrt{1+w} = \frac{\pi}{2} - \text{arctan}\left(\frac{t}{\sqrt{k}}\right) = \frac{1}{\sqrt{w}}\left[1-\frac{w}{3} + \frac{w^2}{5} - \frac{w^3}{7} + \frac{w^4}{9} - \dots \right]$.

The tail probabilities for Student's $t$ distribution can also be represented using the Gamma distribution as:

$$ Q(t\mid k) = \frac{\Gamma\big((k+1)/2\big)}{\Gamma(k/2)\sqrt{\pi}}u^{-k/2}\sum_{j=0}^\infty\frac{c_j}{(k+2)u^j}, $$

where $c_0 = 1$, $c_j = \frac{2j-1}{2j}c_{j-1}$, and $u = 1 + \frac{t^2}{k}$.

Currently, there's no way to compute tail probability from the Student's $t$ distribution in Racket math library, although it has everything we need for the Gamma or Beta distribution. Let's do this by hand using Racket's builtin facilities to compute the _regularized_ incomplete Beta function:

```racket
(require math/special-functions)

(define (pt t df [two-tailed? #f])
  (let ([beta (* 0.5 (beta-inc (* 0.5 df) 0.5 (/ df (+ df (sqr t))) #f #t))])
    (if two-tailed? (* 2 beta) beta)))

(pt 2.41 36)
; => 0.010594171035128275
```

R returns $Q(2.41 \mid 36) = 0.01059417$ for the one-tailed probability.

[^1]: John F. Monahan. _Numerical Methods in Statistics_. Cambridge University Press (2011).
[^2]: Abramowitz and Stegun. [*Handbook of Mathematical Functions*](http://people.math.sfu.ca/~cbm/aands/)
[^3]: As noted by Monahan, for large values of $t/\sqrt{k}$, which may happen for very large test statistic under low df distribution, this expression may yield to potential cancellation.
[^4]: Armido R Didonato and Alfred H Morris Jr. Algorithm 708: Significant Digit Computation of the Incomplete Beta Function Ratios. _ACM Transactions on Mathematical Software_,  18(3): 360--373 (1992).

