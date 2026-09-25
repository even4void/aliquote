---
title: "Chi-squared test in Wolfram"
date: 2026-09-25T21:06:01+02:00
draft: true
tags: ["statistics", "mathematica"]
categories: ["2026"]
---

In the past, when it was still called Mathematica, I often found myself using a
Poisson regression to analyze cross-tabulated data and perform a chi-squared
test of association, even if this entails building a full GLM for a very
particular case. But after all log-linear models are a superset of the basic
analysis of a simple contingency table (see [here][1] for an application in the
particular case of a 2x2 table). Wolfram comes up with a dedicated procedure,
PearsonChiSquareTest, but it is not exactly what you may think of. In fact it is
one of the other applications of the χ² test where we compare observed data
(i.e., the empirical CDF) to expected values from a given distribution. In other
words, it is a goodness-of-fit test.

Andy Ross gave an example of how to perform a proper χ² test for one-dimensional
dataset:

pearsonTest[obs_List, exp_List] /; Length[obs] == Length[exp] := Block[{t}, t =
Total[(obs - exp)^2/exp] // N; {Rule["chisqr", t], Rule["p-val",
SurvivalFunction[ChiSquareDistribution[Length[exp] - 1], t]]} ]

pearsonTest[{115, 188, 97}, {100, 200, 100}] The output matches what would be
obtained in R with chisq.test(c(115,188,97), c(100,200,100)), except that
Wolfram always performs exact numerical computation (try to remove the // N in
the above function). Stata got it right too: (you'll need to ssc install tab_chi
first.)

. chitesti 115 188 97 \ 100 200 100

observed frequencies from keyboard; expected frequencies from keyboard

```
     Pearson chi2(2) =   3.0600   Pr =  0.217
```

[1]: https://demonstrations.wolfram.com/ComparingModelsForTwoWayContingencyTables/
[2]: https://mathematica.stackexchange.com/a/5590

{{% music %}}The Neighbourhood • *Sweater Weather*{{% /music %}}
