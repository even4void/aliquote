---
title: "Poisson approximation in practice"
date: 2020-02-03T19:56:12+01:00
draft: false
tags: ["statistics"]
categories: ["2020"]
---

We know from basic statistics textbook that the distribution of a Binomial random variate (with probbaility of success $p$) can be approximated using a Poisson distribution (of parameter $\lambda = np$), provided certain conditions are met (usually, small $p$ and large $n$).[^1] An easy to remember application is that the sequence of $\text{Bin}(n,\frac{1}{n})$ distributions converges in law to the Poisson distribution with mean 1. We can see $\text{Bin}(n,\frac{1}{n})$ either as the sum of $n$ independent Bernoulli trials with small probability of success, dependent on $n$, or as the count of the total number of occurrences among $n$ independent rare events. It turns out that the later has many useful applications.

Here are two illustrations, taken from DasGupta.[^2] In the _matching problem_, cards are drawn one at a time from a well-shuffled deck containing $N$ cards, and a match occurs if the card bearing the number $j$ is drawn at precisely the $j$-th draw from the deck. Let $S_N$ be the total number of matches. We will need a little theorem, which happens to be useful when we want to prove that a Poisson limit is still applicable for the sum of dependent Bernoulli trials

**Theorem:** For $N\ge 1$, let $X_i=1,2,\dots,n$, $n=n(N)$ be a triangular array of Bernoulli random variables, and let $A_i$ denotes the event for which $X_i=1$. For a given $k$, let $M_k$ be the $k$-th binomial moment of $S_n$; i.e., $M_k=\sum_{j=k}^n{j\choose k}P(S_n=j)$. If there exists $0<\lambda<\infty$ such that, for every fixed $k$, $M_k\rightarrow \frac{\lambda^k}{k!}$ as $N\rightarrow\infty$, then $S_n \rightarrow_{\mathcal{L}}\text{Poi}(\lambda)$.

In the matching problem, the binomial moment $M_k$ can be shown to be $M_k = {N\choose k}\frac{1}{N(N-1)\dots (N-k+1)}$. Using [Stirling's approximation](https://en.wikipedia.org/wiki/Stirling's_approximation), for every fixed $k$, $M_k\rightarrow\frac{1}{k!}$; in other words, the total number of matches converges to a Poisson distribution with mean 1 as the deck size $N\rightarrow\infty$. Convergence is very fast. See also [More about the matching problem](https://probabilityandstats.wordpress.com/2010/05/02/more-about-the-matching-problem/).[^3]

In the _birthday problem_, we are interested in the probability that two randomly chosen persons were born the same day. More formally, suppose each person in a group of $n$ people
has, mutually independently, a probability $\frac{1}{N}$ of being born on any given day of a year with $N$ calendar days. Let $S_n$ be the total number of pairs of people $(i, j)$ such that they have the same birthday. Then $P(S_n > 0)$ is the probability that there is at least one pair of people in the group who share the same birthday. It turns out that if $n$ and $N$ can be expressed as $n^2=N\lambda+\mathcal{o}(N)$, for some $0<\lambda <\infty$, then $S_n\rightarrow_\mathcal{L}\text{Poi}(\lambda)$. If $N=365$, $n=30$, then $S_n\approx\text{Poi}(1.233)$.

[^1]: LeCam's theorem on total variation is also useful. It states, in part, that $d_\text{TV}\left(\text{Bin}(n,\lambda/n),\text{Poi}(\lambda)\right)\le 8\lambda/n$. Further discussion can be found on [maths.SE](https://math.stackexchange.com/a/803352).
[^2]: DasGupta, A. _Asymptotic theory of statistics and probability_. Springer, 2008.
[^3]: Interestingly, it is possible to derive a recurrence relation for the PDF of $S_n$: (proof [here](http://www.randomservices.org/random/urn/Matching.html))
$$
\begin{array}{rcl}
\Pr(S_1 = 1) &=& 1\cr
\Pr(S_n = k) &=& (k+1)\Pr(S_{n+1} = k+1)\quad \text{for}\\: k \in \\{0,1,\dots,n\\}
\end{array}
$$
This allows to obtain the probability density function of $S_n$ recursively for any $n$.