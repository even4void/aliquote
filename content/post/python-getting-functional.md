---
title: "Getting functional using Python"
date: 2019-10-06T20:10:12+02:00
draft: false
tags: ["python", "review"]
categories: ["2019"]
---

Python comes bundled with lot of useful modules, and this is not limited to modules that we use daily, like `os`, `Path`, `math` or `re` to name a few of them. Julie Danjou offers a nice review in his book, _Serious Python_, if you are interested in digging further. In this post I shall focus on the [itertools](https://docs.python.org/2/library/itertools.html) module, but also [functools](https://docs.python.org/2/library/functools.html) in part, since they provide a gentle way to get into higher-order data structures and functions.

This is also the occasion to partly review [Julien Danjou's book](https://serious-python.com), which is really a nice piece of work if you want to understand the underside of Python, especially regarding package import and path management. Note that this will not teach you Python programming, but it will certainly be helpful to better understand Python, think about design patterns, and how to develop your own projects. Each chapter provides a discussion of important topics in project development, and a brief interview by core developers is provided at the end. Note that some chapters are very specific of some aspects of Python programming, or PL more generally.

A function I really like in Clojure is [take](https://clojuredocs.org/clojure.core/take): basically you feed it with a sequence and ask to get the first `n` items. See, much like a `car`, but with varying length. Racket [has it](https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Flist..rkt%29._take%29%29) too. And here it is in Python:

```python
from itertools import islice

def take(n, iterable):
    return list(islice(iterable, n))
```

In the above example, our `take` procedure is just `itertools.islice` in disguise. And this makes use of _iterators_, which are streams of data. This means they are just lazy lists as we have in Scheme or Clojure. Here is a more intesting example, from Justin Poliey:

```python
def nth(iterable, n, default=None):
    return next(islice(iterable, n, None), default)
```

This time, using almost the same construct we just recreated the `nth` procedure, available in many Lisp flavors. The `None` default value stands for the `end=` argument in `itertools.islice`, so we are just building an infinite stream of data, starting onward at `n`.

> With few exceptions, functional programming allows you to write more concise and efficient code. --- Julien Danjou, [Serious Python](https://julien.danjou.info/serious-python-released/)

What does it means exactly? Julien Danjou argues that a functional approach to Python programming is helpful in tems of modularity, brevity, concurrency and testability, the latter two deriving from the very first principle of FP: the input to output flow occurs without the function keeping state or modifying anything not reflected in the return value. In Python, [iterators](https://stackoverflow.com/q/9884132) and generators --- in which the state of the function is saved as a stack reference, while [yield](https://stackoverflow.com/q/231767) acts as a simple `return` statement --- are two of the most interesting features of the languages, in my view. Instead of building a whole list of items, consider using generator whenever possible since they act as lazy lists.

Justin Poliey has some [nice code](https://github.com/jdp/euler) relying on the `itertools` module, like the above, to solve Euler projects. For instance, here is his solution to [Problem 3](https://projecteuler.net/problem=3):

```python
def euler_3():
    """Find the largest prime factor of a composite number."""
    from math import sqrt
    from itertools import takewhile
    from eutil import primes

    num = 600851475143
    ps = takewhile(lambda p: p < sqrt(num), primes())
    return max([p for p in ps if num % p == 0])
```

And this is my code (in Racket):

```racket
(require math)

(define (largest-prime-factor x)
 (apply max (map car (factorize x))))

(define (sol-003 (n 600851475143))
  (largest-prime-factor n))

(sol-003)
```

See, there's no loop, nor any complex control structure (except maybe list comprehension in the case of Python). Above all, you may recall that most operations in FP are just a combination of `map`, `apply` and/or `filter` (or `reduce`), you're almost done since Python has you covered. Some examples of use, especially regarding `map` and `filter`, are discussed by Julien Danjou.

In passing, I learned about `first.first` which might prove very handy when working with stack- or heap-like data structures. Other interesting `itertools` functions (chapter 8): `acumulate(iterable[,func])` returns a series of accumulated sums of items from iterables; `chain(*iterables)` iterates over multiple iterables, one after another, without building an intermediate list of all items; `combinations(iterable,r)` generates all combinations of length `r` from the given iterable; `compress(data,selectors)` applies a Boolean mask from selectors to data and returns only the values from data where the corresponding element of selectors is `True`; `count(start,step)` generates an endless sequence of values, starting with start and incrementing step at a time with each call; `cycle(iterable)` loops repeatedly over the values in iterable; `repeat(elem[,n])` repeats an element ntimes; `dropwhile(predicate,iterable)` filters elements of an iterable starting from the beginning until predicateis False; groupby(iterable,keyfunc) creates an iterator that groups items by the result returned by the `keyfunc()` function; `permutations(iterable[,r])` returns successive `r`­length permutations of the items in iterable; `product(*iterables)` returns an iterable of the Cartesian product of iterables without using a nested for loop; `takewhile(predicate,iterable)` returns elements of an iterable starting from the beginning until predicate is `False`. And of course, there's the `functools` [partial](https://stackoverflow.com/q/15331726) function.
