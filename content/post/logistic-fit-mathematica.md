---
title: "Logistic Fit Mathematica"
date: 2022-06-27T20:04:23+02:00
draft: true
tags: ["mathematica"]
categories: ["2022"]
---

In an [older post] I showed how we could fit a Logistic regression using Racket builtin linear algebra routines.

It is not difficult to import a CSV file and get a working Table for a Logistic regression model, or any other model from the Exponential family really. Here's how I did for the classical low birthweight dataset from Hosmer & Lemeshow[^1], where I consider a single predictor (age of the mother):[^2]

```mathematica
data = Import["~/Documents/work/tutors/CESAM/cours/Stata/birthwt2.csv"];
dt = data[[2 ;;, {2, 1}]];
m = GeneralizedLinearModelFit[dt, x, x, ExponentialFamily -> "Binomial"]
```

Note that we could also use `SemanticImport` to get a "Dataset" structured array, but since it is not callable from `GeneralizedLinearModelFit`, let's stay with classical list of lists. From here now, almost all we need is now available in our "FittedModel" `m`, and we can even display the regression equation using the following incantation:

```mathematica
m // Normal
```

Now, what I really want is to display the logistic fitted curve together with observed proportions of low birth weights (< 2.5 kg) at each decile of age (see my other post to get an idea of this observed vs. fitted proportion display). In Mathematica, there are some grouping and binning functions (`AggregatedEntityClass`, `SplitBy`, `GatherBy`, `BinLists`, `BinCounts`) or one could also rely on [histogram binning].

First we need to add a column indicating to which decile each value of age belongs to. Here is my solution, which relies on the empirical distribution function instead of the `Quantile` function. This is partly inspired by a solution proposed by [Sjoerd C. de Vries] to a similar problem:

```mathematica
ecdf = EmpiricalDistribution[dt[[All, 1]]];
f[x_] := 1 + CDF[ecdf, x] 10 // Floor
qvalues = Map[f, dt[[All, 1]]]
```

Next, we will replace decile indices with the class center of the real values.

{{% music %}}Daft Punk • _Da Funk_{{% /music %}}

[^1]: David W. Hosmer and Stanley Lemeshow, Applied Logistic Regression, Wiley, 2000.
[^2]: The response variable should come last.

[older post]: /post/newton-raphson-racket/
[histogram binning]: https://mathematica.stackexchange.com/a/127734/167
[sjoerd c. de vries]: https://mathematica.stackexchange.com/a/42000/167
