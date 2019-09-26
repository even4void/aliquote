---
title: "lost+found 2015"
date: 2016-01-01T20:32:32+01:00
draft: false
tags: ["this", "psychometrics", "rstats"]
categories: ["2016"]
---

Here are some draft notes, written in 2015, unfilled but not lost forever. With slight edits to accommodate a proper archive blog post.

## R and psychometrics
<small>(February 2015)</small>

I have been using R for most of my statistical projects since 10 years or so. In the beginning it really was an awesome software for psychometric modeling because there were some nice packages for multidimensional and optimal scaling, IRT modeling, and factor analysis, which were otherwise not available, at least on OS X.

Although I am actually doing a lot of psychometric work with [Mplus](https://www.statmodel.com), or even Stata, I must admit there's still a lot of useful packages on CRAN. Here are some of the ones I am familiar with and other mostly new to me.

Regarding IRT, I am mostly familiar with [ltm](http://cran.r-project.org/web/packages/ltm/index.html) and [eRm](http://cran.r-project.org/web/packages/eRm/index.html), but there is now a plethora of related packages on CRAN. Following earlier reviews I made, here is what I found recently by browsing the "Psychometrics" [Task View](http://cran.r-project.org/web/views/Psychometrics.html). Note that several packages are also hosted on [Alexander Robitzsch](https://sites.google.com/site/alexanderrobitzsch/software)'s website.

The [sirt](http://cran.r-project.org/web/packages/sirt/index.html) package provides "supplementary item response theory models." This will also install `TAM`, `CDM`, `mirt`, and `WrightMap`, among others.

Regarding multidimensional IRT fitting, Reckase provides some discussion of NOHARM (which is required by `sirt`) and TESTFACT, but see this [presentation](http://www.psychometrics.cam.ac.uk/uploads/documents/document-uploads-in-2014/multidimensional-item-response-theory) from the Psychometrics Center in Cambridge. The `sirt` also allows to call Conquest, but as NOHARM this is a Windows-only software.

*References*: Reckase, M.D. (2009). *Multidimensional Item Response Theory*. Springer.

Other packages to discuss: `extracat`, `cacIRT`, `irtProb`, `irtrees`, `IRTShiny`, `sirt`.


## Modern statistics in behavioral sciences
<small>(December 2015)</small>

I brought these two books long ago but I just realized that they do really constitute good references for applied researchers in Behavioral Sciences.

1. Wilcox, R. *Modern Statistics for the Social and Behavioral Sciences, A Practical Introduction*, CRC Press, 2012.
2. Wilcox, R. *Fundamentals of Modern Statistical Methods, Substantially Improving Power and Accuracy* (2nd Ed.), Springer, 2010.

Actually I suspect the first reference was developed as a more complete development of the topics discussed in [2]. Contrary to most textbooks on statistics for the behavioral or social sciences, the author goes beyond classical tests of association and insists on robust methods like trimmed mean and robust regression (e.g., median-based or M-estimators). Moreover, several chapters are dedicated to the analysis of variance and post-hoc multiple comparisons, including within-design. In each case, the bootstrap is discussed extensively. Some R code is provided for most of the illustrations.

I organize a course on [applied statistics for behavioral scientists][cogmaster] each year, and I suggest two free online textbooks: [OpenIntro Statistics][openintrostat] (2nd edition), and [Learning Statistics with R][lsr] (v 0.5). I believe these two textbooks provide enough material for students involved in cognitive science or neurosciences.




[cogmaster]: http://cogmaster-stats.github.io/site/
[openintrostat]: http://www.openintro.org/stat/
[lsr]: http://health.adelaide.edu.au/psychology/ccs/teaching/lsr/
[maa]: http://www.maa.org/publications/maa-reviews/modern-statistics-for-the-social-and-behavioral-sciences-a-practical-introduction
