---
title: "Light Table and interactive live coding"
date: 2014-04-25T22:15:52+01:00
draft: false
tags: ["apple", "app"]
categories: ["2014"]
---

[LightTable](http://www.lighttable.com/) 0.6.2 has been released recently. It now supports Python and graphics can be embedded directly into the interactive console.

LightTable changed a lot since it was first announced on [Chris Granger website](http://www.chris-granger.com/2012/04/12/light-table-a-new-ide-concept/), especially regarding the core UI. It now features a plugin manager and inline evaluation, including graphical displays from IPython.

Since I was [recently talking](/post/scheme-and-emacs) about Racket Scheme and its capabilities to display inline graphics, much like Emacs Geiser does, I believe I should just finish this post that I started more than a month ago.[^1] Here is a basic example with code from [Matplotlib demo gallery](http://matplotlib.org/users/screenshots.html#histograms) (right):

{{< fluid_imgs
  "pure-u-1-2|/img/20140424222700.png"
  "pure-u-1-2|/img/20140424224708.png" >}}

LightTable is pretty fast and reactive, and it offers an interesting model for live coding session.[^2] And, well, it's now [open source](http://www.chris-granger.com/2014/01/07/light-table-is-open-source/). Maybe it could be a good alternative to IPython Qt console or even HTML notebook one day.

It's quite interesting that Emacs, and to some extent Vim, comes with full-featured inferior modes and REPLs for most common languages, while [Sublime Text](http://www.sublimetext.com/) (ST) and its [sublimeREPL](https://github.com/wuub/SublimeREPL) package offers far less powerful functionalities, although it has long been hailed as the definitive text editor. Personally, I can never remember more than 10 keyboard shortcuts--and I experienced the same frustration with Textmate before, which is why I still prefer Emacs over other editors: I can just type `M-x` followed by some keywords ([ido](http://www.emacswiki.org/emacs/InteractivelyDoThings) takes care of the rest) and I get things done in few seconds. There is also a menu bar, which can be convenient at times (yes, I know, we don't really need a mouse, but I use my trackpad :). Finally, there is a package manager which facilitates the installation/updating of additional packages.

However, it is interesting to note that we can interact with a live Racket shell in ST as well. Here is a screenshot of `sublimeREPL` running under ST3 with the same sample Scheme code as before: (The Racket package should be installed prior to running the Racket REPL, and `racket` must be in your `$PATH`.)

![ST3REPL1](/img/20140424215625.png)

However, to be fair it looks like the R REPL has been enhanced. Last time I checked, their REPL was displaying strange characters when R expressions were being sent to it (this was last year with ST2 since SublimeREPL was not available for ST3). Now it looks ok, although I haven't gone far with it:

![ST3REPL2](/img/20140424215828.png)

Note that diving into litterate programming with knitr requires a couple of additional packages, namely [SublimeKnitr](https://github.com/andrewheiss/SublimeKnitr), [EnhancedR](https://github.com/randy3k/Enhanced-R), and [LaTeXing](http://docs.latexing.com/), but see [Using knitr with LaTeXing](http://docs.latexing.com/stable/tutorials/knitr-with-latexing.html) for more information.

As a side note, although I recommend to my students to use [RStudio](http://www.rstudio.com) when working with R, I think ST really is a good editor and this is what I would recommend to them in place of Emacs whose learning curve is certainly steeper.

[^1]: This post is pretty old, and LighTable is now at version 0.6.5.
[^2]: [Session](https://medium.com/p/1a12997a5f70) provides yet another "Live-Coding Environment for Clojure".
