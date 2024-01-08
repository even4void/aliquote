---
title: "Permutation test in Lisp"
date: 2023-12-22T09:26:56+01:00
draft: true
tags: ["scheme", "statistics"]
categories: ["2023"]
---

I drafted this post in March, along [Wilcoxon test in Lisp](/post/wilcoxon-test-in-lisp/), then forgot about it. How about using a permutation test? We will be using this time a paired sample design from the same authors, on measurements taken from the Hamilton depression scale in 9 patients with mixed anxiety and depression, taken at two occasions -- before and after initiation of the administration of a tranquilizer (Hollander & Wolfe, 1973). With such a small sample size, we can compute an exact permutation test, which would be close to a [one-liner](https://stats.stackexchange.com/a/43967) in R.

```scheme
(define xs '(1.83 0.50 1.62 2.481.681.881.553.061.30))
(define ys '(0.878 0.647 0.598 2.05 1.06 1.29 1.06 3.14 1.29))
```

I will be using algorithm from Shmuel Zaks, [A new algorithm for generation of permutations](https://link.springer.com/article/10.1007/BF01937486) (Technical Report 220, Technion-Israel Institute of Technology, 1981), from Programming Praxis prelude (originally [written in Scheme](https://programmingpraxis.com/contents/standard-prelude/#comment-2790)). Should you rather prefer using Lisp, you certainly want to use `flet`, `zerop`, and `nthcdr` in place of local `define`, `zero?` and `list-tail` (and maybe some other subtitute that I have overlooked).

```scheme
(define (permutations xs)
  (define (rev xs n ys)
    (if (zero? n) ys
      (rev (cdr xs) (- n 1) (cons (car xs) ys))))
  (let ((xs xs) (perms (list xs)))
    (define (perm n)
      (if (> n 1)
          (do ((j (- n 1) (- j 1)))
              ((zero? j) (perm (- n 1)))
            (perm (- n 1))
            (set! xs (rev xs n (list-tail xs n)))
            (set! perms (cons xs perms)))))
    (perm (length xs))
    perms))
```

From there on, we need a way to generate all pairwise differences for permuted sequences.

{{% music %}}Alina Bzhezhinska & Hip Harp Coolective • _Meditation_{{% /music %}}
