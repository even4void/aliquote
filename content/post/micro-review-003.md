---
title: "Micro review from September (2)"
date: 2019-09-07T18:51:17+02:00
draft: true
tags: ["readings"]
categories: []
---

Here is the monthly micro review of (not so) random links I found while browsing the interweb lately.

<!--more-->

- [Patch Workflow With Mutt - 2019](http://kroah.com/log/blog/2019/08/14/patch-workflow-with-mutt-2019/). Even if I am not using Mutt for reading/writing emails (and I no longer have that many emails to read/write these days), I always find interesting to read others' approach to email processing. This is a good read, full of interesting ideas (and not only re. GTD). In the same spirit, I like reading posts about Emacs and Org. Soon or later, they will end up on [Irreal blog](https://irreal.org/blog/), so I just have to check my RSS feeds from time to time. Or I may happen to find ones myself, e.g., [A Daily Journal in Org Mode](http://zerolib.com/journaling-procedure.html). John Jacobsen's website and Github repository is full of good ideas and tips that I like to read when I have some free time. And guess what? This site was done using Org mode (and [a bit of Clojure](https://github.com/eigenhombre/organa)). This site is not just about programming (e.g., [l.26-97](https://github.com/eigenhombre/rosalind/blob/master/src/rosalind/core.clj) if you ever try to solve [Rosalind](http://rosalind.info/) problems), though; see, e.g.: [Reflections on a Year of Daily Memory Drawings](http://zerolib.com/daily-composition-lessons-learned.html)---lovely, isn't it?

- [Thoughts on Racket2](https://beautifulracket.com/appendix/thoughts-on-racket2.html). A few weeks ago I mentioned some hot news from the latest Racket conf, namely the fact that the next-gen Racket (aka Racket2?) will probably be parenthesis-free. Matthew Butterick has a much more detailed overview of the points raised by Matthew Flatt, and he has some very on the point thoughts on the future of Lisp languages.

      > In the case of Lisp languages like Racket, Matthew Flatt is right: among a certain audience of potential users, parentheses are a deterrent. Who knows why? But in the last 60 years, simply grabbing these dissenters by the lapels and fumigating them with the stinky garlic breath of parenthesized S-expressions has not been a winning strategy. If Lisp partisans want different results in the next 60 years, we need to try something new.

- [DVC](https://dvc.org) is the new Git for Machine Learning projects. This sounds cool, and I will try it as soon as the opportunity arises. In the past, I have used various strategies for dealing with large files (mostly ending up in the `.gitgnore`), getting rid of IPython notebooks output (removed from Git versioning using [nbstripout](https://github.com/kynan/nbstripout)), or managing dependencies ([packrat](https://rstudio.github.io/packrat/) in R, virtual environments using [pyvenv](https://docs.python.org/3/library/venv.html) in Python). This project apparently brings an extra dose of control while putting the emphasis on sharing and reproducibility.

- Back when I was teaching applied biostatistics, I used to use some falied attempts by geneticians and/or bioinformaticians at using Excel to store their results (remember the DEC1 story or that paper where authors mistakenly deduplicated their data?). Now, I just found this: [One in five genetics papers contains errors thanks to Microsoft Excel](https://www.sciencemag.org/news/2016/08/one-five-genetics-papers-contains-errors-thanks-microsoft-excel).

**Blog rolling**:

- [How UTF-8 works](http://feedproxy.google.com/~r/TheEndeavour/~3/zpg4Q-hjzDo/), on John Cook's blog: Nice exposition of UTF-8 internals; see also the related post: [Excel, R and Unicode](http://feedproxy.google.com/~r/TheEndeavour/~3/RrngOUWdZoU/).
- Some useful tips and tricks on [brace expansion in Bash/Zsh](https://leancrew.com/all-this/2019/09/brace-yourself-im-in-an-expansive-mood/), by Dr. Drang.
