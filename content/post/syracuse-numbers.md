---
title: "Syracuse numbers"
date: 2021-04-22T13:16:45+02:00
draft: false
tags: ["math", "scheme"]
categories: ["2021"]
---

We already covered [Armstrong numbers](/post/armstrong-numbers/), [perfect and amicable numbers](/post/perfect-or-amicable-numbers/), and some others remarkable numbers in the past. In this post, we will consider the Syracuse series, which is defined as follows:

$$ u_{n+1} = \begin{cases} 1 + 3u_n & \text{if $u_n$ is odd} \cr u_n / 2 & \text{if $u_n$ is even}. \end{cases} $$

This apparent simple recurrence scheme is supposed to yield the number 1 in the end, independent of the starting value $u_n > 0$. This is known as the Syracuse or [Collatz conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture). When $u_n = 1$, the series alternate between the values 1 and 4, then 2, and finally 1. Here is a quick implementation in Scheme:

```scheme
(define (syracuse? x)
  (or (= 1 x)
  (if (even? x)
    (syracuse? (quotient x 2))
    (syracuse? (+ 1 (* 3 x))))))
```

Atabey Kaygun wrote some nice blog posts on the Collatz conjecture, e.g., [Collatz Sequences (Continued)](https://kaygun.tumblr.com/post/67833833279/collatz-sequences-continued), [Collatz sequence (yet again)](https://kaygun.tumblr.com/post/170044995839/collatz-sequence-yet-again). He also discussed its [binary representation](https://kaygun.tumblr.com/post/622768677243289600/collatz-sequence-in-binary), and coincidentally I found [another blog](http://lisperator.net/blog/gazing-at-the-numbers-the-collatz-sequence/#tldr) that discusses this approach (see Observation #3, which is quite interesting in this respect). Other reference materials include: [On the 3x + 1 problem](http://www.ericr.nl/wondrous/), [The 3x+1 Problem: An Annotated Bibliography (1963-1999)](https://arxiv.org/abs/math/0309224), and for statistical nerds, [On the Probabilistic Proof of the Convergence of the Collatz Conjecture](https://www.hindawi.com/journals/jps/2019/6814378/).

Using binary transformations instead of standard arithmetic on decimal numbers is interesting. The idea is to perform integer division (by 2), and store remainders from least (first remainder) to most significant (last). To convert the number 101, we have the following: (with remainder in parenthesis)

        101 / 2 = 50 (1)
         50 / 2 = 25 (0)
         25 / 2 = 12 (1)
         12 / 2 =  6 (0)
          6 / 2 =  3 (0)
          3 / 2 =  1 (1)
          1 / 2 =  0 (1)

         101 -> 1100101

The binary representation of a positive integer can easily be obtained in Scheme using the following procedure, which is not tail recursive:

```scheme
(define (decimal->binary n)
  (cond ((zero? n) '())
    (else (cons (remainder n 2)
      (decimal->binary (quotient n 2))))))
```

This will return a list of zeros and ones. If you prefer a string, we can use something like this:

```scheme
> (apply string-append (map number->string (decimal->binary 101)))
"1010011"
```

However, this is generally a builtin: `number->string`. For instance, using Chez Scheme:

```scheme
> (number->string 101 2)
"1100101"
```

All that for what? If the final digit is a one, then the number is odd, otherwise it is even. Pretty simple test, especially if we keep the binary representation of $u_n$ as a list (think of extracting the last item in the list, i.e. `(define (last lst) (car (reverse lst)))`). Now, the recurrence function can be think of as follows:

- if the number is even (final digit = 0), halve the number by shifting all the bits to the right (e.g., following the [logical right shift](https://stackoverflow.com/a/141873/420055) `0101 >>> 1` we get `0010`);
- if the number is odd (final digit = 1), use a left shit (this will effectively double the number, e.g., `0010 << 1` yields `0100`) and add the original number to the result; then add one in binary.
