---
title: "GSL shell and Julia"
date: 2012-03-11T08:38:02+01:00
draft: false
tags: ["julia"]
categories: ["2012"]
---

There has been some buzz around a new language for numerical, and potentially statistical, computation: [Julia](http://julialang.org/). Another interesting project is [gsl-shell](http://www.nongnu.org/gsl-shell/) which offers interactive data analysis and visualization with GNU Scientific Library.

## Julia

Julia is actually available on [GitHub](https://github.com/JuliaLang/julia) and a binary for OS X can be grabbed from there. That was just for testing purpose, because I expect Julia to be evolving very rapidly in the next few months and I don't want to recompile Julia every time.

Among its most interesting features are the web REPL with [d3js](http://mbostock.github.com/d3/)-based visualization, and transparent [FFI](http://julialang.org/manual/calling-c-and-fortran-code/) support. That's a very biased summary, which comes from my looking for similar facilities with Common Lisp or Scheme at the moment.

{{< fluid_imgs
  "pure-u-1-2|/img/20120311113101.png"
  "pure-u-1-2|/img/20120319230159.png" >}}

## gsl-shell

Beside Julia, [gsl-shell](http://www.nongnu.org/gsl-shell/) offers a full interface to the GSL via a REPL based on the [Lua JIT](http://luajit.org/) compiler.

It has been updated to version 2.1.1 few months ago. Older versions required to patch lua using the [LNUM patch](http://files.luaforge.net/releases/lnum/lnum) (see [Lua Power Patches](http://lua-users.org/wiki/LuaPowerPatches)). However, it is [no longer needed](http://lua-list.2524044.n2.nabble.com/ANN-GSL-Shell-2-0-beta1-release-td6950022.html). I have had difficulty compiling it from scratch, but the [Git version](http://git.savannah.gnu.org/r/gsl-shell.git) works just fine. There's a static 2D and 3D [graphics interface](http://www.nongnu.org/gsl-shell/doc/graphics.html) (based on [agg](http://www.antigrain.com/)) whose syntax is very simple yet very efficient.

I'm currently playing with GSL Shell for computational statistics. More to come later, probably.