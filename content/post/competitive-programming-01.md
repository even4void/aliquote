---
title: "Competitive Programming the lispy way"
date: 2018-11-22T20:12:22+01:00
draft: true
tags: ["scheme", "lisp"]
categories: []
---
Most of what is available in terms of tutorial or solution to problems from programming contests, also called competitive programming, relies on C or C++--see, e.g., this [earlier post](/post/the-competitive-programmer-s-handbook) of mine on the [Competitive Programmer's Handbook](https://cses.fi/book.html). I recently came across this [Bachelor's thesis](https://upcommons.upc.edu/bitstream/handle/2117/113325/memoria.pdf) (PDF, 44 pp.) where the author offers solutions to various problems in C++. Here I will try to offer some Scheme or Lisp solutions (one at a time).

<!--more-->

Today, we shall start with the well-known [Knuth-Morris-Pratt](https://en.wikipedia.org/wiki/Knuth–Morris–Pratt_algorithm) (KMP for short) algorithm which is widely used for pattern matching, usually on strings. This algorithm is linear in time and has asymptotic complexity $\mathcal{O}(n)$. To understand what the difference between the KMP and the Boyer-Moore's algorithm are, see this related [Stack Overflow thread](https://stackoverflow.com/q/12656160).

The proposed task reads as follows:

> Given an integer N, make a palidrome (word that reads the same when you reverse it) of length at least N.

First, we need a working version of the KMP algorithm and I will use [Racket Scheme](https://racket-lang.org). Note that the documentation on string libraries (SRFI 13, R5RS) [discusses the KMP algorithm](https://docs.racket-lang.org/srfi/srfi-std/srfi-13.html#KMP).



http://www-igm.univ-mlv.fr/~lecroq/string/node8.html
http://www.inf.fh-flensburg.de/lang/algorithmen/pattern/kmpen.htm

Here is one solution in Scheme from [codecodex](http://www.codecodex.com/wiki/Knuth-Morris-Pratt_Algorithm_Examples#Scheme):

```{lisp}
(define (init-next p)
  (let* ((m (string-length p))
         (next (make-vector m 0)))
    (let loop ((i 1) (j 0))
       (cond ((>= i (- m 1))
              next)
             ((char=? (string-ref p i) (string-ref p j))
              (let ((i (+ i 1))
                    (j (+ j 1)))
                 (vector-set! next i j)
                 (loop i j)))
             ((= j 0)
              (let ((i (+ i 1)))
                 (vector-set! next i 0)
                 (loop i j)))
             (else
              (loop i (vector-ref next j)))))))

(define (kmp p s)
  (let ((next (init-next p))
        (m (string-length p))
        (n (string-length s)))
    (let loop ((i 0) (j 0))
      (cond ((or (>= j m) (>= i n))
             (- i m))
            ((char=? (string-ref s i) (string-ref p j))
             (loop (+ i 1) (+ j 1)))
            ((= j 0)
             (loop (+ i 1) j))
            (else
             (loop i (vector-ref next j)))))))
```

