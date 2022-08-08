---
title: "Bootstrap resampling using Scheme"
date: 2022-08-03T10:34:29+02:00
draft: true
tags: ["scheme", "statistcis"]
categories: ["2022"]
---

In a [previous post], we discuss bootstrap resampling in Lisp, using LispStat. Let's write a full standalone procedure for bootstraping a test statistic in Scheme. Il will use Chicken, for it provided some basic summary statistic in the [statistics] module. We will focus on the classical example of computing a 95% confidence interval for a correlation coefficient, and compare this estimate with the asymptotic CI computed using [Fisher]'s z transformation.

Recall the nonparametric bootstrap algorithm:

1. Let $X = (x_1, x_2, \dots, x_n)$ be a sample of i.i.d. observations.
2. Generate $B$ random samples of size $n$ by drawing with replacement from $X$. Let call those new samples $\{X_1^{\star}, X_2^{\star},\dots, X_B^{\star}\}$.
3. Consider a statistic $S(X)$, which may be any estimator, test statistic or average prediction for instance. Any aspect of the distribution of $S(X)$ may be assessed from the distribution of the bootstrap samples directly, $\{S(X_1^{\star}), S(X_2^{\star}),\dots, S(X_B^{\star})\}$.

The variance of the bootstrap estimate, $\mathbb{V}[S(X)]$ is then:

$$ \mathbb{\widehat V}[S(X)] = \frac{1}{B-1}\sum\_{b=1}^B\left(S(X_b^{\star}) - \bar S^{\star}\right)^2. $$

where $\bar S^{\star}$ is the bootstrap sample mean, $\frac{1}{B}\sum_{b=1}^BS(X_b^{\star})$.

Basically, we need a way to shuffle a list of indices (the observation index in a list or vector), to call the same function on a $B$ random lists, and to compute a sum. Below is some Chicken Scheme code. Let's first get some data:

```scheme
(import (chicken io))
(define fs "/home/chl/Documents/work/tutors/CESAM/cours/Stata/birthwt2.csv")
(define data (call-with-input-file fs (lambda (p) (read-lines p))))
```

{{% music %}}The Durutti Column • _Experiment in Fifth_{{% /music %}}

[previous post]: /post/bootstraping-lisp/
[statistics]: https://wiki.call-cc.org/eggref/5/statistics
[fisher]: https://en.wikipeadia.org/wiki/Fisher_transformation
