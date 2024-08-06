---
title: "Tech Review / October 2018"
date: 2018-10-26T18:52:27+02:00
draft: false
tags: ["readings", "review"]
categories: ["2018"]
---

Here is the (not so) monthly tech newsletter for October. Please note that other link-only items are available in my latest [bag of tweets](/post/bag-of-tweets-103).

According to Wikipedia, probabilistic programming refers to a programming paradign "designed to describe probabilistic models and then perform inference in those models." I am still on my way to give [Anglican](http://www.robots.ox.ac.uk/~fwood/anglican/language/index.html) a more serious try in the future, but in the meantime, here is the book to read on arXiv: [An Introduction to Probabilistic Programming](https://arxiv.org/abs/1809.10756), written by Jan-Willem van de Meent, Brooks Paige, Hongseok Yang, and Frank Wood. Interestingly, the authors decided to use an abstract language similar in syntax and semantics to Anglican for their illustrations, which is not surprising since Frank Wood designed the Anglican PPL.

[Zip trees](https://arxiv.org/abs/1806.06726) have recently been proposed as a new form of [randomized binary search trees](https://en.wikipedia.org/wiki/Treap), which constitutes an alternative to more classical balanced binary search tree structures. Binary search trees can be [implemented in Clojure](https://eddmann.com/posts/binary-search-trees-in-clojure/) without much pain. However, a zip tree differ from the classical treap by the fact that priority ties are resolved by favoring smaller keys, whereby the parent of a node has rank greater than that of its left child and no less than that of its right child, while insertions and deletions are handled with [unzipping and zipping](https://rd.springer.com/article/10.1007%2FBF02576649).

Here is a lovely [interactive population map](https://pudding.cool/2018/10/city_3d/) that I found recently on Twitter (h/t [@maartenzam](https://twitter.com/maartenzam/status/1055200741575614465)):

{{< figure src="/img/DqTTMpkWkAEd_ws.jpg-large.jpeg" >}}

[Principles of Algorithmic Problem Solving](https://www.csc.kth.se/~jsannemo/slask/main.pdf), by Johan Sannemo, with [HN thread](https://news.ycombinator.com/item?id=18287355), provides a nice introduction to desigining various algorithms, ranging from brute-force methods to dynamic programming, combinatorics or number theory. It uses C++ like the Competitive Programmer's Handbook that I [reviewed earlier](/post/the-competitive-programmer-s-handbook).

I read a few interesting blog posts recently:

- [The Story of Emacs Lisp](http://irreal.org/blog/?p=7561) (Irreal), with follow up posts, provides an interesting account of Emacs history.
- [How to automate common tasks](https://blog.stata.com/2018/10/09/how-to-automate-common-tasks/) (Stata blog), or how to deal with scripting, do-file and ado programming in Stata.
- [Practical Peer Review](http://bactra.org/weblog/practical-peer-review.html) (Three-Toed Sloth). What else to say?

     > This is the importance of grasping, or really of making part of one's academic self, two truths about peer review.
     >
     > 1. The quality of peer review is generally abysmal.
     > 2. Peer reviewers are better readers of your work than almost anyone else.

- [Statistically Efficient Ways to Quantify Added Predictive Value of New Measurements](http://fharrell.com/post/addvalue/) (Frank Harrell), a really thoughful discussion of predictive modeling with discrete outcomes.

I just learned about [nextflow](https://www.nextflow.io) which enables scalable and reproducible scientific workflows using software containers (actually, [Docker](http://docker.io/) and [Singularity](http://singularity.lbl.gov/)). What is interesting is that it relies on the idea of Un\*x interoperability between processes via pipes (something that we also found in Elixir or R, or even [Python](https://hackernoon.com/adding-a-pipe-operator-to-python-19a3aa295642)). While I have a hard time using pipes when writing R scripts, I can imagine the benefit of this approach in various settings, especially data processing workflow.

A new Vega-based implementation of density maps, this time for multiclass problems, is available on Github. The first time I saw it, this reminded me of Hadley Wickham's work on [Embedded Plots](http://vita.had.co.nz/papers/embedded-plots.html) (or maybe, [Glyph Maps](http://vita.had.co.nz/papers/glyph-maps.html)).

{{< figure src="/img/multiclass-density-map.png" >}}

As I always loved 3D moving geometrical objects--and I regularly check plenty of them on Twitter, here is one to end this review:

{{< tweet user="beesandbombs" id="1047136671895101440" >}}
