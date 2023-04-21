---
title: "ArXiving on January 2023"
date: 2023-04-19T12:19:00+01:00
draft: true
tags: ["readings", "arxiv"]
categories: ["2022"]
---

(I know, I know, it's a bit late for a January review.)

### Polynomial spline regression: Theory and Application (https://arxiv.org/abs/2212.14777)

The Box-Cox transformation is one of the many tools one can use to ease traditional linear modeling of data.Semi-parametric regression, whihc I never really used for real work is also an option. Flexible regression methods, as emphasized in Harrell's RMS textbook[^1] or the use of generalized additive models[^2] are another. I've been doing some research on orthogonal polynomial, restricted cubic splines, and other spline fitting procedures, and then I found this paper. It introduces different frameworks (Truncated Power, B-spline, and P-Spline), and a quick application on a time-series dataset.

### Parametrization Cookbook: A set of Bijective Parametrizations for using Machine Learning methods in Statistical Inference (https://arxiv.org/abs/2301.08297)

Looks interesting at first sight, but I haven't had time to read it. Maybe you will be interested, though.

> Unlike the parametrizations classically used in Machine Learning, the parametrizations introduced here are all bijective and are even diffeomorphisms, thus allowing to keep the important properties from a statistical inference point of view, first of all identifiability

### An Introduction to Probabilistic Programming (https://arxiv.org/abs/1809.10756)

This is a 300-page long tutorial on probabilistic programming written by one of the authors of [Anglican](https://probprog.github.io/anglican/index.html), which seems like a staled project at this time. Still, it is a very valuable account of probabilistic programming at large and a peculiar implementation targeting the JVM. See also these [slides](https://jwvdm.github.io/slides/inference-learning-prob-prog/).

### A Practical Introduction to Regression Discontinuity Designs: Extensions (https://arxiv.org/abs/2301.08958)

This is a rather long monograph on RDDs. It covers local randomization (which assumes that the assignment of units above or below the cutoff was as if random inside a given window and that in this window the potential outcomes are unrelated to the score), fuzzy RDD (which accounts for non-compliance), and discrete and multidimensional designs. There's a preliminary [monograph](https://arxiv.org/abs/1911.09511) from the same authors that only deals with the classical RDD, as well as a practical for [medical applications](https://arxiv.org/abs/2302.07413).

### Improving Software Engineering in Biostatistics: Challenges and Opportunities (https://arxiv.org/abs/2301.11791)

> Programming is ubiquitous in applied biostatistics; adopting software engineering skills will help
> biostatisticians do a better job.

A few months ago, I read on a blog that statisticians were very bad at programming because they lack skills in software engineering. Let me suggest two additional remarks: applied statisticians must provide results, quickly whenever possible, and when they can use agile programming they do, most of the time. This does not mean they will deliver a product of industrial grade, but if they can reproduce their own results six months later, this already is good news. I guess many software engineers never looked at statlib or established algorithms; you can use TDD, CI, regression tests and the like; if your algorithm is far from the standards, it won't do any good.

### A statistical framework for planning and analysing test-retest studies for repeatability of quantitative biomarker measurements (https://arxiv.org/abs/2301.11690)

Sometimes, I feel like I'm reading the same story every year: "biomarkers", measurement error, practical significant difference, etc. [Ioannidis](https://en.wikipedia.org/wiki/Why_Most_Published_Research_Findings_Are_False) warned us a long time ago.

### From Classification Accuracy to Proper Scoring Rules: Elicitability of Probabilistic Top List Predictions (https://arxiv.org/abs/2301.11797)

The authors hereby suggests "probabilistic top lists as a novel type of prediction in classification, which bridges the gap between single-class predictions and predictive distributions." His conclusion is that the Brier score is a good candidate. The problem with discrimination indices is that they perform poorly when the observed prevalence of the outcome is very low (which happens pretty often in medical applications) despite highly significant variables.

### Getting to the Point. Index Sets and Parallelism-Preserving Autodiff for Pointful Array Programming (https://arxiv.org/abs/2104.05372)

I learned about [Dex](https://github.com/google-research/dex-lang) on Darren Wilkinson's blog. Later on, I learned about Futhark, but see [A comparison of Futhark and Dex](https://futhark-lang.org/blog/2020-12-28-futhark-and-dex.html). I never used any one of these DSLs, but I warmly recommend reading what Darren Wilkinson has to say about those frameworks.

{{% music %}}Train • _Drops of Jupiter_{{% /music %}}

[^1]: Frank E Harrell (2015) _Regression Modeling Strategies_, Cham: Springer International Publishing
[^2]: T. J. Hastie & R. J. Tibshirani (1990) _Generalized Additive Models_, Chapman & Hall/CRC; Wood, S. N. (2017). _Generalized Additive Models: An Introduction with R_ (2nd ed). Chapman & Hall/CRC.
