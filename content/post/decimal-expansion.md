---
title: "Decimal expansion"
date: 2019-10-07T08:42:43+02:00
draft: true
tags: ["math", "euler"]
categories: ["2019"]
---

One of Euler problems deals with [reciprocal cycles](https://projecteuler.net/problem=26). When you write unit fractions using their decimal representation, you soon find that 1/3 which reads 0.33333 can be written as 0.(3) to indicate that it has a 1-digit recurring cycle. Likewise, 1/6 is simply 0.1(6), and so on. Eric Hanchrow provided a very [elegant solution](https://github.com/offby1/project-euler) to solve this problem in Racket, by using coprime and a `for/fold` form. That's what I ended up using because I found it very handy, but I did a little digging to better understand the role of [coprimes](https://en.m.wikipedia.org/wiki/Coprime_integers) in this specific case.

Per the [Racket docs](https://docs.racket-lang.org/math/number-theory.html#%28def._%28%28lib._math%2Fnumber-theory..rkt%29._coprime~3f%29%29), a set of integers is considered coprime if their greatest common divisor is 1. To put it in other words, any prime number that divides one does not divide the other.[^1] In the case 10 and a given integer are coprime, finding their unit-group order will help finding the subsequent

[^1]: Another interesting discussion on the use of [modular arithmetic](https://codereview.stackexchange.com/a/52510) in testing the divisibility of a given number is available on Code Review.

<!---
http://mathworld.wolfram.com/DecimalExpansion.html
https://stackoverflow.com/questions/1315595/algorithm-for-detecting-repeating-decimals
https://artofmemory.com/wiki/Decimal_Representation_of_Fractions
-->
