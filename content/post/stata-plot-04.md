---
title: "Stata plot of the week #4"
date: 2023-02-10T20:40:06+01:00
draft: false
tags: ["stata", "dataviz"]
categories: ["2023"]
---

This is a continuation of a previous post on building [interaction plots](/post/stata-plot-03/) in Stata, where I briefly mentioned the margins and marginsplot commands. As I am working on some [statistical code](/post/biostatistical-methods/) as a side project, I need to reproduce a lot of R plots made with [ggplot2](https://cran.r-project.org/web/packages/ggplot2/).

Let's say we want to reproduce the picture shown at the end of [this post](/post/python-datatable/). It is a combination of jittered scatterplot with (mean) line plot superimposed. There are surely some Stata packages that are lying around the internet to do this with a magic command, but let's do this the hard way using built-in commands only. Note that I generally set [`plotplain`](https://journals.sagepub.com/doi/10.1177/1536867X1701700313) as my default color scheme in Stata.[^1] So we also need to manage color at some point. But let's get [some data](/pub/toothgrowth.dta) first.

```stata
use toothgrowth, clear

summarize

egen dosec = group(dose), label
quietly anova len dosec#supp
quietly margins dosec#supp
```

At this point, we can use `marginsplot` directly and start customizing its display options:

```stata
marginsplot, noci title("") xtitle(Dose (mg/day)) ytitle(Length (oc. unit)) ///
  addplot(scatter len dosec if supp == 1, ms(oh) jitter(5) ///
  mc(ebblue) text(20 1 "OJ", color(ebblue) size(medlarge)) ///
  xscale(r(0 4)) xlab(0(1)3) || scatter len dosec if supp == 2, ///
  ms(oh) jitter(5) mc(orange) text(10 2 "VC", color(orange) ///
  size(medlarge))) scheme(uncluttered)
```

In this case, we use the [`uncluttered`](https://github.com/graykimbrough/uncluttered-stata-graphs) color scheme (see also this [review](https://blog.stata.com/2018/10/02/scheming-your-way-to-your-favorite-graph-style/) of various other schemes on the Stata blog), which gently manages the color for us (although I did not choose the right blue/orange combination in this case).

Here is a similar command built using the menu dialog options for `marginsplot`, which works with the `plotplain` scheme:

```stata
 marginsplot, noci recast(line) ///
   plot1opts(lcolor(ebblue)) plot2opts(lcolor(orange)) ///
   addplot((scatter len dosec if supp == 1, mcolor(ebblue) jitter(5)) ///
   (scatter len dosec if supp == 2, mcolor(orange) jitter(5))) ///
   ytitle(Length (oc. unit)) xtitle(Dose (mg/day)) xscale(range(0.75 3.25)) ///
   title("") legend(off)
```

I should note I was not able to reorder the legend (to suppress the additional keys generated for the scatter added plots). Anyway, both results are shown side by side below:

{{< fluid_imgs
"pure-u-1-2|/img/fig-01-06.png"
"pure-u-1-2|/img/fig-toothgrowth-margins-v2.png" >}}

The `anovaplot` command works also quite well, actually:

```stata
anovaplot dosec supp, scatter(jitter(5))
```

{{% music %}}Rammstein • _Amerika_{{% /music %}}

[^1]: Here is my `profile.do` configuration by the way:

        sysdir set PLUS "~/.local/lib/ado/plus/"
        sysdir set PERSONAL "~/.local/lib/ado/personal/"
        sysdir set OLDPLACE "~/.local/lib/ado/"

        set seed 101
        set logtype text
        set matastrict on
        set maxvar 5000
        set scrollbufsize 2000000
        set tracedepth 1
        // set varabbrev off

        set scheme plotplain
        graph set eps fontdir ~/.local/share/fonts
        graph set window fontface "Roboto Condensed"
        if "`c(console)'"!="console" graph set eps preview on
        graph set eps logo off
        graph set eps fontface "Roboto Condensed"
        graph set print logo off
        // set autotabgraphs on, perm

        set max_memory 8g, permanently
