+++
title = "Statistical questions in evidence-based medicine"
date = 2014-04-04T20:00:49+01:00
draft = false
tags = ["review", "statistics"]
categories = ["2014"]
+++

[Statistical questions in evidence-based medicine](http://www-users.york.ac.uk/~mb55/quest/questcon.htm) was written long ago by Martin Bland and Janet Peacock (Oxford University Press, 2000), but is is still full of good recommendations. It is a series of case-based questions and answers.

<!--more-->

It is supposed to serve as a companion to [*An introduction to Medical Statistics*](http://goo.gl/p2H9Nt). I personally bought the third edition of Indrayan's *Medical Biostatistics*, which I find very good, and I just ordered [*Medical Statistics in Clinical and Epidemiological Research*](http://goo.gl/Beuq8p), by Marit B. Veierød, Stian Lydersen and Petter Laake.

A related book is

> Peacock, J and Kerry, S (2007). Presenting medical statistics. From proposal
> to publication. Oxford University Press.

Here is a briek sketch of the book. The second chapter asks basic questions about study design, emphasizing the role of randomized controlled trials as a gold standard in evidence-based medicine. The third chapter is about observational studies when no intervention or treatment takes place (cross-sectional, cohort and case-control) and various sources of bias that can arise as a result of the way subjects are included in the study. See this [old post]({{< ref "/post/practical-psychiatric-epidemiology.md" >}}) of mine to get an overview of this kind of studies and their biases. Chapters 4 and 5 are concerned with sumarizing and presenting data. There's no mention of [ICMJE guidelines](http://www.icmje.org) (more recently, the <i class="fa fa-file-pdf-o fa-1x"></i> [SAMPL guidelines](http://www.equator-network.org/wp-content/uploads/2013/07/SAMPL-Guidelines-6-27-13.pdf)).

Other articles of interest are listed below:

* [Twenty Statistical Errors EvenYOUCan Find in Biomedical Research Articles](http://goo.gl/dJJIwF)
* [Guidelines for the Design and Statistical Analysis of Experiments Using Laboratory Animals](http://goo.gl/FPDQrO)

Here are some things I don't like in *Statistical questions in evidence-based medicine*:

- In chapter 5 "Presenting Data", the use of barcharts rather than Cleveland's <i class="fa fa-file-pdf-o fa-1x"></i> [dotplot](http://www.perceptualedge.com/articles/b-eye/dot_plots.pdf) to display counts or frequencies, especially in the working example on the 8 domains of the SF-36 questionnaire for which scores were available in two groups. In fact, there's no mention of Tufte or Cleveland in the References section, which I find disappointing since barcharts do not provide more information than dotchart and have a poor [data-ink ratio](http://www.infovis-wiki.net/index.php/Data-Ink_Ratio). Oftentimes, it also nice to display all individual information as well as summary measures; see, e.g., <i class="fa fa-file-pdf-o fa-1x"></i> [Beware of dynamite](http://biostat.mc.vanderbilt.edu/wiki/pub/Main/TatsukiRcode/Poster3.pdf) (PDF).

- In many Tables, they display redundant information by reporting the statistics used to summarize each variable (in the case of continuous outcomes, mean ± SD). In this respect, I prefer a single legend or annotation indicating what is used to summarize numerical and/or categorical variables, as implemented in the R `summary.formula()` function from the [Hmisc](http://biostat.mc.vanderbilt.edu/wiki/Main/Hmisc) package. (Stata's [estout](http://repec.org/bocode/e/estout/) command is much more complicated, in my opinion, <i class="fa fa-file-pdf-o fa-1x"></i> [tabout](http://www.ianwatson.com.au/stata/tabout_tutorial.pdf); see also, <i class="fa fa-file-pdf-o fa-1x"></i> [Making Working & Publication-style Tables in Stata](http://www2.fiu.edu/~tardanic/public.pdf))
