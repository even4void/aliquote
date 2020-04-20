---
title: "April in review"
date: 2020-04-19T08:06:24+02:00
draft: false
tags: ["readings"]
categories: ["2020"]
---

I've been keeping so much bookmarks in Safari on my iPhone that I definitely need to expunge some of them. So here are some things to read while we live in our wild home sweet home.

- There's an updated [tutorial on D3](https://observablehq.com/@d3/learn-d3) here on Observable now. This is series of 9 notebooks which are probably worth the look even if you are alreayd familiar with D3.
- How did I miss this abandoned book on Lisp? Here's [Nick Levine](https://www.nicklevine.org/lisp-book/talks/eclm-2011-10-23/plan.txt)'s take on the idea of publishing for O'Reilly back in 2011. See also this [course on Common Lisp](https://www.nicklevine.org/declarative/lectures/#lectures). Finally, ACM is offering many articles for free, so let's for some old papers like [LISP history](https://dl.acm.org/doi/abs/10.1145/1411829.1411837) or [An overview of COMMON LISP](https://dl.acm.org/doi/abs/10.1145/800068.802140), by Guy Steele.

  > COMMON LISP is a new dialect of the LISP language, related specifically to MACLISP and Lisp Machine LISP, designed by a group of committed implementors and others. A language definition document is being prepared and should be substantially complete before August 1982. COMMON LISP is specifically designed to be portable, and yet also sufficiently powerful that a broad range of "systems software" (such as text editors, graphics programs, and 1/O drivers) can be efficiently expressed in it.

- Reader macros for concise expression of function partial application and composition, in Lisp, available on [Github](https://github.com/eschulte/curry-compose-reader-macros).
- Thanks to Jeroen Janssens, I recently learnt that there's something like a grammar of graphics for Python which is not [ggplot](http://ggplot.yhathq.com), but [plotnine](https://www.datascienceworkshops.com/blog/plotnine-grammar-of-graphics-for-python/). There are some exmaples of use on [Github](https://github.com/has2k1/plotnine-examples/tree/master/plotnine_examples/examples), although at this point I wonder if this goes beyond basic graphics.
- Random links: [Three Star Programmer](https://wiki.c2.com/?ThreeStarProgrammer), [Things software engineers trip up on when learning Haskell](https://www.williamyaoh.com/posts/2020-04-12-software-engineer-hangups.html), [Memex](https://szymonkaliski.com/writing/2020-04-19-memex-dreams/) by Szymon Kaliski.
- While I use mostly Emacs, I sometimes fire up Nvim for quick edits, and I keep reading about others' config files, just so I know what's the current state of affair in Vim land. For instance, recently I learned about [vim-iced](https://liquidz.github.io/vim-iced/), which is a Vim8 / Neovim plugin to provide a Clojure interactive development environment, of a nice setup for [Writing a Book with Pandoc, Make, and Vim](https://keleshev.com/my-book-writing-setup/), and of this [lengthy thread](https://www.reddit.com/r/lispadvocates/comments/g2zi4s/a_case_for_vim/) on Reddit, by the LispAdvocates.
- [RMST and survival forests](https://www.ellessenne.xyz/2020/03/rmst-and-survival-forests/). The growing number of applications of Random Forests in the past 10 years will always surprise me. Now I'm reading about [random survival forest](https://kogalur.github.io/randomForestSRC/theory.html.) and the [randomForestSRC](https://cran.r-project.org/web/packages/randomForestSRC/index.html) package.

  ![randomForestSRC](/img/2020-04-20-10-22-17.png)

- Pattern-defeating quicksort ([pdqsort](https://github.com/orlp/pdqsort)) is a novel sorting algorithm that combines the fast average case of randomized quicksort with the fast worst case of heapsort, while achieving linear time on inputs with certain patterns.
- [Markov Models From The Bottom Up](https://ericmjl.github.io/essays-on-data-science/machine-learning/markov-models/): A nice overview of Markov models using Python.
- Random #rstats news here and there: [ggstatsplot](https://github.com/IndrajeetPatil/ggstatsplot) (Enhancing `ggplot2` plots with statistical analysis), [Analyzing international survey data with the pewmethods R package](https://medium.com/pew-research-center-decoded/analyzing-international-survey-data-with-the-pewmethods-r-package-3b0b21cba607), Frank Harrell's scripts for [reproducible reporting](https://github.com/harrelfe/rscripts).
- [Chez Scheme vs. SBCL: a comparison](https://elmord.org/blog/?entry=20191114-sbcl-chez): I wish the author included a comparison of Chez and Racket for the Scheme part.
- [Phylogenetics in the Genomic Era](https://hal.inria.fr/PGE/). Lovely!

  > This journey in the collaborative publishing has started with the unreasonable request from a well-known publisher to make us pay 20,000 euros for an open access book that we (the editors), would have had to handle from A to Z (choose the chapters, find the authors, get the contracts signed, format the manuscript etc ...). It did not seem right, so we asked the colleagues that already had shown interest in writing a chapter for our book, to trust us.

Expect a few more pointers in a next post.

> You are a software developer? And sometimes you need to use cryptography in your daily job, like hashes, encryption or digital signatures? And you think cryptography is complex and full of math and it is for nerds only? No, this is not true, every developer can learn how to use cryptographic algorithms. This book will show you how: with code examples and hands-on coding experience, with less math and more practice. --- [Practical cryptography for developers](https://cryptobook.nakov.com).

{{% music %}}Meltemi • _Alboran Trio_{{% /music %}}
