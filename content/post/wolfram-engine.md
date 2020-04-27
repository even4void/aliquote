---
title: "Wolfram Engine and Jupyter"
date: 2020-04-24T12:04:01+02:00
draft: false
tags: ["mathematica"]
categories: ["2020"]
---

I hold a license for Mathematica 9 (pro) and 11 (home edition), and whenever I need to run some Mathematica code, I just launch the Desktop app because I prefer Desktop app anyway. There are two other options to run Mathematica code these days. First, you can use Wolfram cloud, even from your phone if you like, or you can install the Jupyter [kernel extension](https://github.com/WolframResearch/WolframLanguageForJupyter). The later is interesting because you can use Emacs [jupyter](https://github.com/dzop/emacs-jupyter) mode to interact with your running kernel without worrying about launching a notebook or a console in a separate terminal. While I was very enthusiastic at the beginning, I soon realized that I will stand by Mathematica for the time being.

![emacs-jupyter](/img/2020-04-21-20-04-12.png)
<small>The above screenshot was taken while using an older version of the kernel. I'm now running version 12.1.</small>

In a [previous post](/post/stata-jupyter/) of mine I discussed some alternatives to [ESS](https://ess.r-project.org) to run Stata code. Upon reflection, and a bit of tests and experiments, I have to admit that `emacs-jupyter` comes in handy to work with Stata code interactively: Just edit your `do`-file in a standard Emacs buffer, and `C-c C-c` to evaluate it right away in Jupyter. Also, don't forget to `(setq jupyter-repl-echo-eval-p t)` in order to have the results printed in the Jupyter buffer instead of a blank buffer. Minor caveat: you still need to `graph export` your plot as there's no support for embedded plots (like in, e.g., Racket mode), notwithstanding the fact that `graph2png` is not available in console mode.

Regarding Wolfram, you will need to install the Wolfram kernel, which also means that you will have to install the [Wolfram engine](https://www.wolfram.com/engine/) as well as the `wolframscript` command-line program. The Wolfram engine is free for educational or personal purpose. I somehow forgot about an [older post](https://writings.stephenwolfram.com/2019/05/launching-today-free-wolfram-engine-for-developers/) by Stephen Wolfram who introduced the SDK. It is around 1 Go (much less than the full Mathematica package) and it comes without any GUI, but it includes `wolframscript` as a separate package. When you're done with the installation procedure, you should be able to launch either one from the Applications folder, and they will run in your Terminal application. You will need to register your account by launching `wolframscript` once before activating the Wolfram kernel.

![wolframscript](/img/2020-04-27-08-08-16.png)

Unfortunately, at this point I do not find the Jupyter UI very interesting compared to, say, Stata or Python. While Stata or Python runs fine in an interactive Qt console, results are also correctly rendered under Emacs, pending a minor issue with graphical output. However, nothing like this is available at the time of this writing for Wolfram code. Moreover, here is what I get when using wolframscript, compared to the output of Mathematica:

{{< fluid_imgs
"pure-u-1-2|/img/2020-04-27-11-07-51.png"
"pure-u-1-2|/img/2020-04-27-11-08-01.png" >}}

In fact, this is nothing but Math kernel in action (I use to use Mathematica in a Terminal from time to time). In Emacs, the results are not even displayed, although the connection to the running kernel appears to be working fine. I don't know why. Actually, everything works as expected if you're willing to use a Jupyter notebook (and you're not too fussy about the typographical rendering). So, I suspect the kernel was developed with Jupyter notebook in mind, and not really CLI connections, at least for this initial release.

![jupyter-notebook](/img/2020-04-27-18-48-14.png)
