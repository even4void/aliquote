---
title: "Digit Sum"
date: 2019-07-08T10:14:05+02:00
draft: false
tags: ["math", "racket", "euler"]
categories: ["2019"]
---

A lot of Euler problems amount to find the sum of digits in a given numbers. The digit sum is easy to compute using Lisp or Scheme, provided you convert the number at hand into a list or as a string, then as ascii-decoded character: `(char->integer #\1)` returns 49 in Racket so it is quite easy to write a little helper function to convert any character into its corresponding integer value.

However, if you prefer to keep working with numbers, here is a little function that will convert any number into a list of digits. It is then a matter of applying `foldr` or `apply` to this list to compute any quantity of interest, e.g., the sum of all digits:

```scheme
(define (digits n)
  (if (zero? n)
      null
      (cons (remainder n 10) (digits (quotient n 10)))))
```

A more general formula to compute the digit sum of $x$ in base $b=10$ is:

$$
\sum\_{n=0}^{\lfloor\log_{10}x\rfloor}\frac{1}{10^n}(x\, \textrm{mod}\, 10^{n+1}-x\, \textrm{mod}\, 10^n).
$$

This is widely used in checksum algorithms, for instance the Luhn number checksum, also called the mod-10 algorithm. Here it is in Scheme:

```scheme
(define (mod-10 x n)
  (- (modulo x (expt 10 (add1 n))) (modulo x (expt 10 n))))

(define (digit-sum x)
  (for/list ([i (in-range (ceiling (log x 10)))])
    (* (/ 1 10) (mod-10 x i))))
```

A related idea can be found in the [CRC error checking](https://dvsoft.developpez.com/Articles/CRC/) algorithm. There are various Lisp implementation of the CRC algorithm, [here](http://www.thoughtstuff.com/rme/crc.lisp) and [there](https://github.com/robblackwell/cl-crc64).

{{% alert note %}}
<small>[2024-01-19]</small><br>
Mathematica 14 now has its own `DigitSum` function.
{{% /alert %}}

