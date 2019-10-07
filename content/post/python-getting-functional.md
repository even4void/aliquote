---
title: "Getting functional using Python"
date: 2019-10-05T20:10:12+02:00
draft: true
tags: ["python", "review"]
categories: ["2019"]
---

Python comes bundled with lot of useful modules, and this is not limited to modules that we use daily, like `os`, `Path`, `math` or `re` to name a few of them. Julie Danjou offers a nice review in his book, _Serious Python_, if you are interested in digging further. In this post I shall focus on the [itertools](https://docs.python.org/2/library/itertools.html) module, but also [functools](https://docs.python.org/2/library/functools.html) in part, since they provide a gentle way to get into higher-order data structures and functions.

A function I really like in Clojure is [take](https://clojuredocs.org/clojure.core/take): basically you feed it with a sequence and ask to get the first `n` items. See, much like a `car`, but with varying length. Racket [has it](https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Flist..rkt%29._take%29%29) too. And here it is in Python:

```python
from itertools import islice

def take(n, iterable):
    return list(islice(iterable, n))
```

In the above example, our `take` procedure is just `itertools.islice` in disguise. And this makes use of _iterators_, which are streams of data. This means they are just lazy lists as we have in Scheme or Clojure. Here is a more intesting example:

```python
def nth(iterable, n, default=None):
    return next(islice(iterable, n, None), default)
```

This time, using almost the same construct we just recreated the `nth` procedure, available in many Lisp flavors. The `None` default value stands for the `end=` argument in `itertools.islice`, so we are just building an infinite stream of data, starting onward at `n`.

> With few exceptions, functional programming allows you to write more concise and efficient code. --- Julien Danjou, [Serious Python](https://julien.danjou.info/serious-python-released/)

What does it means exactly? Julien Danjou argues that a functional approach to Python programming is helpful in tems of modularity, brevity, concurrency and testability, the latter two deriving from the very first principle of FP: the input to output flow occurs without the function keeping state or modifying anything not reflected in the return value. In Python, [iterators](https://stackoverflow.com/q/9884132) and generators --- in which the state of the function is saved as a stack reference, while [yield](https://stackoverflow.com/q/231767) acts as a simple `return` statement --- are two of the most interesting features of the languages, in my view. Instead of building a whole list of items, consider using generator whenever possible since they act as lazy lists.
