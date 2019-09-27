---
title: "Stata for health researchers"
date: 2015-05-29T22:44:26+01:00
draft: false
tags: ["review", "stata"]
categories: ["2015"]
---

Here is a quick review of the fourth edition of [*An introduction to Stata for Health Researchers*](http://www.stata.com/bookstore/introduction-stata-health-researchers/), by Svend Juul and Morten Frydenberg.

I have several books from Stata Press (and I'd love getting more of them). I always found them very well written, and they generally offer a good balance between theory and application. There is a [companion website](http://ph.au.dk/uddannelse/software/) (other than material provided by Stata Press) as well. There is also some [comments to exercises](http://goo.gl/rvUn2I) for the present book.

So, here is a brief sketch of this book: As stated in the [comments from the Stata technical group](http://goo.gl/jgQ79L), this book does not only expose the reader to Stata syntax or commands to be used to perform a specific task. First of all, a complete chapter (70 pages) is dedicated to data management, including a specific section on data auditing and archiving. Chapter 3 is about all sort of statistical analysis, but it mostly focuses on regression modeling, followed by time-to-event analysis and diagnostic measurement. Various add-on commands are presented. A specific chapter is dedicated to graphical displays, using some custom neat schemes ([lean schemes](http://www.stata-journal.com/article.html?article=gr0002)). The last chapter is about Stata programming, but I highly recommend Baum's book for that purpose: [An introduction to Stata programming](http://goo.gl/EefPeq) (Stata Press, 2009). 

Incidentally, this book uses the Low birth weight data set from Hosmer and Lemeshow. This is the same data set that I have used for my R or Stata lectures during the past 3 or 4 years. I explain why on [Cross Validated](http://stats.stackexchange.com/a/21504/930). For a [MOOC on introductory statistics with R](https://goo.gl/6NajP0), we decided to use another dataset because of possible copyright issues. But see, e.g., <https://www.umass.edu/statdata/statdata/data/lowbwt.txt> for an example of such copyright notice. However, it is not clear to me whether these data are really copyrighted and I didn't find any acknowledgment to Wiley in Juul and Frydenberg's book. I remember a discussion on Twitter one or two years ago saying that tables and/or figures from a textbook were copyrighted but not the raw data. Such legal issues are likely to vary from one country to the other. Personally, I agree with the following quote from the [University of Michigan](http://www.lib.umich.edu/node/2433):

> Fair use allows limited use of copyrighted material without permission from the copyright holder for purposes such as criticism, parody, news reporting, research and scholarship, and teaching.

In any case, the Low birth weight data is available in R and most of R is [under the GPL](http://www.r-project.org/Licenses/). The only information that is given from `help(birthwt, package = "MASS")` is:

```
Source:

     Hosmer, D.W. and Lemeshow, S. (1989) _Applied Logistic
     Regression._ New York: Wiley

References:

     Venables, W. N. and Ripley, B. D. (2002) _Modern Applied
     Statistics with S._ Fourth edition.  Springer.
```

Back to the book. The authors offer sound advices on data management, which are not limited to Stata. This reminded me of J. Scott Long's *Workflow of data analysis using Stata*, which I discussed briefly in [Workflow for statistical data analysis](http://goo.gl/PTh6ol). Regarding R, Roger D. Peng released [R Programming for Data Science](https://leanpub.com/rprogramming) a few months ago,[^1] with several tips to read and process data from within R. I miss a good textbook on data management with R, though. I didn't read [Data Management Using Stata: A Practical Handbook](http://goo.gl/fGCHHj), by Michael N. Mitchell, so I don't know how it compares to Juul and Frydenberg's book. Surely it features much more material

Other resources of interest, other than the [D] reference manual (670 pages long as of Stata 13) are listed below:

- [Take good care of your data](http://goo.gl/z3YWk9) 
- [Introduction to Stata Data Management](http://goo.gl/0Gs8xx)
- [Good practice in data collection and storing](http://wp.me/p315fp-zA)

*Data Analysis Using Stata*, by Ulrich Kohler and Frauke Kreuter (3rd ed., 2012) is another great textbook for learning Stata. It does not target a medical audience specifically, but most concepts can be applied in biostatistics or data management anyway. Of course, biostatisticians will miss case-control, survival or time-to event analysis, which are nicely covered in Juul and Frydenberg's book.
Finally, here are two other great textbooks for a Stata-oriented approach to biostatistical modeling:

1. Dupont, W.D. (2009). *Statistical Modeling for Biomedical Researchers*. Cambridge University Press (2nd ed.).  
The [companion website](http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/) has lot of additional resources, including data sets and lectures notes based on the textbook.

2. Vittinghoff, E., Glidden, D.V., Shiboski, S.C., and McCulloch, C.E. (2005). *Regression Methods in Biostatistics*. Springer. I once started to wrote [R solutions](/articles/tech/RMB/) to selected chapters. But I never really finished it because I was missing some data sets.

[^1]: There is also [The Elements of Data Analytic Style](https://leanpub.com/datastyle), by Jeff Leek. The first chapters are very relevant to users interested in [tidying data](http://vita.had.co.nz/papers/tidy-data.pdf).
