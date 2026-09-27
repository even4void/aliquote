---
title: "Chi-squared test in Wolfram"
date: 2026-09-25T21:06:01+02:00
draft: false
tags: ["statistics", "mathematica", "stata"]
categories: ["2026"]
---

In the past, I often found myself using a Poisson regression to analyze
cross-tabulated data and perform a chi-squared test of association, even if this
entails building a full GLM for a very particular case. After all log-linear
models are a superset of the basic analysis of a simple contingency table (see
[here][1] for an application in the particular case of a 2x2 table). You'll get
everything you need: test statistic, p-value, expected values and residuals.
Unlike R or Stata, Wolfram does not offer a chi-squared test of independence for
contingency table. Instead, Wolfram comes up with a dedicated procedure,
`PearsonChiSquareTest`, but it is not exactly what you may think of. In fact it
is one of the other applications of the χ² test where we compare observed data
(i.e., the empirical CDF) to expected values from a given distribution. In other
words, it is a goodness-of-fit test.

You'll find a good introduction in Knuth's TAOCP (vol. 2, *Seminumerical
Algorithms*) to assess randomness of a sequence of numbers (possibly generated
by a PRNG). See also [Knuth's series for chi squared percentage points][2] by
John D. Cook.

[Andy Ross][3] gave an example of how to perform a proper χ² test for a
one-dimensional dataset:

```wolfram
pearsonTest[obs_List, exp_List] /; Length[obs] == Length[exp] :=
 Block[{t},
  t = Total[(obs - exp)^2/exp] // N;
 {Rule["chisqr", t], 
  Rule["p-val", SurvivalFunction[ChiSquareDistribution[Length[exp] - 1], t]]}  
  ]

pearsonTest[{115, 188, 97}, {100, 200, 100}]
```

The output matches what would be obtained in R with
`chisq.test(c(115,188,97), c(100,200,100))`, except that Wolfram always performs
exact numerical computation (try to remove the // N in the above function).
Stata got it right too: (you'll need to `ssc install tab_chi first`.)

```stata
. chitesti 115 188 97 \ 100 200 100

observed frequencies from keyboard; expected frequencies from keyboard

         Pearson chi2(2) =   3.0600   Pr =  0.217
```

[Bill Huber][4] also showed how to perform a chi-squared test for a contingency
table. This is the right approach when analyzing a two-way table. In Stata, we
could use the `chi2` (and maybe `expected`) option to `tabulate`. In R we could
again rely on `chisq.test()` with a properly formatted two-way table.

When using a Poisson regression model it is as simple as comparing the full
model with a baseline model (intercept only) using `anova()`. If you look at the
help for `anova.glm()`, you'll notice that there are both an LRT and a score
(Rao) tests, which is all you need. Considering two categorical variables, $X_1$
and $X_2$, the model (log of the counts) reads:

$$
  log(y) = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + \beta_3 X_1 X_2,
$$

and the test of independence we use in a standard $\chi^2$ test for a
contingency table amounts to test $H_0: \beta_3 = 0$, which reads "no
interaction between $X_1$ and $X_2$."

Consider the builtin dose dataset from Stata, which is comprised of 96
observations relating dose frequency (dosage) and time to recovery (function):

```stata
. tabulate dose function, chi2 expected

+--------------------+
| Key                |
|--------------------|
|     frequency      |
| expected frequency |
+--------------------+

           |             Function
    Dosage |    < 1 hr     1 to 4         4+ |     Total
-----------+---------------------------------+----------
     1/day |        20         10          2 |        32 
           |      15.3       12.7        4.0 |      32.0 
-----------+---------------------------------+----------
     2/day |        16         12          4 |        32 
           |      15.3       12.7        4.0 |      32.0 
-----------+---------------------------------+----------
     3/day |        10         16          6 |        32 
           |      15.3       12.7        4.0 |      32.0 
-----------+---------------------------------+----------
     Total |        46         38         12 |        96 
           |      46.0       38.0       12.0 |      96.0 

          Pearson chi2(4) =   6.7780   Pr = 0.148
```

Note that we could do better by accounting for the fact that the two variables
are ordinal in nature and report Kendall $\tau_B$ instead of Pearson's $\chi^2$.

Here's a regression model in Wolfram:

```wolfram
data = Import["https://www.stata-press.com/data/r19/dose.dta"];
ds = Partition[Flatten[MapAt[# - 1 &, Tally[data], {All, 1}]], 3];
m = GeneralizedLinearModelFit[ds, {x1, x2}, {x1, x2}, 
  NominalVariables -> {x1, x2}, ExponentialFamily -> "Poisson"]
testStatistic = m["PearsonChiSquare"] (* 6.77803 *)
Needs["HypothesisTesting`"];
ChiSquarePValue[testStatistic, m["ResidualDegreesOfFreedom"]] (* OneSidedPValue -> 0.148094 *)
```

The second expression above is use to convert the raw (unlabeled) dataset to
3-column array with row number, column number and associated counts. You can
verify what is done by inspecting the final result with `ds // MatrixForm`.
Unlike what is shown in the mathematica.SE thread linked above, I ask that
Wolfram treat the two variables as categorical variables. I found this is not
much more code than implementing the test of independence as a Module. There's
more to see in the help file, but you could use `m["PredictedResponse"]` to get
the expected values displayed in the Stata table above.

[1]: https://demonstrations.wolfram.com/ComparingModelsForTwoWayContingencyTables/
[2]: https://www.johndcook.com/blog/2025/04/29/knuths-chisq/
[3]: https://mathematica.stackexchange.com/a/5590
[4]: https://mathematica.stackexchange.com/a/5285

{{% music %}}The Neighbourhood • *Sweater Weather*{{% /music %}}
