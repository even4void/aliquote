---
title: "Computing Student t-test"
date: 2019-12-14T18:02:18+01:00
draft: false
tags: ["statistics"]
categories: ["2019"]
---

The Student *t*-test is a well-known statistical test when it comes to comparing the mean of two groups, or of one group to a reference value. It is an interesting case in the statistical armory since it requires two estimates (the mean and the standard deviation) from the same sample as well as [strong assumptions](https://en.wikipedia.org/wiki/Behrens–Fisher_problem), but if we leave that aside it is also an interesting challenge from an algorithmic perspective.

Indeed, you may recall that the test statistic is computed as $(\bar x - \mu_0) / (s_x / \sqrt{n})$ in the case of a single sample of size $n$, for which $\bar x$ and $s_x$ denote the sample mean and standard deviation which are estimates for the corresponding population mean ($\mu$) and variance ($\sigma^2$), while $\mu_0$ is the parameter we are interested in under the null hypothesis $H_0:\, \mu = \mu_0$. In this case, $s^2$ follows a chi-square distribution with $\eta=n-1$ degrees of freedom, while $\bar x$ follows a gaussian distribution with parameter $\mu$ and $\sigma^2/n$.[^1] The Student $t$ distribution has a probability density function that can be expressed either as a combination of Gamma distributions, or using the following Beta distribution:

$$ f(t) = \frac{1}{\sqrt{\eta}B(\frac{1}{2},\frac{\eta}{2})}\left( 1+\frac{t^2}{\eta}\right)^{-\frac{\eta+1}{2}}. $$

Depending on whether $\eta$ is odd or even, specific [asymptotic expansions](https://en.wikipedia.org/wiki/Student%27s_t-distribution) can be used but only in the case where $\eta$ is an integer value, which is not always the case, e.g., when using Welch or Satterthwaite approximations.

If you look into the R source code, you will find a standard helper function, `src/library/stats/R/t.test.R`, which computes the test statistic, its p-value and associated confidence interval. Nothing really surprising here, you could write a function that does the same job, providing you take care of computing the variance correctly (cf. possible catastrophic cancellation discussed in a [previous post](/post/computing-variance)). What's more difficult is to get the p-value, and the confidence interval *de facto*, since it involved a continuous distribution that is quite complicated.

If you look more carefully, you will notice that the probability distribution function `pt` is implemented in C in `src/nmath/pt.c`:

```R
> pt
function (q, df, ncp, lower.tail = TRUE, log.p = FALSE)
{
    if (missing(ncp))
        .Call(C_pt, q, df, lower.tail, log.p)
    else .Call(C_pnt, q, df, ncp, lower.tail, log.p)
}
<bytecode: 0x7fc000643fe0>
<environment: namespace:stats>
```

<small>The `pnt.c` file is used in the case of a non-central distribution.</small>

Now, what's inside the C code?

- First, a normal approximation (`pnorm`) is used when *n* is large (`n > 4e5` for R version ≤ 2.6), and in more recent versions of R a modified Beta approximation in the case $x^2>10^{100}n$;
- in the other case, the p-value is estimated from a Beta distribution, specifically a $\text{Beta}(x^2/(n+x^2), 0.5, n/2)$ when $n>x^2$, or a $\text{Beta}(1/(1 + x^2/n), n/2, 0.5)$ if $n \le x^2$.

The last two conditions aim at limiting possible underflow and come from Abramowitz & Stegun's textbook, [*Handbook of Mathematical Functions*](http://people.math.sfu.ca/~cbm/aands/), specifically the following formula for the incomplete Beta function:

$$ I_x(a, b) = \frac{x^a(1-x)^b}{aB(a, b)} \left[ 1 + \sum_{n=0}^\infty \frac{B(a+1,n+1)}{B(a+b,n+1)} x^{n+1} \right], $$

where $B(a, b)$ denotes a Beta distribution with shape parameters $a$ and $b$, which are called $\alpha$ and $\beta$ on [Wikipedia](https://en.wikipedia.org/wiki/Beta_distribution). In this case, $a = n/2$ and $b= 1/2$.

Beside R, there's [algorithm AS 3](http://lib.stat.cmu.edu/apstat/3) that's lurking on StatLib, but you will find a more detailed discussion the CACM, specifically [Algorithm AS 395](https://dl.acm.org/citation.cfm?id=362775). In fact, LispStat relies on the latter, and again, a distinction is made depending on whether the degrees of freedom ($\eta=n-2$) and the test statistic, $t$, are considered small ($\eta<20$ and $t < 4$) or large enough, in which case a Beta distribution $B(1/2, n/2)$ is used.[^1] In fact, there are other corner cases that are treated, like the cases where:

- $\eta < 2$ and $\eta \ne 1$ (the degrees of freedom are not necessarily integers) --- despite the values, this is treated as what is considered large in the above statement and relies on a $B(1/2, n/2)$; otherwise, LispStat relies on asymptotic series, as described p. 619 of Algorithm 395;
- nested summation of cosine series are used in all cases where none of the following conditions are verified: $\eta > \lfloor n\rfloor$, or $n \ge 20$ and $t < n$, or $n > 20$ --- this is what is considered "small" in the above description.

Apparently, Stata relies on a Gamma distribution and, per the documentation, the function `ttail` computes the reverse cumulative (survivor) Student’s t distribution (i.e., $\Pr(T>t)$) as $\int_t^\infty \frac{\Gamma\big((\eta+1)/2\big)}{\sqrt{\pi\eta}\phantom{\:}\Gamma(\eta/2)}(1+x^2/\eta)^{-(\eta+1)/2}dx$, with $2^{-10}\le\eta\le 2^{17}$, $\eta\in\mathbb{R}^+$. Finally, Python uses an incomplete Beta in the [scipy](https://scipy.org/scipylib) package for the `stats/ttest_*` functions. It is defined in the `special` submodule, as C code (`cephes/stdtr.c`).

[^1]: The parameterization of the Gaussian or Beta distribution may vary depending on the software you use.
