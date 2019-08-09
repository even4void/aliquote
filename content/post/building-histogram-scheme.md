---
title: "Building an histogram in Lisp, step by step"
date: 2019-08-07T08:21:06+02:00
draft: true
tags: ["lisp", "dataviz"]
categories: []
---

This post is a rough attempt at constructing a proper histogram for a sequence of real values, usually stored as a list or vector in Common Lisp. With minor adapatations, it should work with Scheme dialects too.

<!--more-->

[Histograms](https://en.wikipedia.org/wiki/Histogram) allow to visually depict the distribution of a continuous variable, and it should not be confused with other graphical displays that use bar-like representation, like in barcharts. This kind of statistical plot expect a discretized variable as input, and in this post we are going to focus on this very specific aspect of binning for a continuous variable.

Gnuplot has no histogram facilities, so you have to run your own implementation, as I did in one of my [previous posts](/post/ten-years/), but see also these [SO](https://stackoverflow.com/a/5948573) [answer](https://stackoverflow.com/a/9279630) of mine. However, R or Stata provide ready-to-use implementations of this statistical estimator as `hist` (or better, `MASS:truehist`) and <u>`hist`</u>`ogram`. In this post, I am going to explore Common Lisp (CL) utilities to work on sequences of integer or real numbers. Indeed, Lisp comes with a class of objects, called _sequences_, which can be lists, vectors or strings. The [iterate](https://www.common-lisp.net/project/iterate/) or [Alexandria](https://github.com/keithj/alexandria) packages are two among many of the packages that provide utilities to manipulate such objects. For instance, using Alexandria it is quite easy to get a permuted series of values stored in a list:

```lisp
(ql:quickload "alexandria")
(defvar *s* '(1 2 3 4 5 6 7 8 9))
(shuffle *s*)
```

Note that it also with strings as well (try replacing the previous list of integers with `"random string"`). Now, we need to design a little helper function that will discretize a continuous variable in $k$ buckets of data, if the list is non-empty of course. Here it is

```lisp
(defun emptyp (lst)
  (eq nil lst))

(defun slice (a b xs &optional (ys '()))
  "Take a subsequence out of a sequence `xs'"
  (cond ((> a 0) (slice (1- a) b (cdr xs) ys))
        ((> b 0) (slice a (1- b) (cdr xs) (cons (car xs) ys)))
        ((reverse ys))))

(defun split (predicate xs)
  "Split a sequence `xs' into two sublists according to a predicate [https://stackoverflow.com/a/18117017]."
  (loop for x in xs
    if (funcall predicate x) collect x into in
    else collect x into out
    finally (return (values in out))))

(defun binning (xs &key (len 10))
  "Convert a sequence of numbers `xs' into packets of size `len' or `bins' packets."
  (unless (<= len 0)
    (let* ((lower (apply #'min xs))
           (upper (apply #'max xs))
           (step (+ lower (/ (- upper lower) len))))
       (multiple-value-bind (bin rest)
           (split (lambda (x) (<= x step)) xs)
         (cons (length bin)
               (binning rest :len (1- len)))))))
```

There may be better alternatives to split the data into buckets, e.g. [`arnesi`](https://common-lisp.net/project/bese/arnesi.html)`:partition` or [`cl21`](https://github.com/cl21/cl21/blob/c36644f3b6ea4975174c8ce72de43a4524dd0696/src/core/sequence.lisp#L1243)`:partition-if`, as well as solutions to [split list into sublists](https://stackoverflow.com/q/47875185) discussed on SO. Note also that Alexandria provides an `emptyp` function. Finally, the `slice` function (adapted from [code available](https://stackoverflow.com/a/35534477) in Scheme) could be used to restrict the values to a specific range in the list. The above code works, at least the function returns the correct counts. Here is an example of use:

```lisp
> (binning '(1 2 3 4 5) :binsize 2)
(3 2)
> (binning '(1 2 3 4 5) :binsize 4)
(2 1 1 1)
```

However, we are lacking some critical information, namely what the values of `xs` range correspond to each bucket counts.
