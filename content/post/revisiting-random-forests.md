---
title: "Revisiting Random Forests"
date: 2023-11-22T10:40:52+01:00
draft: false
tags: ["statistics", "rstats", "lisp"]
categories: ["2023"]
---

I've been a heavy user of [Random Forests](/post/visualizing-what-random-forests-really-do/) in the past (both for applied work and theoretical foundations of ensemble learning and bagging techniques). I very much like [Leo Breiman](https://www.stat.berkeley.edu/~breiman/)'s work, and I warmly recommend you to take a look at his WALD lectures if you haven't already done so. I've lost track of all the packages I tried back at the time (mostly R and C), and recently I came across Norm Matloff's new package, [qeML](https://github.com/matloff/qeML), which provides standard R code to perform ML workflow in seamingless fashion (much like caret did once upon a time, but it looks like folks are using [pipe-oriented tidy stuff](https://www.rebeccabarter.com/blog/2020-03-25_machine_learning) these days).

We could use the Boston Housing dataset from Breiman & Cutler, available as [boshouse.txt](https://www.stat.berkeley.edu/~breiman/RandomForests/reg_examples/boshouse.txt).[^1] It features 13 numerical variables for a total of 506 observations. However, it's missing the outcome (median value of owner-occupied homes). Let's grab the data from the [mlbench](https://search.r-project.org/CRAN/refmans/mlbench/html/BostonHousing.html) package. Here's how I would usually do using R, without splitting the dataset into a training and test sample:

```r
library(randomForest)
data(BostonHousing, package = "mlbench")
## Codebook
## --------
## CRIM: Per capita crime rate by town
## ZN: Proportion of residential land zoned for lots over 25,000 sq. ft
## INDUS: Proportion of non-retail business acres per town
## CHAS: Charles River dummy variable (= 1 if tract bounds river; 0 otherwise)
## NOX: Nitric oxide concentration (parts per 10 million)
## RM: Average number of rooms per dwelling
## AGE: Proportion of owner-occupied units built prior to 1940
## DIS: Weighted distances to five Boston employment centers
## RAD: Index of accessibility to radial highways
## TAX: Full-value property tax rate per $10,000
## PTRATIO: Pupil-teacher ratio by town
## B: 1000(Bk — 0.63)², where Bk is the proportion of [people of African American descent] by town
## LSTAT: Percentage of lower status of the population
## MEDV: Median value of owner-occupied homes in $1000s (*outcome*)
set.seed(101)
m <- randomForest(medv ~ ., data = BostonHousing, importance=TRUE)
print(m)
Metrics::mae(BostonHousing$medv, predict(m))
```

I got 88.18% of explained variance with a residual mean square error of 9.98. The mean absolute error is estimated as 2.10. Note that using default settings, this function considered 500 trees, and we didn't bother optimizing the `mtry` parameter (or other subtleties, like `nodesize` and `sampsize`). Okay, this is just looking at raw results, and we could do way better for reporting purpose, see, e.g., this [tutorial](https://uc-r.github.io/random_forests). Now, with `qeML`, we can perform the above steps using a one-liner:

```r
library(qeML)
m <- qeRF(BostonHousing, "medv")
m$trainAcc
# replicMeans(100,"qeRF(BostonHousing, 'medv')$testAcc")
```

The accuracy on the training set (to keep close to the previous analysis which did not consider an holdout sample) again relies on the averaged prediction for the outcome (mean absolute prediction error) is now 1.17. The last expression will take longer since it runs the RF algorithm 100 times, but you'll get more a reliable estimate of prediction accuracy on a test sample. There are some interesting [vignettes](https://cloud.r-project.org/web/packages/qeML/vignettes/) on CRAN if you want to learn more about prediction using ML methods, feature selection, class imbalances, etc.

Last but not least, did you known Random Forests can be fitted directly in Common Lisp? We will first need to convert the R dataset to a [plain text](/pub/boshous.txt) file (`write.table(format(transform(BostonHousing, chas = as.numeric(chas) - 1), digits = 2, nsmall = 1, scientific = FALSE), file = "boshous.txt", sep = "\t", col.names = FALSE, row.names = FALSE, quote = FALSE)`), load it into SBCL REPL and convert it to a Lisp 2D array. I spent a lot of time debugging a type error in Lisp because I didn't notice that the `chas` variable was stored as a factor (with levels {1,2}) which get exported as {0,1}, and not {0.0,1.0} despite the call to `format` above.

```lisp
(ql:quickload "cl-csv")
(ql:quickload "parse-number")
(ql:quickload "cl-slice")
(ql:quickload "cl-random-forest")

(defun numlist (lst)
  (mapcar #'parse-number:parse-number lst))

(defun as-array (lst)
  (make-array (list (length lst)
                    (length (car lst)))
              :element-type 'single-float
              :initial-contents lst))

(defparameter *data* (as-array (cl-csv:read-csv #P"boshous.txt" :separator #\Tab :map-fn #'numlist)))
(defparameter *X* (cl-slice:slice *data* t (cons 0 13)))
(defparameter *Y* (cl-slice:slice *data* t 13))

(defparameter *rforest*
  (cl-random-forest:make-regression-forest *X* *Y*
                          :n-tree 500 :bagging-ratio 0.6
                          :max-depth 5 :min-region-samples 5 :n-trial 10))

(test-regression-forest *rforest* *test* *test-target*)
```

It's pretty fast and it can even be parallelized using the [lparallel](https://lparallel.org/) library. I wasted enough time with a simple typing error for today, so in a future post, I will try to extend the previous code in order to compute the RMSE using a holdout sample and to plot the fitted values with Gnuplot.


That was quick, but there are many other [RF models](https://cloud.r-project.org/web/packages/qeML/vignettes/ML_Overview.html#random-forests) that you can try from the qeML package. Finally, let's pay attention to Breiman's own [advice](https://www.stat.berkeley.edu/~breiman/RandomForests/reg_philosophy.htm):

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
