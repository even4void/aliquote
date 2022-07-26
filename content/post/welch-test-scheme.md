---
title: "Welch t-test in Scheme"
date: 2022-07-25T19:44:22+02:00
draft: false
tags: ["scheme", "statistics"]
categories: ["2022"]
---

### Background

For two independant samples, the Student test statistic is defined as follows:

$$
t_{\text{obs}}=\frac{\bar x_1 - \bar x_2}{s_c\sqrt{\frac{1}{n_1}+\frac{1}{n_2}}},\quad
s_c=\left(\frac{(n_1-1)s^2_1+(n_2-1)s^2_2}{n_1+n_2-2}\right)^{1/2},
$$

where $\bar x_i$ and $n_i$ represent the means and sample sizes of the two samples, and $s_c$ is the pooled variance for the difference of means. Under $H_0$, this test statistic follows a Student distribution with $n_1+n_2-2$ degrees of freedom.

A $100(1-\alpha)$\% confidence interval for the difference $\bar x_1 - \bar x_2$ can be defined as

$$
\bar x_1 - \bar x_2\pm t_{\alpha, n_1+n_2-2}s_c\sqrt{\frac{1}{n_1}+\frac{1}{n_2}},
$$

with $P(t<t_{\alpha,n_1+n_2-2})=1-\alpha/2$.

The above assumes equal variances at the population level.[^1] This hypothesis can be relaxed by approximating the degrees of freedom using a linear combination of the sample variances, $\tfrac{s_1^2}{n_1}+\tfrac{s_2^2}{n_2}$.[^2] The test statistic still follows a Student distribution, but with $\nu$ degrees of freedom.

The Satterthwaite approximation considers:

$$
\nu = \frac{ \left( s_1^2/n_1 + s_2^2/n_2 \right)^2 }
{ \frac{\left( s_1^2/n_1 \right)^2}{n_1-1} + \frac{\left( s_2^2/n_2 \right)^2}{n_2-1} }.
$$

The formula proposed by Welch is close to the above formulation:[^3]

$$
\nu = -2 + \frac{ \left( s_1^2/n_1 + s_2^2/n_2 \right)^2 }
{ \frac{\left( s_1^2/n_1 \right)^2}{n_1 + 1} + \frac{\left( s_2^2/n_2 \right)^2}{n_2 + 1} }.
$$

### Implementation

Here is a simple function that compute the test statistic and its assocuated p-value. It follows the approach in Statistical functions in Common Lisp (Version 1.01 July 27, 2001) by Larry Hunter, except that we d'ont use a lookup table for the p-value as can be found in certain versions available on the web. Instead, we use the incomplete Beta distribution discussed in [previous] [posts] which is available from the [GNU Scientific Library].

I will use Chicken Scheme since it is quite easy to use its FFI facilities (see, e.g., this post on the [Murmurhash] algorithm). For CL users, [Matt Curtis] provide a standalone incomplete beta function in his port of Larry Hunter's code. Fortunately, there's also some [Chicken code] for the original Lisp code, provided by Peter Lane. Here's the gist of it:

```scheme
(import (chicken foreign))

(foreign-declare "#include <gsl/gsl_sf_gamma.h>")

(define beta-incomplete
  (foreign-lambda double "gsl_sf_beta_inc" double double double))

(define (pt stat df two-sided)
  (set! stat (exact->inexact stat))
  (set! df (exact->inexact df))
  (let ((a (beta-incomplete (* 0.5 df) 0.5 (/ df (+ df (square stat))))))
    (if (two-sided a)
        (if (positive? stat)
          (* 0.5 a)
          (- 1.0 (* 0.5 a))))))

(define (t-test x1 s1 n1 x2 s2 n2 two-sided)
  (let ((stat #f)
        (df #f))
    (let ((s (sqrt (/ (+ (* (- n1 1) (square s1)
                          (* (- n2 1) (square s2))))
                      (+ n1 n2 -2)))))
      (set! stat (/ (- x1 x2
                            (* s (sqrt (+ (/ n1) (/ n2)))))))
      (set! df (+ n1 n2 -2)))
    (pt stat df two-sided)))
```

Let's test it:

```scheme
> (t-test 12 2 24 11 1.5 24 #t)
```

Compare to Stata:

```stata
. ttesti 24 12 2 24 11 1.5

Two-sample t test with equal variances
------------------------------------------------------------------------------
         |     Obs        Mean    Std. Err.   Std. Dev.   [95% Conf. Interval]
---------+--------------------------------------------------------------------
       x |      24          12    .4082483           2    11.15547    12.84453
       y |      24          11    .3061862         1.5    10.36661    11.63339
---------+--------------------------------------------------------------------
combined |      48        11.5    .2627511    1.820393    10.97141    12.02859
---------+--------------------------------------------------------------------
    diff |                   1    .5103104               -.0272015    2.027201
------------------------------------------------------------------------------
    diff = mean(x) - mean(y)                                      t =   1.9596
Ho: diff = 0                                     degrees of freedom =       46

    Ha: diff < 0                 Ha: diff != 0                 Ha: diff > 0
 Pr(T < t) = 0.9719         Pr(|T| > |t|) = 0.0561          Pr(T > t) = 0.0281
```

{{% music %}}Caroles Daughter • _My Mother Wants Me Dead_{{% /music %}}

[^1]: See the [Behrens-Fisher problem](https://en.wikipedia.org/wiki/Behrens–Fisher_problem).
[^2]: F. E. Satterthwaite (1946). An Approximate Distribution of Estimates of Variance Components. _Biometrics Bulletin_, _2_, 110-114.
[^3]: B. L. Welch (1947). The Generalization of Student's Problem When Several Different Population Variances Are Involved. _Biometrika_, _34_, 28-35.

[previous]: /post/student-approx/
[posts]: /post/computing-student-t/
[gnu scientific library]: https://www.gnu.org/software/gsl/doc/html/specfunc.html
[murmurhash]: /post/murmurhash/
[matt curtis]: https://github.com/mrc/lhstats
[chicken code]: https://wiki.call-cc.org/eggref/5/statistics
