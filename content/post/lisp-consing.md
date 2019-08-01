---
title: "List processing and consing"
date: 2019-07-29T08:39:56+02:00
draft: false
tags: ["readings", "lisp", "scheme"]
categories: []
---

I just finished reading _The Little Schemer_, by Friedman and Felleisen. Here are some basic facts about very simple yet useful data structures: lists.

<!--more-->

First of all, this is a very nice book for people interested in Lisp, Scheme, or functional programming to a larger extent. It is very different from SICP in that it focus on basic building blocks (`car`, `cdr`, `cons`, `eq`, etc.) and use a very pragmatic approach to understanding the structuration and interpretation of forms and s-expr. The penultimate goal of this book (4th ed., after the original _Little Lisper_) is to learn to think in a functional way. The ten commandments are worth keeping in mind for that very specific purpose:

1. When recurring on a list of atoms, `lat`, ask two questions about it: `(null? lat)` and `else`. When recurring on a number, `n`, ask two questions about it: `(zero? n)` and `else`. When recurring on a list of s-expr, `l`, ask three questions about it: `(null? l)`, `(atom? (car l))`, and `else`.
2. Use `cons` to build lists.
3. When building a list, describe the first typical element, and then `cons` it into the natural recursion.
4. Always change at least one argument while recurring. When recurring on a list of atoms, `lat`, use `(cdr lat)`. When recurring on a number, `n`, use `(sub1 n)`. And when recurring on a list of s-expr, `l`, use `(car l)` and `(cdr l)` if neither `(null? l)` nor `(atom? (car l))` are true.
   It must be changed to be closer to termination. The changing argument must be tested in the termination condition: when using `cdr`, test termination with `null?`, and when using `sub1`, test termination with `zero?`.
5. When building a value with `÷`, always use 0 for the value of the terminating line, for adding 0 does not change the value of an addition. When building a value with `x`, always use 1 for the value of the terminating line, for multiplying by 1 does not change the value of a multiplication. When building a value with `cons`, always consider `()` for the value of the terminating line.
6. Simplify only after the function is correct.
7. Recur on the subparts that are of the same nature: on the sublists of a list; on the subexpressions of an arithmetic expression.
8. Use help functions to abstract from representations.
9. Abstract common patterns with a new function.
10. Build functions to collect more than one value at a time.

Rules 1 and 4 mostly ressemble safe guards we would use in any programming language, and the other rules also apply even in imperative languages. However, in this post I am only interested in rule 2: using `cons` to build list. LISP stands for LISt Processing, right? And indeed, lists and sequences are the most useful data structures in Lisp or Scheme dialects, inasmuch as we don't need vectors. A cons cell is just a record holding two values, much like a pair as in `(1 . 2)`. Note that it is different from `(list 1 2)`, which in fact is composed of two cons cells, where the first cons cell contains 1 and a pointer to the second cons cell (same for the second cons, except that it includes `nil` to signal the end of the list). So, to add an element in front of a list, you will just be consing it as in the following example:

```lisp
(cons 1 (list 2 3 4))
```

The `car` of the above expression is just 1, and its `cdr` is `(2 3 4)`. And most operations on lists will rely on these ideas: add an element upfront, or inspect the very first item and keep the remaining elements for further processing. Clojure also comes with a `cons` function (and a `conj`, which acts differently whether items are grouped in a list, vector, set or map--the so-called [concrete type](https://clojuredocs.org/clojure.core/conj)). Racket provides [custom accessors](https://docs.racket-lang.org/reference/pairs.html), like `first` and `rest`, and even `last` or `append`, in addition to all the above Lisp operators. And go read a [previous post of mine](/post/category-theory/) to see an implementation of cons in Haskell.

Finally, I should note that Rainer Joswig provides a good overview of [cons and memory allocation](https://stackoverflow.com/a/2256613) in Lisp, and why consing may add a bit of overhead to a program. And Paul Graham discusses extensively the use of cons vs. macros in his book [_On Lisp_](http://www.paulgraham.com/onlisptext.html) (I still have to manage to find some time to read it more seriously one day!).

In Python, lists are implemented as vectors, not as single linked lists (in this case, you would probably want to try a [deque](https://docs.python.org/3/library/collections.html#collections.deque)). However, it is quite easy to adapt the definition of `cons`, `car` and `cdr` discussed in the [SICP](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-14.html#%_sec_2.1.3) (nicely typesetted [PDF here](http://web.mit.edu/alexmv/6.037/sicp.pdf)) as closures:

```lisp
(define (cons x y)
   (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))
```

See what's going on? In this case, the definition of `cons` implies a closure holding two values (`x` and `y`). Whenever you call `car` or `cdr` with a "cons", you are actually calling a function that selects either the first or the second member of the pair `(p q)`. Translation to Python is straightforward, even if this does not please some [PEP conventions](https://www.python.org/dev/peps/pep-0008/#programming-recommendations) (flake8 will report an E731 on the following piece of code):

```python
def cons(x, y):
    return lambda m: m(x, y)

def car(z):
    return z(lambda p, q: p)

def cdr(z):
    return z(lambda p, q: q)
```
