---
title: "Markdown everywhere"
date: 2012-08-09T22:30:03+01:00
draft: false
tags: ["misc"]
categories: ["2012"]
---

The [Markdown](http://daringfireball.net/projects/markdown/) language has become the *de facto* lightweight markup language for text editing, and more.

What's more? 

- With [Pandoc](http://johnmacfarlane.net/pandoc/), you can write simple text files in your preferred text editor, combine them and create a book, a set of slides or a series of handouts with little efforts. Code highlighting, cross-references and bibliographic entries are managed painlessly.
  
- The [filter](https://github.com/adityam/filter) module[^1] for Context (see also this presentation at the 4th Context Meeting, [Beg, Borrow, and Steal Running external filters in ConTeXt](http://bit.ly/S42zdt), or this thread on tex.SE, [I'd like to include Markdown in a LaTeX file](http://tex.stackexchange.com/q/31159/2580), among others)
  
- The [knitr](http://yihui.name/knitr/) package for R is presented as the successor of [Sweave](http://www.statistik.lmu.de/~leisch/Sweave/). It is now [integrated](http://rstudio.org/docs/authoring/using_markdown) into [RStudio](http://rstudio.org/). Moreover, it has replaced Sweave on UCLA [Data Analysis Examples](http://www.ats.ucla.edu/stat/dae/).
  
- Although Python documentation still relies on [reST](http://sphinx.pocoo.org/rest.html) (e.g., Sphinx), there are [Markdown extension](http://freewisdom.org/projects/python-markdown/) and I believe Markdown could replace reST without too much effort (although I didn't dig up besides this Stack Overflow [thread](http://stackoverflow.com/q/2471804/420055)).
  
- Markdown also has its place on GitHub which has its [GitHub Flavored Markdown](http://github.github.com/github-flavored-markdown/).
  
There are certainly lots of other applications I am not aware of.

I like plain text files: these are files that do not weigh heavy on a HD, they can be visualized with any text editor or pager, they are easy to send by email, etc. I used to use Emacs for writing almost everything, and of course there is good support for [Markdown](http://jblevins.org/projects/markdown-mode/) and [Pandoc](http://wwwuser.gwdg.de/~jkremer/pandoc-mode.html). For rendering purpose, I found a nice application (Mac-only): [Marked](http://markedapp.com/). It's worth its price! For a free alternative, take a look at [Mou](http://mouapp.com/). My basic setup at the moment consists in typing my text in Emacs while I have an open Marked preview next to it, as shown below. Simplicity matters.

![Markdown and Marked.app](/img/20120809114509.png)


[^1]: Aditya Mahajan's blog, [Random Determinism](http://bit.ly/S42M0h), contains a wealth of information for those interested in Context and [vim](http://www.vim.org).
