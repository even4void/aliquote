---
title: "Currying and repeated calls of a function"
date: 2022-09-19T14:06:44+02:00
draft: false
tags: ["scheme", "sicp"]
categories: ["2022"]
---

In my [previous post] I discussed the repeated application of a function to build a list of results. This was done using a named let form first, then through currying. See what's happening?

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

Since intermediate results are not exploited in successive calls to `f` in the above example, this amounts to make `n` independent calls to `f`, unlike the following use of `curry`, where intermediate results are reused:

```scheme
((curry 2 (lambda (x) (square x))) 2)
;; => 16
((curry 3 (lambda (x) (square x))) 2)
;; => 256
```

In the first case, we compute $2\times 2 = 4$, then $4\times 4 = 16$, while in the second case we add an extra step with $16\times 16 = 256$.

The most natural application of currying is probably to compute an iterated or cumulative sum in statistical computing. As an alternative one may consider a "reducer", like `reduce` or `foldl`. Currying is also important in functional programming when it comes to manage function multiple arguments, since it allows to express $f(x, y)$ as $g(x)(y)$, for instance. In Python, the `partial` function from the [functools] package does just that. In Scheme, we can introduce as many lambdas as we need in a function, or use specialized macros.[^1] As an example, consider a function that expect two arguments, `(define (greater? x n) (> x n))` -- I use such constructs in combination with `filter` to select observations in a sequence of numerical values; it can be converted to a one-argument function using an extra lambda, `(define (greater? n) (lambda (x) (> x n)))`. Then instead of `(greater? 3 1)`, we would simply write `((greater? 1) 3)`. The function now returns a new function that knows the value of `n`.

The SICP has another application of repeated call to a function in exercise 1.43:

> If f is a numerical function and n is a positive integer, then we can form the nth repeated application of f, which is defined to be the function whose value at x is f(f(...(f(x))...)). For example, if f is the function x + 1, then the nth repeated application of f is the function x + n. If f is the operation of squaring a number, then the nth repeated application of f is the function that raises its argument to the 2^nth power. Write a procedure that takes as inputs a procedure that computes f and a positive integer n and returns the procedure that computes the nth repeated application of f.

Unlike the previous case, this times it's all about composing function using an auxiliary function, `compose`:

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

In the above, `fn` isn't called `n` times, instead this function returns the function `fn` itself $n-1$ times and the lambda from `compose` takes care of calling those new functions, plus an extra call via the guard which makes for a total of $n$ calls. Getting ride of the `compose` helper function, we simply have the following lambda in action:

```scheme
(define (repeated fn n)
  (if (= n 1)
      fn
      (lambda (x) (fn ((repeated fn (- n 1)) x)))))
```

See the [Scheme wiki] for further discussion on this exercise.

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

[^1]: There's even an [SRFI](https://srfi.schemers.org/srfi-232/) under review.

[previous post]: /post/bootstrap-in-scheme/
[functools]: https://docs.python.org/3/library/functools.html
[scheme wiki]: http://community.schemewiki.org/?sicp-ex-1.43
[simply scheme]: /post/simply-scheme/
