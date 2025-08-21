---
title: "Gradient descent n Haskell"
date: 2025-08-21T08:57:31+02:00
draft: true
tags: ["haskell", "statistics"]
categories: ["2025"]
---

I was reading a paper on stochastic gradient descent, and then I was reminded of Atabey Kaygun's implementation of SGD in [Common Lisp](https://kaygun.tumblr.com/post/55714055393/a-gradient-descent-implementation-in-lisp) or [Clojure](https://kaygun.tumblr.com/post/161636640449/a-stochastic-gradient-descent-implementation-in). As it is implemented in CL, I believe it is steepest descent rather than ordinary gradient descent, where we update $x_{n+1}$ as $x_n - \varepsilon_n\nabla f(x_n)$, $x_O\in\mathbb{R}^n$. Note that steepest gradient reflects the deterministic counterpart of stochastic gradient descent.

Note that there's already a stochastic gradient descent [library](https://hackage.haskell.org/package/sgd) on Hackage.

{{% music %}}Lauren Hoffman & The Secret Storm • _Feel It All_{{% /music %}}
