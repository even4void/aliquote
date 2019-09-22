---
title: "Euler Problems 1-10"
date: 2019-07-04T15:53:39+02:00
draft: false
tags: ["racket", "math", "euler"]
categories: ["2019"]
---

I have been having fun recently solving the first Euler problems using Racket. Here are some notes I took when trying to solve the problem. Note that I do not reveal the solutions in this post nor some of the tips recommended on the site to improve naive algorithms. Oftentimes, brute force methods are enough to solve the problem. Regarding Racket code, mistakes are mine.

<!--more-->

## Problem 1

Brute-force is eligible in this case, computer are fast enough for such small numbers. If you are looking for an elegant answer, probably Haskell will be your friend for this particular problem, as it amounts to:

```haskell
sum [x | x <- [0..999], (mod x 3) == 0 || (mod x 5) == 0]
```

A more elegant solution exploits the fact that we count numbers divisible by 15 twice, when enumerating numbers that are divisible by either 3 or 5.

A little helper function, defined as follows, provides a more efficient way to solve the problem:

```racket
(define (sum-divisible-by n)
    (let* ([limit 1000]
           [p (floor (/ limit n))])
           (/ (* n (* p (add1 p))) 2)))
```

## Problem 2

The conscious reader will [check](https://mathematica.stackexchange.com/q/37266) and [prove](https://math.stackexchange.com/q/2386804) that it is possible to exploit the fact that even numbers occur every three steps, so that we save money on the even-number filter. For the record, the Racket [range](https://docs.racket-lang.org/reference/pairs.html?q=range#%28def._%28%28lib._racket%2Flist..rkt%29._range%29%29) function has everything we need to iterate over a list of numbers using a predefined step.

## Problem 3

The Haskell wiki has some working code for [primality testing](https://wiki.haskell.org/Testing_primality#Primality_Test_and_Integer_Factorization) and the like. Using Racket, Lisp or Python, we don't have to worry working with very large integers. Moreover, Racket has a nice submodule related to number theory in `math`, which simplifies the task to a great extent. Otherwise, we would have to implement prime factorization ourselves (see, e.g., [this gist](https://gist.github.com/dstnbrkr/855700)).

## Problem 4

There are probably many ways to tackle this problem. If we want to treat this like a classical palindrome problem, we need to deal with number-to-string conversion, and then rely on brute-force searching using Racket `for`-loop facilities. The trick is to limit the iteration to numbers ranging from 100 to 999 (and not 0 to 1000 since we want 3-digit number), and to start with larger values as it will increase our chance to find a large palindrome early on. Another nice solution appears at [JP's blog](https://blog.jverkamp.com/2012/11/07/project-euler-4/).

## Problem 5

This is just a brute-force approach, exploiting `for`-loop in Racket and existing algorithm for [generic numerics](https://docs.racket-lang.org/reference/generic-numbers.html). We could roll our own routines to compute `gcd` and `lcm`, e.g.:

```racket
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))
(define (lcm a b)
  (/ (abs (* a b)) (gcd a b)))
```

## Problem 6

Again, the Racket doesn't use any optimization trick. However, a clever implementation would use the fact that $1+2+\dots+n = \tfrac{1}{2}n(n+1)$, and $1^2+2^2+\dots+n^2 = \tfrac{1}{6}n(2n+1)(n+1)$. In the latter case, we can even prove that the sum of square of the $n$ first odd numbers is $\frac{n(4n^2-1)}{3}$, while the sum of squares of the $n$ first even numbers is $\frac{2n(n+1)(2n+1)}{3}$.

Not sure if we really need to care with infinite precision integers. Using Mathematica, this boils down to `Total[Range[10]]^2 - Total[Range[10]^2]`. In any case, those two quantities are well known in applied statistical textbooks, although [Welford's method](https://www.johndcook.com/blog/2008/09/26/comparing-three-methods-of-computing-standard-deviation/) is also a good approach when it comes to computing an empirical variance.

## Problem 7

Mathematica probably provides the shortest answer using `Prime[10001]` (and I guess Pari/GP would do as well). And, of course, Racket get you covered with the `nth-prime` [procedure](https://docs.racket-lang.org/math/number-theory.html#%28def._%28%28lib._math%2Fnumber-theory..rkt%29._nth-prime%29%29). Beware that you will need to ask for `(nth-prime 10000)`, and not 10001 since Racket uses 0-base index, i.e. `(nth-prime 0)` returns 2.

In any case, enumerating Prime numbers suggest to use an efficient way to assess whether a given integer is a prime, such as the [Sieve of Erasthothenes](https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf) (a sieve algorithm for Prime numbers is discussed in the SICP textbook, but it turns out it is a different algorithm; likewise, the "trial division", which checks if a number $x$ is a prime by testing its divisibility against each of the primes $ < x$, is a suboptimal approach). There are interesting implementations in Scheme available on Programming Praxis, e.g., [Sieve of Eratosthenes](https://programmingpraxis.com/2009/02/19/sieve-of-eratosthenes/), [Incremental Sieve Of Eratosthenes](https://programmingpraxis.com/2015/07/31/incremental-sieve-of-eratosthenes/), or [Segmented Sieve Of Eratosthenes](https://programmingpraxis.com/2010/02/05/segmented-sieve-of-eratosthenes/).

A concise and elegant solution can be written in Python using a generator function:

```python
def sieve(n):
    s = [1] * n
    s[0] = s[1] = False

    for (i, match) in enumerate(s):
        if match:
            yield i
            for n in range(i**2, n, i):
                s[n] = 0
```

The problem when using a sieve is that you need to list all values up to a certain number of items, i.e., it won't tell you what's the $k$-th prime number. Anyway, to get the last value computed by the above generator and not print all items using list comprehension, you can use a "deque":

```python
from collections import deque
deque(sieve(100), maxlen=1).pop()
```

## Problem 8

This is a common pattern in time series analysis or exploratory data analysis and it boils down to using a rolling window and to apply a custom function on observations falling in each consecutive window. A specific use case is computing the moving average of temporal data. Nice solutions in Python can be found with little googling, but here is reusable generic function in Racket (credit to [Jens Axel Søgaard](https://stackoverflow.com/a/40520792)):

```racket
(define (rolling-window n xs)
  (let* ([v (list->vector xs)]
         [m (vector-length v)])
    (for/list ([i (max 0 (- m n -1))])
    (vector->list (vector-copy v i (+ i n))))))
```

## Problem 9

Note that a solution appears on Racket documentation center, specifically in the [Infix Expressions for Racket](https://docs.racket-lang.org/infix-manual/) manual. Here, we will be using a little helper function to check whether a given tuple `(a,b,c)` form a valid Pythagorean triplet, and then iterate over the list of possible candidates. The brute-force solution should work, yet it is possible to avoid iterating over a grid of 1000 by 1000 for `a` and `b` by remarking that since $a < b < c$ we must have $a<\tfrac{a+b+c}{3}$ and $a < b < \tfrac{a+b+c}{3}$. Lastly, there's no need to iterate over `c` as it is readily computed as `1000-a-b`, and of course it is way better to start the iteration with the largest values available.

## Problem 10

This requires basically the same tool than Problem 7. Since it amounts to testing all integers up to two million, we do not need to implement an approximate primality testing algorithm.
