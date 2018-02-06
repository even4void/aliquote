+++
title = "Against the systematic use of Fisher's exact test"
description = ""
date = 2010-09-16T21:36:21+01:00
draft = false
tags = ["statistics"]
categories = []
+++

Here is an article published in *Statistics in Medicine* last year and that argues against the systematic use of Fisher's exact test. Since this is the test that is most of the times reported in clinical biostatistics and epidemiology articles, let's look at the rationale behind this claim.

Lydersen, S. Fagerland, M.W., and Laake, P., [Recommended tests for association in 2×2 tables](http://www.ncbi.nlm.nih.gov/pubmed/19170020), Statistics in Medicine (2009) 28: 1159-1175.

Below is the abstract of the article by Lydersen and coll.

> The asymptotic Pearson’s chi-squared test and Fisher’s exact test have long been the most used for testing association in 2×2 tables. Unconditional tests preserve the significance level and generally are more powerful than Fisher’s exact test for moderate to small samples, but previously were disadvantaged by being computationally demanding. This disadvantage is now moot, as software to facilitate unconditional tests has been available for years. Moreover, Fisher’s exact test with mid-p adjustment gives about the same results as an unconditional test. Consequently, several better tests are available, and the choice of a test should depend only on its merits for the application involved. Unconditional tests and the mid-p approach ought to be used more than they now are. The traditional Fisher’s exact test should practically never be used.

## The chi-square and Fisher's test

First of all, let's recall what's the difference between Fisher's test and the standard χ<sup>2</sup> test. Basically, Pearson's  χ<sup>2</sup> reads as the suqared differences between observed and expected counts, divided by expected counts (to get a convenient normalization). Under the hypothesis of no association (i.e., statistical independence between row and column totals, the so-called margins), the expected count of n<sub>ij</sub> is simply the product of its corresponding totals, n<sub>i+</sub> and n<sub>+j</sub>. Under a large sample hypothesis, the observed χ<sup>2</sup> statistic follow a χ<sup>2</sup>(1) distribution. It generalizes to IxJ Tables, where the degree of freedom is (I-1)(J-1). The Fisher's test is an exact test relying on the hypergeometric distribution (where all possible Tables having the same marginal totals are computed). It is a computer intensive job, and in R (`fisher.test()`) it is relegated to a C function.

It is important to recall that Fisher's test assumes that margins are fixed, whereas Pearson's  χ<sup>2</sup> might be used to test either independence or homogeneity of proportions when one marginal total is fixed.

A more comprehensive framework is provided in Sokal and Rohlf,<sup>(1)</sup> p. 721 and ff. They consider three different kind of sampling schemes or designs, named Model I, II and III, depending on whether "the totals in the margins of the 2x2 Table are fixed by the investigator or are free to vary and reflect population parameters."

- Model I considers all Tables with the same total sample size n (an alternative model I is where the same individuals are assessed two times--but the hypothesis to be tested is clearly different).
- Model II considers that one of the margin totals is fixed.
- Model III considers that both margin totals are fixed.

The Fisher's test is appropriate for Model III design. The G-test of independence is designed for the other two models. The G-test is a likelihood ratio test whose expression might be derived from multinomial expectations (p. 692) as

$$ G=2\sum_{i=1}^af_i\ln\left(\frac{f_i}{\hat f_i}\right), $$

i.e., it summarizes "the sum of the independent contributions of departures from expectations ln(•) weighted by the frequency of the particular class (f<sub>i</sub>)." It is approximately χ<sup>2</sup>(1) distributed.

## About Yates' correction

The Yates' continuity correction consists in subtracting 0.5 from the difference between each observed value and its expected value in 2×2 table only.<sup>(1)</sup>

Yates' correction is known to result in tests that are more conservative as with Fisher's "exact" tests. However, we can read in Agresti ([CDA](http://www.stat.ufl.edu/~aa/cda/cda.html), 2002, p. 103) that

> Yates (1934) mentioned that Fisher suggested the hypergeometric to him for an exact test. He proposed a continuity-corrected version of χ<sup>2</sup>,

$$ \chi_c^2=\sum\sum\frac{\left(\mid n_{ij}-\hat\mu_{ij}\mid -0.5\right)^2}{\hat\mu_{ij}} $$

> to approximate the exact test. (...) Since software now makes Fisher's exact test feasible even with large samples, this correction is no longer needed.

There is an excellent tutorial by Jerry Dallal on [Contingency Tables](http://www.jerrydallal.com/LHSP/ctab.htm), and the same remark is made: Continuity-corrected chi-square are useless when it comes to approximate Fisher exact test now that the latter is readily available in any statistical software. Dallal considers the following example:

```r
tab <- matrix(c(8,3,5,10), nr=2)
chisq.test(tab, correct=FALSE)
chisq.test(tab)
fisher.test(tab)
```

<table border="0">
<tbody>
<thead>
<tr>
<th></th>
<th><strong>χ<sup>2</sup></strong></th>
<th><strong>p-value</strong></th>
</tr>
</thead>
<tr>
<td align="right"><strong>Uncorrected χ<sup>2</sup></strong></td>
<td>3.9394</td>
<td>0.0472</td>
</tr>
<tr>
<td align="right"><strong>Corrected χ<sup>2</sup></strong></td>
<td>2.5212</td>
<td>0.1123</td>
</tr>
<tr>
<td align="right"><strong>Fisher χ<sup>2</sup></strong></td>
<td>--</td>
<td>0.1107</td>
</tr>
</tbody>
</table>
<br />

As can be seen, the p-values from the continuity-corrected χ<sup>2</sup> and Fisher's test are in close agreement. The LRT (G-test) would yield χ<sup>2</sup>(1)=4.0573, p=0.0440. It is available through `assocstats()` from the [vcd](http://cran.r-project.org/web/packages/vcd/index.html) package.

## The mid-p approach

<u>TODO</u>

## In summary

All of the above would lead to the following practical considerations:

- For large sample, or Tables satisfying Cochran's rule[^1], use uncorrected chi-square test.<sup>(4,5)</sup> 
- Otherwise, use Fisher's test.

See also [Assumptions/Restrictions for Chi-square Tests on Contingency Tables](https://sites.google.com/a/lakeheadu.ca/bweaver/Home/statistics/notes/chisqr_assumptions), by Bruce Weaver.

Campbell<sup>(6)</sup> discussed the use of Fisher's test in lieu of the usual chi-square test, but see his associated website on [Two by two Tables](http://www.iancampbell.co.uk/twobytwo/twobytwo.htm). As quoted on this website, the following rules are recommended:

- Where all expected numbers are at least 1, analyse by the "N - 1 chi-squared test" (the K. Pearson chi-squared test but with N replaced by N - 1).
- Otherwise, analyse by the Fisher-Irwin test, with two-sided tests carried out by Irwin's rule (taking tables from either tail as likely, or less, as that observed).

## Back to Lydersen et coll.

In their article, Lydersen et coll. said that, as a conditional test, Fisher's test may be replaced by more appropriate unconditional tests depending on the hypothesis of interest.

## References

1. Sokal, RR and Rohlf, FJ (1995). *Biometry* (3rd ed). Freeman.
2. Yates, F (1934). Contingency table involving small numbers and the χ<sup>2</sup> test. Supplement to the Journal of the Royal Statistical Society 1(2): 217–235. 
3. Mantel, N (1974). Some Reasons for Not Using the Yates Continuity Correction on 2 × 2 Contingency Tables: Comment and a Suggestion. Journal of the American Statistical Association 69(346): 378-380.
4. Cochran, WG (1952). The chi-squared test of goodness of fit. Annals of Mathematical Statistics 25: 315–345.
5. Cochran WG (1954). Some methods for strengthening the common [chi-squared] tests. Biometrics 10: 417–451.
6. Campbell, I (2007). Chi-squared and Fisher–Irwin tests of two-by-two tables with small sample recommendations. Statistics in Medicine 26(19): 3661–3675.
7. Haviland, MG (1990). Yates's correction for continuity and the analysis of 2 × 2 contingency tables. Statistics in Medicine 9(4): 363–367.

[^1]: Cochran's rule just says that there must be no expected cell count less than 1 and no more than 20% less than 5; in the 2x2 case, the second rule reduces to all cells.