---
title: "Stata: A retrospective"
date: 2023-12-05T20:46:57+01:00
draft: false
tags: ["stata"]
categories: ["2023"]
---

I'm afraid I haven't made much progress on my [Stata Starter Kit][0] since I started the original draft. Partly because I'm busy with other interests, partly because I don't use Stata that much these days (and my paid licence is for Stata 13 MP), and because I give a lot of projects along the way, almost surely as they use to say in mathematical statistics. My bad! So I thought I would write down some notes I took when studying the history of Stata, a few years ago. I warmly recommend reading the proper retrospectives published in the Stata Journal, see below (there are other interesting special volumes, IIRC). Interestingly, I've done most of my professional statistical analyses using statistical packages that provide scripting facilities (and not menu-driven interaction), mostly R (90%) and Stata (10%). While I used Stata for real work (I mean, from data cleansing/management to statistical modelling) late, I always kept an eye on data analysis _using_ Stata and I learned a lot from the great collection of books published by Stata Press.

![img](/img/IMG_3355.JPG)

Stata is almost [40 years old][1]. The latest stable release (v18) was released on April 25, 2023. Stata is written in C, but users can access the source code of commands/programs using viewsource. Pre-compiled code cannot be accessed, though. The article [Statistical software certification][2] describes the process of certification adopted by StataCorp. [Thirty Years with Stata: A Retrospective][3] is a good read, as well as [volume 5(1)][4] of the Stata Journal which celebrated the 20 years of Stata. Needless to say, Stata comes with extensive documentation. There are 23 manuals bundled with Stata v13, totalling 11365 pages.[^1]

Of course there are the [41 commands][5] that every Stata user should know (as of Stata v13), but there are also those 42 commands, originally found in Stata v1.0:

```stata
append dir infile plot spool beep do input query summarize by drop label
regress tabulate capture erase list rename test confirm exit macro
replace type convert expand merge run use correlate format modify save
count generate more set describe help outfile sort
```

As can be inferred, the above commands are mostly concerned with data management for rectangular datasets and regression.

> The first version of Stata was a regression package and really nothing more than that. It did a little bit in the way of calculations, and it did some summary statistics, but it was all built around a regression engine. It was written over a one-year period by me initially and by Sean Becketti, who helped me later. I wrote the C code; Sean Becketti helped me a lot with the design. I would say that half of the design is mine and half the design is Sean’s in terms of what the user actually saw. A number of things became available just at that time when we started this project, and it was those things that actually caused the project to start. The first C compiler was available for the PC.
> --- William Gould (A conversation with William Gould, in _Thirty Years with Stata: A Retrospective_, Enrique Pinzon (ed.), Stata Press 2015)

The plotting system has been entirely reworked starting with Stata v2.0 but you can still get good ol' looking inline plot, e.g.:

```stata
. sysuse auto
(1978 Automobile Data)

. plot mpg weight

      41 +
         |      *
         |
         |
    M    |
    i    |      **
    l    | *
    e    |
    a    |          *
    g    |     *  *
    e    | *                              *
         |  *       *     *
    (    |    **    *        *
    m    |       * * * *      **
    p    |                  **     *    **
    g    |        *          * * *       **               *    *
    )    |                              ** ***
         |              *    *   *      *  ** *  ****
         |                                       * *   *  *
         |                                   *     *  **  ***   *
      12 +                                                              *  *
          +----------------------------------------------------------------+
             1760                  Weight (lbs.)                      4840
```


Most commands are still available, except `modify` which has been superseded by `replace`, while `spool`, `beep` and `convert` have simply been deleted.

I started rewritting part of the above Stata system in Scheme,[^2] and my hope is to provide a Racket `#lang stata` one day. One day...

[0]: https://aliquote.org/articles/stata-sk/
[1]: https://www.stata.com/support/faqs/resources/history-of-stata/
[2]: https://www.stata-journal.com/article.html?article=pr0001
[3]: https://www.stata.com/bookstore/thirty-years-with-stata/
[4]: https://www.stata-journal.com/sj5-1.html
[5]: https://www.stata.com/manuals13/u27.pdf

[^1]: On Linux you can run, e.g., `for i in /usr/local/stata/docs/*.pdf; \ do pdfinfo "$i" | grep "^Pages:"; done | awk '{s+=$2} END {print s}'`
[^2]: Stata is primarily column-based, which is a perfect fit for list/vector processing.

{{% music %}}Nirvana • _Breed_{{% /music %}}
