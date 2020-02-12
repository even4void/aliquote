---
title: "February in review"
date: 2020-02-12T14:46:04+01:00
draft: false
tags: ["readings"]
categories: ["2020"]
---

Here are some of the interesting links I found while browsing the interweb lately.

- [Chloé-Agathe Azencott](http://cazencott.info) released the second edition of her textbook on Machine Learning (in French): [Introduction au Machine Learning](http://cazencott.info/dotclear/public/lectures/IntroML_Azencott.pdf) (PDF, 180 pp.). I went through the book quickly, but I plan to come back to it later. With [Philippe Besse](https://www.math.univ-toulouse.fr/~besse/)'s books, I think they are the only books I have read in French on machine learning --- and it's quite relaxing actually.
- [Lessons learned from writing ShellCheck, GitHub’s now most starred Haskell project](https://www.vidarholen.net/contents/blog/?p=859). Interesting blog post on ShellCheck, "a shell script linter, (that) actually started life in 2012 as an IRC bot (of all things!) on #bash@Freenode." This is what I use in Emacs for shell script since [Flycheck](https://www.flycheck.org/en/latest/languages.html) fully supports it. I didn't know ShellCheck was written in Haskell, though. The author notices that Haskell has an undeniably high barrier to entry for the uninitiated, and ShellCheck’s target audience is not Haskell developers; and that the Haskell ecosystem moves and breaks very quickly. New changes would frequently break on older platform versions.
- [JuliaLang: The Ingredients for a Composable Programming Language](https://white.ucc.asn.au/2020/02/09/whycompositionaljulia.html). I reinstalled Julia 1.x recently and I hope to find some time to experiment with it a little at some point. I've played with versions 0.4 and 0.6 some years ago, but the growing list of changes from one version to the next, notwithstanding the incompatibility issues encountered here and there between v 0.6 and 0.7, had caused me to abandon the idea of working with it at a professional level. This blog post discusses why developing a package is better and easier or safer than writing local modules, and how Julia’s combination of duck-typing with multiple dispatch happens to be very powerful.
- Whenever I have to write a quick Haskell script, I use a shebang like this:

  ```shell
  #! /usr/bin/env stack
  -- stack --resolver lts-13.26 script
  ```

  Now I learn that there is [stack script](https://www.wespiser.com/posts/2020-02-02-Command-Line-Haskell.html). Great!

- [Reconciling modern machine learning practice and the bias-variance trade-off](https://arxiv.org/abs/1812.11118), or how increasing model capacity beyond the point of interpolation results in improved performance. Nice read!

  ![](/img/2020-02-12-15-13-23.png)

- Recently, I heard about [loky](https://loky.readthedocs.io/en/stable/) for Python asynchronous processing. In the meantime, I'm still learning how to use the [multiprocessing](https://docs.python.org/3/library/multiprocessing.html) package correctly, but TBH I found [numba](http://numba.pydata.org) @jit decorator so much powerful for simple tasks (e.g., parallelizing simple "for" loops and the like) that I'm quite happy with what I have for now.
- I'm not familiar with state-space models, but I came across the following review thanks to [Gavin Simpson](https://twitter.com/ucfagls/status/1225821518476611584?s=20): [An introduction to state-space modeling of ecological time series](https://arxiv.org/abs/2002.02001).
