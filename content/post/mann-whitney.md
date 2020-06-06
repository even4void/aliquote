---
title: "Mann Whitney test"
date: 2020-06-05T19:29:21+02:00
draft: false
tags: ["statistics", "stata"]
categories: ["2020"]
---

The Wilcoxon-Mann-Whitney test, or simply the Mann-Whitney (MW) test for SPSS, SAS and probably more casual users, is a nonparametric test that is commonly used to compare the location parameters of two distributions having the same shape.[^1] Note that it is [not a test of the medians](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1120984/) of the two distributions (there exist a [median test](https://en.wikipedia.org/wiki/Median_test) or a test of the median of the differences based on the Hodges–Lehmann estimator for that purpose), but see [What hypotheses do "nonparametric" two-group tests actually test?](https://journals.sagepub.com/doi/pdf/10.1177/1536867X1201200202) (PDF). It is often referred to the Wilcoxon _rank sum test_ as indicated in the R help page for `wilcox.test`.[^2] In the case only one sample is tested, including the case of two paired samples, against a theoretical parameter value, it is best known as the Wilcoxon _signed rank test_. There are various way to compute the p-value (with or without continuity correction using a normal approcimation) and to report the test statistic (either as a _U_ or $\text{N}(0;1)$-based _z_ statistic). Let's just remember that there are approximate (for large sample) and exact methods for computing the _p_-value.[^3] Also, the Mann-Whitney statistic appears to be a monotonic function of a _t_-statistic computed on the ranks, hence it can be seen as a test for the difference of expected mean rank for two samples. Also, per the R documentation:

> The literature is not unanimous about the definitions of the Wilcoxon rank sum and Mann-Whitney tests. The two most common definitions correspond to the sum of the ranks of the first sample with the minimum value subtracted or not: R subtracts and S-PLUS does not, giving a value which is larger by m(m+1)/2 for a first sample of size m. (It seems Wilcoxon's original paper used the unadjusted sum of the ranks but subsequent tables subtracted the minimum.)

The MW test is also available in Stata as [ranksum](https://www.stata.com/help.cgi?ranksum), and in Python scipy as [stats.mannwhitneyu](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.mannwhitneyu.html). It is recommended to Python users to "use (it) only when the number of observation in each sample is > 20 and you have 2 independent samples of ranks," though Mann & Whitney computed tables for the probability of _U_ for sample size ≤ 8, while Lehmann reported that the actual efficiency of the MW test is close to Pitman's Asymptotic Relative Efficiency (ARE) evne in the case where n = 5 (in both samples).[^4] To approximate sample size required for the MW test, one could start with estimating the sample size for an equivalent $t$-test and then adjust the sample size based on the ARE of the MW test.[^5] For instance, assuming a normal distribution the ARE of the MW test relative to Student _t_-test is 3/π = 0.955,[^6] which means you can simply take the optimal n for a _t_-test and divide it by this value. More elaborated formula have been proposed, though, including the use of [exemplary dataset](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2796701/). Finally, regarding power, Lehman notes (p. 81) that:

> When nothing is known about the shape of the distribution, and particularly for distributions whose tails are very much heavier than those of the normal distribution (...), the Wilcoxon test may be considerably more efficient than the _t_-test.

Of course, a wide range of statistical software offer the Wilcoxon tests in their base packages. Let us consider some data from Stata:

```stata
. webuse fuel2
. ranksum mpg, by(treat)

Two-sample Wilcoxon rank-sum (Mann-Whitney) test

       treat |      obs    rank sum    expected
-------------+---------------------------------
   untreated |       12         128         150
     treated |       12         172         150
-------------+---------------------------------
    combined |       24         300         300

unadjusted variance      300.00
adjustment for ties       -4.04
                     ----------
adjusted variance        295.96

Ho: mpg(treat==untreated) = mpg(treat==treated)
             z =  -1.279
    Prob > |z| =   0.2010
```

Now, in R:

```r
> d <- haven::read_dta("http://www.stata-press.com/data/r15/fuel2.dta")
> wilcox.test(mpg ~ treat, d, correct = FALSE)

	Wilcoxon rank sum test

data:  mpg by treat
W = 50, p-value = 0.201
alternative hypothesis: true location shift is not equal to 0
```

<small>A more precise p-value is 0.20096117142482586.</small>

Finally, the Python version:

```python
In [1]: from scipy.stats import mannwhitneyu
In [2]: import pandas as pd
In [3]: d = pd.read_stata("http://www.stata-press.com/data/r15/fuel2.dta")
In [4]: x = d.groupby("treat").get_group("untreated")["mpg"]
In [5]: y = d.groupby("treat").get_group("treated")["mpg"]
In [6]: mannwhitneyu(x, y, use_continuity=False, alternative="two-sided")
Out[6]: MannwhitneyuResult(statistic=50.0, pvalue=0.20096117142482584)
```

<small>There's probably some arcane way to split the Pandas data frame into separate series of values, something simple akin to R's `base::split` and not involving melting, but I must admit I was too lazy to Google for it.</small>

That's it! Stata does not offer any continuity correction but can report exact p-value for sample sizes up to 200. I don't know which algorithm they use, though, but it might be interesting to use the approach suggested by Nagarajan & Keich[^3] as a benchmark.

[^1]: H.B. Mann and D.R. Whitney. [On a Test of Whether one of Two Random Variables is Stochastically Larger than the Other](https://projecteuclid.org/euclid.aoms/1177730491). _Ann. Math. Statist._ 18(1) (1947), 50-60.
[^2]: Stata technical note ([R], p. 2074 for Stata 14) is more verbose than R on this point: "We follow the great majority of the literature in naming these tests for Wilcoxon, Mann, and Whitney. However, they were independently developed by several other researchers in the late 1940s and early 1950s. In addition to Wilcoxon, Mann, and Whitney, credit is due to Festinger (1946), Whitfield (1947), Haldane and Smith (1947), and Van der Reyden (1952). Leon Festinger (1919–1989), John Burdon Sanderson Haldane (1892–1964), and Cedric Austen Bardell Smith (1917–2002) are well known for other work, but little seems to be known about Whitfield or van der Reyden. For a detailed study, including information on these researchers, see Berry, Mielke, and Johnston (2012)."
[^3]: N. Nagarajan and U. Keich. [Reliability and efficiency of algorithms for computing the significance of the Mann–Whitney test](http://users.umiacs.umd.edu/~niranjan/papers/NagarajanKeichCS09.pdf). Comput. Stat. 24(605) (2009).
[^4]: E.L. Lehman and H.J.M. D'Abrera. _Nonparametrics: Statistical Methods Based on Ranks_. Holden-Day (1975).
[^5]: As a rule of thumb which I have in my notes although I don't remember where I could possibly get it, for a nonparametric test you could also compute the sample size required for a t-test and add 15%, which is close to the lower bound of the ARE for the MW test (0.864), see van der Vaart[^6] or Lehman[^4].
[^6]: van der Vaart, A.W. _Asymptotic Statistics_. Cambridge University Press (1998).
