---
title: "Some interesting R packages"
date: 2023-09-18T09:23:08+02:00
draft: true
tags: ["rstats"]
categories: ["2023"]
---

Some R packages I discovered or reinstalled in 2023: (I did learn R 20 years ago, and it was [already cool](https://kbroman.org/hipsteR/).)

- First, I learned that there's a dedicated webiste for [ggplot extensions](https://exts.ggplot2.tidyverse.org/). There you will find ggstance (horizontal boxplots, for instance), ggalt (useful for spline fitting) or ggradar (radar or spider charts, which I implemented in base R 14 years ago!).

- [gtsummary](https://www.danieldsjoberg.com/gtsummary/) as a quick replacement for gt when one to summarize a data frame. It produces an HTML page by design. However, it supports several backends, including [gt](https://gt.rstudio.com/articles/intro-creating-gt-tables.html), to output PNG (requires the webshot2 package, and one of chrome-based browser), DOCX or TEX (as a longtable) files. Quick one-liner:

```r
library(gt)
library(gtsummary)
tbl_summary(iris) |> as_gt() |> gtsave(filename = "/tmp/out.tex")
```

- [janitor](https://www.rdocumentation.org/packages/janitor) to manage your dirty dataset.

- [parameters](https://www.rdocumentation.org/packages/parameters) for managing and displaying model estimates; not sure I would really need this, but I'll keep it in mind.

- [emmeans](https://cran.r-project.org/web/packages/emmeans/index.html) and [margins](https://cran.r-project.org/web/packages/margins/vignettes/Introduction.html)

- [dbplyr](https://dbplyr.tidyverse.org/) and [multidplyr](https://multidplyr.tidyverse.org/)

{{% music %}}Benoît Delbecq • _Anamorphoses_{{% /music %}}
