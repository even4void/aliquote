---
title: "Common Lisp loop"
date: 2022-08-25T11:40:59+02:00
draft: false
tags: ["lisp"]
categories: ["2022"]
---

The Common Lisp `loop` macro is the most incredible thing I've seen so far when working with functional PL. It comes with so subtle variations that it is hard to summarize all of its functionalities in a few words. Let's consider the following two statements:

```lisp
(loop for i in '(0 1 2 3 4) do (format t "~a " i))
;; => 0 1 2 3 4
(loop for i on '(0 1 2 3 4) do (print i))
;; => (0 1 2 3 4)
;; => (1 2 3 4)
;; => (2 3 4)
;; => (3 4)
;; => (4)
```

The first instruction asks to iterate over each element of a list, while in the second we iterate over each cdr of a list. If you want to return a list for later consumption, you can use `(append (list i i))` or simply "collect" the elements, but see below. Any other builtin or user function that accept the iterator variable (`i`) as an argument will work too. Little subtelties...

> I don’t know if the loop macro in Common Lisp is genius or madness. It’s the idiomatic way to do iteration, but the syntax doesn’t resemble Lisp in any way, the number of variations is as long as your arm, and you can mix and match every which way. --- [A Closed and Common Lisp](https://www.flooey.org/commonlisp.html)

A standard for loop construct is written:

```lisp
(loop for i from 0.0 to 4.0 by 0.5 do (format t "~a " i))
;; => 0.0 0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0
```

Note that `loop` works with real number too, unlike some other functions or macros, and that you are not limited to generating sequences of increasing values -- replace start and end value and `to` with `downto` to get sequence in descending order.[^1] If you are an Alexandria's user, you probably already know the `iota` function, which helps in generating sequence of equally spaced integers (think of Python's `range` function). Here it is in action, and its equivalent version using `loop` using keyword parameters:

```lisp
(iota 5)
;; => (0 1 2 3 4)
(loop :for n :below 5 :collect n)
;; => (0 1 2 3 4)
```

The `loop` macro also supports conditional statement in between, like in `(loop for i from 1 to 10 when (oddp i) collect i)`.

The only contender to CL's `loop` macro is Racket's [iterations and comprehensions forms](https://docs.racket-lang.org/reference/for.html), which I use a lot for little scripts. [Chicken Scheme](https://wiki.call-cc.org/eggref/5/simple-loops) and [Clojure](https://clojuredocs.org/clojure.core/loop) also have for loop constructs which are pretty handy. Many times, though, for loops are not really needed and can be safely replaced with `map` or `fold`, or variations thereof, even in [Python](https://medium.com/python-pandemonium/never-write-for-loops-again-91a5a4c84baf). There was an interesting discussion on for loop in Scheme on the IRC #scheme channel recently, but I forgot to bookmark the conversation. It's probably [in the log](https://snailgeist.com/irc-logs), though.

If you are interested in macros, I can suggest the following blog posts:

- [Idiomatic Macros for Common Lisp](https://stuartsierra.com/2006/06/03/idiomatic-macros), by Stuart Sierra
- [The Nature of Lisp](https://www.defmacro.org/ramblings/lisp.html), by Slava Akhmechet
- [Racket Macro Exercises](https://lexi-lambda.github.io/racket-macro-exercises/index.html), by Alexis King
- [Iterators and for loops with Guile Scheme](https://willosborne.co.uk/coding/2019/11/16/iterators-and-for-loops-with-guile-scheme.html), by Will Osborne
- [Macros in Racket, part one](https://tfeb.org/fragments/2015/01/13/macros-in-racket-part-one/) and [The proper use of macros in Lisp](https://www.tfeb.org/fragments/2021/11/11/the-proper-use-of-macros-in-lisp/), by Tim Bradshaw
- [Haskell doesn't have macros](https://chrisdone.com/posts/haskell-doesnt-have-macros/), by Chris Done

{{% music %}}XXX • _XXX_{{% /music %}}

[^1]: They are known as the `arithmetic-up` and `arithmetic-downto` arguments. See the [HyperSpec documentation](http://www.lispworks.com/documentation/HyperSpec/Body/m_loop.htm).
