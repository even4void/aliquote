---
title: "Capture-recapture sampling"
date: 2020-01-04T20:06:52+01:00
draft: true
tags: ["statistics"]
categories: ["2020"]
---

Capture-recapture (CR) sampling is widely used in ecological research, epidemiology and population biology. I saw a [tweet](https://twitter.com/AndrewM_Webb/status/1212673397106388992) a few days ago that nicely illustrates the CR method using animated graphics, which has been followed by a [blog post](http://www.awebb.info/blog/iterated_mark) since then.

The basic idea underlying CR sampling is that  you use simple random sampling to capture a set of *n* individuals out of a population of size *N*, release this sample once all items have been marked, and then iterate. Sample sizes do not necessarily have to be identical among each capture stage, but you must assume that marking does not affect survival, and that the population is fixed (no death, no new individual). Suppose you take a first sample of size 10 and a second sample of size 15, of which 5 were already marked during the first stage, then the estimated population size would be (10 x 15) / 5 = 30. More iterations will help refine this estimate.

This of course is the *hypergeometric distribution* in disguise. The hypergeometric distribution plays a central role in random sampling with finite populations. Let's consider an urn with red and black balls. Each time you draw a ball, without replacement: what's the probability of drawing *n* red balls? Unlike the case of the binomial distribution, each drawing stage influence the outcome of the next draw since the ratios of red to black balls changes after each draw.