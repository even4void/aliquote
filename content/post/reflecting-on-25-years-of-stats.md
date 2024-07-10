---
title: "Make progress and feel at ease in statistical computing"
date: 2024-07-10T20:42:46+02:00
draft: false
tags: ["statistics"]
categories: ["2024"]
---

Last month I came across a blog entry posted on HN: [A Bunch of Programming Advice I’d Give To Myself 15 Years Ago](https://mbuffett.com/posts/programming-advice-younger-self). I couldn't help thinking that some of the advices discussed here are good ones even for managing a statistical project:

- Spending time sharpening the axe is almost always worth it
- If you can’t easily explain why something is difficult, then it’s incidental complexity, which is probably worth addressing
- Don’t underestimate the value of digging into history to investigate some bugs
- Make debugging easier

All the above apply equally well to statistical analysis. Even if should select the best statistical package for the task at hand (while running a t-test is a common task that most software offer nowadays, analyzing survey data is not something to be taken lightly). As someone who value good software and the command-line (not much because I like typing commands but because I can record them for later use or review) I've almost always relied on R, Stata and a few dedicated software (e.g., jags, stan, xgboost). Writing code also means you should value your text editor (Emacs first, then Vim, then Neovim in my case). About the second point, I faced it both when teaching medium-to-hard techniques to graduate students or during corporate training, and by presenting my own analysis results, most of the time resulting from multivariate analysis. I was using Git mostly for mono repos so that I could track changes along project timeline (my changes, and their -- i.e., the client or colleagues -- changes as well). As for debugging, especially making it easier to detect errors or misbehaving programs, I believe it comes with experience and good practices.

Other rule-of-thumbs I adopted over time:

- Make a [plot for every p-value](https://stats.stackexchange.com/a/2724) you report.
- We have computer to do the hard work, but it's always good to know how dof are derived, for instance. It helps checking if we are working with the correct data, but see below.
- Be careful with variable encoding and missing values.
- Be careful with default values of your preferred statistical package for certain routines, they may differ from other well acknowledged software (continuity correction, population vs. sample dof, etc.).
- Reproducibility is a thing, but you should first be able to reproduce your own results (think about the 2-year cycle or so before publishing a paper; you may be asked to re-run the whole analysis to please one picky reviewer, who might be right by the way).

{{% music %}}Passenger • _Wicked Man's Rest_{{% /music %}}
