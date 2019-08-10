---
title: "Building an histogram in Lisp"
date: 2019-08-09T08:21:06+02:00
draft: true
tags: ["lisp", "statistics", "dataviz"]
categories: []
---

This post is a rough attempt at constructing a proper histogram for a sequence of real values, usually stored as a list or vector in Common Lisp. With minor adapatation, it should work with Scheme dialects too.

<!--more-->

[Histograms](https://en.wikipedia.org/wiki/Histogram) allow to visually depict the distribution of a continuous variable, and they should not be confused with other graphical displays that use bar-like representation, like barcharts. This kind of statistical plot expect a discretized variable as input, and in this post we are going to focus on this very specific aspect of binning for a continuous variable. From a purely statistical and technical viewpoint, the probability that a random variable (r.v.) $X$ lies in a specific interval can be represented using the cumulative distribution function, defined as $F(x)=\Pr(X\le x)$; its inverse corresponds to the quantile function. Another well-known estimator of the probability law of an r.v. is, of course, the density function, defined as $\Pr(a< X\le b)=\int_a^bf(t)dt$, and an histogram is nothing else than yet another estimator of the density of a continuous r.v.. More discussion is available on [Arthur Charpentier](https://freakonometrics.hypotheses.org/57221)'s excellent blog.

Gnuplot has no histogram facilities, so you have to run your own implementation, as I did in one of my [previous posts](/post/ten-years/), but see also these [SO](https://stackoverflow.com/a/5948573) [answers](https://stackoverflow.com/a/9279630) of mine. However, R or Stata provide ready-to-use implementations of this statistical estimator as `hist` (or better, `MASS:truehist`) and <u>`hist`</u>`ogram`. In this post, I am going to explore Common Lisp utilities to work on sequences of integer or real numbers. Indeed, Lisp comes with a class of objects, called _sequences_, which can be lists, vectors or strings. The [iterate](https://www.common-lisp.net/project/iterate/) or [Alexandria](https://github.com/keithj/alexandria) packages are two among many of the packages that provide utilities to manipulate such objects. For instance, using Alexandria it is quite easy to get a permuted series of values stored in a list:

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

There may be better alternatives to split the data into buckets, e.g. [`arnesi`](https://common-lisp.net/project/bese/arnesi.html)`:partition` or [`cl21`](https://github.com/cl21/cl21/blob/c36644f3b6ea4975174c8ce72de43a4524dd0696/src/core/sequence.lisp#L1243)`:partition-if`, as well as solutions to [split list into sublists](https://stackoverflow.com/q/47875185) discussed on SO. Note also that Alexandria provides an `emptyp` function. Finally, the `slice` function (adapted from [code available](https://stackoverflow.com/a/35534477) in Scheme) could be used to restrict the values to a specific range in the list, as when computing a trimmed mean, for instance. The above code works, at least the function returns the correct counts. Here is an example of use:

```lisp
> (binning '(1 2 3 4 5) :binsize 2)
(3 2)
> (binning '(1 2 3 4 5) :binsize 4)
(2 1 1 1)
```

However, we are lacking some critical information, namely the labels for each bucket counts, i.e. which range of values of `xs` correspond to each count. It would also be nice to compute an optimal number of bins automagically, e.g., using [Sturge's formula](https://en.wikipedia.org/wiki/Histogram#Sturges'_formula) or Scott's normal reference rule.[^1] After some updates, here is the code for the `binning` function:

```lisp
(defun binning (xs)
"Convert a sequence of numbers `xs' into k packets using Sturge's formula."
  (let* ((len (1+ (ceiling (/ (log (length xs)) (log 2))))))
    ))
```

Now, let's go test this function with a more realistic sample of values. Here is how we generate an artificial dataset of size $n=100$, based on random gaussian draws from the [GSLL package](https://common-lisp.net/project/gsll/):

```lisp
(ql:quickload "gsl")
(defvar *rng* (gsl:make-random-number-generator gsl:+mt19937+ 0))
(defvar μ 12)
(defvar σ 2)
(defvar x (gsl:sample *rng* :gaussian :sigma σ)))
```

[^1]: The R statistical package uses Sturge's formula, meaning the default number of bins is computed as $\lceil \log_2(n)\rceil + 1$. Stata considers $\text{min}\left\{\sqrt{N},10\ln(N)/\ln(10)\right\}$, which is close. The [Freedman-Diaconis](https://en.wikipedia.org/wiki/Freedman–Diaconis_rule) rule is also quite robust, where the bin width is chosen as $h=2\text{IQR}n^{-1/3}$ (IQR, interquartile range), so that the number of bins is $(\text{max}-\text{min})/h$.
