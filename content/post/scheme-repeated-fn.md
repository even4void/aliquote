---
title: "Repeated call of a function in Scheme"
date: 2022-09-19T14:06:44+02:00
draft: true
tags: ["scheme", "sicp"]
categories: ["2022"]
---

In my [previous post] I discussed the repeated application of a function to build a list of results. This was done using a named let form first, then through currying. A simple accumulator would have been equally performant. See what's happening?

```scheme
(import (chicken random))

(define (curry n f)
  (if (= n 0)
      (lambda (x) x)
      (lambda (x) (f ((curry (- n 1) f) x)))))

(define (square x) (* x x))
((curry 5 (lambda (x) (cons (square 2) x))) '())
;; => (4 4 4 4 4)

(define (random max) (pseudo-random-integer max))
((curry 5 (lambda (x) (cons (random 10) x))) '())
;; => (9 6 5 3 7)
```

The most natural application of currying is probably to compute an iterated or cumulative sum in statistical computing. As an alternative one may consider a "reducer", like `reduce` or `foldl`. Currying is also important in functional programming when it comes to manage function multiple arguments, since it allows to express $f(x, y)$ as $g(x)(y)$, for instance. In Python, the `partial` function from the [functools] package does just that.

The SICP has another application of repeated call to a function in exercise 1.43. Unlike the previous case, this times it's all about composing function using an auxiliary function, `compose`:

```scheme
(define (compose f g)
  (lambda (x)
    (f (g x))))
```

Now, a recursive call to a function that calls itself $n$ times, e.g. $f(x) = x^2$ which for $x=5$ and $n=4$ is $(5 \times (5 \times (5 \times 5)))$, can be written as:

```scheme
(define (repeated fn n)
  (if (= n 1)
      fn
      (compose fn (repeated fn (- n 1)))))
```

In the above, `fn` isn't called `n` times, instead this function returns the function `fn` $n-1$ times and the lambda from `compose` takes care of calling those new functions, plus an extra call via the guard which makes for a total of $n$ calls. Getting ride of the `compose` helper function, we simply have the following lambda in action:

```scheme
(define (repeated fn n)
  (if (= n 1)
      fn
      (lambda (x) (fn ((repeated fn (- n 1)) x)))))
```

As a sidenote, the following function is defined (and explained) in [Simply Scheme]:

```scheme
(define repeated
  (let ((= =) (- -))
    (lambda (fn number)
      (if (= number 0)
       (lambda (x) x)
       (lambda (x)
        ((repeated fn (- number 1)) (fn x)))))))
```

{{% music %}}The Fall • _Totally Wired_{{% /music %}}

[previous post]: /post/bootstrap-in-scheme/
[functools]: https://docs.python.org/3/library/functools.html
[simply scheme]: /post/simply-scheme/
