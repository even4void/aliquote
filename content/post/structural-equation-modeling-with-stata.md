+++
title = "Structural equation modeling with Stata"
date = 2013-06-10T11:13:48+01:00
draft = false
tags = ["stata", "psychometrics"]
categories = ["2013"]
+++

Stata 12 came with a module to perform Structural Equation Modeling. Like Amos, there is a SEM diagram builder and fancy dialog boxes but as always commands are directly returned on the command-line so it is not difficult to learn how to write your SEM model directly at Stata prompt or in a do file.

<!--more-->

Recently, a book on [Discovering Structural Equation Modeling Using Stata](http://bit.ly/XEgFWz) was published by Stata Press ([Alan C. Acock](http://health.oregonstate.edu/people/acock-alan), 2013). It is well written and introduces main concepts for factor analysis and structural equation modeling. Datasets and do-files used in the book can be downloaded from [Stata Press](http://www.stata-press.com/data/dsemus.html). Some tips about the [Stata 12 SEM package](https://sites.google.com/site/ifarwf/home/stata-12-sem-package) have been provided elsewhere. And of course, the UCLA server has already covered some good material about Stata SEM on their [Stata FAQ](http://www.ats.ucla.edu/stat/stata/faq/).

<i class="fa fa-file-pdf-o fa-1x"></i> [An Overview of Stata’s "sem" for Structural Equation Modeling](http://www.cpc.unc.edu/training/seminars/BollenBauldry%20SEM%20JAN13.pdf), by K. Bollen and S. Bauldry, is also a good start. Of course, there are many others presentations available via few Google clicks, e.g., <i class="fa fa-file-pdf-o fa-1x"></i> [Structural Equation Modeling Using the sem Command and SEM Builder](http://www.stata.com/meeting/sandiego12/materials/sd12_macdonald.pdf).

Now, Stata has just announced the release of [Stata 13](http://www.stata.com/stata13/), with extended capabilities for latent variable modeling and new support for [generalized linear response variables](http://www.stata.com/stata13/generalized-sem/) (`gsem` command). See, for example, this example with an <i class="fa fa-file-pdf-o fa-1x"></i> [ordered logit model](http://www.stata.com/manuals13/semexample35g.pdf). So I expect more publications related to the use of Stata for psychometric research in the future, and it would be very helpful to have a report paper showing the different capabilities of R, Mplus, and Stata on benchmark datasets. Surely, a direct comparison of [gllamm](http://www.gllamm.org/) vs. Stata built-in SEM package would be very insightful as I always found `gllamm` to be much to slow to be used in routine tasks (IRT, multi-group CFA, etc.). Actually, using a combination of `polychoric` and `factor` to carry out a factor analysis on Likert-type items is also very slow.
