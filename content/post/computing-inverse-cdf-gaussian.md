---
title: "Computing the inverse CDF of a Gaussian"
date: 2022-06-04T16:08:28+02:00
draft: true
tags: ["statistics", "python", "racket"]
categories: ["2022"]
---

There's no closed-form solution to the inverse CDF for the normal distribution, also known as the "quantile" function, that was discussed in a [previous post]. By glancing at the statistics module from [CPython], I noticed the authors actually rely on the rational approximation described in Wichura's Algorithm AS 241: The Percentage Points of the Normal Distribution.[^1]

The same algorithm is used by the authors of the Racket [math] module, with an additional remark:

> Added asymptotic expansions to increase range when given log probabilities, and a Newton iteration to fix up answers in the tricky spot between -20000 and -744.

Note that test cases are provided in the original article such that you can easily verify that your own implementation provides the expected results:

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

The last value does not agree with test values provided in the reference paper, and I got the same results in R using `qnorm(10e-20)`).[^2] When working with very low p-values, or when you suspect that something could get wrong with floating-point arithmetic, it's always wise to double check the result you get. Mathematica, for instance, returns the expected result:

```mathematica
In[10]:= N[InverseCDF[NormalDistribution[], 10^-20], 16]
Out[10]= -9.262340089798408
```

I learned a long time ago that for everything related to statistical distributions, it's always worth double checking with Mathematica.

In the case of R, some strange things may happen, even if the authors took care of the details for you. For instance, there's a `lower.tail` argument to the `p*` and `q*` family functions, which allows to correct for catastrophic cancellation; it even works when distribution are not symmetric (otherwise we could simply use `qnorm(1-p)`).

{{% music %}}Shawn Mullins • _Lullaby_{{% /music %}}

[^1]: Wichura, Michael J. Algorithm AS 241: The Percentage Points of the Normal Distribution. Journal of the Royal Statistical Society. Series C (Applied Statistics), 37(3): 477-484 (1988). [PDF](https://csg.sph.umich.edu/abecasis/gas_power_calculator/algorithm-as-241-the-percentage-points-of-the-normal-distribution.pdf)
[^2]: Same for Stata (`invnormal(10e-20)`), or Python using scipy (`norm.ppf(10e-20)`).

[previous post]: /post/inverse-cdf-random-sampling/
[cpython]: https://github.com/python/cpython
[math]: https://docs.racket-lang.org/math/
