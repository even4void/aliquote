---
title: "Reflecting on 25 years of statistical computing"
date: 2024-06-30T21:42:46+02:00
draft: true
tags: ["statistics"]
categories: ["2024"]
---

Yesterday I came across a blog entry posted on HN: [A Bunch of Programming Advice I’d Give To Myself 15 Years Ago](https://mbuffett.com/posts/programming-advice-younger-self). Surely some of the advices discussed here are ggo ones even when managing a statistical project:

- Spending time sharpening the axe is almost always worth it
- If you can’t easily explain why something is difficult, then it’s incidental complexity, which is probably worth addressing
- Don’t underestimate the value of digging into history to investigate some bugs
- Make debugging easier

All the above apply equally well to statistical analysis.

Other rule-of-thumbs I adopted over time:

- Make a [plot for every p-value](https://stats.stackexchange.com/a/2724) you report
- We have computer to do the hard work, but it's always good to know how dof are derived, for instance. It helps checking if we are working with the correct data, but see below.
- Be careful with variable encoding and missing values
- Be careful with default values of your preferred statistical package for certain routines, they may differ from other well acknowledged software (continuity correction, population vs. sample dof, etc.)
- Reproducibility is a thing, but you should first be able to reproduce your own results (think about the 2-year cycle or so before publishing a paper; you may be asked to re-run the whole analysis to please one picky reviewer, who might be right by the way)

{{% music %}}Passenger • _Wicked Man's Rest_{{% /music %}}
