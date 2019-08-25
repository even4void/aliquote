---
title: "Micro review from August"
date: 2019-08-24T16:22:26+02:00
draft: true
tags: ["readings"]
categories: []
---

Here is another micro review of random or not so random links I found while browsing the interweb lately.

<!--more-->

- [Haskell. History of a Community-Powered Language](https://serokell.io/blog/haskell-history): This is broad review of the inception of Haskell, statically typed and purely functional programming language that many FP programmer love for its purity. The first Haskell report dates back to the 90's, so it's been a while, and Haskell Prime will the new standard by 2020. There is a PDF reveiw available on [Microsoft website](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/07/history.pdf) as well. It is also worth checking, or even subscribing to, the whole blog if you are inclined to use FPs and especially Haskell.

- This new shell clearly looks very hand for data munging: [Introducing nushell](http://www.jonathanturner.org/2019/08/introducing-nushell.html). Indeed, if you look at the demo on the blog post, many oprations are usually what we found in data processing at the command-line, using pipes, redirection, and the like. The fact that `ls`, for instance, returns a structured table of results makes me think of JSON or YAML common data format, together with [jq](https://stedolan.github.io/jq/) or [csvkit](https://csvkit.readthedocs.io) utilities, as discussed by Jearoen Janssens in his wonderful textbook, [_Data Science at the Command Line_](https://www.datascienceatthecommandline.com). After [search](https://github.com/tantivy-search/tantivy) [engines](https://github.com/toshi-search/Toshi), [Emacs](https://github.com/remacs/remacs) clone, this is the first instance of a shell emulation in Rust that I am aware of. I am not going to switch, though, and I am quite happy with my recent [move to Fish](/post/fish-shell/). However, I am now eager to try the [GSL shell](GSL shell ) [again](/post/gsl-shell/).

- There are so many applied math textbook available for free on the internet that it is hard to make a definitive choice. My BibTeX file is full of preprint, published or archived textbooks, and I barely have time to read a dozen of them each year. Today, I found [_Introduction to Applied Linear Algebra – Vectors, Matrices, and Least Squares_](https://web.stanford.edu/~boyd/vmls/), from Cambridge University Press, available as a PDF. And guess what: It was already in my electronic bookshelf! You will have to schedule some time to review it since it is 473 pages long, and covers both mathematical theory and applications to statistics (e.g., distance-based clustering, dynamical systems, or OLS and logistic regression).

- I Just noticed this [thread on HN](https://news.ycombinator.com/item?id=20766443), in which [UglyToad](https://news.ycombinator.com/user?id=UglyToad) complains that only 2-3 hours are really productive in a day. I can relate, since I observed the same pattern when working as an applied statistician: 3 hours (one burst) for writing code, that's only what I was able to do in a day; hopefully, I could benefit from the rest of the day to write statistical reports and process emails! It also reminds me of Chris Done's report on his weekly activity on Github for a particular project: there was a clear pattern of high intensity the first three days, then a progressive decrease in the number of commits starting on Thursday up to Sunday. (Unfortunately I can't get my hands on this post.)
