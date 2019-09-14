---
title: "Perfect and amicable numbers"
date: 2019-09-12T08:55:52+02:00
draft: false
tags: ["math", "racket"]
categories: ["2019"]
---

In which we talk about perfect numbers and amicable pairs. This is somewhat related to problems raised on the Euler project and the Exercism coding track. This also once motivated the name of this site.

<!--more-->

A _perfect number_ is a positive integer that is equal to the sum of its positive divisors, excluding the number itself, which also means such a number is equal to its [aliquot sum](https://en.wikipedia.org/wiki/Aliquot_sum). Perfect numbers can further be classified as deficient or abundant, and in [many other ways](https://en.wikipedia.org/wiki/Perfect_number). What really matters, though, is that all even perfect numbers can be expressed as $N=2^{p-1}(2^p-1)$, where $p$ is a prime number for which $2^p-1$ is a [Mersenne prime](http://mathworld.wolfram.com/MersennePrime.html). Finally, [amicable numbers](https://en.wikipedia.org/wiki/Amicable_numbers) are also interesting since they involved [proper divisors](http://djm.cc/amicable.html): indeed, they are defined so that the sum of the proper divisors of each is equal to the other number. They also form an aliquot sequence of period 2.

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

What about amicable numbers, then? Since we already have `divisor-sum`, we can just use a simple test:

```Lisp
(define (amicable? n)
  (define s (divisor-sum n))
  (and (not (= n s))
       (= n (divisor-sum s))))
```

Whence an amicable pair $(m,n)$ satisfies `(= m (divisor-sum n))` and `(= n (divisor-sum m))`, provided $m\neq n$. If you substitute the preceding boolean return value with a sum, like suggested by [Chris Jester-Young](https://stackoverflow.com/a/23711209) over at SO, then you get "amicable peers" which allows to screen for amicable pairs in between predefined bounds:

```Lisp
(define (amicable-peer n)
  (define sum (divisor-sum n))
  (and (not (= n sum))
       (= n (divisor-sum sum))
       sum))

(define (amicable-pairs-between m n)
  (for*/list ((i (in-range m (add1 n)))
              (peer (in-value (amicable-peer i)))
              #:when (and peer (<= m peer n) (< i peer)))
    (cons i peer)))
```

List comprehension in Racket are really great, aren't they? FInally, a little `apply` can be used to find the sum of all amicable numbers under 10000:

```Lisp
(define (pair-sum p)
  (+ (car p) (cdr p)))

(apply + (for/list ([elt (in-list (amicable-pairs-between 0 10000))]) (pair-sum elt)))
```
