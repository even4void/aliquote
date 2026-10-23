---
title: "Stata plot of the week #6"
date: 2026-10-23T20:43:33+02:00
draft: true
tags: ["stata", "dataviz"]
categories: ["2026"]
---

For one of my last lectures I produced the following plot in R:

{{< figure src="/img/2026-10-23-20-50-20.png" >}}

The idea was to illustrate sampling fluctuations and the exchangeability of labels when samples come from the same population, eventually.

Here's one way to reproduce this chart using Stata. First, let's generate two random samples from a Normal distribution with different location parameters:

```stata
set seed 101
set obs 15
gen y1 = rnormal(11, 1)
gen y2 = rnormal(9, 1)
gen id = _n
reshape long y, i(id) j(g)
drop id 
```


{{% music %}}Defekt 86 • _Meine Haut_{{% /music %}}
