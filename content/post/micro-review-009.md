---
title: "February in review (2)"
date: 2020-02-21T07:58:37+01:00
draft: false
tags: ["readings"]
categories: ["2020"]
---

Here is a second review for [February](/post/micro-review-008/). I have accumulated quite a bit of bookmarks in Safari, so let's get them sorted out.

> It's not just the compilers. Clojure is nice in its way, but it lacks some essentials of Lisp programming. For a while now I've been wishing for a Clojure implementation that is a proper Lisp--one that restores what Clojure has lost. One that has, as I wrote elsewhere, Lisp's flesh and bones. [Clojure in Common Lisp](https://news.ycombinator.com/item?id=22326853)

- [Introduction to Machine Learning (I2ML)](https://compstat-lmu.github.io/lecture_i2ml/index.html) is a self-contained textbook on basic principles of supervised methods in large scale statistical inference. There are many such textbooks around the internet. This one comes with Youtube videos, PDF slides and RMarkdown notebooks. It covers regression and classification problems, as well as nested cross-validation or bagging approaches, so it should provide the reader with a compelling overview of advanced techniques in Machine Learning. Shai Carmi recently released a lot of [teaching materials](https://scarmilab.org/talks-teaching-materials/) (lot of Powerpoint slides unfortunately), mostly related to statistical genetics. Feel free to take a look if you are interested in genomics, population genetics or ML techniques.
- In [Org-mode Workflow: A Preview](https://blog.jethro.dev/posts/org_mode_workflow_preview/), Jethro Kuan explains how he is using Org-mode (especially org-agenda) and deft to manage his daily activities. Note that this is a multipart series.
  > At the time of writing, I have completed 3478 todo items, and written over 29000 lines in my personal knowledge base.
- [Statistical Thinking for the 21st Century](https://statsthinking21.org), by Russell A. Poldrack is a really nice textbook on statistical inference and the R statistical package. In a recent article, Cox and Efron, two of the most eminent statisticians of the last decades, also discuss what could possibly be [statistical thinking for 21st century scientists](https://advances.sciencemag.org/content/3/6/e1700768.full). The take home message is that it is important to acknowledge the importance of uncertainity and variability of statistical estimates and of _direct_ vs. _indirect_ evidence in statistical research.
  > It is the job of theoretical statisticians both to be alive to the challenges of specific applications and, at the same time, to develop methods and concepts that, with good fortune, will be broadly applicable.
- After 15 years of using R, I may finally forget about this infamous [`stringAsFactors` option](https://developer.r-project.org/Blog/public/2020/02/16/stringsasfactors/) that causes more trouble than anything else when you're not working with data from designed experiments.
- _Statistical Rethinking_ has been ported to [TensorFlow](https://github.com/ksachdeva/rethinking-tensorflow-probability) recently. There's also [Doing Bayesian Data Analysis in brms and the tidyverse](https://bookdown.org/connect/#/apps/3686/access) which just reached version 0.1 ([Github](https://github.com/ASKurz/Doing-Bayesian-Data-Analysis-in-brms-and-the-tidyverse)).
- I've been quite happy withw writing text or code in Emacs for the past few months. Doom Emacs comes with good customizations for LSP mode now, and Flycheck has a lot of checkers for plain text, including [proselint](http://proselint.com) and [textlint](https://textlint.github.io) (I tried the later for a few days, but it definitely has too many third-party plugins to configure). Now, I learned that there's also [smog](https://github.com/zzkt/smog), if you want to get a summary of writing style, word use and readability.

  ![emacs](/img/2020-02-21-10-47-49.png)

- When these are not full-featured [blog posts](https://lexi-lambda.github.io), you get full-featured Gist instead. If you are interested in Alexis King's work, go check [Continuations and reduction semantics](https://gist.github.com/lexi-lambda/d97b8187a9b63619af29689e9fa1b880).
- I've been using circular statistics during my PhD, but I would not have bet on porting them to regression trees. Achim Zeileis and coll. did it first : [Circular regression trees and forests](https://eeecon.uibk.ac.at/~zeileis/news/circtree/). This is now available as part (or an addon) of their [Toolkit for Recursive Partytioning](https://cran.r-project.org/web/packages/partykit/index.html).
- Finally, here is another good article on [compression](http://lisp-univ-etc.blogspot.com/2020/02/programming-algorithms-compression.html?m=1), in Lisp, by Vsevolod Dyomkin.
