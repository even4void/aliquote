---
title: "Expected tosses for consecutive Heads"
date: 2026-11-09T19:59:40+01:00
draft: true
tags: ["statistics"]
categories: ["2026"]
---

I came across the following puzzle, [Expected Tosses for Consecutive Heads: 2
Heads vs 3 Heads Puzzle][1], this morning:

Let's say A keep tossing a fair coin, until he get 2 consecutive heads, define X
to be the number of tosses for this process; B keep tossing another fair coin,
until he get 3 consecutive heads, define Y to be the number of the tosses for
this process.

1. Calculate P{X>Y}
2. What's the expected value of X
3. What's the expected value of Y

Sure we can enumerate all possible states as the author did. However, we know
that $X$ follows a modified Geometrical law: for $n \geq 2$ (we can't get 2
heads with one trial only) $\Pr(N = n) = \frac{F_{n-1}}{2^n}$, where $F_{n-1}$
is the $n - 1$th term of the Fibonacci series. Assuming a fair coin ($p = 1/2$),
the expected number of trials before observing $k = 2$ Heads is given by
$E(k) = \frac{1}{p} + \frac{1}{p^2}$, or $2(2^k - 1) = 2^{k+1} - 2$. For $k = 2$
we would need 6 flips.

The transition matrix for the corresponding 3-state Markov chain, where state 0 = 0 consecutive Head, state 1 = 1 consecutive Head, and State 2 = 2 consecutive Heads (absorbing state), is:

$$
  \begin{pmatrix}
    0.5 & 0.5 & 0   \cr
    0.5 & 0   & 0.5 \cr
    0   & 0   & 1   \cr
  \end{pmatrix}
$$

Let's look at the transient states 0 and 1:

$$
  Q = \begin{pmatrix}
    0.5 & 0.5 & 0   \cr
    0.5 & 0   & 0.5 \cr
    0   & 0   & 1   \cr
  \end{pmatrix}
$$

The fundamental matrix, $N = (I-q)^{-1}$, is derived from:

$$
I - Q = \begin{pmatrix} 1 & 0 \cr 0 & 1 \end{pmatrix} - \begin{pmatrix} 0.5 & 0.5 \cr 0.5 & 0 \end{pmatrix} = \begin{pmatrix} 0.5 & -0.5 \cr -0.5 & 1 \end{pmatrix}
$$

So that $N = \begin{pmatrix} 4 & 2 \cr 2 & 2\end{pmatrix}$. The sum of first row reflects the number of time we will visit state 0 and state 1 before absorbtion.

{{% music %}}Lauren Hoffman • *The Chemical*{{% /music %}}

[1]: https://pratikpoddarcse.blogspot.com/2009/10/lets-say-keep-tossing-fair-coin-until.html
