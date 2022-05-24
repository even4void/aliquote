---
title: "Computing the inverse CDF of a Gaussian"
date: 2022-05-24T16:08:28+02:00
draft: true
tags: ["statistics", "python", "racket"]
categories: ["2022"]
---

There's no closed-form solution to the inverse CDF for the normal distribution. By glancing at the statistics module from [CPython], I noticed the authors actually rely on the rational approximation described in Wichura's Algorithm AS 241: The Percentage Points of the Normal Distribution.[^1]

The same algorithm is used by the authors of the Racket [math] module, with an additional remark:

> Added asymptotic expansions to increase range when given log probabilities, and a Newton iteration to fix up answers in the tricky spot between -20000 and -744.

Note that test cases are provided int he original article such that you can easily verify that your own implementation provide expected results:

$$
\begin{equation}
\begin{aligned}
z_{0.25} &= -0.6744897501960817,\cr
z_{0.001} &= -3.090232306167814,\cr
z_{10^{-20}} &= -9.262340089798408\cr
\end{aligned}
\end{equation}
$$

Here is what I got from Racket:

```scheme
> (require math/distributions)
> (for ([q (in-list '(0.25 0.001 10.0e-20))])
    (displayln (flnormal-inv-cdf 0.0 1.0 q #f #f)))
-0.6744897501960817
-3.090232306167813
-9.013271153126675
```

Clearly, something is going wrong in the last test case ($z_{10^{-20}}$).

[^1]: Wichura, Michael J. Algorithm AS 241: The Percentage Points of the Normal Distribution. Journal of the Royal Statistical Society. Series C (Applied Statistics), 37(3): 477-484 (1988). [PDF](https://csg.sph.umich.edu/abecasis/gas_power_calculator/algorithm-as-241-the-percentage-points-of-the-normal-distribution.pdf)

{{% music %}}Shawn Mullins • _Lullaby_{{% /music %}}

[cpython]: https://github.com/python/cpython
[math]: https://docs.racket-lang.org/math/
