---
title: "On memoization"
date: 2019-12-21T17:41:01+01:00
draft: false
tags: ["racket", "python", "haskell"]
categories: ["2019"]
---

Memoization is a technique that keeps intermediate results in memory in order to speed up execution of a computer program. In other words, we store results from succesive call to a given function so that whenever it is called with the same arguments we don't need to evaluate this function again and again and just pick the value computed from a previous call. This is somewhat akin to using a cache to manage the state of a function or a stack of its returned values, or more generally to dynamic programming (we talked a bit of DP in the case of [Motzkin numbers](post/motzkin-numbers)). This assumes that the function is pure, which is often the case in functional PLs, and it is related to [Y-Combinator](http://hisham.hm/2011/04/04/understanding-at-last-the-y-combinator-a-programmer-friendly-perspective), Y = λf · (λx · f (x x)) (λx · f (x x)), which allows to devise a non-recursive version of a function, apply Y to it, and get a recursive function in turn. 

Even with pure function (no side effect) and referential transparency (replacing an expression with its value does not modify the behavior of the program), there are cases where memoization is not possible without resorting to higher-order function, in particular when a recursive function has to perform memoized calls to itself. Indeed, using lambda calculus alone does not allow to devise recursive function since there's no way to call anonymous function (the f in λx · f(x x)) unless we give it a name. Hence the need for a *combinator*, i.e. another function without free variables, which allows a function to call itself, without giving it a name in the scope in which it is declared. In Racket, this is expressed as follows:

```racket
#lang lazy

(define Y (λ(f)((λ(x)(f (x x)))(λ(x)(f (x x))))))

(define fib
  (Y (λ(f) (λ(x) (if (equal? x 1) 1 (* x (f (- x 1))))))))
```

You will find similar patterns for Python, Haskell, and even C on this [Medium post](https://levelup.gitconnected.com/implementing-recursion-with-the-y-combinator-in-any-language-9e83fa369ca). Do we need to write all this by ourselves? No, not really, since Racket already comes with a memoization procedure for typed or untyped programs. Here is an example for the Fibonacci sequence using typed Racket:

```racket
(require tmemoize)

(: fib (-> Integer Integer))
(define fib (memoize (lambda ([n : Integer])
                        (if (<= n 1) 1
                            (+ (fib (- n 1))
                               (fib (- n 2)))))))
```

Unfortunately,  the `tmemoize` package seems no longer available, so here is a modified version using untyped Racket:

```racket
#lang racket

(require memoize)
(require racket/trace)

(define/memo (fib n)
  (if (<= n 1) 1 (+ (fib (- n 1)) (fib (- n 2)))))

(trace fib)
(fib 10)
```

The number of function calls should be 2*F*(*n*) − 1, where *F*(*n*) is the Fibonacci number corresponding to *n*. You can "trace" function calls when memoization is enabled or not using the `racket/trace` module, as illustrated in the above script. By running this script in a terminal (`racket fib.rkt | grep fib | wc -l`), you can easily check that there are just 19 calls to `fib` when memoization is enable whereas  there's a total of 177 function calls, as expected, when it is not (you just have to remove the `define/memo` form).

A more interesting discussion is provided on [JP's blog](https://blog.jverkamp.com/2012/10/20/memoization-in-racket). Another implementation is available on Henry Brooks' [website](https://hebr3.github.io/2017/04/memoization-in-racket.html). There's also a crazy version on [Coursera](https://www.coursera.org/lecture/programming-languages-part-b/memoization-SqEc5) (starting at 3'50). Finally, there is a nice discussion of memoization, from which most the code above borrows from, on the Racket blog: [Dynamic Programming versus Memoization](https://blog.racket-lang.org/2012/08/dynamic-programming-versus-memoization.html).

Regarding Python, I didn't invest much in the [joblib](https://pypi.org/project/joblib/) module --- which is able to cache intermediate results, AFAIK --- but I relied on the [`lru_cache` decorator](https://stackoverflow.com/a/49883466) from the `functools` module, instead:

```python
import functools

@functools.lru_cache(None)
def fib(n):
    if n < 2:
        return n
    return fib(n-1) + fib(n-2)
```

Similar tracing functionalities are available in Python, e.g. using the following [snippet](https://stackoverflow.com/a/8315566):

```python
import sys

def tracefunc(frame, event, arg, indent=[0]):
    if event == "call":
        indent[0] += 2
        print("-" * indent[0] + "> call function", frame.f_code.co_name)
    elif event == "return":
        print("<" + "-" * indent[0], "exit function", frame.f_code.co_name)
        indent[0] -= 2
    return tracefunc
```

Then you'll just need to add `sys.settrace(tracefunc)` before your function call.

Haskell is quite good actually when it comes to keeping intermediate results in memory: You just have to [name it](https://stackoverflow.com/a/11466959); in the case of Fibonacci numbers, this means keeping a list of intermediate results, which remains in memory despite garbage collection. The [Haskell wiki](https://wiki.haskell.org/Memoization) has a nice application of memoization, although there are [other examples](https://stackoverflow.com/q/3208258) available on SO:

```haskell
fib :: (Int -> Integer) -> Int -> Integer
fib f 0 = 1
fib f 1 = 1
fib f n = f (n - 1) + f (n - 2)

-- this function takes care of memoization per se
memoize :: (Int -> a) -> (Int -> a)
memoize f = (map f [0 ..] !!)

-- and here is the memoized fib function
fibMemo :: Int -> Integer
fibMemo = fix (memoize . fib)
```

<small>`Integer` is an arbitrary precision type in Haskell, while `Int` corresponds to traditional 32- or 64-bit integer.</small>