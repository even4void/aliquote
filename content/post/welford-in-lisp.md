---
title: "Welford algorithm in Lisp"
date: 2023-03-20T11:54:10+01:00
draft: true
tags: ["lisp", "statistics"]
categories: ["2023"]
---

A few years ago we discussed the Welford algorithm to [compute the variance](/post/computing-variance/) of a vector of numerical values [without catastrophic cancellation](https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance). In addition to being numerically stable, the difference with Kahan-compensated two-pass computations for large data sets are very small. See also [Numerically stable algorithm for computing the running mean](https://nullbuffer.com/articles/welford_algorithm.html) for related approaches, and John D. Cook's [original post](https://www.johndcook.com/blog/2008/09/28/theoretical-explanation-for-numerical-results/). The stability and numerical accuracy of one-pass algorithms are also discussed in several textbooks.[^1]

While reviewing Newlisp statistical function in the [stat](http://www.newlisp.org/code/modules/stat.lsp.html) module, I noticed it should get it wrong in this case:

```lisp
(module "stat.lsp")
(setf x (sequence 1 5))
(stat:var x)
;; => 2,5
(stat:var (map (lambda (x) (+ 1e10 x)) x))
;; => -16384
```

The author uses the formula `(sub (sum-sq X) (div (mul (sum X) (sum X)) (length X)))` (later corrected for bias), which is the same that was discussed in the previous post.

Note that Racket has no problem with this cornercase.[^2] Let's implement the single-pass Welford algorithm in Newlisp, as a rough translation of the R code provided in the previous post:

```lisp

(setf xs (sequence 1 5))
(let ((mean 0) (variance 0)) (for (j 1 (length xs)) (let (x (nth (- j 1) xs) (tmp mean)) (setq mean (+ tmp (/ (- x tmp) j))) (println mean))))

(let ((mean 0) (variance 0)) (for (j 1 (length xs)) (setq x (nth (- j 1) xs)) (setq tmp mean) (setq mean (+ mean (/ (- x mean) j))) (setq variance (+ variance (* (- xs mean) (- xs tmp))))) (/ variance (- n 1)))

```

A more idiomatic way of writing a standard function in CL, which follows Racket's two-pass approach, would be:

```lisp
(defun mean (xs)
  (/ (reduce #'+ xs) (length xs)))

(defun variance (xs)
  (let ((mean (mean xs))
        (n (length xs))
    (/ (reduce #'+ (map 'list #'(lambda (x) (square (- mean x))) xs))
       (1- n))))
```

<small>This assumes that we also have a function to compute the mean, as in Racket.</small>

{{% music %}}Tracy Chapman • _Fast Car_{{% /music %}}

[^1]: See, e.g., N.J. Higham, _Accuracy and Stability of Numerical Algorithms_ (2nd ed.), SIAM 2002. (section 1.9)
[^2]: Here's the test case:

    ```scheme
    (require math)
    (define x '(1 2 3 4 5))
    (exact->inexact (variance x #:bias #t))
    ;; => 2.5
    (exact->inexact (variance (map (lambda (x) (+ 1e10 x)) x) #:bias #t))
    ;; => 2.5
    ```
