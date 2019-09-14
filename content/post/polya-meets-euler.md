---
title: "From Polya to Euler problem"
date: 2019-07-12T10:20:08+02:00
draft: false
tags: ["math", "euler", "racket"]
categories: ["2019"]
---

One of Euler problem asks to find the number of ways we can traverse a square lattice using only horizontal and vertical moves (think of the Manhattan distance).

<!--more-->

Interestingly, while a brute-force approach might help to find a working solution in [more or less](http://code.jasonbhill.com/python/project-euler-problem-15/) decent time, this problem amounts to a problem of combinatorics. Pólya proposed a similar problem, where the task is to spell out "abracadabra" by traversing the following pattern, assuming the starting position is at the top most A:<sup>[^1]</sup>

         A
        B B
       R R R
      A A A A
     C C C C C
    A A A A A A
     D D D D D
      A A A A
       B B B
        R R
         A

As you can see, we can only move in two directions, and the problem is identical to Euler problem 15. Here is a valid solution:

         A
        • B
       • • R
      • • A •
     • • • C •
    • • • A • •
     • • D • •
      • A • •
       • B •
        R •
         A

There are of course many other valid solutions. How many exactly? In fact, it can be shown that this path finding problem amounts to compute how many different paths there are from the nrothern corner to various other corners, travelling only in one two directions. If we label each node with the number of ways they can be reached, we get the well-known [Pascal triangle](https://en.wikipedia.org/wiki/Pascal%27s_triangle), and of course these numbers are the [binomial coefficients](https://en.wikipedia.org/wiki/Binomial_coefficient), which Euler noted as $n \choose r$ to indicate the number of ways of choosing a subset of size $r$ from a set of fixed size $n$. The boundary conditions are ${n \choose 0} = {n \choose n} = 1$, and there exists a nice recursive relationship, which can also be inferred upon inspecting Pascal triangle:

$$ {n+1 \choose r} = {n \choose r-1} + {n \choose r}. $$

In the case of Euler problem 15, the question can be reframed as choosing $k$ out of $2k$ possible paths, assuming the order doesn't matter, or ${2k \choose k} = \frac{(2k)!}{k!\cdot k!}$. Factorials are easy to compute, and for moderate $k$ like in this case, using standard multiplication should perform correctly.

Here is my solution to Euler problem 15 in Racket. Note that Racket does not provide a `reduce` procedure, unless you are willing to use the [srfi/1](https://docs.racket-lang.org/srfi/srfi-1.html?q=reduce) module. The following code makes use of a custom `reduce` function which expects two parameters, a function and a list: the function is applied to the head of the list and the reduction follows with the rest of the list.

```scheme
(define (reduce f xs)
  (and (not (empty? xs)) (foldl f (first xs) (rest xs))))

(define (f n)
  (reduce (lambda (x y) (* x y)) (range 1 (add1 n))))

(define (sol-015 [n 20])
  (ceiling (/ (f (* n 2)) (f n) (f n))))

(sol-015)
```

[^1]: Pólya, George, Tarjan, Robert E. and Woods, Donald R. _Notes on Inroductory Combinatorics_. Springer, 1983.
