---
title: "Scheme Repeated Fn"
date: 2022-09-18T21:06:44+02:00
draft: true
tags: ["scheme", "sicp"]
categories: ["2022"]
---

In my previous post I discussed the repeated application of a function to build a list of results. This was done using a named let form, but SICP has an interesting application of repeated call to a function in exercise 1.43. Unlike the previous case, this times it's all about composing function using an auxiliary function, `compose`:

```scheme
(define (compose f g)
  (lambda (x)
    (f (g x))))
```

Now, a recursive call to a function that calls itself $n$ times, e.g. $f(x) = x^y$ which for $x=5$ and $y=4$ is $(5 \ times (5 \times (5 \times 5)))$, can be written as:

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

As an alternative, consider the following function defined in [Simply Scheme]:

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

[simply scheme]: /post/simply-scheme/
