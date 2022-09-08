---
title: "Algorithms for functional programming"
date: 2022-09-08T21:52:36+02:00
draft: false
tags: ["review", "scheme"]
categories: ["2022"]
---

I started reading _Algorithms for Functional Programming_, by John David Stone (Springer, 2018), and it's one of my preferred technical book of this Summer. My plan is to finish reading it before the start of the new academic year, and then read [Functional Algorithms, Verified!], then _Purely Functional Data Structures_, by Okasaki, and maybe Bird's _Pearls of Functional Algorithm Design_ in the next few months. Stay tuned!

In this book, the author uses Scheme to illustrate all the concepts discussed in the book. After a brief introduction to functional programming and Scheme (Chapter 1), the author starts discussing more involved concepts. I should note that even if Chapter 1 is an introductory chapter, it features material that you will not find in introductory tutorial on Scheme, like `receive` expressions[^1] or advanced `let` constructs. In Chapter 2, the author discusses several add-ons for working with lists (e.g. `map`) and procedures (adapters, couplers, etc.), which allows to define all kind of function composition or dispatiching. Later, reducers and iterators are implemented, which for a complete distinct set of operations one usually perform using recursion alone. An example if

```scheme
(define (ceiling-of-log-two bound)
  ((pipe (iterate (pipe >initial (sect >= <> bound))
                  (cross double add1))
         >next)
   1 0))
```

I find this formulation a bit heavy, and I prefer the more classical appraoch the author suggests as an alterntive a few paragraphs later:

```scheme
(define (ceiling-of-log-two bound)
  ((rec (doubler most-recent-double count)
     (if (>= most-recent-double bound)
         count
         (doubler (double most-recent-double) (add1 count))))
   1 0))
```

There is a nice overview of recursion using natural numbers, again using "recursion managers". Later the author presents a `tally` function, simialr to what's available in Python or Clojure

The rest of the book is organized around data structure (Chapter 3 covers sum and product types, unions, pairs and named pairs, boxes which are restrictions of pairs, and various operations that can be performed on lists, trees and bags, sets, tables, and buffers) and various kind of algorithms along with the data structures they are best tied to (sorting, graphs, and sublist search), which makes for another half of the book. I am still reading or rereading some parts, because despite everything this book remains quite dense unless you have a good Scheme and have many years of hindsight (which is not my case).

In each chapter, or even in between sections, a useful recap of Scheme procedures currently discussed is provided, with type hinting and a brief description. I found this very handy as it allows to go back to previous chapter for quick checks.

{{% music %}}Iggy Pop • _Some Weird Sin_{{% /music %}}

[^1]: Quoting the author, in let-expressions, it is an error if any expression in a binding speciﬁcation has more than one value. Frequently, however, we want to have local names for the values of a multiple-valued expression. A third local-binding construction, the receive-expression, provides for this possibility.

[functional algorithms, verified!]: https://functional-algorithms-verified.org/
