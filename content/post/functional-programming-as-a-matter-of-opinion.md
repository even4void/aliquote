---
title: "Functional Programming as a Matter of Opinion"
date: 2018-04-24T23:47:08+02:00
draft: false
description: ""
tags: ["lisp"]
categories: []
---

I was just reading a recent article in the *Communications of the ACM*, [Using Functions for Easier Programming](https://cacm.acm.org/magazines/2018/5/227202-using-functions-for-easier-programming/fulltext), and I found myself thinking about what "functional" refers to when we talk about our preferred functional PL. Is this because we do rely on pure functions and immutable data or just because we can embrace the functional paradigm, meaning we write mostly functions, use local bindings only, and use (tail-) recursion or map/reduce---optionally with a bit of memoization---almost everywhere? 

<!--more-->

Although I know what the distinction between imperative and functional programming is, I believe we can benefit from using (or at least getting inspiration) both approaches or a mix thereof. See, for example, [Higher-Order Perl](https://hop.perl.plover.com). Nowadays, Scala is probably the best example of a multi-paradigm programming language, allowing for both imperative-like and functional programming.

> Just what counts as a functional language can be open to interpretation. "Haskell and ML are widely considered to be functional. Languages like C++ or C and even Java are considered to be imperative," Diatchki says. "Then there are languages like Scala, which sort of depends on who you talk to whether they're functional or imperative, because they support both styles." Often, programmers choose the style that suits them best, or even employ both in different parts of their code.
>
> -- Neil Savage, [Communications of the ACM, 61(5), 29-30](https://cacm.acm.org/magazines/2018/5/227202-using-functions-for-easier-programming/fulltext)

I started learning R after having spent 3 years with Matlab. I was using Turbo Pascal for teaching purpose as well. I can say that I was quite used to using for-loops at that time. Then, I read that we should avoid using for-loops in R and that there were more than one way to do this using the family of *apply functions or simple vectorized operations (e.g., `rowSums()`, `cumsum()`). That was fine with me. When I tried Julia four years ago, loops were back again (it is easier to optimize such constructs using the JIT compiler when they are embedded in a function, even if there are [some other subtleties](https://docs.julialang.org/en/stable/manual/performance-tips/) to get good performance). Again, that's fine, I have a flexible mind. 

When people hear Lisp, they usually think "Ah, that little piece of language for lists where you do put brackets around everything without using for-loop or whatsoever." You are not limited to manipulate cons cells using `car` and `cdr`, you can work with arrays too. You can even use for-loop in Common Lisp. Does this matter? Not really, you just have to [read Loop expressions with half of your brain in Lisp mode, and the other half in Pascal mode](http://cl-cookbook.sourceforge.net/loop.html). Here is a very basic use of a `loop` construct in Common Lisp: `(loop for i from 1 to 5 collect i)`. It will print the numbers 1 to 5 in your REPL; if you omit the instruction `from 1`, it will start at 0 so you will get 6 elements instead of 5. This is as readable as the equivalent C construct `for(int i=1; i<=5; i++)`.

Here is an implementation of the Sieve of Eratosthenes in Common Lisp from the [Rosetta project](https://rosettacode.org/wiki/Sieve_of_Eratosthenes#Common_Lisp):

```lisp
(defun sieve-of-eratosthenes (n)
  (loop
     with sieve = (make-array (1+ n)
                              :element-type 'bit
                              :initial-element 0)
     for candidate from 2 to n
     when (zerop (bit sieve candidate))
     collect candidate
     and do (loop for composite from (expt candidate 2) 
               to n by candidate
               do (setf (bit sieve composite) 1))))

(sieve-of-eratosthenes 101)
```
(This code uses an (1xn) array of unsigned bytes, initially filled with 0s, where n is the maximum number of values to look at. It then iterate over candidate values, using the sieve described in, e.g., [The Genuine Sieve of Eratosthenes](https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf), that is with an inner and an outer loop.)

When you run this code in your preferred Lisp REPL, you will get the first 26 prime numbers. There are many ways to [implement this algorithm in Haskell](https://wiki.haskell.org/Prime_numbers), but Mathematica also proves to have handy one-liner like this: `Prime[Range[26]]`. To iterate over the first 101 integers, the algorithm or the language you choose is of no great importance. Note that you get another algorithm for free here: if you map all 26 characters {A..Z} to those distinct prime numbers, you can check whether any two words are anagrams by simply computing the product of their characters.

To sum up, you can loop over elements in an array or a list in Lisp like you do in C or Python, and this is a matter of taste whether you use this kind of iteration instead of standard recursion, or more fancy features from your favorite language like [lazy sequences](http://clojuredocs.org/clojure.core/lazy-seq#example-542692d3c026201cdc326ff1), when performance is not affected (the preceding link will only work for small numbers---here is another [fancier version](https://stackoverflow.com/a/22668959)).

{{% music %}}The Kooks • *Listen*{{% /music %}}
