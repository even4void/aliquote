---
title: "Prime palindromes"
date: 2021-11-16T11:23:19+01:00
draft: false
tags: ["euler", "math", "racket"]
categories: ["2021"]
---

It's been a long time since I last try to solve one of [Project Euler](https://projecteuler.net) problems. A few days ago, I noticed a post on [Programming Praxis](https://programmingpraxis.com/2021/10/26/prime-palindromes/) that deals with prime palindrome (a prime number which also happens to read as a palindrome, such as 101). I thought it should be easy to fire up my old code, but apparently none of the Euler problems I solved were about palprime.

As an illustration, [problem 4](https://projecteuler.net/problem=4) asks us to find the largest palindrome made from the product of two 3-digit numbers. Here is my solution using Racket: (I know we can write a procedure to check if a number is a palindrome without converting it first to a string, but this does not really impact the performance of the lookup here.)

```racket
(define (rev-string str)
  (list->string (reverse (string->list str))))

(define (palindrome? x)
    (equal? (number->string x) (rev-string (number->string x))))

(define (sol-004)
  (apply max
         (for*/list ([a (in-range 999 100 -1)]
                     [b (in-range a 100 -1)]
                     #:when (palindrome? (* a b)))
           (* a b))))

(sol-004)
```

So yesterday I wrote a quick script to list all prime palindromes, but it is quite inefficient. First, we could use Racket builtin math procedure more efficiently. For instance, `(next-primes z n)` returns a list of the next n primes larger than z, from which we could filter out palindrome numbers I guess. But read on the solution proposed on Programming Praxis and you will learn that there's even a clever way to find the 100th prime palindrome. Anyway, here's my quick and dirty Racket script from yesterday:

```racket
#lang racket

(require math/number-theory)

(define (rev-string str)
  (list->string (reverse (string->list str))))

(define (palindrome? x)
    (equal? (number->string x) (rev-string (number->string x))))

(for ([x (in-range 1 1e6)])
     (when (and (palindrome? x) (prime? x))
       (display (format "~a " x))))
```

Unless you wrap the above code in an [nth](https://docs.racket-lang.org/collections/collections-api.html#%28def._%28%28lib._data%2Fcollection..rkt%29._nth%29%29) form, you can run this in your terminal as follows:

```shell
~ % racket palindromic-primes.rkt | cut -d " " -f 100
94049
```

{{% alert note %}}
<small>[2023-03-14]</small><br>
For other interesting problems on progression of primes, see [Twin Primes, Cousin Primes, Sexy Primes, and Prime Triplets](https://kaygun.tumblr.com/), by Atabey Kaygun.
{{% /alert %}}

{{% music %}}Laura Stevenson • _Continental Divide_{{% /music %}}
