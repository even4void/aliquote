---
title: "March in review"
date: 2020-03-16T10:10:48+01:00
draft: false
tags: ["readings"]
categories: ["2020"]
---

Here is the monthly review on aliquote. Times are changing fast these days, let's keep busy and focused inasmuch as we can.[^1]

- Last week I came across a nice blog, available in French and English: [Literal translations](https://blog.merigoux.ovh/en/table-of-contents.html). There are interesting discussion on Rust or [dynamic vs. static languages](https://blog.merigoux.ovh/en/2017/07/19/static-or-dynamic.html).
- [How to blog with Emacs Org mode](https://opensource.com/article/20/3/blog-emacs): Hugo has become a reliable medium for building static blog during the past few years. I tried to use an [Org backend](/post/blogging-with-ox-hugo/) at some point, but finally I keep editing plain Markdown files, in Emacs of course. [Typora](/post/typora/) was really nice, but not as powerful as Emacs in the long run. Anyway, this blog post explains everything you need to setup a blog using [org-publish](https://orgmode.org/worg/org-tutorials/org-publish-html-tutorial.html).
- If you are a Python user interested in functional programming, go check the [fnc](https://github.com/dgilland/fnc) project (not to be confised with this [FNC](https://github.com/tobydriscoll/fnc-extras/tree/master/python)) and see if it is worth a try. I'm still into Python's own [functools](https://docs.python.org/3.7/library/functools.html) but maybe it is an interesting option.
- Not really much about haskell itself, but Taylor Fausak's take on how to design a library that checks whether two [intervals overlap](http://taylor.fausak.me/2020/03/13/relate-intervals-with-rampart/) or not was a nice read. There are indeed [13 different ways](https://stackoverflow.com/a/5601502) that two intervals can relate to each other.
- Did you notice that [Julia](https://julialang.org)'s website has been redesigned. I just learned that it is now driven by [Franklin](https://franklinjl.org), a new static website generator. Interestingly, it integrates the [Literate](https://github.com/fredrikekre/Literate.jl) package, which is a simplistic package for Literate Programming where lines starting with # are treated as markdown, while all other lines are treated as julia code (much like good old [Docco](https://ashkenas.com/docco/), Rocco & Co.).
- Robert Smith just released a new Lisp package, [Hypergeometrica](https://github.com/stylewarning/hypergeometrica), to compute Pi digits.

  > Hypergeometrica aims to democratize the calculation of pi to trillions of digits. As of March 2020, the software used to break world-record computations has remained closed source. This has been a 20+ year trend, and includes famous software such as y-cruncher, TachusPI, PiFast, and SuperPi.

- John Baez has some nice pages on [Random Permutations](http://math.ucr.edu/home/baez/permutations/). As $n\to\infty$, the probability that a random permutation of an $n$-element set has $k$ fixed points approaches $\frac{1}{ek!}$. In the same limiting case, the average length of the longest cycle in a random permutation is $\lambda n$, where $\lambda\approx 0.624$.
- Tom MacWright wrote a small Elm interactive [dashboard for cocktail](https://oldfashioned.tech) lovers. Lovely.

[^1]: Don't expect any news from COVID-19 here.
