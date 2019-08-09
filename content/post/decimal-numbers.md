---
title: "Decimal numbers"
date: 2019-08-06T20:19:29+02:00
draft: false
tags: ["math", "racket", "euler"]
categories: []
---

A lot of [Euler problems](https://aliquote.org/tags/euler/) can be solved or best understood using number theory or algebra. Decimal numbers also play a particular role in several of these challenges. Here are a few properties that may prove useful in thinking about some of Euler problems.

<!--more-->

As for a simple definition, we will say that a decimal number is a rational number which can be written in fractional form as $\tfrac{a}{10^n}$, $a \in \mathbb{Z}$ and $n \in \mathbb{N}$. Note that this set, $\mathbb{D}$, is a [subring](<https://en.wikipedia.org/wiki/Ring_(mathematics)#Subring>) of $\mathbb{Q}$, the set of rationals, which means that addition, substraction and product of two decimal numbers yield a decimal number. The main interest in decimal numbers lies in the fact that they can be written and manipulated using base-10 notation. Let $x=\frac{a}{10^n}$ be a decimal number, with $a > 0$ and $n \ge 0$. Since we can express $a$ using base-10 notation as:

$$ a = \sum\_{i=0}^m = a_m \times 10^m + a\_{m-1} \times 10^{m-1} + \dots + a_1 \times 10 + a_0, $$

with $m \ge 0$ and $0\le a_i\le 9$ ($a_m \neq 0$). A common shorthand is to write $a = \overline{a_m \dots a_0}$, following the notation used by Daniel Perrin.[^1] Hence, we can reexpress $x$ as

$$ x = \sum\_{i=0}^m = a_m \times 10^{m-n} + \dots + a\_{n+1} \times 10 + a_n + \frac{a\_{n-1}}{10} + \dots + \frac{a_0}{10^n}, $$

with the following shorthand notation: $\overline{a_ma\_{m-1}\dots a\_{n+1}a_n,a\_{n-1}\dots a_0}$, where $0\le\overline{0,a\_{n-1}\dots a_0}<1$ is called the decimal part of $x$.

It is worth remembering that $\tfrac{1}{3}$ is not a decimal number, and more generally that a rational number is decimal if and only if its denominator only admits 2 and 5 as prime factors.

Note that a decimal number have a limited number of decimals (exactly $n$ if $a$ is not a multiple of 10), unlike the case where we approximate a rational number using decimal development. Consider $x=\frac{a}{b}\in\mathbb{Q}$ and $x_n=\frac{q_n}{10^n}$, the decimal value approximated to within $10^{-n}$ of $x$. For $n\ge 0$, $10^na=bq_n+r_n$, $0\le r_n < b$, and there exists an integer $0\le a\_{n+1}\le 9$ such that $q\_{n+1} = 10q_n + a\_{n+1}$. This integer, $a\_{n+1}$ is simply the quotient of the euclidean division of $10r_n$ by $b$: $10r_n = ba\_{n+1}+r\_{n+1}$, with $0\le r\_{n+1} < b$. This means that the $n$ first figures of the decimal part of a number approximated to within $10^{-(n+1)}$ are the same as those of the same number approximated to within $10^{-n}$.

Some interesting properties of decimal numbers follow. Let $\frac{a}{10^m}$ and $\frac{b}{10^n}$ be two decimal numbers, with $m\le n$. Then,

$$ \frac{a}{10^m} + \frac{b}{10^n} = \frac{10^{n-m}a+b}{10^n}\, \text{and}\, \frac{a}{10^m}\frac{b}{10^n} = \frac{ab}{10^{m+n}}. $$

Quick application: Suppose you want to multiply 2.13 by 0.7; it is enough to compute $213\times 7=1491$ (in $\mathbb{N}$), and to add a comma to the right place which is determined by the value of the denominator $10^{(2+1)}$, whence the result 1.491.

The other interesting property of decimal numbers is that we can quickly tell which one of two numbers is the highest. Let us assume that we have two such numbers, $x$ and $y$, both positive or null. If $\lfloor x\rfloor < \lfloor y\rfloor$, then $x < y$. Moreover, if $0\le x < 1$ and $0\le y < 1$, $x$ and $y$ can be rewritten as $x=\overline{0.a_1\dots a_r}$ and $y=\overline{0.b_1\dots b_s}$. Let $m$ be the lowest integer $\ge 1$ such that $a_m\neq b_m$---which means that $a_i=b_i,\,\forall i<m$---then if $a_m<b_m$ we have $x<y$. To sum up: when comparing two decimal numbers, first compare their integer part, and if they are not equal then proceed with the decimal parts, $x-\lfloor x\rfloor$ and $y-\lfloor y\rfloor$, which are decimal numbers comprised between 0 and 1. What we just wrote in plain English can readily be translated into a recursive algorithm, obviously.

A common pattern is to extract the fractional part of a number and to store each digit in a list. Basically, there are two ways to do this: either we convert the decimal number to a string, extract each digit as a character, and convert it back to a number; or we use a simple decomposition of the decimal number using base-10 quotient and remainder. Here is one way to do this using proper arithmetic in Racket:

```lisp
(define (digits x)
  (if (zero? x)
      null
      (cons (remainder x 10)
            (digits (quotient x 10)))))
```

<small>(The `quotient` and `remainder` procedures are bundled in the `base` module.)</small>

It turns out that the above procedure is easier to read and quite more efficient than converting character to number, although digits are given in reverse order. However, it is not difficult to `reverse` the list afterwards, or to adapt the code if timing is a critical element. You can then `apply`, `map` or `filter` the resulting list of digits at will. Here is a working example using a few decimals of $\pi$:

```lisp
> (define x (inexact->exact (floor (* 1e9 (- pi (floor pi))))))
> (digits x)
'(3 5 6 2 9 5 1 4 1)
```

Note that `pi` is a built-in constant in Racket; other Scheme implementations may differ, e.g. using Chez Scheme you will have to `(define pi (* (asin 1) 2))`.

A related task consists in applying [signed integer (truncating) division](https://stackoverflow.com/q/3602827), which can be defined as follows:[^2]

$$ n \div d = \begin{cases}\lfloor \frac{n}{d}\rfloor, & \mbox{if } d \neq 0, nd\ge 0\cr \lceil \frac{n}{d} \rceil, & \mbox{if } d\neq 0, nd < 0 \end{cases} $$

This is known as the `div` operator in many languages. Unfortunately, there is nothing like this in Scheme, so you will have to use a combination of `/` and `floor`.

[^1]: Perrin, Daniel, _Mathématiques d'école : nombres, mesures et géométrie_, Cassini, 2005.
[^2]: Warren, Henri S. Jr., _Hacker's Delight_, Pearson Education, 2003.
