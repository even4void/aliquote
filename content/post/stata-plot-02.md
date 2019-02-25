---
title: "Stata plot of the week #2"
date: 2019-02-24T19:42:18+01:00
draft: true
tags: ["stata","dataviz"]
categories: []
---
Today we are going to customize a simple boxplot by overlaying individual data points.

<!--more-->

Note that there's a few pieces of code lying around on the [UCLA website](https://stats.idre.ucla.edu/stata/code/creating-and-extending-boxplots-using-twoway-graphs/), but we are going to proceed in a different way. Note also that [stripplot](https://ideas.repec.org/c/boc/bocode/s433401.html) offers a lot of functionality, including a [variation](https://www.statalist.org/forums/forum/general-stata-discussion/general/6918-varying-box-plots) of the idea discussed here.

First, we need a dataset. Let's consider, for example, the dataset `physed` which is used in the [MV] manual (it is also discussed in the [Stata Journal](https://www.stata-journal.com/sjpdf.html?articlenum=st0262)). It is described as follows:

> You have measured the flexibility, speed, and strength of the 80 students in your physical education class. You want to split the class into four groups, based on their physical attributes, so that they can receive the mix of flexibility, strength, and speed training that will best help them improve.

There are 4 variables and we are interested in describing the distribution of the three numerical variables, independent of group membership. You may recall that a boxplot summarizes the distribution of a continuous variable by using a 5-point summary, much like `tabstat` or other tables of statistics can do in the results window.

Here are a few steps before we can go on with displays of basic boxplots:

```Stata
webuse physed
local j = 1
foreach v of varlist flexibility-strength {
  rename `v' value`j'
  local ++j
}
gen id = _n
reshape long value, i(id) j(variable)
label define variable 1 "flexibility" 2 "speed" 3 "strength"
label values variable variable
```

Now that we have data in long format (so that we can process all numerical data at once), here is a simple reminder of what a boxplot is:

```Stata
summarize value if variable == 1, detail
graph box value if variable == 1, text(`r(p50)' 95 "Median") ///
  text(`r(p25)' 95 "1st Q") text(`r(p75)' 95 "3rd Q") ///
  text(`r(min)' 95 "Min") text(`r(max)' 95 "Max") ///
  ytitle("Flexibility")
```

![](/img/stata-plot-003.png)

We don't necessarily need the box, and as suggested by Tukey a simpler version might just highlight the median and draw whiskers around it. I wrote a scrappy [R function](https://gist.github.com/even4void/1128764) to build such lightweight boxplot a long ago.
