---
title: "Easier literate programming with R"
date: 2012-04-02T09:03:26+01:00
draft: false
tags: ["tex", "rstats"]
categories: ["2012"]
---

I have been using [Sweave](http://www.statistik.lmu.de/~leisch/Sweave/) over the past 5 or 6 years for processing my R documents, and I have been quite happy with this program. However, with the recent release of [knitr](http://yihui.name/knitr/) (already adopted on [UCLA Stat Computing](http://www.ats.ucla.edu/stat/r/code/) and on [Vanderbilt Biostatistics Wiki](http://biostat.mc.vanderbilt.edu/wiki/Main/KnitrHowto)) and all of its nice enhancements, I really need to get more familiar with it.

In fact, there's a lot of goodies in [Yihui Xie](http://yihui.name/en/)'s `knitr`, including the automatic processing of graphics (no need to call `print()` to display a `lattice` object), local or global control of height/width for any figures, removal of R's prompt (R's output being nicely prefixed with comments), tidying and highlighting facilities, image cropping, use of `framed` or `listings` for embedding code chunk. 

To overcome some of those lacking features in `Sweave`, I generally have to post-process my files using shell scripts or custom Makefile. For example, I am actually giving a course (in French) on introductory #rstats for biomedical research and I provide a  [series of exercices](/cours/2012_biomed/hw-sols.pdf) written with Sweave. I can easily manage my graphics to have the desired size using a combination of Sweave `Gin` and `lattice`'s `aspect=` argument. However, the latter means I have to crop my images afterwards. Moreover, I need to "cache" some of the computations and there's no command-line argument for that, unless you rely on [pgfSweave](http://code.cjb.net/pgfSweave.html). This leads to complicated stuff like:

```
$ R --no-save --no-restore -e "require(cacheSweave); setCacheDir('./cache'); \
  Sweave('hw-sols.rnw', driver=cacheSweaveDriver)"
$ R CMD Stangle hw-sols.rnw
$ ./hw_crop.sh
$ xelatex hw-sols.tex
```

Here, `hw_crop.sh` is a small Bash utility which calls TexLive `pdfcrop` program:

```sh
#! /usr/bin/env bash
for i in $(ls figs/*); do pdfcrop --margins 5 $i $i; done
```

From what I've seen so far, [transitioning to `knitr`](http://yihui.name/knitr/demo/sweave/) looks simple and some of the [demos](http://yihui.name/knitr/demos) are really awesome. (A lot of sample `*.Rnw` files are available in the package `examples` directory:

```
$ ls *.Rnw
knitr-beamer.Rnw      knitr-listings.Rnw    knitr-themes.Rnw
knitr-graphics.Rnw    knitr-manual.Rnw      knitr-twocolumn.Rnw
knitr-input-child.Rnw knitr-minimal.Rnw
knitr-input.Rnw       knitr-subfloats.Rnw
```

I wrote a small [Bash script](/pub/knitr) which basically takes care of the `Rnw->pdf` conversion, with either `xelatex` or `pdflatex` as a $\TeX$ backend. I will update it with more options (`bibtex`, batch mode, etc.) later. Consider the sample file below:

```latex
\documentclass[8pt,a4paper]{article}
\usepackage{blindtext}
\begin{document}
\blindtext[1]
<<setup,echo=FALSE,cache=FALSE>>=
options(width=85)
suppressPackageStartupMessages(library(ggplot2))
@ 
<<reg_demo,fig.cap='A sample demo',fig.width=5,fig.height=3,fig.pos='htbp'>>=
x <- runif(100)
y <- 1.2 + 0.8*x + rnorm(100)
dfrm <- data.frame(x, y)
summary(dfrm)
ggplot(data=dfrm, aes(x, y)) + geom_point() + stat_smooth(method="lm")
@ 
\end{document}
```

Then, knit it to get the [following output](/pub/knitr_demo.pdf) (PDF):

```
$ knitr -ql knitr1.Rnw
```

Other interesting features are:

- We can use [Markdown](https://github.com/yihui/knitr/blob/master/inst/examples/knitr-minimal.md) directly (see also [Knitr, Github, and a new phase for the lab notebook](http://www.carlboettiger.info/archives/4325)).
- Snapshots from dynamic visualization (e.g., `rgl`, `ggobi`, or Yihui's `animate`) can be embedded easily.

I wonder if all this good stuff would just work out of the box using Context [filter module](http://www.ctan.org/pkg/context-filter).

The other Noweb-like system that I really want to try is [Dexy](http://www.dexy.it/). It also offers very nice rendering facilities, and allows to mix several programming languages into the same file. Looking at some of the demonstrations and [templates](http://www.dexy.it/docs/templates/) (especially, [Code Journal Markdown R](http://www.dexy.it/docs/templates/code-journal-markdown-r/) and (Tufte Latex Article R](http://www.dexy.it/docs/templates/tufte-latex-article-r/)), I feel it might well serve as another great tool for creating my next course slides and handouts.
