---
title: "Rectangles Algorithm"
date: 2018-10-29T18:29:55+01:00
lastmod: 2018-10-29T18:29:55+01:00
draft: true
description: ""
tags: []
categories: []
---
The rectangles algorithm is used to generate random variates based on the [acceptance–rejection](https://en.wikipedia.org/wiki/Rejection_sampling) method. Here is a small implementation using Clojure.

<!--more-->

The article is available online, but in a few words the idea of this algorithm 

Recall that the PDF for a gaussian random variable (r.v.) is 

$$ f(x) = \frac{1}{\sqrt{2\pi\sigma^2}}\exp\left(\frac{-(x-\mu)^2}{2\sigma^2}\right), $$

for $-\infty < x < \infty$, where $\mu$ and $\sigma^2$ denote the mean and variance of the distribution. In general, it is easier to consider a standard normal deviate $Z$, with $\mu=0$ and $\sigma=1$, since we can always use the transformation $X = \mu + \sigma Z$.

> Zhang, R., & Leemis, L. M. (2012). [Rectangles algorithm for generating normal variates](http://bit.ly/2DbKZr0). Naval Research Logistics, 59(1), 1–6.

