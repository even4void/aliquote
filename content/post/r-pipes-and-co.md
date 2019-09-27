---
title: "R Pipes and Co."
date: 2015-04-30T22:54:20+01:00
draft: false
tags: ["rstats"]
categories: ["2015"]
---

The R language is rapidly changing. I am afraid I'm still teaching R like I learned and liked it 10 years ago (but I was already [aware of `replicate()` long ago](http://wp.me/p1MjYA-xN) :smile:) although I try to keep myself regularly informed of what's new on CRAN.

It sticks in my head for two or three years now: Should I just stop teaching how to use `lattice` graphics and switch to [ggplot2](http://ggplot2.org)? If you are wondering why this causes me some problems, this is just because once students understand the advantage of using R formulae and the [split-apply-combine](http://www.jstatsoft.org/v40/i01/) strategy with `aggregate()` (and not [plyr](http://plyr.had.co.nz)) for statistical modeling and data aggregation you are almost done. The same R formulae can be used directly with, e.g., `xyplot()`, with minor variations for grouping or conditioning variables. Moreover, the same formulae are in use in the wonderful [Hmisc](/post/hmisc-and-rms) package (which is why, after all, I don't really need the `plyr` package).

When I stumbled upon this [nice tutorial](https://ramnathv.github.io/pycon2014-r/visualize/base_graphics.html), I could not help but think that `lattice::xyplot` already provides most of these functionalities (especially grouped regression lines) with very few options, e.g.

```r
xyplot(lifeExp ~ gdpPercap, data = d, groups = continent, type = c("p", "r"),
       scales = list(x = list(log = 10)))
```

Of course, `ggplot` is great and Hadley's `{d}plyr` packages are really good, but it looks to me like if it were another R. Beside [The Good The Bad And The Ugly](https://www.youtube.com/watch?v=6S9r_YbqHy8) about domain-specific language vs. general purpose programming languages, issues with [naming conventions](http://journal.r-project.org/archive/2012-2/RJournal_2012-2_Baaaath.pdf), different approaches to [object-oriented programming](http://adv-r.had.co.nz/OO-essentials.html), or some [idiosyncrasies](http://appliedpredictivemodeling.com/blog/2013/6/13/type-what) inherent to R itself and its community of developers, I feel like the R language already known enough internal and external divisions with people looking for or actively involved in alternative solutions, be it [Python](http://pandas.pydata.org/pandas-docs/version/0.15.2/ecosystem.html), [Clojure](http://data-sorcery.org), [Lisp](https://github.com/blindglobe/common-lisp-stat/), [pure C](http://modelingwithdata.org/about_the_book.html), [Scala](https://darrenjw.wordpress.com/2013/12/23/scala-as-a-platform-for-statistical-computing-and-data-science/) or [Julia](http://www.evanmiller.org/why-im-betting-on-julia.html).

Although I am familiar with Unix pipes, I must admit I only tried very briefly [magrittr](https://github.com/smbache/magrittr) + [dplyr](http://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html), or even [tidyr](http://blog.rstudio.org/2014/07/22/introducing-tidyr/), and I am far from mastering all the packages that are now part of what is sometimes called the [Hadleyverse](http://adolfoalvarez.cl/the-hitchhikers-guide-to-the-hadleyverse/)[^1], even if I have been using ggplot for a long now. Anyway, I am not sure that the example about `magrittr` that is available on the [RStudio Blog](http://blog.rstudio.org/2014/12/01/magrittr-1-5/) is really attractive for newcomers, though:

```r
mae <- . %>% abs %>% mean(na.rm = TRUE)
```

This happens to be a way to express the following simple function: `mae <- function(x) mean(abs(x), na.rm = TRUE)`. I agree that in some cases expressing R's operations through pipes could be really fun (and probably more expressive), especially for data munging, but I feel like it often just obscures the language. However, I should note that the following [piece of code](https://github.com/kjhealy/apple/blob/master/apple.r) from Kieran Healy looks more clear to me. At least, I can understand this series of operations:

```r
data.m %>% group_by(Product) %>% filter(Product=="iPad") %>% na.omit() %>% data.frame(.)
```

Maybe I'm too old after all, and I should just try to use these new tools more regularly.


[^1]: See also: [R: the good parts](http://blog.datascienceretreat.com).
