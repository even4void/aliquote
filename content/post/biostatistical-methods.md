---
title: "Biostatistical methods"
date: 2023-02-06T20:30:52+01:00
draft: false
tags: ["statistics"]
categories: ["2023"]
---

I am currently working on porting a [workshop](https://even4void.github.io/rstats-biostats/) I held on several occasions in the past on Biostatistical modelling into different different languages. The exact title in French is _Méthodes biostatistiques_, in honor of one of my first textbook on mathematical statistics (Philippe Tassi, [Méthodes statistiques](https://www.eyrolles.com/Sciences/Livre/methodes-statistiques-9782717848595/), 2004), although the handouts I wrote are mainly about applied and not theoretical statistics.

I refactor part of the R code, and then started to write Stata and Python scripts to reproduce the R textual and graphical outputs. I intend to write more translations, at least for Clojure, Mathematica and Racket. Of course, it is somewhat limited by the available capabilities of each language, since I don't have time nor the inclination to rewrite everything from scratch. I know I won't be in trouble with Stata, but I doubt I will be able to equate all R's results with any other programming languages. The [rms](https://cran.r-project.org/web/packages/rms/) and [ggplot2](https://cran.r-project.org/web/packages/ggplot2/) packages are damned good. Fortunately, Python has a nice [package](/post/python-plotnine/) for the grammar of graphics, which I started using lately -- I was really impressed that everything worked as expected for someone used to R syntax, and Stata has good facilities for faceted displays. We will see what's doable in other languages.

My original idea with this side project was to practice again, of course (otherwise we end up forgetting the good old reflexes), but also to get an idea of what can be done from one language to another and if the native features of a language influence the way to approach the "data problem". I learned Stata after R (and SPSS and SAS and Statistica and Lisp-Stat), and I learned a lot about how to organize or recode data to optimize data processing and to benefit from built-in features.

I had for a long time a big prejudice about Python because in my opinion if you can't do interactive, specifically visual, exploratory analysis of the data then it's better to turn to more adapted solutions. I still think that there's room for improvements in the Python land for statistical computing -- and I do not pretend nor am I interested in fixing the problem, but I must admit things have improved in the past few years. And as I noted above, plotnine is really a great add-on to the Python "data stack".

Let's see how it goes then. I will write a more detailed review of what I've learned from this porting experiment, and what are the pros and cons of each of those languages with respect to biostatistical modelling at large.

{{% music %}}Bauhaus • _Spirit_{{% /music %}}
