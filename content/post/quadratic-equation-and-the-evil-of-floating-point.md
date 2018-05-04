---
title: "Quadratic Equation and the Evil of Floating Point"
date: 2018-04-29T17:42:18+02:00
draft: false
description: ""
tags: ["clang", "math"]
categories: []
---

Today I came across an interesting discussion of floating point arithmetic by John D Cook: [The quadratic formula and low-precision arithmetic](https://www.johndcook.com/blog/2018/04/28/quadratic-formula/). The take away message is: "when the linear coefficient b is large relative to the other coefficients, the quadratic formula can give wrong results when implemented in floating point arithmetic."

<!--more-->

It made me think that [floating-point arithmetic](https://dl.acm.org/citation.cfm?id=103163) is hard, really hard, and that we must take care of very fine details, even when working with simple arithmetic expression like quadratic equation. I had to search my (very old) archives of Pascal and C code to find an illustration of the above trap (substracting nearly equal numbers) and how to alleviate it.

The following snippet (full C code, [trinome.c](http://aliquote.org/pub/trinome.c)) computes the two real or complex roots of a second degree polynomial. All variables are declared as `float` and `EPS` is simply defined as `static double EPS = 1E-10`. Note that we only compute one of the two roots and use [Vieta's formulas](https://en.wikipedia.org/wiki/Vieta%27s_formulas) to compute the second real root. Given the quadratic equation $ax^2 + bx + c = 0$, the roots $x_1$ and $x_2$ satisfy the following two relations: $x_1 + x_2 = -\tfrac{b}{a}$ and $ x_1x_2 = \tfrac{c}{a}$. The first root is computed according to the sign of $b$. 

```c
delta = b*b - 4*a*c;
if (delta >= 0) {
  if (b > 0)
    r1 = -(b+sqrt(delta))/(2*a);
  else
    r1 = (-b+sqrt(delta))/(2*a);
  r2 = abs(r1) < EPS ? 0 : c/(a*r1);
  i1 = i2 = 0;
}
else {
  r1 = r2 = -b/(2*a);
  i1 = sqrt(-delta)/(2*a);
  i2 = -i1;
}
```

As a I said, floating-point arithmetic is hard, even when it is [visually explained](http://fabiensanglard.net/floating_point_visually_explained/) ([HN thread](https://news.ycombinator.com/item?id=15359574)).


Other ressources of potential interest:

- [The floating-point guide](http://floating-point-gui.de)
- [Floating-point representation](http://www.toves.org/books/float/)
- [Printing Floating-Point Numbers Quickly and Accurately with Integers](http://florian.loitsch.com/publications/dtoa-pldi2010.pdf) (PDF) --- or why 0.1 + 0.2 prints 0.3 in R (but not in Julia or Python)

{{% music %}}Bill Callahan • *Sometimes I Wish We Were an Eagle*{{% /music %}}
