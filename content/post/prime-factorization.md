---
title: "Prime Factorization"
date: 2019-08-17T20:51:41+02:00
draft: true
tags: ["math", "euler", "lisp"]
categories: []
---

As I said in a [previous post](/post/decimal-numbers/), a good number of Euler problems rely on number theory, henceforth prime numbers & Co.

<!--more-->

[Prime factorization](https://en.wikipedia.org/wiki/Integer_factorization) consists in finding the prime factors of a given positive integer. Other than Euler problems, prime factors have interesting applications, and they are, for instance, largely used in cryptographic applications since there is only one set of prime factors for any number. The other interesting aspects of prime numbers in cryptography and encryption techniques is that factoring very large numbers is hard, and it requires a lot of computing power and time. John Cook discusses a lot of ideas and applications related to cryptography on [his blog](https://www.johndcook.com/blog/).

As noted on [Programming Praxis](https://programmingpraxis.com/2011/09/20/project-euler-problem-3/), most of the problems offered on the Euler project will exceed 32-bits arithmetic for integers, so you have to rely on external libraries (e.g., [gmp](https://gmplib.org)) or don't bother at all and use PLs supporting large integers, such as Python, Lisp or Scheme. On the same blog post, you will find a nice algorithm to find the factors of a given input number $n$. In fact, [Problem 3](https://projecteuler.net/problem=3) from the Euler project asks us to find the largest prime factor of the number 600851475143. That's quite an easy task in Racket since there is a submodule related to number theory in the [math](https://docs.racket-lang.org/math/index.html?q=math) module:

```lisp
(require math)

(define (largest-prime-factor x)
 (apply max (map car (factorize x))))

(largest-prime-factor 600851475143)
```

https://rosettacode.org/wiki/Miller–Rabin_primality_test#Common_Lisp
https://github.com/sjl/euler/blob/master/src/primes.lisp
https://programmingpraxis.com/contents/themes/#Prime%20Numbers
