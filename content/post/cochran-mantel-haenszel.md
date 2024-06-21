---
title: "Cochran-Mantel-Haenszel test"
date: 2024-06-21T20:53:23+02:00
draft: false
tags: ["statistics", "rstats", "python", "stata"]
categories: ["2024"]
---

Yesterday I was looking for some implementation of the Cochran-Mantel-Haenszel test in Python. Inasmuch as I like Python for web dev and string processing, I always find it surprising that people prefer to stay in Python rather than use dedicated statistical packages. Anyway, here's how I went to benchmark the [CMH](https://pypi.org/project/CMH/) package against R and Stata.

First of all, I started looking at whta's available in the [statsmodels](https://www.statsmodels.org/stable/index.html) package. I remain impressed by the progress developers have made over the last ten years in terms of the quality, usability and diversity of the procedures available. However, while there's an homogeneity test for stratified tables (along with the Breslow–Day test), it is limited to [2x2 tables](https://www.statsmodels.org/stable/generated/statsmodels.stats.contingency_tables.StratifiedTable.html#statsmodels.stats.contingency_tables.StratifiedTable).[^1] Soon after I found the CMH package whihc looks like what was I was looking for since it handles extensions of Cochran–Mantel–Haenszel statistics to K-way tables with more than two categories.

Here's a little benchmark taken from the R on-line help for stats::mantelhaen.test in R:

```r
> Satisfaction <-
     as.table(array(c(1, 2, 0, 0, 3, 3, 1, 2,
                      11, 17, 8, 4, 2, 3, 5, 2,
                      1, 0, 0, 0, 1, 3, 0, 1,
                      2, 5, 7, 9, 1, 1, 3, 6),
                    dim = c(4, 4, 2),
                    dimnames =
                    list(Income =
                         c("<5000", "5000-15000",
                           "15000-25000", ">25000"),
                         "Job Satisfaction" =
                         c("V_D", "L_S", "M_S", "V_S"),
                         Gender = c("Female", "Male"))))
> ftable(. ~ Gender + Income, Satisfaction)
                   Job Satisfaction V_D L_S M_S V_S
Gender Income
Female <5000                          1   3  11   2
       5000-15000                     2   3  17   3
       15000-25000                    0   1   8   5
       >25000                         0   2   4   2
Male   <5000                          1   1   2   1
       5000-15000                     0   3   5   1
       15000-25000                    0   0   7   3
       >25000                         0   1   9   6
> mantelhaen.test(Satisfaction)
        Cochran-Mantel-Haenszel test

data:  Satisfaction
Cochran-Mantel-Haenszel M^2 = 10.2, df = 9, p-value = 0.3345
```

I exported the above dataset as a dataframe with one row per observation as follows:

```r
> dd <- as.data.frame(Satisfaction)
> write.csv(dd[rep(row.names(dd), dd$Freq), 1:3], file = "satisfaction.csv", row.names = FALSE)
```

I got the same result in Stata:

```stata
. import delimited /home/chl/tmp/satisfaction.csv, varnames(1)

. foreach v of varlist income-gender {
  2.   encode `v', gen(`v'_)
  3.   drop `v'
  4. }

. rename *_ *

. emh income jobsatisfaction, strata(gender) general

Extended Mantel-Haenszel (Cochran-Mantel-Haenszel) Stratified Test of Association

General Association Statistic:
Q (9) = 10.2001, P = 0.3345
Transformation: Table Scores (Untransformed Data)
```

Then, in Python, it is as simple as the following snippet:

```python
import pandas as pd
from cmh import CMH

df = pd.read_csv("satisfaction.csv")
r = CMH(df, 'Income', 'Job.Satisfaction', stratifier='Gender')
r


        Cochran-Mantel-Haenszel Chi2 test

"Income" x "Job.Satisfaction", stratified by "Gender"

Cochran-Mantel-Haenszel M^2 = 12.29047, dof = 9, p-value = 0.1974
```

And so it begins. The test statistics and their respective p-values do not match. Querying the online help from IPython suggests there's an `adjustment` option, with no indication of what it means actually. I thought it would maybe related to some kind of continuity correction[^2] and I went right away check the source code on GitHub. Sadly, there was not `adjustment` parameter in the GH code, although there's one in my local package (installed via `pip`):

```python
# -%<---------------
    # Create stratified contingency tables
    for k in range(K):
        cat = df[stratifier].cat.categories[k]

        subset = df.loc[df[stratifier] == cat, [var, outcome]]
        xs = pd.crosstab(subset[outcome], subset[var], dropna=False)
        contingency_tables[:, :, k] = xs  + adjustment
# ->%---------------
```

Since the author claims his code is based on Agresti (*Categorical Data Analysis*, 2002), I also checked the textbook. It was long time since I didn't open it, btw.

{{% music %}}New Order • _Blue Monday_{{% /music %}}

[^1]: It's worth noting that they apply a continuity correction by default.
[^2]: If I'm not mistaken, Fisher-Yates correction only applies in the case of 2x2 tables.
