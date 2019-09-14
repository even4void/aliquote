+++
title = "Emacs Org-mode and literate programming"
date = 2014-08-06T23:23:34+01:00
draft = false
tags = ["emacs", "rstats", "lisp"]
categories = ["2014"]
+++

I've been using Emacs for editing and evaluating R code with [ESS](http://ess.r-project.org) for a long time now. I also like Emacs for editing statistical reports and compiling them using [knitr](http://yihui.name/knitr/) (and before that, [Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/)), using plain $\LaTeX$ or just RMarkdown. Now, I'm getting interested in [org-mode](http://orgmode.org) as an alternative to [noweb](http://www.cs.tufts.edu/~nr/noweb/), which I previously used when looking for a way to integrate different programming languages (e.g., sh, sed, and R) into the same document.

<!--more-->

## Literate programming

I've long been interested by literate programming (LP), and I wrote some posts about [different]({{< ref "/post/weaving-scientific-document.md" >}}) [aspects]({{< ref "/post/easier-literate-programming-with-r.md" >}}) of [LP]({{< ref "/post/reproducible-research-with-r.md" >}}). I've seen an increased interest in LP and reproducible research this year (see, e.g., Roger Peng's blog posts or handouts on Coursera and elsewhere). At some point, it get even mixed up with the new kid on the block: Data Science, which really does mean nothing to me since I consider myself as a data scientist as soon as I have to clean and process data coming from medical research. (If this has to do with "big data" or the "computer scientist *vs.* statistician debate", I'm not really interested in that: After all, we are data slaves and we must deal with that.)


## R and knitr

There are so many good tutorials and posts on R + knitr that I feel too lazy to search through my Twitter posts or web bookmarks. Here are two recent ones:

- [R Markdown — Dynamic Documents for R](http://rmarkdown.rstudio.com)
- [Writing reproducible reports in R with markdown, knitr and pandoc](http://nicercode.github.io/guides/reports/)

The updated RMarkdown (v2, brought to you by <http://www.rstudio.com>) now relies on [Pandoc](http://johnmacfarlane.net/pandoc/) to build HTML, PDF, or even DOCX documents. They all are standalone documents, meaning that you don't have to provide a separate folder with figures in the case of HTML, for example. This is pretty good. I've been using [knitr](http://yihui.name/knitr/) for two years now, and I updated my statistical workflow to build custom reports based on knitr. I also wrote [some custom Elisp](https://gist.github.com/chlalanne/7403341) <i class="fa fa-file-code-o fa-1x"></i> file to edit/build RMarkdown files under Emacs. It should not be too difficult to update this code in order to make use of RStudio `rmarkdown::render()` instead of `knitr::knit()`. Furthermore, [as discussed on GitHub](https://github.com/rstudio/rmarkdown/issues/17), it is possible to define custom renderer, for example in, e.g., our `~/.Rprofile`:

```r
my_render <- function(input, encoding) {
    rmarkdown::render(input, clean = FALSE, encoding = encoding)
}
```

or use YAML [to set knitr opts and hooks](https://github.com/Thell/knitr-yaml-example).

## Org-mode

[Organize your life in plain text](http://doc.norang.ca/org-mode.html) offers a good overview of what is `org-mode`, and why people who cares about plain text workflow should care about Emacs/Org. I must admit I personally remain on very pragmatic approaches to programming (I need code to do something right now because I'm a medical statistician, not a programmer, but it has to be reproducible at some point--I don't want to spend too much time rewriting it two years ago when a reviewer asks for further analyses) and editing (I like plain text because I can view and update it on almost every device: a laptop, my iPhone, etc., and I can use any of all the magic GNU utilities to process text streams).


## Org-mode for literate programming

I remember that people were already using `org-mode` to display live R code in their TeX document before the first release of knitr. Surely we could find several threads on Stack Overflow or Cross Validated around 2010-2012. As of *Markdown vs. Org* or LP through `org-mode`, here are [some](http://goo.gl/AgN9z0) [related](http://goo.gl/7rgRZX) [threads](http://goo.gl/dq1xy6), but see also Bernd Weiss's Slides from the R Benutzer Treffen Köln / R user meeting in Cologne on ["A brief introduction to reproducible research with Emacs’ Org mode and R"](https://github.com/berndweiss/ps2012-07-KRUG_org_r). There is also [How to Use Emacs Org-Babel Mode to Write Literate Programming Document in R Language](http://orgmode.org/worg/org-contrib/babel/how-to-use-Org-Babel-for-R.html) available on <http://orgmode.org>.

Two years ago, Eric Schulte and coll. published a paper entitled [A Multi-Language Computing Environment for Literate Programming and Reproducible Research](http://www.jstatsoft.org/v46/i03) in the *Journal of Statistical Software* (46(3), 2012). This article provides a good review of exiting systems for LP, as well as some example of use of Org-mode with various programming languages, including R (p. 20 ff.). In fact, this is [Babel](http://orgmode.org/worg/org-contrib/babel/index.html) (formerly, org-babel) that is responsible for processing chunks of code into a text file for matted using org directives. There are some [user-submitted examples](http://orgmode.org/worg/org-contrib/babel/uses.html) that helps to see how Babel can be used in interaction with R. It looks like [ox-ravel.org](https://github.com/chasberry/orgmode-accessories/blob/master/ox-ravel.org), from [orgmode-accessories](https://github.com/chasberry/orgmode-accessories) is now considered as a potential alternative to Sweave or knitr for processing R code under Emacs. At least, it has been used to produce an R vignette, see [Writing R vignettes in emacs org mode using ox-ravel](http://cwcode.wordpress.com/2013/05/21/vignette/).

Regarding Clojure, I found the following post, [Using Clojure with org-babel and nREPL](http://nakkaya.com/2013/04/06/using-clojure-with-org-babel-and-nrepl/), where the author described how to configure Emacs to run Clojure code through [nREPL](https://github.com/clojure/tools.nrepl). However, nREPL has been replaced by [CIDER](https://github.com/clojure-emacs/cider), so this is no longer applicable except for those who didn't make the switch. In the meantime, [Org-babel-clojure](http://orgmode.org/worg/org-contrib/babel/languages/ob-doc-clojure.html) has been updated and can be used with the development version of `org-mode`.


