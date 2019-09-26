---
title: "Prime numbers in Scheme"
date: 2019-08-19T20:51:41+02:00
draft: false
tags: ["math", "euler", "scheme"]
categories: ["2019"]
---

As I said in a [previous post](/post/decimal-numbers/), a good number of Euler problems rely on number theory, henceforth prime numbers & Co.

[Prime factorization](https://en.wikipedia.org/wiki/Integer_factorization) consists in finding the prime factors of a given positive integer. Other than Euler problems, prime factors have interesting applications, and they are, for instance, largely used in cryptographic applications since there is only one set of prime factors for any number. The other interesting aspects of prime numbers in cryptography and encryption techniques is that factoring very large numbers is hard, and it requires a lot of computing power and time. John Cook discusses a lot of ideas and applications related to cryptography on [his blog](https://www.johndcook.com/blog/).

As noted on [Programming Praxis](https://programmingpraxis.com/2011/09/20/project-euler-problem-3/), most of the problems offered on the Euler project will exceed 32-bits arithmetic for integers, so you have to rely on external libraries (e.g., [gmp](https://gmplib.org)) or don't bother at all and use PLs supporting large integers, such as Python, Lisp or Scheme. On the same blog post, you will find a nice algorithm to find the factors of a given input number $n$. In fact, [Problem 3](https://projecteuler.net/problem=3) from the Euler project asks us to find the largest prime factor of the number 600851475143. That's quite an easy task in Racket since there is a submodule related to number theory in the [math](https://docs.racket-lang.org/math/index.html?q=math) module:

```racket
(require math)

(define (largest-prime-factor x)
 (apply max (map car (factorize x))))

(largest-prime-factor 600851475143)
```

Easy peasy, nothing but exploiting built-in functions. I should, however, note that the [`factorize`](https://docs.racket-lang.org/math/number-theory.html?q=number%20theory#%28def._%28%28lib._math%2Fnumber-theory..rkt%29._factorize%29%29) function first checks whether $n$ is large or not. In the latter case ($n>1000$), the [Pollard method](https://en.wikipedia.org/wiki/Pollard%27s_p_%E2%88%92_1_algorithm) is used.

Another common task that appears a lot (at least in the very first Euler problems) is to determine if a given number is prime or not, or what's the largest prime number below a given integer. Primality testing can be carried out exactly, using a sieve, or approximate (or better, probabilisitic) testing can be done using, e.g., [Miller-Rabin](https://en.wikipedia.org/wiki/Miller–Rabin_primality_test) or Fermat test. Approximate here means that we are going to use an iterative approach to determine if a number if prime or not, but this can be refined at will (at the expense of time complexity) so we can keep accuracy under control to some extent. It can be shown that if $n$ is composite then the Miller–Rabin test declares $n$ _probably prime_ with a probability at most $4^{−k}$.

Common Lisp code is available on [Rosetta](https://rosettacode.org/wiki/Miller–Rabin_primality_test#Common_Lisp), but you may well spend some time inspecting Steve Losh's [code on Github](https://github.com/sjl/euler/blob/master/src/primes.lisp), it is quite instructive. The author also provides his own implementation of fast modular exponentiation, which otherwise is discussed in the SICP textbook. Indeed, Fermat's Little Theorem says that if $n$ is a prime number and $a$ is any positive integer less than $n$, then $a$ raised to the $n$-th power is congruent to $a$ modulo $n$. The idea of the Fermat probabilistic test is thus to pick a random number $a < n$ and to compute the remainder of $a^n\ \text{mod}\ n$. If the result is not equal to $a$, then $n$ is certainly not prime. Otherwise, chances are good that $n$ is prime. As for Miller-Rabin test, trying more values of $a$ will increase our confidence in the result.

Here is a simple version of fast modular exponentiation in Scheme available on the [Community Scheme Wiki](http://community.schemewiki.org/?sicp-ex-1.27): (Note that this is also available in the [online version](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-11.html#%_sec_1.2.6) of the SICP.)

```scheme
(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
```

Therefrom, it is quite easy to implement Fermat primality test:

```scheme
(define (fermat-test n)
  (define (test a)
    (= (expmod a n n) a))
  (define (iter a)
    (if (< a n)
        (if (test a)
            (iter (+ a 1))
            #f)
        #t))
  (iter 1))
```

Note that other implementations, closer to Steve Losh's version, are available on [Stack Overflow](https://stackoverflow.com/q/56178778) or [Code Review](https://codereview.stackexchange.com/q/139221) (or [this gist](https://gist.github.com/cky/ac11c20816b41f82c13bb59bb173cbad)). Want more on prime numbers and Scheme? You will find a lot of useful stuff packed up in this [archive on Programming Praxis](https://programmingpraxis.com/contents/themes/#Prime%20Numbers).
