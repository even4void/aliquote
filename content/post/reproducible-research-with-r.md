+++
title = "Reproducible research with R"
date = 2014-04-19T09:03:16+01:00
draft = false
tags = ["review", "rstats"]
categories = ["2014"]
+++

I just finished reading two recent books in the R Series from Chapman & Hall: *Reproducible research with R and RStudio* ([Christopher Gandrud](http://christophergandrud.blogspot.fr/)), and *Dynamic documents with R and knitr* ([Yihui Xie](http://yihui.name/)).

<!--more-->


![R books](/img/20140327104852.png)

Following my post on a good [Workflow for statistical data analysis]({{< ref "/post/workflow-for-statistical-data-analysis.md" >}}), I decided to take a look at the state of the art regarding the R statistical software. In fact, I've been using [Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/) and [knitr](http://yihui.name/knitr/) for a while now, and I tend to use knitr for everything but simple R scripts that can be self-contained.

There is now a plethora of R packages dedicated to writing MD or LaTeX tables: [texreg](http://cran.r-project.org/web/packages/texreg/), [stargazer](http://cran.r-project.org/web/packages/stargazer), [apsrtable](http://cran.r-project.org/web/packages/apsrtable), [rapport](http://cran.r-project.org/web/packages/rapport) and [pander](http://cran.r-project.org/web/packages/pander), [reporttools](http://cran.r-project.org/web/packages/reporttools), [brew](http://cran.r-project.org/web/packages/brew/index.html). I should note that someone once asked about a list of such packages on [Stack Overflow](http://stackoverflow.com/questions/5465314/tools-for-making-latex-tables-in-r). Personally, I almost exclusively rely on the [xtable](http://cran.r-project.org/web/packages/xtable) and [Hmisc](http://cran.r-project.org/web/packages/Hmisc) packages, although I wish the latter could return HTML formatted tables in addition to $\LaTeX$ + PDF.

Regarding [tools for Reproducible Research](http://www.stat.wisc.edu/reproducible), there are also a lot of resources available on the internet. The last ones I checked are generally relying on R or Python (see, e.g., Fernando Perez's work and talks, like <i class="fa fa-file-pdf-o fa-1x"></i> [Reproducible software vs. reproducible research](http://www.stanford.edu/~vcs/AAAS2011/1102_aaas_reproducibility_fperez.pdf)). The SIAM 2011 conference included a mini-symposium on that particular aspect of scientific research: [Verifiable, reproducible research and computational science](http://jarrodmillman.com/events/siam2011.html). Karl Broman also has some very nice tutorials for his new course, [Tools for Reproducible Research](http://kbroman.github.io/Tools4RR/). Roger Peng has some [articles on reproducible research](http://www.biostat.jhsph.edu/~rpeng/RR/). Incidentally, he created the [SRPM](http://cran.r-project.org/web/packages/SRPM) package.[^1]

The [associated website](http://christophergandrud.github.io/RepResR-RStudio/) for *Reproducible research with R and RStudio* includes chapter examples and sample Project files. This project can be compiled using GNU Makefile and [knitr](http://yihui.name/knitr/). Regarding the latter, the interested reader can browse

- [Yihui Xie's website](http://yihui.name/knitr/)
- The **knitr** book [GitHub repository](https://github.com/yihui/knitr-book/)
- [JSS review](http://www.jstatsoft.org/v56/b02/paper)

Basically, this book reviews some of the prerequisites to perform reproducible data analysis: reflect the different steps of data analysis (data collection, data cleansing, statistical modeling and reporting) in different directories and subdirectories, use version control to keep a history of how the project did evolve with time and collaboration with others, sum up the results in static ($\LaTeX$ + PDF) and dynamic (HTML + e.g., [googleVis](http://cran.r-project.org/web/packages/googleVis/index.html)) reports, and slideshow (Beamer or [slidify](http://slidify.org/)). The point is that everything can be done with [RStudio](https://www.rstudio.com/), which provides an unified interface to those aspects of data science. Even if I am more versed into Emacs and GNU tools for that, I must acknowledge that RStudio is really the best software to interact with R in a non-intrusive way (read, it's not a "cliquodrome"), although it is clearly best suited for wide screen display. "Everything is a text file" sums up the essence of my own ideas in the past few years. One thing that is missing is package development, which is what I believe RStudio is really great for too. It may not be always the case that when analyzing data you need to build a dedicated package (see my review [How to efficiently manage a statistical analysis project?](http://stats.stackexchange.com/a/3191/930) on Cross Validated), but RStudio comes with handy tools to develop, test and deploy R packages.


Personally, I very much like these books that are available on GitHub: First you have the book almost for free (I often buy the book not to please the editor but to acknowledge the work and efforts made by the author), and you get some nice template to play with. In this case, everything is available on this [GitHub repository](https://github.com/christophergandrud/Rep-Res-Book). By the way, his course [Introduction to Applied Data Analysis for Social Science](https://github.com/christophergandrud/Introduction_to_Statistics_and_Data_Analysis_Yonsei) is also available on GitHub.

Note that a new book was just published in the Chapman & Hall collection: [Implementing Reproducible Research](http://www.crcpress.com/product/isbn/9781466561595). Individual chapter files can be obtained at <https://osf.io/s9tya/>.


[^1]: I wrote another post on [Audit trails in statistical project]({{< ref "/post/audit-trails-in-statistical-project.md" >}}), which discusses the [track](http://cran.r-project.org/web/packages/track/) package.
