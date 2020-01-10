---
title: "Digit sum and factorial"
date: 2020-01-10T12:22:22+01:00
draft: false
tags: ["euler", "racket"]
categories: ["2020"]
---

I already talked about [digit sum](/post/digit-sum/) earlier but I wanted to extend this to the case where we would like to apply a specific transformation to each digit of a given number. For example, as stated in Euler problem 34, we could consider factorial digit sum, where we compute the sum of the factorial of each digit and test whether it equals the numbr itself. A generalization of this problem is what was coined [factorions](https://en.wikipedia.org/wiki/Factorion). In the case of Euler problem, these are factorions of base 10. We know that those numbers are seven digits or less since 9! × *k* < 10<sup>*k*</sup>. A related problem is to find [narcissistic](https://en.wikipedia.org/wiki/Narcissistic_number) numbers (as in, e.g. problem 30). The solution highlighted below could be used as well.

Here is how to compute such numbers in Racket. First, we need to convert a number to a list of digit; the order of the digits in the list does not matter for our purpose:

```racket
(require math)

(define (digits n)
  (if (zero? n)
      null
      (cons (remainder n 10) (digits (quotient n 10)))))
```

Then, of course, we need the more specific stuff, namely a function that computes the digit sum:

```racket
(define f (map factorial (range 10)))

(define (digit-sum n)
  (apply + (map (lambda (x) (list-ref f x))
              (digits n))))
```

The rest is just using a `for/list` form with a guard, e.g., `#:when (= i (digit-sum i))`. A more "[compact solution](https://math.stackexchange.com/a/533677)" using Mathematica has been proposed. Of note, there are several ways to optimize these computations, but the most critical aspect in the above code is the repeated use of the same factorials: Some caching of intermediate results (especially, combinations of digits, not digit factorial) would probably be in order. Another idea is to use [lower and upper bounds](https://math.stackexchange.com/a/35726) to restrict the brute force search to a relevant interval. And, finally, why wrote a program when Wikipedia or the [OEIS](http://oeis.org/A014080) tell us there are only two integer, 145 (1!+4!+5!) and 40585 (4!+0!+5!+8!+5!), that verify this property (1 and 2 are excluded since they are not proper sums)? Just to learn a bit more of Racket, I guess, since I didn't find any real [application](/post/armstrong-numbers/) of factorion in real life.