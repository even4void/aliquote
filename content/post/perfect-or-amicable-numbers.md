---
title: "Perfect and amicable numbers"
date: 2019-09-08T08:55:52+02:00
draft: true
tags: ["math", "racket"]
categories: []
---

<!--more-->

A _perfect number_ is a positive integer that is equal to the sum of its positive divisors, excluding the number itself, which also means such a number is equal to its [aliquot sum](https://en.wikipedia.org/wiki/Aliquot_sum). Perfect numbers can further be classified as deficient or abundant, and in [many other ways](https://en.wikipedia.org/wiki/Perfect_number). What really matters, though, is that all even perfect numbers can be expressed as $N=2^{p-1}(2^p-1)$, where $p$ is a prime number for which $2^p-1$ is a [Mersenne prime](http://mathworld.wolfram.com/MersennePrime.html).

It is quite easy to compute the sum of divisors using recursion or list comprehension in Python or Racket. Here is one way in Racket:

```Lisp
(define (divisor-sum n)
  (for/sum ([i (in-range 1 (add1 (quotient n 2)))]
            #:when (zero? (remainder n i)))
    i))
```

[Another solution](https://stackoverflow.com/a/23711209) involving a `fold/fold` form has been proposed on SO. Now, deciding on whether a given number is perfect or not is just a matter of a `cond`:

```Lisp
(define (perfect? n)
  (let ([divs (divisor-sum n)])
    (cond [(= n divs) 'perfect]
          [(> n divs) 'deficient]
          [else 'abundant])))
```
