---
title: "Fisher-Yates shuffling"
date: 2020-09-17T10:14:45+02:00
draft: true
tags: ["scheme"]
categories: ["2020"]
---

Yesterday I came across a [nice post](https://danluu.com/sattolo/) on the Fisher-Yates and Sattolo's algorithms. Briefly, the Fisher-Yates shuffling algorithm is a robust and efficient technique to generate a random permutation of elements in a list, with uniform probability. The Sattolo's algorithm relies on a similar approach but produces permutation consisting of a single cycle. Donald Knuth coined the former Algorithm P (TAOCP, vol. 2), and later acknowledged the original work of Fisher and Yates. If you want to get an idea of how this works, trust Mike Bostock for providing so much [enlightening visualisation](https://bost.ocks.org/mike/shuffle/).

There's a nice implementation available on Programming Praxis.

```scheme
(define (shuffle x)
  (do ((v (list->vector x)) (n (length x) (- n 1)))
      ((zero? n) (vector->list v))
    (let* ((r (randint n)) (t (vector-ref v r)))
      (vector-set! v r (vector-ref v (- n 1)))
      (vector-set! v (- n 1) t))))
```

Interestingly, in R the `sample` function relies on two different C subroutines, `do_sample` and `do_sample2`, which are defined in `src/main/random.c` and `src/main/unique.c`).
