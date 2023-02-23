---
title: "Bootstrap t-test"
date: 2023-02-22T20:55:34+01:00
draft: false
tags: ["rstats", "stata"]
categories: ["2023"]
---

A few years ago I ran a [workshop](https://github.com/even4void/rstats-ssample) where I showed how to carry out a simple (bilateral) permutation test in R. Assuming you have a matrix `d` with two columns of values, and no missing values, it reads:

```r
s0 <- mean(d[,1]) - mean(d[,2])               ## observed statistic
x <- c(d[,1], d[,2])
idx <- combn(seq(along = 1:20), 10)           ## {20 \choose 10}
f <- function(k) mean(x[k]) - mean(x[-k])
s <- apply(idx, 2, f)                         ## test statistic s
pobs <- sum(abs(s) >= abs(s0)) / length(s)
```

Using the [coin](https://cran.r-project.org/web/packages/coin/index.html) package the same test is done as follows:

```r
library(coin)
oneway_test(value ~ variable, data = reshape2::melt(d[1:2]),
            alternative = "two.sided", distribution = "exact")
```

I also showed how to devise a bootstrap test of hypothesis in R. This time, we need to take care of correctly centering the group means, though:

```r
x1 <- d[,1] - mean(d[,1]) + mean(x)           ## x is c(d[,1], d[,2])
x2 <- d[,2] - mean(d[,2]) + mean(x)
B <- 999                                      ## no. bootstrap samples
s <- numeric(B)                               ## vector of test statistics
for (i in 1:B) {
  x1s <- sample(x1, replace=TRUE)
  x2s <- sample(x2, replace=TRUE)
  s[i] <- mean(x1s) - mean(x2s)
}
pobs <-  (1 + sum(abs(s) > abs(s0))) / (B+1)  ## s0 is mean(d[,1]) - mean(d[,2])
```

Note that the `for` loop can easily be replaced with a function call in a `replicate` statement, of course. Here is some results with the ToothGrowth dataset we discussed [earlier](/post/python-datatable/), which can be prepared as follows:

```r
> data(ToothGrowth)
> d <- as.data.frame(with(ToothGrowth, split(len, supp)))
> x <- ToothGrowth$len
> s0 <- mean(d[,1]) - mean(d[,2])
--8<-- copy/paste code above ---
> pobs
[1] 0.043
```

Of course, we could compute confidence normal, percentile or BCA confidence intervals, with little effort. Stata does it [smoothly](https://www.stata.com/features/overview/bootstrap-sampling-and-estimation/), as usual:

```stata
. use toothgrowth, clear
. bootstrap dobs = (r(mu_1) - r(mu_2)), reps(1000) seed(101): ttest len, by(supp)
. estat bootstrap, all

Bootstrap results                               Number of obs      =        60
                                                Replications       =      1000

      command:  ttest len, by(supp)
         diff:  r(mu_1) - r(mu_2)

------------------------------------------------------------------------------
             |    Observed               Bootstrap
             |       Coef.       Bias    Std. Err.  [95% Conf. Interval]
-------------+----------------------------------------------------------------
        diff |         3.7   .0643175   1.8568749    .0605921   7.339408   (N)
             |                                      -.0248661   7.282081   (P)
             |                                       -.178198   7.126667  (BC)
------------------------------------------------------------------------------
(N)    normal confidence interval
(P)    percentile confidence interval
(BC)   bias-corrected confidence interval
```

<small>You can download the dataset [here](/pub/toothgrowth.dta).</small>

{{% music %}}Three Days Grace • _I Hate Everything About You_{{% /music %}}
