---
title: "How many permutations"
date: 2024-01-10T14:53:15+01:00
draft: true
tags: ["statistics", "stata"]
categories: ["2023"]
---

Usually, we would determine the number of permutations required to carry out a Monte Carlo permutation test based on the precision we wish to attain for the p-value. In fact, Stata provides a confidence interval for the estimated p-value when you use the [permute](https://www.stata.com/manuals/rpermute.pdf) procedure. This confidence interval is based on a binomial proportion (this is what we are estimating after all). With the example discussed in a [previous post](/post/permutation-test-in-lisp/), converted as a [tabular dataset](/pub/how-many-permutations.csv), here is a sample run from Stata 13:

```stata
. insheet using how-many-permutations.csv
. gen i=_n
. reshape long v, i(i)
. permute _j r(mu_1), reps(10000): ttest v, by(_j)
// -%----
Monte Carlo permutation results                   Number of obs   =         20

      command:  ttest v, by(_j)
        _pm_1:  r(mu_1)
  permute var:  _j

------------------------------------------------------------------------------
T            |     T(obs)       c       n   p=c/n   SE(p) [95% Conf. Interval]
-------------+----------------------------------------------------------------
       _pm_1 |      14.48    5229   10000  0.5229  0.0050   .513055   .5327317
------------------------------------------------------------------------------
Note:  Confidence interval is with respect to p=c/n.
Note:  c = #{|T| >= |T(obs)|}
```

Note that we get a p-value close to the one estimated using Lisp or R. Philip Good provides illustrations with various statistical software in chapter 3 of one of his textbook.[^1]

The approximate 95% CI for a proportion estimated from a sample of size $n$ is

$$ \hat p \pm 2\sqrt{\frac{\hat p(1-\hat p}{n}}, $$

which can be approximated as $\hat p \pm \sqrt{\hat p/n}$ for small $\hat p$. As an example, to get a precision of two decimal places for a proportion of 0.01, we would need $n > 1600$ rearrangements ($0.01 > 4\sqrt{0.01/n}$, then solve for $n$). This is probably why the rule of thumb is to use 1000 to 10000 permutations, when not "use the maximum number of permutations". Of course, this only applies to Monte Carlo re-rerandomization, since in the case of exact permutation tests you get the "exact" p-value you get, which is tied to your sample size. E.g., with five observations you only have 32 possibilities and 1 extreme observation out of 32 means a p-value of 0.03125.

{{% music %}}Happy Mondays • _Olive Oil_{{% /music %}}

[^1]: Phillip Good (2005) _Resampling Methods: A Practical Guide to Data Analysis_, Boston: Birkhäuser
