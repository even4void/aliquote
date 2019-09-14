---
title: "On the Raise and Fall of Apple Products"
date: 2018-05-21T20:30:16+02:00
draft: false
tags: ["apple"]
categories: ["2018"]
---

I was reminded by [a colleague of mine](https://github.com/briatte/) that it is harder to stand by Apple OSs than good old Un*x systems, unless you accept to upgrade frequently. I am even not speaking of security updates or OS minor version upgrade. I read somewhere that the Macbooks have a lifetime of about 4 years. This is not only about hardware: software may become obsolete soon or later.

<!--more-->

In the present case, the problem arose when trying to [install Pandoc on old release of OS X](https://github.com/jgm/pandoc/issues/4661).
Such peculiarities can waste a lot of your time. This happened to me recently when trying to reinstall [xgobi](https://github.com/ggobi/xgobi). I got it working on my old Macbook running El Capitan, so I thought I would resurrect my old X11 habits on my current Macbook. It is clear now that I will have to rely on GGobi only. I started writing a post back in April but I am probably better leaving it as the following rough draft. The title was: "On Compiling Xgobi 20 Years Later."

-----

Things have changed a bit since the last time: OS are 64 bits, XQuartz replaced Xorg and clang is now the default C compiler. Your mileage may vary but here is how I got it working on High Sierra.

1. First, you need to realize (or remember, it depends how old you are) that before Makefile there was Imakefile, especially when one was relying on the X11 backend. Basically, imake just helps to generate a proper Makefile for your system. Apple no longer ships the imake programs so you have to install it via, e.g., Homebrew. However, it also means installing gcc, which is not what I want actually because (1) I already have a C compiler from Xcode and (2) I only want the imake executable and do not want to waste time installing other software. My first attempt was to grab the latest version from <https://www.x.org/releases/individual/util/>, and remember that time before Homebrew where things were as simple as typing `configure && make`. It worked but then I was missing some files (`Image.{tmpl,rules}` and `X11.{tmpl,rules}`). Maybe things would have get smoother if I installed gcc on the first call. Anyway, once you install imake without dependencies (`brew install imake --ignore-dependencies`), you get everything in `/usr/local/Cellar` and you get the missing files for free.
Unfortunately, it also happened that the `Makefile` was not ready for consumption as there were some indentation errors ("missing separator" error) for several targets. I fixed this by hand. Next, the `-n32` was not recognized as a valid flag by `clang`. Again, I fixed this in the `Makefile` by switching to the alternate `CCOPTIONS = -ansi -w`.

2. (compilation) I got some interesting errors in `xgv_mds.c` (the variable `point_is_dragging` was used in place of `point_is_dragged`)---this was highlighted by `clang` quite nicely. There were a lot more of issues than that, including problems with `return` statement or `static` declaration, and a redefinition of `psort` that I had already sorted out in the past.

3. (linking) I never succeed in linking the whole stuff, partly because of the above complications (and how I did alter the original code) but also because of 32/64 bits issues that I was not able to sort out (and there was also dependency issues like Xmu which actually sits in `/opt/X11/lib` but was causing enough problem to prevent the linking stage to complete).


![](/img/2018-04-17-21-51-17.png)

-----

Anyway, this was an happy evening, at least in terms of good wine and music.

{{% music %}}Joy Division • *Unknown Pleasures*{{% /music %}}


