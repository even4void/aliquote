---
title: "June in review"
date: 2021-06-17T20:37:14+02:00
draft: false
tags: ["readings"]
categories: ["2021"]
---

Things from the internet that I heard about recently.

- [Deep Javascript](https://exploringjs.com/deep-js/toc.html): Another JS ressource; think of [Eloquent Javascript](https://eloquentjavascript.net/) and the like, but from a more advanced point of view.

- [The Book of Statistical Proofs](https://statproofbook.github.io/) is an online textbook I bookmarked a while and forgot in the mean time. I found it mentioned by Luke Tiernay himself on Twitter, so I thought I would revisit its content. Note that this book covers a wide range of topics, from elementary statistics (Covariance of independent random variables) to more advanced Bayesian statistics (Conjugate prior distribution for Poisson-distributed data). As I noted [earlier on](/post/recently-june-2021/), I hope this textbook keeps being updated as it may become the new HyperSpec of stats or something like that.

- [Loess: local polynomial regression](https://docs.racket-lang.org/loess/index.html): I see a lot of statistical packages coming out on the Racket side, which is great. This one, combined to the [data-frame](https://docs.racket-lang.org/data-frame/index.html) package, could well mark the rebirth of LispStat and the advent of a [Scheme for statistics](https://www.stat.auckland.ac.nz/~ihaka/downloads/Compstat-2008.pdf).
- [Culture des données, données de la culture](https://datactivist.coop/dataculture/#1): Very nice slideshow by Joël Gombin, with lot of useful insights.

    > Technically, then, what we understand as data are actually capta (derived from the Latin capere, meaning ‘to take’); those units of data that have been selected and harvested from the sum of all potential data. --- Kitchin, 2014

- [Down memory lane: the Hive paper](https://mostlymaths.net/2021/01/hive.html/): Of course, I recommend to subscribe to the author's blog, there's always something to learn from the weekly feeds. This post in particular is interesting in that it provides a nice overview of [Hive](https://hive.apache.org/) (and its cousin or backend Hadoop, but all Apache products are generally good) and its original approach to data munging.

- Pattern matching in Python, with some [nice application](https://github.com/fluentpython/example-code-2e/blob/2338cb9d9824ec882ff921e9f2f7119f776d9693/18-context-mngr/lispy/py3.10/lis.py)): For what is worth, a rewrite of `Lis.py` (Peter Norvig) using the latest top-notch feature of Python 3.

> Unfortunately, code reviews also appear to be a difficult problem. Many projects are bottlenecked by code reviews, in that reviewers are hard to find and progress gets slowed down by having to wait a long time for reviews.<br> The "solution" that I've often seen applied in practice is to have lower quality code reviews. Reviewers don't attempt to gain a proper understanding of a change, so reviews become shallower and therefore easier. This is convenient on the surface, but more likely to allow bad code to go through: a subtle corner case that isn't covered by tests (yet?) may be missed, there may be a misunderstanding of a relevant underlying spec, a bad design decision slips through, and so on. This is bound to cause pains later on. --- [They want to be small, they want to be big: thoughts on code reviews and the power of patch series](https://nhaehnle.blogspot.com/2020/06/they-want-to-be-small-they-want-to-be.html)

Which is to say: the very same phenomenon appears to operate in scientific publishing and reviewing.

{{% music %}}Gary Burton & Chick Corea • _Crystal Silence_{{% /music %}}
