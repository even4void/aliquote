---
title: "Introduction to Statistics with Mathematica"
date: 2025-01-29T20:43:59+01:00
draft: false
tags: ["review", "mathematica"]
categories: ["2025"]
---

I just finished reading the [Notebook version](https://www.wolfram-media.com/products/introduction-to-statistics-with-the-wolfram-language/) of Koppler's _Introduction to Statistics with Mathematica_. If you're new to Mathematica and/or statistics, chapters 3 to 5 will teach you the basic building blocks and data structures useful for statistical analysis. Even if you are familiar with lists and nested lists, `Dataset`s provide useful abstraction for representing statistical data and they come with great utilities, e.g. `GroupBy`.

This is an introductory course on descriptive and inferential statistical. There's no linear algebra, no digressions on mathematical or computational statistics but it does the job at explaining basic concepts to newcomers, in particular the sampling distribution of a test statistic, standard error and confidence intervals, and how to interpret null hypothesis testing. I yet have to explore how far Mathematica goes with Bayesian, non-parametric and robust statistics.

Regarding the basic material itself, you will learn about `List` comprehension using `Table` and to deal with lists and nested lists, which can be flattened or viewed in a matrix form. [Everything is an expression](https://reference.wolfram.com/language/tutorial/Expressions.html) and the basic object of interaction is a list, which must bring back fond memories for Lisp regulars. I would say it is even more striking  than with R. As said above, `Dataset` extends the capabilities offered by nested lists to associations, which is the term used to denote a specific hash table which links elements of nested lists with distinct keys.

You can view a `Dataset` as is in a notebook -- it's pretty well displayed and useable, btw, and you can import rectangular datasets (e.g., tab-delimited or CSV data files) into a `Dataset` using `SemanticImport` rather than the omnipotent `Import` function. One thing that I struggled with when I started using Mathematica two years ago as a replacement to Stata was how to alternate between the `Dataset` and `List` views. It turns out that something like `Normal[dataset[All, "column"]]`, where `column` is the variable of interest, will turn a `Dataset` column to a regular list. Another thing I really like is that you can address any value in a `Dataset` like you would do in R, with `All` and `;;` as secret keywords you must retain. Like in R, you can address variable (column) by name or index, which was not easy in Stata (where almost every entry is a variable).

I like the fact there's an implicit apply function for dataset, e.g. `dataset[Mean, "column"]`. Should you want the whole split-apply-combine strategy, combine `Select` and `GroupBy`.

Mathematica already provides a lot of builtin functions for data visualization (with great defaults!) and summary statistics. There's a lot more to see on [Wolfram Function Repository](https://resources.wolframcloud.com/FunctionRepository). For casual statistical tests, you will need the HypothesisTesting and ANOVA package, but they are already available in the base installation of Mathematica.

{{% music %}}Tindersticks • _Drunk Tank_{{% /music %}}
