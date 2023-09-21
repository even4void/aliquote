---
title: "Some interesting R packages"
date: 2023-09-18T09:23:08+02:00
draft: false
tags: ["rstats"]
categories: ["2023"]
---

It's interesting to see how few R code I write these days, compared to my early professional carrier as a medical statistician. I could have some opportunities to do biostatistical stuff but most of the time I am never asked to and my job resolves around genomics these days. That's fine by me, I still have some opportunities to learn new things, especially in NGS and bioinformatics. At work I mostly use Python and Bash, because they fulfill their role for string processing and task orchestration. When I'm not involved in programming, I'm using more or less esoteric bioinformatic software, for which my rough estimate of their lifetime is about 2 years after having been described in a peer-reviewed paper. Anyway, I still do some statistical stuff, mostly for fun at home, and most of the time R comes to the rescue, even if I also use Stata and Mathematica.

Here are some R packages I discovered or reinstalled in 2023:

- First, I learned that there's a dedicated webiste for [ggplot extensions](https://exts.ggplot2.tidyverse.org/). There you will find ggstance (horizontal boxplots, for instance), ggalt (useful for spline fitting) or ggradar (radar or spider charts, which I implemented in base R 14 years ago!). There is many cool stuff that been developed around ggplot, which is great.

- [gtsummary](https://www.danieldsjoberg.com/gtsummary/) as a quick replacement for gt when one to summarize a data frame. It produces an HTML page by design. However, it supports several backends, including [gt](https://gt.rstudio.com/articles/intro-creating-gt-tables.html), to output PNG (requires the webshot2 package, and one of chrome-based browser), DOCX or TEX (as a longtable) files. Quick one-liner:

```r
library(gt)
library(gtsummary)
tbl_summary(iris) |> as_gt() |> gtsave(filename = "/tmp/out.tex")
```

- [janitor](https://www.rdocumentation.org/packages/janitor) to manage your dirty dataset. There's no magic incantation, though, so I believe it does not prevent the user to closely inspect, and not only eye-balling, the data.

- [parameters](https://www.rdocumentation.org/packages/parameters) for managing and displaying model estimates; not sure I would really need this, but I'll keep it in mind.

- [emmeans](https://cran.r-project.org/web/packages/emmeans/index.html) and [margins](https://cran.r-project.org/web/packages/margins/vignettes/Introduction.html), although I'm used to the effects and rms packages.

- [dbplyr](https://dbplyr.tidyverse.org/) and [multidplyr](https://multidplyr.tidyverse.org/): I'm still not versed into the tidyverse, but I must admit that the dbplyr package offers the best of the two worlds, a robust query language on top of an efficient database system. As such, instead of using the [data.table](https://github.com/Rdatatable/data.table) package, we can imagine using Arrow to read and/or write large data files, and duckdb to query the collected data using their efficient streaming algorithms, but see some examples of use in [this tutorial](https://hbs-rcs.github.io/large_data_in_R/). I'd like to benchmark this approach with a full-blown [H2O](https://github.com/h2oai) solution. I was quite surprised by the performance and ease of use of the Python [datatable](/post/python-datatable) package from the H20 team.

There are many other packages that I once installed but removed soon after using them. There are also lot of packages that I am not aware of. In fact, I stopped my technological watch years ago, and never really came back, so that I'm mostly comfortable with what I've learned long time ago. By the way, it was [already cool](https://kbroman.org/hipsteR/). Curiously, while I was using the Bioconductor project and its packages 13 years ago for GWAS analysis, I no longer use them, except for RNASeq or metagenomics-related stuff.

{{% music %}}Benoît Delbecq • _Anamorphoses_{{% /music %}}
