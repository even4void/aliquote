---
title: "Welford algorithm in Newlisp"
date: 2023-03-20T11:54:10+01:00
draft: false
tags: ["lisp", "statistics"]
categories: ["2023"]
---

A few years ago we discussed the Welford algorithm to [compute the variance](/post/computing-variance/) of a vector of numerical values [without catastrophic cancellation](https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance). In addition to being numerically stable, the difference with Kahan-compensated two-pass computations for large data sets are very small. See also [Numerically stable algorithm for computing the running mean](https://nullbuffer.com/articles/welford_algorithm.html) for related approaches, and John D. Cook's [original post](https://www.johndcook.com/blog/2008/09/28/theoretical-explanation-for-numerical-results/). The stability and numerical accuracy of one-pass algorithms are also discussed in several textbooks.[^1]

While reviewing Newlisp statistical function in the [stat](http://www.newlisp.org/code/modules/stat.lsp.html) module, I noticed it should get it wrong in this case:

```lisp
(module "stat.lsp")
(set 'x (sequence 1 5))
(stat:var x)
;; => 2.5
(stat:var (map (lambda (x) (+ 1e10 x)) x))
;; => -16384
```

The author uses the formula `(sub (sum-sq X) (div (mul (sum X) (sum X)) (length X)))` (later corrected for bias), which is the same that was discussed in the previous post.

Note that Racket has no problem with this cornercase.[^2] Let's implement the single-pass Welford algorithm in Newlisp, as a rough translation of the R code provided in the previous post:

```lisp
(define (variance xs)
    (let ((mean 0.0)
          (variance 0.0)
          (n (length xs)))
          (dotimes (i n)
              (setq curr (nth i xs))
              (setq tmp mean)
              (setq mean (add mean (div (sub curr mean) (+ i 1))))
              (setq variance (add variance (mul (sub curr mean) (sub curr tmp)))))
    (div variance (- n 1))))

(variance (map (lambda (x) (+ 1e10 x)) x))
;; => 2.5
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

I should not that Tom MacWright gets it right too in his [simple-statistics](https://simple-statistics.github.io/) module:

```javascript
const ss = require("../dist/simple-statistics.js");
ss.sampleVariance([1, 2, 3, 4, 5].map((x) => x + 1e10));
```

The take away message is that you should either rely on a two-pass algorithm (i.e., compute the mean first, then the squared deviations from the mean) or the Welford algorithm, especially if you are interested in running statistics.

{{% alert note %}}
<small>[2023-11-23]</small><br>
As I was surveying the various statistical packages lying around on GitHub, I found many buggy implementations (e.g., `basic-statistics.lisp` in [LispUtils](https://github.com/MBcode/LispUtils)). However, [cl-ana](https://github.com/ghollisjr/cl-ana) got it right:

```lisp
(ql:quickload "cl-ana")
(defparameter *xs* '(1 2 3 4 5))
(cl-ana::variance *xs*)
;; => 5/2
(cl-ana::variance (mapcar (lambda (x) (+ 10000000 x))  *xs*))
;; => 5/2
```
{{% /alert %}}

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
