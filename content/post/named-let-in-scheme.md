---
title: "Named let in Scheme"
date: 2022-08-27T13:17:18+02:00
draft: true
tags: ["scheme"]
categories: ["2022"]
---

In [one of my last posts], I discussed Common Lisp `loop` macro. I just finished reading [The Adventures of a Pythonista in Schemeland], by Michele Simionato. Although it is now more than 10 years old, it is a very good read that I recommend to people interested in Scheme, especially if they want to learn more about macros. In this series of articles, the authors discusses some idiomatic construct in Scheme. Beside recursion, he shows an example of a for-loop form which I got interested in. Chicken Scheme, which is the current implementation of Scheme dialect I use,[^1] has a for-each construct which allows to write stuff like this:

```scheme
(define xs '(0 1 2 3 4))
(for-each print xs)
```

This is more limited than what's available in Racket's [iterations and comprehensions forms] but it has the merit of being there. Note that there are more involved constructs for [iterating over sequences].

In Scheme, a [named `let`] is the standard way to build such a for-like expression. Let's see an example:

```scheme
(import srfi-48)  ;; see also Chicken extras module

(let loop ((i 0))
  (unless (= i 5)
     (format #t "~a " i)
     (loop (+ i 1))))
```

This is well explained on [Stack Overflow], especially how it relates to tail-recursion. See also [Python to Scheme to Assembly, Part 1: Recursion and Named Let](https://davidad.github.io/blog/2014/02/28/python-to-scheme-to-assembly-1/), for another use case of recursion.

Instead of a for loop, let's consider a while loop. It is not much different, since in this case we have a predicate that helps stopping the iteration and a default case. See also this discussion on `call/cc` on [SO]. There's a bunch of useful utilities in the "standard prelude" of [Programming Praxis]. It targets R5RS, and some of its forms are already available in Chicken Scheme or Racket, but it is worth taking a look at the code. For instance, it features a macro for a [while loop] construct:

```scheme
(define-syntax while
  (syntax-rules ()
    ((while pred? body ...)
      (do () ((not pred?)) body ...))))
```

Example of use:

```scheme
(let ((loop 4))
  (while (< 0 loop)
         (display loop)
         (set! loop (- loop 1))))
=> 4321
```

It is defined as a [macro], and I just found that Jacques Chazarain once proposed a different solution, using pretty old syntax and non-hygienic macro:[^2]

```scheme
(define-macro (while test . body)
  `(letrec ((loop (lambda ()
                    (if ,test
                      (begin ,@body (loop))))))
     (loop)))
```

There is nevertheless a slight issue with the formulation above: the local function `loop` may happen to mask a variable bound in the `let` statement. To remedy this problem, one needs to use `gensym` to generate the name of the local loop construct, as illustrated below:

```scheme
(define-macro (while test . body)
  (let ((loop (gensym)))
    `(letrec ((,loop (lambda ()
                    (if ,test
                      (begin ,@body (,loop))))))
     (,loop))))
```

This is also discussed on [Chicken Scheme] website.

{{% music %}}MIKA • _Blue Eyes_{{% /music %}}

[^1]: It is the first Scheme implementation I heard about, around 2007, via Jan de Leeuw's mailing list on statistical computing. I wrote toy example, stopped using it and forgot about it until I got back to Scheme four or five years ago.
[^2]: Chazarain, J. _Programmer avec Scheme_. International Thomson Publishing, 1996.

[one of my last posts]: /post/cl-loop-macro/
[the adventures of a pythonista in schemeland]: http://www.phyast.pitt.edu/~micheles/scheme/
[iterations and comprehensions forms]: https://docs.racket-lang.org/reference/for.html
[iterating over sequences]: https://wiki.call-cc.org/eggref/5/sequences#iteration-constructs
[named `let`]: https://people.csail.mit.edu/jaffer/r5rs_6.html#IDX130
[stack overflow]: https://stackoverflow.com/questions/31909121/how-does-the-named-let-in-the-form-of-a-loop-work
[so]: https://stackoverflow.com/a/44110742/420055
[programming praxis]: https://programmingpraxis.com/contents/standard-prelude/
[while loop]: https://programmingpraxis.com/contents/standard-prelude/#control-flow
[macro]: https://docs.scheme.org/guide/macros/
[chicken scheme]: https://wiki.call-cc.org/man/5/Module%20(chicken%20syntax)#explicit-renaming-macros
