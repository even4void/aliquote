+++
title = "Spring quick notes"
date = 2016-04-25T15:02:32+01:00
draft = false

tags = ["readings"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

Some quick notes from my recent activities and reading list. Although I am far less active that I used to be in the past (and that I would like to be currently), I still archive--when time allows--interesting things that happen on the web or that I found potentially useful for my work.

<i class="fa fa-external-link fa-1x"></i> The famous "[Structure and Interpretation of Computer Programs](https://mitpress.mit.edu/sicp/full-text/book/book.html)", by Abelson, Sussman, and Sussman, is now [live on GitHub](https://github.com/sarabander/sicp). Great work, really! The HTML and PDF rendering are carefully done and I noticed there's an update version of the [Info file](http://www.neilvandyke.org/sicp-texi/) that I browse from time to time in Emacs.

<i class="fa fa-external-link fa-1x"></i> [Composing Programs](http://www.composingprograms.com/) is one of the best online tutorial that I found for Python. It reminds me of the beautiful [Eloquent Javascript](http://eloquentjavascript.net) or [Smooth CoffeeScript](http://autotelicum.github.io/Smooth-CoffeeScript/). It relies on [Python Tutor](http://pythontutor.com) and it is based on the SICP mentioned above. The author wrote another excellent online textbook, [Computational and Inferential Thinking](http://www.inferentialthinking.com), where Pyhton is used for statistical data analysis.

<i class="fa fa-external-link fa-1x"></i> While I found myself using [Shiny](http://shiny.rstudio.com) more and more[^1], I discovered [Radiant](http://vnijs.github.io/radiant/) which provides a very nice interactive playground for exploratory data analysis. It is built on top of Shiny but it incorporates several nifty additions like [Pivot Tables](https://github.com/smartinsightsfromdata/rpivotTable) or a dedicated panel to build [GGplot2](http://ggplot2.org) graphics. In the same spirit, but using Vega, [Pole✭](http://vega.github.io/polestar) is one of the interactive environment developed at the UW [IDL](http://idl.cs.washington.edu) (see also [Lyra](http://idl.cs.washington.edu/projects/lyra/)).

<i class="fa fa-external-link fa-1x"></i> I have been using [Spacemacs](http://spacemacs.org) every day for more than five weeks and I must admit that it really rocks. I dropped [some words about it]({{< ref "post/why-i-am-still-using-emacs.md" >}}) a year ago but I think it has now reached full maturity. Since I keep using Spacemacs in Emacs mode, I'm as comfortable with editing my text files than I was with my old Emacs. As usual, I started writing a post describing my feeling about Spacemacs, but it's always in my draft inbox. Incidently, switching to Spacemacs also led me to take another look at [Atom](https://atom.io), which comes with a pretty nice theme ("One Dark", also [available for Emacs](https://github.com/jonathanchu/atom-one-dark-theme)) and a clean UI. For Julia users, [Juno](http://junolab.org) is built on top of Atom, using [Ink](https://github.com/JunoLab/atom-ink)[^2], which aims to be

> a toolkit for building IDEs in Atom – in particular, it's aimed at providing the UI pieces necessary to build richly interactive, live environments for programming – inspired by the likes of SmallTalk, Lisp, LightTable, DevTools, Swift, and others.

Note that other companies are actually building their tools around Atom, e.g. Facebook's [Nuclide](http://nuclide.io) or [Nylas](https://www.nylas.com/blog/splitting-the-atom).

<i class="fa fa-external-link fa-1x"></i> The "Gifi book" is now available as an [R Markdown book](http://gifi.stat.ucla.edu/gifi/_book/), thanks to Jan de Leeuw who remains as productive as ever. The [bookdown](https://github.com/rstudio/bookdown) R package has now superseded Hadley Wickham's Mardown-based GitHub wiki's, and it offers online publishing facilities like [GitBook](https://www.gitbook.com).

<i class="fa fa-external-link fa-1x"></i> I came across very nice [Stata cheat sheets](http://geocenter.github.io/StataTraining/portfolio/01_resource/), which remind me of [RStudio cheat sheets](https://www.rstudio.com/resources/cheatsheets/). Generally speaking, I think that such cheat sheets are very good for people trying to learn a new software because they can quickly find the main commands that are used to perform a certain (canonical) task. 

<i class="fa fa-external-link fa-1x"></i> I just finished reading [How to be a modern scientist](https://leanpub.com/modernscientist), by Jeff Leek, which is full of good advices about reproducible research and how to organize our work as scientist (writing/reviewing paper, working with data, etc.). I found many other interesting books, mostly related to Lisp, to read on Leanpub: [Programming in Clojure](http://leanpub.com/programming-clojure), [Loving Common Lisp, or the Savvy Programmer's Secret Weapon](http://leanpub.com/lovinglisp), [Build Your Own Lisp](http://leanpub.com/buildyourownlisp).

<i class="fa fa-external-link fa-1x"></i> [Some folks](http://tech.metail.com/think-stats-in-clojure-i/) started rewriting Think Stats Python's snippets in [Clojure](http://clojure.org). Despite the [buzz](http://stats.stackexchange.com/q/130/930) five or six years ago, it looks like no one started hacking a real replacement for [Lisp Stat](http://homepage.stat.uiowa.edu/~luke/xls/xlsinfo/xlsinfo.html) (and [Common Lisp Statistics](https://github.com/blindglobe/common-lisp-stat) looks on a siding right now). There is, however, this collection of [statistical libraries](http://www.gilboz.com/b/clojure-machine-learning-math-statistical-libraries-collection-cm567/), and many IDEs (e.g., [LightTable](http://lighttable.com), [Cursive](https://cursive-ide.com), [Nightcode](https://sekao.net/nightcode/)) or online editors (e.g., [Gorilla REPL](http://gorilla-repl.org), or the minimalistic [InstaREPL](http://web.clojurerepl.com)). Regarding books, there are [Clojure Data Analysis Cookbook](https://github.com/erochest/clj-data-analysis/blob/master/index.md) and [Mastering Clojure Data Analysis](https://www.packtpub.com/big-data-and-business-intelligence/mastering-clojure-data-analysis) (by the same author, [Eric Rochester](http://www.ericrochester.com/clj-data-master/)).


[^1]: After 8 years of writing short to long statistical reports, I came to the conclusion that not only shall we deliver to any customer a reproducible report with accompagnying R or Stata code but also an interactive application so that they can explore their data on their own.

[^2]: [Hydrogen](https://atom.io/packages/hydrogen) further allows to run anything that is supported by [Jupyter](https://jupyter.org) kernels.
