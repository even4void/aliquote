---
title: "Permutation test in Lisp"
date: 2023-12-22T09:26:56+01:00
draft: false
tags: ["scheme", "statistics"]
categories: ["2023"]
---

I drafted this post in March, along [Wilcoxon test in Lisp](/post/wilcoxon-test-in-lisp/), then forgot about it. How about using a permutation test? Since I ran out of time with implementing a proper version in Common Lisp, and get bored of Hollander & Wolfe's dataset, let's look at this quick [one-liner](https://stats.stackexchange.com/a/43967) in R.

```scheme
(define xs '(12.9 13.5 12.8 15.6 17.2 19.2 12.6 15.3 14.4 11.3))
(define ys '(12.7 13.6 12.0 15.2 16.8 20.0 12.0 15.9 16.0 11.1))
```

From there on, we need a way to generate all pairwise differences for permuted sequences. Although it is tempting to implement a procedure to permute a list of numbers,[^1] and take the first half of the sequence as the first (resampled) sample, we can equivalently generate all combinations of k elements chosen among n ones.[^2] My own implementation in R is shown in [another post](/post/bootstrap-test). Note that I use the unstandardized difference in means, not the test statistic typically computed from a t-test or its non-parametric alternative.

Now, let's do this in Scheme:

```scheme
(define (combn k xs)
  (cond ((= k 0) '(()))
        ((null? xs) '())
        (else (append (map (lambda (x) (cons (car xs) x))
                           (combn (- k 1) (cdr xs)))
                      (combn k (cdr xs))))))
```

We could mimic the R code above by computing the difference in means between each combination and its complement (i.e. the element of `xs` or `ys` not already present in the combination), but let's simplify the problem a bit: the two samples are of equal size, hence the sum provides the same amount of information as the mean. Furthermore, we only need to compute one of the two sums since the other one can be deduced from the grand sum. Hence the sum of the permuted sequence is a sufficient statistic. Let's test the above code by computing the sum of each sub-lists formed using 9 elements taken in `xy`, which results from the concatenation of `x` and `ys`:

```scheme
(define xy (append xs ys))
(map (lambda (x) (apply + x)) (combn (length xs) xy))
;; => (144.8 146.2 147.1  ...
```

The original value is `(apply + xs)`, and it will be our reference to compute the proportion of values that are at least more extreme on the distribution of permuted test statistics. The answer only requires to modify the previous code a little bit:

```scheme
(define pdist (combn (length xs) xy))
(define stat (apply + xs))
(define pos (map (lambda (x) (cond ((> (apply + x) stat) 1) (else 0))) pdist))
(exact->inexact (/ (foldr + 0 pos) (length pos)))
;; => 0.514332416809197
```
<small>`(apply + pos)` yields a stack overflow in this case, hence the use of right folding. Using a similar approach, I got 0.5210061 from R.</small>

{{% music %}}Alina Bzhezhinska & Hip Harp Collective • _Meditation_{{% /music %}}

[^1]: Regarding permutation in Scheme, I would recommend using algorithm from Shmuel Zaks, [A new algorithm for generation of permutations](https://link.springer.com/article/10.1007/BF01937486) (Technical Report 220, Technion-Israel Institute of Technology, 1981), from Programming Praxis prelude (originally [written in Scheme](https://programmingpraxis.com/contents/standard-prelude/#comment-2790)). It works well for small n, but not that well when n=20 (because of heap size limit). Should you rather prefer using Lisp, you certainly want to use `flet`, `zerop`, and `nthcdr` in place of local `define`, `zero?` and `list-tail` (and maybe some other substitutes that I have overlooked).
[^2]: See also Combinations from a Set in [Chapter 1](https://people.eecs.berkeley.edu/~bh/ssch1/showing.html) of _Simply Scheme_.
