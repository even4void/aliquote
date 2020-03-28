---
title: "Computing √2 by additions alone"
date: 2020-03-28T08:32:49+01:00
draft: true
tags: ["math"]
categories: ["2020"]
---

We've  already seen a well-known algorithm to computing $\sqrt{2}$ to an arbitrary precision using [Newton's method](/post/newton-raphson-racket/) in a previous post (see esp. footnote 1). Here is another approach discussed by Melzak.[^1] Let's start with two positive integers $p_0$ and $q_0$, and the following recurrence relations, for $n = 0, 1, 2, \dots$:

$$
\begin{cases}
p_{n+1} = p_n + 2q_n,\cr
q_{n+1} = p_n + q_n
\end{cases}
$$

so that $p_n/q_n \to 2^{1/2}$. This can be demonstrated by noting that:

$$ p_{n+1}^2 - 2q_{n+1}^2 = -(p_n^2 - 2q_n^2) = \dots = (-1)^{n+1}(p_0^2 - 2q_0^2), $$

which implies that:

$$ \frac{p_{n+1}}{q_{n+1}} - 2^{1/2} = \frac{(-1)^{n+1}(p_0^2 - 2q_0^2)}{q_{n+1}(p_{n+1}+2^{1/2}q_{n+1})}. $$

Therefore, the sequence $p_0/q_0, p_1/q_1, \dots$ converges to $2^{1/2}$, as illustrated using the following Mathematica code:

```mathematica
values = RecurrenceTable[{x[n + 1] == x[n] + 2 y[n],
    y[n + 1] == x[n] + y[n], x[0] == 1, y[0] == 1}, {x, y}, {n, 0,
    20}];
xs = Apply[Divide, values, {1}];
ListPlot[xs, PlotRange -> All]
```

![Recurrence](/img/square-root-two.png)

Compare the above to what would be obtained using the Newton derivative-based approach:

![Newton](/img/2020-03-28-11-33-36.png)

The convergence is so quick that it is hard to see that the serie is alternating. We have

$$ \left| \frac{p_n}{q_n} - 2^{1/2} \right| < \frac{1}{2} \left| \frac{p_n}{q_n} - \frac{p_{n-1}}{q_{n-1}} \right|, $$

Upon observing that the successive approximations $p_n/q_n$ are generated iteratively by means of two additions of integers only, Melzak then asks what other numbers can be similarly computed. To put in other words, let's start with a series of integers $p_{10}, p_{20}, \dots, p_{k0}$, we require $p_{1n+1}, p_{2n+1},\dots, p_{kn+1}$ to be generable from $p_{1n}, p_{2n}, \dots, p_{kn}$ with a fixed number of additions only, i.e.:

$$ p_{in+1} = \sum_{j=1}^k c_{ij}p_{jn}, \qquad i = 1, 2, \dots, k;\quad n = 0, 1, 2, \dots $$

where the $c_{ij}$ are fixed integers. If a real irrational $x$ exists such that $x = \lim_{n\to\infty}p_{1n}/p_{2n}$, we call $x$ "computable by addition alone." It turns out that $x$ is computable by additions alone if and only if it is [algebric](https://en.wikipedia.org/wiki/Algebraic_number).

[^1]: Z.A. Melzak, _Companion to Concrete Mathematics_, John Wiley & Sons, 1973.
