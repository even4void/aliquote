---
title: "On computing variance"
date: 2019-12-13T18:02:06+01:00
draft: false
tags: ["statistics"]
categories: ["2019"]
---

I recently started following Travis Hinkelman's blog, originally because of several of his very interesting posts on Racket for statistical computing. Lately, he began to take a more serious interest in Chez Scheme and he even wrote a [short package](https://www.travishinkelman.com/post/writing-chez-scheme-library/) for basic statistical data processing:

> I had no idea that accurately calculating sample variance is challenging or that there are nine algorithms to choose from when using `quantile` in R (and now also in `chez-stats`).

Computing variance is such a big deal for applied statistics that it has been covered in several papers dating back to the 80s. Not only is variance, or sum of squares, involved in analysis of variance, but also in computing almost any estimate of some estimator precision. Like is the case for quantiles, several algorithms (*seven*, as a matter of fact) have been proposed.[^1][^2]

As is always the case, John D. Cook already had this covered on [his blog](https://www.johndcook.com/blog/standard_deviation/).[^3] Be sure to check the related posts on standard deviation and accuracy of Welford's approach to computing an estimate for the sample variance. A single pass algorithm is required when you deal with streaming data or when reading data twice would seriously impact the performance of your application (e.g., when frequent updates of the sample estimates are required). As discussed in the above link or on [The Mindful Programmer](https://jonisalonen.com/2013/deriving-welfords-method-for-computing-variance/), the following formula for the sample variance,

$$ s^2 = \frac{1}{n-1}\sum_{i=1}^n(x_i-\bar x)^2 = \frac{1}{n-1}\left(\sum_{i=1}^n x_i^2 - n\bar x^2\right), $$

is quite handy for manual computation with "usual" numbers but it is quite unstable numerically. Indeed, it may lead to serious [cancellation error](https://en.wikipedia.org/wiki/Loss_of_significance) when the variance is small compared to the square of the mean. 

Consider the following sample of size 5, $x=\{1, 2, 3, 4, 5\}$, for which $s_x^2=2.5$. Since the variance is invariant to changes in location parameter, adding 10<sup>10</sup> to all five values should yield the same estimate. Let's check what happen in R: (you'll need `sprintf("%.1f", x)` to display the values stored in variable `x`)

```R
> x <- 1:5 + 1e10
> var(x)
[1] 2.5
> 1/4*(sum(x^2)-5*mean(x)^2)
[1] 16384
```

Using Welford algorithm, which is a good choice in the case *n* is small,[^1] we would however get the correct result. Here's a quick implementation in R:

```R
wvar <- function(x) {
  m <- s2 <- 0
  n <- length(x)
  for (k in seq(1, n)) {
    xs <- x[k]
    tmp <- m
    m <- m + (xs - m)/k
    s2 <- s2 + (xs - m)*(xs - tmp)
  }
  return(s2/(n-1))
}
```

You know what? XLispStat got it almost right, even if it is using the more standard two-pass formula:

```lisp
> (def x (+ (iseq 1 5) 1e10))
> (def s (standard-deviation x))
> (* s s)
2.5000000000000004
```

Next time, we will revisit the Student *t*-test using Beta integral aproximation for small degrees of freedom (DF) or asymptotic series for large or non-integer DF.



[^1]: Chan, T.F., Golub, G.H., and LeVeque, R.J. Algorithms for Computing the Sample Variance: Analysis and Recommendations. The American Statistician, 37(3): 242–247, 1983.
[^2]: Ling, R.F. Comparison of Several Algorithms for Computing Sample Means and Variances. Journal of the American Statistical Association, 69(348): 859–866, 1974.
[^3]: See also [A Multiset of Observations With Constant-time Sample Mean and Variance](https://pvk.ca/Blog/2019/11/30/a-multiset-of-observations-with-constant-time-sample-mean-and-variance/).