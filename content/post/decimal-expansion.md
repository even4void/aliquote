---
title: "Decimal expansion and coprimes"
date: 2019-12-25T08:42:43+02:00
draft: false
tags: ["math", "euler"]
categories: ["2019"]
---

One of Euler problems deals with [reciprocal cycles](https://projecteuler.net/problem=26). When you write unit fractions using their decimal representation, you soon find that 1/3 which reads 0.33333 can be written as 0.(3) to indicate that it has a 1-digit recurring cycle. Likewise, 1/6 is simply 0.1(6), and so on. Eric Hanchrow provided a very [elegant solution](https://github.com/offby1/project-euler) to solve this problem in Racket, by using coprime and a `for/fold` form. That's what I ended up using (with little rewrite) because I was struggling with this problem for days until I came across this solution. I made up for that cheating by doing some research, especially [digging](https://artofmemory.com/wiki/Decimal_Representation_of_Fractions) [a bit](https://stackoverflow.com/questions/1315595/algorithm-for-detecting-repeating-decimals) [to better](https://math.stackexchange.com/questions/3362329/elementary-way-to-prove-that-if-n-and-10-are-coprime-then-1-n-has-no-tran) [understand](https://en.wikipedia.org/wiki/Multiplicative_group_of_integers_modulo_n) the role of [coprimes](https://en.m.wikipedia.org/wiki/Coprime_integers) in this specific case.

```racket
#lang racket

(require math/number-theory)

(define (lrcdf q)
  (if (coprime? 10 q)
      (unit-group-order 10 q)
      0))

(for/fold ([p '(0 . 0)])
    ([x (in-range 2 1000)])
    (let ([l (lrcdf x)])
      (if (< (cdr p) l)
          (cons x l)
          p)))
```

As mentioned on the [Racket docs](https://docs.racket-lang.org/math/number-theory.html#%28def._%28%28lib._math%2Fnumber-theory..rkt%29._coprime~3f%29%29), a set of integers is considered coprime if their greatest common divisor is 1. To put it in other words, any prime number that divides one does not divide the other.[^1] Since we are interested in [decimal expansion](http://mathworld.wolfram.com/DecimalExpansion.html) with a *viniculum*, this means that we need to work with integers coprime to 10. 

The key point resolves around [full reptend prime](https://en.wikipedia.org/wiki/Full_reptend_prime). According to [Wikipedia](https://en.wikipedia.org/wiki/Repeating_decimal), a *proper prime* is a prime *p* which ends in the digit 1 in base 10 and whose reciprocal in base 10 has a repetend (i.e., repeating decimal segment) with length *p* − 1. Each digit appears in the repetend the same number of times, (*p*-1)/10. A prime is a proper prime if and only if it is a full reptend prime and congruent to 1 mod 10, i.e. $10^k \equiv 1\ (\text{mod}\ p)$ for $k=p-1, k\nless p-1$. As a side note, we could remark that if this prime number is also *safe*, that is a prime of the form 2*p* + 1 where *p* is also a prime, then 1/*p* will produce a [stream](https://oeis.org/A000353) of *p* − 1 pseudo-random digits. Anyway, the idea is to find the first full reptend prime number below a limit, here $d < 1000$.

I also happened to find a very nice solution in Mathematica, by [Nayuki](https://www.nayuki.io/page/project-euler-solutions):[^2]

{{< figure src="/img/2019-12-24-17-03-16.png" >}}

There's more to see: The following fraction has 2997 recurring decimals!

$$ \frac{1}{998001} = 0.000001002003004005... $$

Indeed, you will successively find all 3-decimal numbers from 000 to 999, until it starts over again at 000. Check out James Grime's explanations on [Numberphile](http://www.numberphile.com/).

{{< youtube daro6K6mym8 >}}



[^1]: Another interesting discussion on the use of [modular arithmetic](https://codereview.stackexchange.com/a/52510) in testing the divisibility of a given number is available on Code Review.
[^2]: There's also a GMP-based C version available on [Github](https://github.com/eagletmt/project-euler-c/blob/master/20-29/problem26.c).