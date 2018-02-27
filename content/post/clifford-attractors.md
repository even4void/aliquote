+++
title = "Clifford attractors"
description = ""
date = 2018-02-26T16:44:14+01:00
draft = false
tags = ["math", "dataviz"]
categories = []
+++


I came across some nice visualization of Clifford attractors on Antonio Sánchez Chinchón's website, which is dedicated to experiments in R (mostly using ggplot): [Drawing 10 Million Points With ggplot: Clifford Attractors](https://fronkonstin.com/2017/11/07/drawing-10-million-points-with-ggplot-clifford-attractors/). Other graphics can be found on [Paul Bourke's website](http://paulbourke.net/fractals/clifford/). A [Javascript version](https://bl.ocks.org/gunn/87401cb547cc2ee5b5ec) is also available.

[Peter de Jong attractors](http://paulbourke.net/fractals//peterdejong/) are relevant too and can be found on the same website. For a more general discussion, see [Strange Attractors: Creating Patterns in Chaos](http://sprott.physics.wisc.edu/sa.htm), by Julien C. Sprott.

Clifford attractors are defined by the following recurrence equations:

$$
\begin{align}
x_{n+1} & = \sin(a y_n) + c\cos(a x_n) \\
y_{n+1} & = \sin(b x_n) + d\cos(b y_n)
\end{align}
$$

In Mathematica, it is quite easy to define those equations and compute a few values as a function of $n$, or a complete list of $(x,y)$ values for $n$ taking all values in a given range, as illustrated with the following code:

![Mathematica output](/img/math-clifford.png)

Below is the result (note that this graphic only includes 100,000 data points and the aspect ratio was not modified).

![Clifford attractor](/img/clifford.png)

Of course, while digging on Google to find other interesting patterns and the math' behind them, I happened to find a [thread on Stack Exchange](https://mathematica.stackexchange.com/questions/159668/drawing-clifford-attractors-in-mathematica), with clever Mathematica code (be sure toc heck the linked thread too!).

{{% music %}}London Grammar • *Truth is a beautiful thing*{{% /music %}}
