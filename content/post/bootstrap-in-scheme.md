---
title: "Bootstrap resampling using Scheme"
date: 2022-08-09T10:34:29+02:00
draft: true
tags: ["scheme", "statistcis"]
categories: ["2022"]
---

In a [previous post], we discussed bootstrap resampling in Lisp, using LispStat. Let's write a full standalone procedure for bootstraping a test statistic in Scheme. I will use Chicken, for it provided some basic summary statistic in the [statistics] module. We will focus on the classical example of computing a 95% confidence interval for a correlation coefficient, and compare this estimate with the asymptotic CI computed using [Fisher]'s z transformation.

Recall the nonparametric bootstrap algorithm:

1. Let $X = (x_1, x_2, \dots, x_n)$ be a sample of i.i.d observations.
2. Generate $B$ random samples of size $n$ by drawing with replacement from $X$. Let call those new samples $\{X_1^{\star}, X_2^{\star},\dots, X_B^{\star}\}$.
3. Consider a statistic $S(X)$, which may be any estimator, test statistic or average prediction for instance. Any aspect of the distribution of $S(X)$ may be assessed from the distribution of the bootstrap samples directly, $\{S(X_1^{\star}), S(X_2^{\star}),\dots, S(X_B^{\star})\}$.

The variance of the bootstrap estimate, $\mathbb{V}[S(X)]$ is then:

$$ \mathbb{\widehat V}[S(X)] = \frac{1}{B-1}\sum\_{b=1}^B\left(S(X_b^{\star}) - \bar S^{\star}\right)^2. $$

where $\bar S^{\star}$ is the bootstrap sample mean, $\frac{1}{B}\sum_{b=1}^BS(X_b^{\star})$.

Basically, we need a way to (1) shuffle (with replacement) a list of indices (the observation index in a list or vector) _or_ to shuffle the data values directly, then (2) call the same function on $B$ random lists, and finally (3) compute a sum (or any other test statistic). Below is some Chicken Scheme code.

To pick a random element from a list, one can use (replace `pseudo-random-integer` with `random` if you are using Racket):

```scheme
(import (chicken random))
(lambda (x) (list-ref x (pseudo-random-integer (length x))))
```

Let's test it:

```scheme
(define xs '(1 2 3 4 5 6 7 8 9 10))
(list-ref xs (pseudo-random-integer (length xs)))
;; => 9
```

Of course, your result will likely be a different one, since I don't use a fixed seed for the PRNG. To repeat the same call to the above procedure, `pick` say, `(length xs)` times we can use a simple iterator:

```scheme
(define (pick x) (list-ref x (pseudo-random-integer (length x))))
(define len (length xs))
(let loop ((n 1)
           (rs '()))
  (cond ((> n len) rs)
        (else (loop (add1 n) (cons (pick xs) rs)))))
;; => (6 6 9 4 8 3 4 2 4 10)
```

Since we sample with replacement, it is normal to expect some duplicates since the [average bootstrap sample] omits 36.8% of the original sample.

Everything is now in place. We just need to add one more outer loop to build $n$-samples $k$ times.

Let's first get some data:

```scheme
(import (chicken io))
(define fs "/home/chl/Documents/work/tutors/CESAM/cours/Stata/birthwt2.csv")
(define data (call-with-input-file fs (lambda (p) (read-lines p))))
```


{{% music %}}The Durutti Column • _Experiment in Fifth_{{% /music %}}


[previous post]: /post/bootstraping-lisp/
[statistics]: https://wiki.call-cc.org/eggref/5/statistics
[fisher]: https://en.wikipeadia.org/wiki/Fisher_transformation
[average bootstrap sample]: https://blogs.sas.com/content/iml/2017/06/28/average-bootstrap-sample-omits-data.html
