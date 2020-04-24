---
title: "Wolfram Engine and Jupyter"
date: 2020-04-24T12:04:01+02:00
draft: true
tags: ["mathematica"]
categories: ["2020"]
---

I hold a license for Mathematica 9 (pro) and 11 (home edition), and whenever I need to run some Mathematica code, I just launch the Desktop app because I prefer Desktop app anyway. There are two other options to run Mathematica code these days. First, you can use Wolfram cloud, even from your phone if you like, or you can install the Jupyter [kernel extension](https://github.com/WolframResearch/WolframLanguageForJupyter). The later is interesting because you can use Emacs [jupyter](https://github.com/dzop/emacs-jupyter) mode to interact with your running kernel without worrying about launching a notebook or a console in a separate terminal.

![](/img/2020-04-21-20-04-12.png)

In a [previous post](/post/stata-jupyter/) of mine I discussed some alternatives to [ESS](https://ess.r-project.org) to run Stata code. Upon reflection, and a bit of tests and experiments, I have to admit that `emacs-jupyter` comes in handy to work with Stata code interactively: Just edit your `do`-file in a standard Emacs buffer, and `C-c C-c` to evaluate it right away in Jupyter. Also, don't forget to `(setq jupyter-repl-echo-eval-p t)` in order to have the results printed in the Jupyter buffer instead of a blank buffer.

