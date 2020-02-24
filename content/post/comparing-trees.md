---
title: "On comparing trees"
date: 2020-02-21T11:41:20+01:00
draft: true
tags: ["bioinformatics"]
categories: ["2020"]
---

Phylogenetic trees are used to visually depict the evolutionary relationships between a set of taxa. The branching pattern of such trees is called the topology of the tree, and an interesting question is: What statistcal measure can be used to compare the layout of different evolutionary trees, or in other words, to assess whether their topologies could be considered different. It turns out that the [Robinson-Foulds](https://en.wikipedia.org/wiki/Robinson–Foulds_metric) distance is exactly what we need, and it is available in the [phangorn](https://cran.r-project.org/web/packages/phangorn/index.html) R package.

Let's see it in action.

https://www.biostars.org/p/179195/
