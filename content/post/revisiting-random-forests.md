---
title: "Revisiting Random Forests"
date: 2023-11-22T10:40:52+01:00
draft: true
tags: ["statistics", "rstats", "lisp"]
categories: ["2023"]
---

I've been a heavy user of Random Forests in the past (both for applied work and theoretical foundations of ensemble learning and bagging techniques). I very much like [Leo Breiman](https://www.stat.berkeley.edu/~breiman/)'s work, and I warmly recommend you to take a look at his WALD lectures if you haven't already done so. I've lost track of all the packages I tried back at the time (mostly R and C), and recently I came across Norm Matloff's new package, [qeML](https://github.com/matloff/qeML), which provides standard R code to perform ML workflow in seamingless fashion (much like caret did once upon a time, but it looks like folks are using [pipe-oriented tidy stuff](https://www.rebeccabarter.com/blog/2020-03-25_machine_learning) these days).

I will use the Boston Housing dataset from Breiman & Cutler, available as [boshouse.txt](https://www.stat.berkeley.edu/~breiman/RandomForests/reg_examples/boshouse.txt).[^1] It features 13 numerical variables for a total of 506 observations.



Here's how I would usually do:

```r
library(randomForest)
d <- read.table("boshouse.txt")
names(d) <- c()
```

Now, with `qeML`, we can perform the above steps using a one-liner:

```r
library(qeML)
m <- qeRF(d,'Weight')
m$baseAcc
replicMeans(100,"qeRF(mlb1,'Weight')$testAcc")
```

Last but not least, let's refit the same model in Common Lisp.

Finally, let's pay attention to Breiman's own [advice](https://www.stat.berkeley.edu/~breiman/RandomForests/reg_philosophy.htm):

> RF is an example of a tool that is useful in doing analyses of scientific data.<br>
> But the cleverest algorithms are no substitute for human intelligence and knowledge of the data in the problem.<br>
> Take the output of random forests not as absolute truth, but as smart computer generated guesses that may be helpful in leading to a deeper understanding of the problem.


{{% music %}}Nick Cave and the Bad Seeds • _Bring it on_{{% /music %}}

[^1]: The augmented version of this dataset is also available from the [mlbench](https://search.r-project.org/CRAN/refmans/mlbench/html/BostonHousing.html) package, and the original and augmented datasets can be downloaded directly from [Statlib](https://lib.stat.cmu.edu/datasets/). It is no longer available in the _de facto_ standard ML library for Python, though:

```python
>>> from sklearn.datasets import load_boston

ImportError:
`load_boston` has been removed from scikit-learn since version 1.2.

The Boston housing prices dataset has an ethical problem: as
investigated in [1], the authors of this dataset engineered a
non-invertible variable "B" assuming that racial self-segregation had a
positive impact on house prices [2]. Furthermore the goal of the
research that led to the creation of this dataset was to study the
impact of air quality but it did not give adequate demonstration of the
validity of this assumption.

The scikit-learn maintainers therefore strongly discourage the use of
this dataset unless the purpose of the code is to study and educate
about ethical issues in data science and machine learning.
```
