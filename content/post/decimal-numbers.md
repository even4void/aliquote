---
title: "Decimal numbers"
date: 2019-08-04T20:19:29+02:00
draft: true
tags: ["math"]
categories: []
---

A lot of [Euler problems](https://aliquote.org/tags/euler/) can be solved or best understood using number theory or algebra. Decimal numbers also play a particular role in several of these challenges. Here are a few properties that may prove useful in thinking about some of Euler problems.

<!--more-->

As for a simple definition, we will say that a decimal number is a rational number which can be written in fractional form as $\tfrac{a}{10^n}$, $a \in \mathbb{Z}$ and $n \in \mathbb{N}$. Note that this set, $\mathbb{D}$, is a [subring](<https://en.wikipedia.org/wiki/Ring_(mathematics)#Subring>) of $\mathbb{Q}$, the set of rationals, which means that addition, substraction and product of two decimal numbers yield a decimal number. The main interest in decimal numbers lies in the fact that they can be written and manipulated using base-10 notation. Let $x=\frac{a}{10^n}$ be a decimal number, with $a > 0$ and $n \ge 0$. Since we can express $a$ using base-10 notation as:

$$ a = \sum_{i=0}^m = a_m \times 10^m + a_{m-1} \times 10^{m-1} + \dots + a_1 \times 10 + a_0, $$

with $m \ge 0$ and $0\le a_i\le 9$ ($a_m \neq 0$). A common shorthand is to write $a = \overline{a_m \dots a_0}$, following the notation used by Daniel Perrin.[^1] Hence, we can reexpress $x$ as

$$ x = \sum_{i=0}^m = a_m \times 10^{m-n} + \dots + a_{n+1} \times 10 + a_n + \frac{a_{n-1}}{10} + \dots + \frac{a_0}{10^n}, $$

with the following shorthand notation: $\overline{a_ma_{m-1}\dots a_{n+1}a_n,a_{n-1}\dots a_0}$, where $0\le\overline{0,a_{n-1}\dots a_0}<1$ is called the decimal part of $x$.

Note that a decimal number have a limited number of decimals (exactly $n$ if $a$ is not a multiple of 10), unlike the case where we approximate a rational number using decimal development. Consider $x=\frac{a}{b}\in\mathbb{Q}$ and $x_n=\frac{q_n}{10^n}$, the decimal value approximated to within $10^{-n}$ of $x$. For $n\ge 0$, $10^na=bq_n+r_n$, $0\le r_n < b$, and there exists an integer $0\le a_{n+1}\le 9$ such that $q_{n+1} = 10q_n + a_{n+1}$. This integer, $a_{n+1}$ is simply the quotient of the euclidean division of $10r_n$ by $b$: $10r_n = ba_{n+1}+r_{n+1}$, with $0\le r_{n+1} < b$. This means that the $n$ first figures of the decimal part of a number approximated to within $10^{-(n+1)}$ are the same as those of the same number approximated to within $10^{-n}$.

Some interesting properties of decimal numbers follow. Let $\frac{a}{10^m}$ and $\frac{b}{10^n}$ be two decimal numbers, with $m\le n$. Then,

$$ \frac{a}{10^m} + \frac{b}{10^n} = \frac{10^{n-m}a+b}{10^n}\, \text{and}\, \frac{a}{10^m}\frac{b}{10^n} = \frac{ab}{10^{m+n}}. $$

A common pattern is to extract the fractional part of a number and to store each digit in a list. Basically, there are two ways to do this: either we convert the decimal number to a string, extract each digit as a character, and convert it back to a number; or we use a simple decomposition of the decimal number using base-10 quotient and remainder. Here is one way to do this using proper arithmetic in Racket:

```lisp
(define (digits x)
  (if (zero? x)
      null
      (cons (remainder x 10)
            (digits (quotient x 10)))))
```

<small>(The `quotient` and `remainder` procedures are bundled in the `base` module.)</small>

It turns out that the above procedure is easier to read and quite more efficient than converting character to number.

[^1]: Perrin, Daniel, _Mathématiques d'école : nombres, mesures et géométrie_, Cassini, 2005.
