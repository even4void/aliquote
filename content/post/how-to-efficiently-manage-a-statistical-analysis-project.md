+++
title = "How to efficiently manage a statistical analysis project"
date = 2010-09-25T10:15:48+01:00
draft = false

tags = ["statistics"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

As I always try to get things organized when I am working on a statistical project, and it happens to be hardly succeeded (here success is measured as the time it takes to me to come back to my analysis code one year later), I am looking for an efficient way to manage all the stuff that surround a statistical project.

Ok, it should be agreed that everything must reside into the same directory. Now, the questions are: how do I organize this directory, how do I maintain a coherent view of successive version of R code, where to put the various notes I take when elaborating a new statistical approach, etc.

I am now exploring various solutions for project management I found while browsing Stack Overflow and BioStar (as suggested in response to a question on the [stats.stackexchange](http://stats.stackexchange.com/) Q&A website). Here is a brief list of what I found interesting. Of course, I install everything on my Mac, and now I need to test then but it looks quite interesting at first sight.

First, separating source code from a $\TeX$ified report appears mandatory, unless you really want to embed your R code within a templating or typesetting system. From my experience, it only works for small scale project. Otherwise, it rapidly becomes very messy to organize all the studd, especially dependencies.

For reporting with clean PDF or HTML output, there are [Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/) and [brew](http://cran.r-project.org/web/packages/brew/index.html). For the latest, you have to write a template file and analysis might be cycled over different data sets; this is very convenient when you have to report statistics per country, for instance. I am most familiar with Sweave that I used for preparing textbook, course notes or results from interim analysis. By the way, I just found [noweb](http://www.cs.tufts.edu/~nr/noweb/) really wonderful, as it is not limited to R files. I use it when I have to consider more than one programming language (e.g. bash or ruby + R or python).

About organizing our R files, several options are available: keep them all in a dedicated file, e.g. `func.R`, that will be sourced whenever they are needed; or just create an R package. Well, in this case it seems to me little be hard to imagine that I will create an R package for each statistical project I am involved in. At last, I can capitalize my code by storing useful and generic functions in one package, but it seems each project call for specific add-ons so I don't see the interest here. However, documenting each function is a good habit, and I use [roxygen](http://roxygen.org/) for that purpose.

I found a useful trick from [Brendan O'Connor](http://anyall.org/) on Stack Overflow: The idea is to load every functions in a dedicated R environment, e.g.:

```r
util = new.env()
util$bgrep = function [...]
util$timeit = function [...]
while("util" %in% search())
  detach("util")
attach(util)	
```

This way, in the top-level namespace we won't see them (e.g., through `ls()`) and we don't have to use a dot prefix for masking our functions (which I ever found a very sad approach). On a related idea, one proposes to put all functions in a separate folder, and load them in a names environment (here, `myfunc`) using code like

```r
if( length(grep("^myfuncs$",search()))==0 )
  attach("myfuncs",pos=2)
for( f in list.files("functions","\\.r$",full=TRUE) )
  sys.source(f,pos.to.env(grep("^myfuncs$",search())))		
```

Versioning is also worth of attention, because we need to keep a trace of what we do, especially since I found that statistical analysis often follows a non-linear time course: we start a new project, work hard on data cleaning and first exploratory analysis, run basic models, then we present the intermediate results, discuss about other modeling strategies, then... we are called on another project that has to be updated in few days, then we go back to our initial project and find other good ideas to analyse the data, etc. I often make use of the simple [RCS](http://tldp.org/HOWTO/RCS-5.html) system, but now I am moving all my code and projects over [Git](http://git-scm.com/). [Git Magic](http://www-cs-students.stanford.edu/~blynn/gitmagic/) is a good start.

Obviously, in addition to a version control system you need to think of a periodic backup solution. When I have to work with remote collaborator, I finally find [Dropbox](http://www.dropbox.com) the best solution: every person involved in the project can access the latest version of a report, and check for the R code I produced. As there is a roll-back option, we can ever restore deleted or modified files.

At a more abstract level (to me at least), there's the [CRISP-DM](http://www.crisp-dm.org/) project which provides guidelines for creating a good workflow for knowledge discovery or data mining projects.

Other projects I discovered in the meantime are listed below:

- [sumatra](http://neuralensemble.org/trac/sumatra) (with Django support) is a tool for managing and tracking projects based on numerical simulation or analysis, with the aim of supporting reproducible research.
- [ditz](http://ditz.rubyforge.org/) is a simple, light-weight distributed issue tracker designed to work with distributed version control systems like git, darcs, Mercurial, and Bazaar.
