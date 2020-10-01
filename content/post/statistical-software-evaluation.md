---
title: "Statistical software evaluation"
date: 2020-10-01T20:52:29+02:00
draft: false
tags: ["statistics", "rstats"]
categories: ["2020"]
---

Long ago there were some folks who were complaining that R was not "certified", as SAS was, for example, in the pharmaceutical industry. There's however some detailed notes about R's [testing and quality control](https://www.r-project.org/certification.html). No one talked about Stata, if I remember correctly, but in any case the [certification](https://www.stata-journal.com/article.html?article=pr0001) is fully documented, including among other things [detailed results](https://www.stata.com/support/cert/nist/) obtained against the NIST StRD—Standard Reference Data. But what does certification really mean? There are at least two critical points one has to address before releasing a statistical package: the algorithms should be sound and efficient (no one would accept that a statistical procedure deliver an ANOVA table by computing sum of squares as we would do by hand), and numerical accuracy should be ensured.

Let us focus on the second point, by assuming that we are not talking about things like MS Excel which was using a single-pass formula for computing the SD of a series of values, for instance. I didn't bother to check if this is still the case. Numerical accuracy is addressed in several papers, and it can be verified using online benchmarks (like the aforementioned NIST reference dataset). Moreover, _Numerical Issues in Statistical Computing for the Social Scientist_, by Altman, Gill and McDonald (Wiley, 2004) provides an excellent overview of the numerical accuracy and the quality of statistical routines for standard estimation tasks.

Sources of inaccuracy in statistical computation usually follows from bugs, computer arithmetic, randomized algorithms, approximation and heuristic algorithms, local search algorithms. About [computer arithmetic](https://floating-point-gui.de), specifically:

> There's a credibility gap: We don't know how much of the computer's answers to believe. Novice computer users solve this problem by implicitly trusting in the computer as an infallible authority; they tend to believe that all digits of a printed answer are significant. Disillusioned computer users have just the opposite approach; they are constantly afraid that their answers are almost meaningless. --- Don Knuth

So, what is the take away message from computer arithmetic:

1. Rounding errors occur in binary computer arithmetic that are not obvious when one considers only ordinary decimal arithmetic.
2. Round-off error tends to accumulate when adding large and small numbers --- small numbers tend to "drop off the end" of the addition operator's precision, and what accumulates in the leftmost decimal positions is inaccurate.
3. Subtracting a similar quantity from the result can then "cancel" the relatively accurate numbers in the rightmost decimal places, leaving only the least accurate portions.

As an illustration, check the value of `i = 1000000000 + 2 - 0.1 - 1000000000` in your preferred software. Here is what we get in Node:

```bash
~ ❯ node
Welcome to Node.js v14.11.0.
Type ".help" for more information.
> 1000000000 + 2 - 0.1 - 1000000000
1.899999976158142
^D
```

The same results is obtained using Julia (1.5.1), Python (3.8.5), while R (4.0.2), Stata (14.2) or Mathematica (11.0.1) prints 1.9, which is mathematically the correct result. R produces some idiosyncratic results sometimes (check out some of John Myles White's examples on Twitter, for example[^1]), but it does not suffer from canceling errors, nor does Stata in this particular case.

[^1]: Unfortunately, I've lost track of most of it. You know what it means "searching" on Twitter, right? Anyway, I just found [this gem](https://twitter.com/johnmyleswhite/status/1264863830934421504?s=20), which has nothing to do with computer arithmetic per se: `x <- 1152921504606846976; r <- x:(x+100; length(r)` equals 1, while `r <- x:(x+200); length(r)` returns 257.
