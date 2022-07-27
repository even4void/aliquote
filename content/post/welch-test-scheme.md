---
title: "Welch t-test in Scheme"
date: 2022-07-27T09:41:22+02:00
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

### Application in Scheme

Here is an simple application in Scheme. It follows the approach proposed by Larry Hunter in his Statistical functions in Common Lisp (Version 1.01 July 27, 2001), except that we don't use a lookup table for the p-value as can be found in certain versions available on the web. Instead, we use the incomplete Beta distribution discussed in [previous] [posts] which is available from the [GNU Scientific Library].

I will use Chicken Scheme since it is quite easy to use its FFI facilities (see, e.g., this post on the [Murmurhash] algorithm). For CL users, [Matt Curtis] provide a standalone incomplete beta function in his port of Larry Hunter's code. Fortunately, there's also some [Chicken code] for the original Lisp code, provided by Peter Lane. Here's the gist of it, using the interpreter (`csi`):

```scheme
> (import statistics)
> (t-test-two-sample 12 2 24 11 1.5 24 #f)
0.0561191363596448
```

Compare to the two-tailed p-value returned by Stata:

```stata
. ttesti 24 12 2 24 11 1.5, unequal

Two-sample t test with unequal variances
------------------------------------------------------------------------------
         |     Obs        Mean    Std. Err.   Std. Dev.   [95% Conf. Interval]
---------+--------------------------------------------------------------------
       x |      24          12    .4082483           2    11.15547    12.84453
       y |      24          11    .3061862         1.5    10.36661    11.63339
---------+--------------------------------------------------------------------
combined |      48        11.5    .2627511    1.820393    10.97141    12.02859
---------+--------------------------------------------------------------------
    diff |                   1    .5103104               -.0293791    2.029379
------------------------------------------------------------------------------
    diff = mean(x) - mean(y)                                      t =   1.9596
Ho: diff = 0                     Satterthwaite's degrees of freedom =  42.6558

    Ha: diff < 0                 Ha: diff != 0                 Ha: diff > 0
 Pr(T < t) = 0.9717         Pr(|T| > |t|) = 0.0566          Pr(T > t) = 0.0283
```

Now we would like to compute a 95% asymptotic confidence interval. According to Stata, using Satterthwaite's approximation (42.7 df) it amounts to $[-0.0294;2.0294]$. Under the equal variance assumption (46 df), it is $[-.0272;2.0272]$. Not much of a difference between the two CIs. Here are the values computed using Scheme:

```scheme
> (define (pooled-sd s1 n1 s2 n2)
    (sqrt (/ (+ (* (- n1 1) (* s1 s1))
                (* (- n2 1) (* s2 s2)))
             (+ n1 n2 -2))))
> (define sp (pooled-sd 2 24 1.5 24))
```

We need to be careful when using the one-sample confidence interval routine (`normal-mean-ci`), since it needs to get the right degrees of freedom. IT works great in the case of univariate statitics. The function reads:

```scheme
(define (normal-mean-ci mean sd n alpha)
  (let ((t-value (t-distribution (- n 1) (- 1 (/ alpha 2)))))
    (values (- mean (* t-value (/ sd (sqrt n))))
            (+ mean (* t-value (/ sd (sqrt n)))))))
```

In this case, the degree of freedom is the sample size minus 1, and the standard error is computed as `(/ sd (sqrt n))`, which is defintely not what we want. The estimated standard error of the difference of means is the pooled SD, `sp`, times $\sqrt{1/24 + 1/24}=\sqrt{1/12}$, in the case of equal variances. Hence the correct 95% CI is computed as follows:

```scheme
> (define se (* sp (sqrt (/ 1 12))))
> (define qt 46 0.975)
> (values (- 1 (* qt se)) (+ 1 (* qt se)))
-0.0272016886019351
2.02720168860194
```

Using separate variances, we would use the following standard error to compute te 95% CI:[^4]

```scheme
> (define se (sqrt (+ (/ (* 2 2) 24) (/ (* 1.5 1.5) 24))))
> (define nu (/ (square (+ (/ (* 2 2) 24) (/ (* 1.5 1.5) 24)))
                                (+ (/ (square (/ (* 2 2) 24)) (- 24 1))
                                   (/ (square (/ (* 1.5 1.5) 24)) (- 24 1)))))
> (define qt (t-distribution nu 0.975))
> (values (- 1 (* qt se)) (+ 1 (* qt se)))
-0.0293791829211965
2.0293791829212
```

This agrees with Stata's summary table.

Of course, it would be better to embed the computation of the confidence intervals into the testing procedure, which actually returns the p-value only.

{{% music %}}Caroles Daughter • _My Mother Wants Me Dead_{{% /music %}}

[^1]: See the [Behrens-Fisher problem](https://en.wikipedia.org/wiki/Behrens–Fisher_problem).
[^2]: F. E. Satterthwaite (1946). An Approximate Distribution of Estimates of Variance Components. _Biometrics Bulletin_, _2_, 110-114.
[^3]: B. L. Welch (1947). The Generalization of Student's Problem When Several Different Population Variances Are Involved. _Biometrika_, _34_, 28-35.
[^4]: See William D. Dupont (2009). _Statistical Modeling for Biomedical Researchers_ (2nd ed.), Cambridge (p. 36).

[previous]: /post/student-approx/
[posts]: /post/computing-student-t/
[gnu scientific library]: https://www.gnu.org/software/gsl/doc/html/specfunc.html
[murmurhash]: /post/murmurhash/
[matt curtis]: https://github.com/mrc/lhstats
[chicken code]: https://wiki.call-cc.org/eggref/5/statistics
