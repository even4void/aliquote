---
title: "Gradient descent in Haskell"
date: 2025-08-21T08:57:31+02:00
draft: true
tags: ["haskell", "statistics"]
categories: ["2025"]
---

I was reading a paper on stochastic gradient descent, and then I was reminded of Atabey Kaygun's implementation of SGD in [Common Lisp](https://kaygun.tumblr.com/post/55714055393/a-gradient-descent-implementation-in-lisp) or [Clojure](https://kaygun.tumblr.com/post/161636640449/a-stochastic-gradient-descent-implementation-in). As it is implemented in CL, I believe it is steepest descent rather than ordinary gradient descent, where we update $x_{n+1}$ as $x_n - \varepsilon_n\nabla f(x_n)$, $x_O\in\mathbb{R}^n$. Note that steepest gradient reflects the deterministic counterpart of stochastic gradient descent. If you don't know what the gradient of a function is, it suffices to say it is the vector of its partial derivatives at a given point, e.g. $\nabla f(x,y) = \left[\frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}\right]$,[^1] which points toward the direction of maximumal increase at that point. This means that if we keep moving in the direction of the negative gradient, we will eventually reach a local minimum.

Before implementing the gradient descent algorithm, let's start with something alike and simpler: Newton's method to find the square root of a number. We already covered the [Newton algorithm in Racket](/post/newton-raphson-racket) in the past. To solve $x^2 = a$, the idea is roughly to start with some guess $x_1 > 0$, and improves this initial guess with $x_{n+1} = \frac{1}{2}\left(x_n + \frac{a}{x_n}\right)$. We'll be using the `Data.List` package for the `find` function, which returns the first element in the list matching a predicate. Here is the whole idea in a nutshell:

```haskell
import Data.List (find)

sqrt' :: Double -> Double -> Maybe Double
sqrt' x start = find precision $ iterate newton start
    where
          precision guess = abs (guess^2 - x) < 0.001 * x
          newton guess = (guess + x / guess) / 2
```

You can load the above in `ghci` and just ask for `sqrt 9 4`. We can get ride of the `Just` by importing `Data.Maybe (fromJust)` and chaining `fromJust $` with `find`, but the above snippet already does the job.

More inforamtion can be found at the following links:

- [What is the difference between Gradient Descent and Newton's Gradient Descent?](https://stackoverflow.com/a/12066869)
- [Why is Newton's method not widely used in machine learning?](https://stats.stackexchange.com/questions/253632/why-is-newtons-method-not-widely-used-in-machine-learning)
- [Newton's Method vs Gradient Descent?](https://math.stackexchange.com/questions/3453005/newtons-method-vs-gradient-descent)

Regarding Haskell specifically, there's already a stochastic gradient descent [library](https://hackage.haskell.org/package/sgd) on Hackage. And there's also a [monadic application](https://andrew.gibiansky.com/blog/machine-learning/gradient-descent/) on Andrew Gibiansky's weblog.

{{% music %}}Lauren Hoffman & The Secret Storm • _Feel It All_{{% /music %}}

[^1]: Extending this idea to a multiple valued function, $v, w = f(x, y)$, we would get the gradient for both $v$ and $w$, which together makes for a $4\times 4$ matrix which is called the Jacobian, and is a measure of [how the space is warped at that location](https://blog.demofox.org/2025/08/16/derivatives-gradients-jacobians-and-hessians-oh-my/).
