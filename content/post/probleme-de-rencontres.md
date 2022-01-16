---
title: "Un problème de rencontres"
date: 2022-01-14T20:17:44+01:00
draft: false
tags: ["math"]
categories: ["2022"]
---

Asking for the number of permutations of $n$ distinct elements such that element $k$ is not in the $k$th position, $k=1, \dots, n$, is just the "problème des rencontres".[^1] As stated on Wikipedia, it amounts to determine the probability that a random permutation is a [derangement](https://en.wikipedia.org/wiki/Derangement).[^2]

The total number of objects to be considered is $N=n!$, by definition. All those $a_n$ permutations are distinguished by the fact that element $a_k$ is in the $k$th position. The problem is symmetric because the selection of a set of size $j$ determines a number independent of the particular set that is being selected. For instance, if $b_1, b_2, \dots, b_j$ is such a subset, then $N(b_1b_2\dots b_j) = (n-j)!$. From there, the relative sum $S_j$ over such a subset turns out to be:

$$ S_j = \frac{{n \choose j}(n-j)!}{n!} = \frac{1}{j!}. $$

Riordan relies on symbolic development (pp. 52-53) to show that:

$$
\begin{align}
p_n(0) &= 1 - S_1 + S_2 - S_3 + \dots + (-1)^nS_n\cr
       &= 1 - 1 + \frac{1}{2!} - \frac{1}{3!} + \dots + \frac{(-1)^n}{n!}
\end{align}
$$

and also that:

$$
\begin{align}
p_n(k) &= S_k - (k+1)S_{k+1} + {k+2 \choose 2}S_{k+2} - \dots + (-1)^{n-k}{n \choose k}S_n\cr
       &= \frac{1 - 1 + \frac{1}{2!} - \dots + \frac{(-1)^{n-k}}{(n-k)!}}{k!} \cr
       &= \frac{p_{n-k}(0)}{k!}
\end{align}
$$

The above indicates that all probabilities are determined by $p_n(0)$ which is the truncated exponential series $e^{-1}$,[^3] whose mean is $S_1=1$. For large $n$, the distribution is approximated by a Poisson distribution with mean 1 since $p_n(k) \approx e^{-1}/k!$.

[^1]: Riordan, John. _Introduction to Combinatorial Analysis_. Dover Publications Inc., 2002.
[^2]: An $\mathcal{O}(N)$ algorithm to find a particular derangement of a sequence of $n$ items consists in dividing the original sequence in pairs of items and then swap each item from each pair; if $n$ is odd the last pair must be swapped twice, which means there are at most $n/2+1$ swaps. It does not help generating a random derangement, but it finds the derangement with the least perturbation in lexicographic order.
[^3]: Recall that well-known Taylor and Maclaurin series includes $e^x = 1 + x + \frac{x^2}{2!} + \frac{x^3}{3!} + \dots + \frac{x^n}{n!} = \sum_{n=0}^\infty \frac{x^n}{n!}$ for all $x$. A truncated series is just an approximation of an infinite series using some maximum for the series. For instance, in the case of a geometric series, $1 + t + t^2 + t^3 + \dots = \sum_{n=0}^\infty t^n$, we know that when $\|t\|<1$, the solution converges to $\frac{1}{1-t}$. Instead of this, we could consider $\sum_{n=0}^N t^n$, which can be evaluated numerically.
