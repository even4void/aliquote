---
title: "Back to Table one"
date: 2020-10-02T20:34:21+02:00
draft: false
tags: ["rstats"]
categories: ["2020"]
---

In the past I reviewed several packages useful for making summary or regression tables in R.[^1] Recently, I stumbled upon the following blog post: [My favourite R package for: summarising data](https://dabblingwithdata.wordpress.com/2018/01/02/my-favourite-r-package-for-summarising-data/), which nicely summarizes some of the oldest packages that I mentioned, and more recent ones. Despite being a huge fan of `Hmisc`, I find myself using [skimr](https://ropensci.org/blog/2017/07/11/skimr/) more regularly these days. I even added it to my `.Rprofile` file:

```bash
.loader <- function(p)
  suppressWarnings(suppressPackageStartupMessages(library(p, character.only = TRUE)))
.pkg <- c("ggplot2", "skimr")
if (interactive()) invisible(sapply(.pkg, .loader))
```

That being said, the object of this post is just to talk about the famous "Table 1" of epidemiology or medicine articles, which usually stands for a summary table of subjects or patients' characteristics, stratified by clinical status, exposure, time points or whatever. I have always used `Hmisc::summary.formula` with the `"reverse"` option for that matter. Few days ago I needed to build some supplementary tables for a paper under review (yeah, it still happens to me!), and I wanted to try a quick one-liner. I heard about something like a "table 1" package last year, or maybe this was two years ago. After a quick search and some tests, I can confirm that [tableone](https://cran.r-project.org/web/packages/tableone/index.html) works great, while [table1](https://cran.r-project.org/web/packages/table1/index.html) isn't that different from the Hmisc version (except that it is limited to the "reverse" option, of course).

There are some weird choices in the design of the `tableone` package, like for example the fact that we need to indicate which numeric variables should be treated as categorical ones (e.g., binary variables encoded as integers) in `factorVars =` although they must be listed with all other variables in `vars =`. However it does the job pretty well, and it correctly identify binary variables such that only one line is printed for the % (n) values. In most cases it is enough, but I like the option in Hmisc to print both values (i.e., when the variable value equals 0 or 1) because in some settings it matters a lot. Above all that, the fact that the table is stored in a simple matrix structure makes it relatively easy to export it right into a CSV file, and then into Excel for hand edit. Yeah, I told you it still happens to me.

Overall, I would say that no package will ever beats `Hmisc`, but for those interested in quick fix, `tableone` is probably a good option.

[^1]: I'm pretty sure I wrote a blog post about this stuff, but I cannot find it at the time of this writing.
