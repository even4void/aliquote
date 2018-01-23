+++
title = "Weaving Stata"
date = 2014-11-15T09:58:51+01:00
draft = false

tags = ["stata"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

Here are some possibilities for [weaving](http://goo.gl/mZ11) Stata commands without much effort.

I used to use [StatWeave](http://homepage.divms.uiowa.edu/~rlenth/StatWeave/), as described in [this post]({{< ref "/post/weaving-stata-documents.md" >}}). In essence, it is similar to [Sweave](http://www.statistik.lmu.de/~leisch/Sweave/) and you write code chunks with options, etc. A concise description is provided in <i class="fa fa-file-pdf-o fa-1x"></i> [these slides](http://www.stata.com/meeting/italy08/rising_2008.pdf). Although less sophisticated than Sweave or [knitr](http://yihui.name/knitr/), it provided enough features for me to write a full textbook for a course I teach at the university. There is also [dexy](http://www.dexy.it/) and its [Stata filter](http://www.dexy.it/ref/filters/stata.html), but I haven't investigated this much.

Are there any other direct options, à la knitr?

In this blog post, [Stata Markdown](http://hopstat.wordpress.com/2014/01/11/stata-markdown-2/), some options to deal with Stata log files using Markdown-based processor are discussed, although one of the conclusion was:

> You can do “markdown” in Stata. (...) It's complicated.

For direct HTML output where syntax highlighting is enabled, you can have a look at the recent [Synlight Package](http://www.haghish.com/statistics/stata-blog/reproducible-research/synlight.php). [Weaving Stata Output and Annotations](http://data.princeton.edu/wws509/stata/weave) using the `weave` command provides another option. But, as can be seen, it shorthly comes rather cumbersome as you have to embed HTML code chunks to display images that have to be saved as PNG files. Other alternatives, which work together, are:

- [Weaver](http://www.haghish.com/statistics/stata-blog/reproducible-research/weaver.php), "`Weaver` package provides a handful of commands for creating dynamic reports in Stata. `Weaver` was developed to meet the need of Lecturers and Statisticians that need to write and share a lot of reports, especially with other academic people which are not very interested in the details of the analysis and Stata codes. `Weaver` help to produce a clean HTML or PDF document that presents the important results and graphs, avoiding other technical and coding details that may not be of interst of other researchers with less background in statistics."
  
- [Ketchup](http://www.haghish.com/statistics/stata-blog/reproducible-research/ketchup.php), "`Ketchup` is a SMCL logfile modernizer. It converts SMCL to HTML and PDF and styles the document by adding headings, highlighting syntax, and adding graphs to the document. Ketchup requires two other Stata packages which are `Synlight` and `Weaver`."
