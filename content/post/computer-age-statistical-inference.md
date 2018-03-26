+++
title = "Computer Age Statistical Inference"
description = ""
date = 2018-03-25T19:04:51+01:00
draft = true
tags = ["review", "statistics"]
categories = []
+++

Today, I will discuss the latest book authored by [Bradley Efron](http://statweb.stanford.edu/~ckirby/brad/) and [Trevor Hastie](https://web.stanford.edu/~hastie/), *Computer Age Statistical Inference*. Note that the book has been made [available in PDF format](https://web.stanford.edu/~hastie/CASI/) for free. 

<!--more-->

> Statistics is the science of learning from experience, particularly experience that arrives a little bit at a time.

Together with the [Elements of Statistical Learning](https://web.stanford.edu/~hastie/ElemStatLearn/) or an [Introduction to Statistical Learning](http://www-bcf.usc.edu/~gareth/ISL/), this is another great reference for applied reasearchers. The present book shares a similar spirit in that it offers a deep review of modern techniques of statistical inference, especially in Part 2, but it also covers more "classical" techniques like generalized linear and time to event models. 

From the very beginning of the book, the authors want to pinpoint and exploit the distinction that one can establish "between the algorithmic and inferential aspects of statistical analysis." For example, while averaging a series of observed numbers is an algorithm, computing the standard error of this estimate allows to make an inference for the accuracy of this algorithm. I like the idea of the interplay between statistical algorithm and learning because it sums up the situation of computational statistics very well.

The introduction follows the classical distinction between *estimation*, based on a regression framework using least squares with asymptotic standard errors or lowess fit with 95% bootstrap CIs, and *hypothesis testing* on a set of candidate genes in the leukemia data set, that the authors used to illustrate the two-sample Student t-test and the false-discovery rate approach to multiple testing.

Chapter 2 is about frequentist inference, and it provides a concise albeit very ponctillous summary of key concepts in the frequentist approach. Basically, 

Whereas the preceding chapters focused on


The book makes heavy use of the R statistical software, which is great since it is open source and the reader can follow along every example with no pain.


{{% music %}}John Cale • *Fragments of a Rainy Season*{{% /music %}}
