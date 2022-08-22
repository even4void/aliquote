---
title: "Simply Scheme"
date: 2022-08-21T09:39:09+02:00
draft: false
tags: ["review", "readings", "scheme"]
categories: ["2022"]
---

_Simply Scheme_, by Brian Harvey and Matthew Wright, is available [on line] in PDF and HTML versions. It is presented as an introductory textbook on computer science, with six chapters covering the basis of (interactive) functional programming: functions, compositions of functions, functions as data, recursion, abstraction, and sequential programming. It is not the first book I read on Scheme. I started with The Little series some years ago, followed by two textbooks in French, and this book is different in that it follows an example-driven approach to teaching Scheme. If you are looking for a such an introduction in Scheme to functional programming, go take a look at the first four chapters to get an idea. For people coming from Python and interested in learning a bit of Scheme, I would also recommend [The Adventures of a Pythonista in Schemeland]. If you're a Racket user, there's even a dedicated library: [simply-scheme].

Note that the authors use older syntax for Scheme expressions than what is now known as R6 or R7RS (but see below), and they also provide some helper functions in a separate file, `simply.scm` (see Appendix A). It is important to download a copy of this file in order to be able to run the examples, since almost all of them use functions defined in that module. For instance, the `accumulate` function is defined as follows:

```scheme
(define accumulate
  (let ((not not) (empty? empty?) (bf bf) (first first) (procedure? procedure?)
	(whoops whoops) (member member) (list list))
    (lambda (combiner stuff)
      (define (real-accumulate stuff)
	(if (empty? (bf stuff))
	    (first stuff)
	    (combiner (first stuff) (real-accumulate (bf stuff)))))
      (cond ((not (procedure? combiner))
	     (whoops "Invalid first argument to ACCUMULATE (not a procedure):"
		     combiner))
	    ((not (empty? stuff)) (real-accumulate stuff))
	    ((member combiner (list + * word se)) (combiner))
	    (else
	     (whoops "Can't accumulate empty input with that combiner"))))))
```

<small><code>whoops</code> in an error-handler function.</small>

Example of use:

```scheme
> (load "simply.scn")
> (define (acronym phrase)
    (accumulate word (every first phrase)))
> (acronym '(american civil liberties union))
aclu
```

As such, the reader doesn't necessarily get into Scheme's subtleties until chapter 3 or 4 maybe. The very first chapters are here to illustrate some general concepts from computing science: what a statement is, data structures such as lists, sets, the logic behind basic algorithms (e.g., permutations, factorial), branching patterns and function composition. The concepts of predicate and special form only appears in chapter 6, but that's not a big deal since the authors favour an approach based on examples and introduce important concept one after the other (usually, one or two main concepts per chapter). Chapter 9 introduces lambda expression, and things start to get more interesting, especially when discussing named and anonymous functions.

> An even more powerful use of lambda is to provide the value returned by some procedure that you write.

Chapter 10 deals with the Tic-Tac-Toe game and the author discuss how to solve the problem using reasoning and Scheme techniques available so far. This makes heavy use of helper functions available in `simply.scm`.

Next comes some chapters dealing with recursion, with complete functions defined along the way. As an example, consider the following snippet:

```scheme
(define (evens sent)
  (if (<= (count sent) 1)
      '()
      (se (first (bf sent))
	  (evens (bf (bf sent))))))
```

This function takes a sentence as its argument and returns a sentence of the even-numbered words of the original sentence. The authors write three versions of the same procedure before offering the best option. They later discuss the case of simplifying base case in recursive functions. The last chapter on recursion presents several functions written by the authors (e.g., `every`, `keep`, `accumulate`) and that were used previously. I found that this helps thinking back to previous exercises and how they could possibly be solved using the highlighted procedures.

The authors sometimes use diagrams or illustrations to explain the behavior of some functions. Most of the examples discussed in the book deal with the manipulation of strings. All chapters end up with a series of exercises, some of which are just applications of what have been discussed in the chapter. There are also mini-projects at the end of some chapters. Together with the heuristic or example-based approach, this reminds me of [Practical Common Lisp], by Peter Seibel.

I wish I learned about this book earlier because it is both a good read (I like the authors' writing style) and a valuable tool for those who want to practice in Scheme. Don't stop at your first impression after chapter 4, things start to get really interesting with Parts III and IV. Reader of _The Little Schemer_ may enjoy this book as well, especially the exercises and mini-projects. The only caveat is that following the textbook requires the authors' toolbox, and not only a base Scheme installation -- however, given that some of the concepts discussed in the book are quite advanced, it is somewhat expected to provide the reader with some additional tools as the authors acknowledge, which would otherwise deserve several chapters to expose.

{{% music %}}Led Zeppelin • _You Shook Me_{{% /music %}}

[on line]: https://people.eecs.berkeley.edu/~bh/ss-toc2.html
[the adventures of a pythonista in schemeland]: http://www.phyast.pitt.edu/~micheles/scheme/
[simply-scheme]: https://docs.racket-lang.org/manual@simply-scheme/index.html
[practical common lisp]: https://gigamonkeys.com/book/
