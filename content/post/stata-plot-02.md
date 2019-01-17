---
title: "Stata plot of the week #2"
date: 2019-01-16T10:25:28+01:00
draft: true
tags: ["stata","dataviz"]
categories: []
---
Today we are going to build a correlation heatmap using a few Stata commands.

<!--more-->

Note that there already are some solutions available on the [Stata FAQ](https://stats.idre.ucla.edu/stata/faq/how-can-i-make-a-correlation-matrix-heat-map/) from the UCLA website. However, it relies on contour or scatter plot while we want to display something more akin to a heatmap with filled cells rather than symbols or contour lines. See, e.g., [Nathan Yau's description](https://flowingdata.com/2010/01/21/how-to-make-a-heatmap-a-quick-and-easy-solution/) of a heatmap.

A quick search on the internet suggest that it is possible to use [hmap](https://ideas.repec.org/c/boc/bocode/s457256.html) or [plotmatrix](http://teaching.sociology.ul.ie/bhalpin/heatmaps.html), and I even learnt about [transition probability color plots](http://medim.ceps.lu/stata/transcolorplot03.pdf) (PDF) even it is barely related to our subject. Other interesting ideas were once discussed on [Stata List](https://www.statalist.org/forums/forum/general-stata-discussion/general/1325012-heatmap-in-a-20-by-20-table).

