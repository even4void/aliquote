---
title: "Gradient descent algorithm in Racket"
date: 2019-01-10T13:12:21+01:00
draft: true
description: ""
tags: ["scheme","lisp"]
categories: []
---
Here is a little programming entertainment in Racket to console me for wasting two hours fighting with Excel.

<!--more-->

Briefly, I spent nearly two hours figuring out how to perform a simple regression analysis and some trivial parametric statistics using Excel for a colleague of mine. I don't even talk about computing Spearman rank correlation when there are ties and you must manually apply a correction because there is no automated function in vanilla Excel for that. After I transmitted the result of my morning work, I thought it would finally go as fast to implement a gradient descent algorithm in Scheme and use Gnuplot or anything else for data visualization. Atabey Kaygun already did this [using Common Lisp](https://kaygun.tumblr.com/post/55714055393/a-gradient-descent-implementation-in-lisp), but Racket should do the job as well, notwithstanding the fact that we can benefit from a lot of built-in packages.

First, we need a [CSV reader](https://www.neilvandyke.org/racket/csv-reading/) because the dataset is available as a comma-delimited text file. We will also need basic [helper functions](https://docs.racket-lang.org/math/stats.html) to summarize the data, and also a [plotting framework](https://docs.racket-lang.org/plot/index.html) to visualize the data. Finally, the [gradient descent](http://wiki.fast.ai/index.php/Gradient_Descent) algorithm itself, which consists in  starting with an initial set of parameter values for a given function and iteratively moving toward the set of parameter values that minimize the function. Iteration translates easily in Lisp recursion. In our case, the parameters correspond to the intercept and the slope of the regression line. Obviously, we need an objective or cost function to evaluate and it is based on the squared distance measure of observed and fitted points, much like how residuals are defined in the standard OLS approach. The term "gradient" comes from the fact that we will be working with partial derivatives of the estimated parameters.

Gradient descent is probably best known in Machine Learning applications since [more classical and closed-formed algorithms](https://stats.stackexchange.com/a/164164) are used to solve OLS problems. Depending on the data structure, however, the GD algorithm might provide an interesting alternative, especially in the case [where $n$ is large](http://leon.bottou.org/publications/pdf/mloptbook-2011.pdf), and it works in the case the response variable is binary (aka logistic regression). Note also that there are also other well known variants of this algorithm, like batch or stochastic gradient descent.

Here is the final code: (also [available to download](/pub/gd-bwt.rkt))

```Scheme
(require csv-reading)
(define descent (fun x &key (error 1.0d-5) 
                           (rate 1.0d-2) 
                           (max-steps 10000))
  (let ((len (length x)))
     (do* ((y x (map 'vector '- y step))
           (step (map 'vector 
                      (lambda (i) (* rate (nabla fun y (basis i len)))) 
                      (range len))
                 (map 'vector 
                      (lambda (i) (* rate (nabla fun y (basis i len)))) 
                      (range len)))
           (n 0 (1+ n)))
          ((or (< (norm step) error) 
               (>= n max-steps)) 
           (if (< n max-steps) y)))))
```

Note that you must install `csv-reading` first, e.g., using `raco pkg install csv-reading` at the prompt of your preferred shell.
