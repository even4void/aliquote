---
title: "Weaving scientific documents"
date: 2011-04-25T09:03:39+01:00
draft: false
tags: ["tex", "stata", "rstats"]
categories: ["2011"]
---

Some notes about installing and testing [StatWeave](http://www.stat.uiowa.edu/~rlenth/StatWeave/) with R and Stata.

[StatWeave](http://www.stat.uiowa.edu/~rlenth/StatWeave/) is yet another way to weave code chunks and text into a single document. The idea of interlacing code and doucmentation is borrowed from the famous [web](http://www.literateprogramming.com/web.pdf) (PDF) and [cweb](http://www-cs-faculty.stanford.edu/~uno/cweb.html) systems developed by D Knuth who also coined the term "literate programming". There is a draft article on [Lightweight Literate Programming](http://infohost.nmt.edu/~al/Literate-programming/draft/), which has evolved as an extended discussion of the following paper: Allan Stavely, Lynda Walsh, and John Shipman. “Lightweight Literate Programming: a Documentation Practice”. Technical Communication. Vol. 55. No. 1. 23-37. February 2008.

For R, we already have [Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/) and its variants, but see the CRAN Task View on [Reproducible Research](http://cran.r-project.org/web/views/ReproducibleResearch.html). I used it a lot for preparing my courses (handouts and slides with beamer). But, in the meantime, I rediscovered [noweb](http://www.cs.tufts.edu/~nr/noweb/) which is closer to the web software, and more general in some sense. I know [Luke Tiernay](http://www.cs.uiowa.edu/~luke/) is using it for documenting his [R projects](http://www.cs.uiowa.edu/~luke/R/), and I once found a very pretty document by Jason Catena using the Tufte LaTeX class together with noweb, [Study Haskell](https://dl.dropbox.com/u/502901/haskell.pdf).
 
I grabbed the Statweave jar file a long ago, but never tried it for real. Now, following a question on [tex.stackexchange.com](http://tex.stackexchange.com/questions/16398/problem-in-statweave) I reinstalled it and try to process some R and Stata document. Well, I don't think I'd pushed it to the limits, but at first sight it is quite straightforward to get a running PDF in few commands. What I like is that it works with Stata on my Mac.[^1]

Here is a sample R document:

![rdoc](/img/20110422183131.png)

And here is one with Stata commands embedded:

![statadoc](/img/20110425170528.png)

The idea is as simple as that of Sweave: you include code chunks in a dedicated environment (here, it starts with `\begin{XXcode}` and stops with `\end{XXcode}`, where `XX` stands for the foreign language). The Stata example simply reads:

```latex
\documentclass{article}
\usepackage{Statweave}
\begin{document}
\StataweaveOpts{prompt=". "}

\section{StatWeave example using Stata}

Here are some fake data:

\begin{Statacode}{label=summary,saveout}
sysuse auto, clear
summarize mpg
\end{Statacode}

Here is the result:

\recallout{summary}
\end{document}
```

Nothing really difficult in terms of syntax. The configuration of Statweave is also easy. I just changed the default setting for Stata, before noticing that everything was already in the on-line help (RTFM!). So, only the first item in the configuration dialog has to be update in order to reflect the location of your Stata executable:

![stataopt](/img/20110425171416.png)

It seems to be possible to use Matlab and Maple. I will try to configure StatWeave to accept Octave code, instead of Matlab that I don't use anymore since the end of my PhD.


[^1]: To run Stata from the command line directly, you just have to symlink the `stata-se` executable into your ` /usr/local/bin/` directory and to add Stata directory to your path, e.g. `export PATH="/Applications/Stata10:$SPATH"`.
