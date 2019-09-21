---
title: "Coffescript"
date: 2012-06-24T20:37:38+01:00
draft: false
tags: ["javascript"]
categories: ["2012"]
---

I am currently reading [Smooth CoffeeScript](http://autotelicum.github.com/Smooth-CoffeeScript/) which is a wonderful introduction to [CoffeeScript](http://coffeescript.org/).

Two PDF versions are available: with and without solutions to exercices, and there is also an interactive version which can be browsed directly. Other resources are available, e.g. [JavaScript Basics](http://autotelicum.github.com/Smooth-CoffeeScript/literate/js-intro.html).

I found this book thanks to a [post](http://kbroman.wordpress.com/2012/06/21/learning-a-new-language/) by [Karl Broman](http://www.biostat.wisc.edu/~kbroman/) (who also has a very nice website full of interesting resources for those interested in statistics, genetics, and programming language).

> CoffeeScript is a little language that compiles into JavaScript.

Hopefully, the syntax is cleaner than Javascript itself, and we can use JS libraries. It comes with a REPL and it has an Emacs mode too. Something weird about Emacs mode for Node.js or CoffeeScript: when running `node` or `coffee` as inf-mode, strange escape characters will be printed instead of the nice looking REPL prompt we get in classic Terminal. It looks like it results from Node.js using Readline. As suggested on [Stack Overflow](http://stackoverflow.com/q/6605058/420055), it is possible to use something like `export NODE_NO_READLINE=1` (in your `.bashrc` or `.profile` file); however, if you want Raedline support when running `node` or `coffee` in a Terminal, it might just easier to change the command that Emacs call (for example, create two `sh` scripts, say `node2` and `coffee2`, that set the above environment variable before running either `node` or `coffee`). For `node`, we can use `(setq inferior-js-program-command "node2")`. It appears that an even easier solution is proposed on Node.js [help page for the REPL](http://nodejs.org/api/repl.html): using a combination of `NODE_NO_READLINE` and [rlwrap](http://utopia.knoware.nl/~hlub/rlwrap/).


Literate programming is possible thanks to [docco](http://jashkenas.github.com/docco/). Incidentally, I used a similar tool for a statistical introduction to health measurement with R: [rocco](http://rtomayko.github.com/rocco/) which plays nicely with R code. Finally, it relies on [Node.js](http://nodejs.org/), which is another of those nice projects I discovered last year. But see this cool "Introduction to Node.js with Ryan Dahl:"

{{< youtube jo_B4LTHi3I >}}

Now the question I'd like to ask is: Would it be possible to play with [d3.js](http://d3js.org/) with CoffeeScript directly?[^1] It looks like Harlan T Wood asked the same question some months ago and provided an answer, see his [gist](https://gist.github.com/1091420) (also on <http://bl.ocks.org/1091420>).

[^1]: For Clojure, there's already C2, a [Clojure(Script) data visualization](http://keminglabs.com/c2/) by Kevin Lynagh. See also his Clojure/West sides <i class="fa fa-file-pdf-o fa-1x"></i> [Composing statistical graphics on the web](http://keminglabs.com/talks/kevin_lynagh_statistical_graphics_clojure_west_2012.pdf).

