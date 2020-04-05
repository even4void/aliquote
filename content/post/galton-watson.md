---
title: "Galton-Watson process"
date: 2020-04-04T20:31:40+02:00
draft: false
tags: ["math", "bioinformatics"]
categories: ["2020"]
---

We already talked about [Markov models](/post/markov-random-process-using-mathematica/) and [branching process](/post/virus-and-bacteria/). Formally, branching processes allow to model a random genealogical or phylogenetic tree with a common ancestor --- we also say this is a rooted tree. Let's assume it is unique. This tree can be defined in a recursive manner:

- At generation $n=0$, the only ancestor die after a fixed period of time (or life), with a probability $p_k$ ($k\ge 0$) of having $k$ children.
- At the the $n$ th generation, all individuals die after the same amount of time as their ancestors, and each of them has, i.i.d., a probability $p_k$ ($k\ge 0$) of having $k$ children.

The [Galton-Watson process](https://en.wikipedia.org/wiki/Galton–Watson_process) is the random sequence of counts for each generation, $Z_n$ ($n\ge 0$). Its probability law is clearly deduced from the discrete probability $p_k$. Let's further assume that $\sum_{k\ge O} k^2p_k < \infty$. This process can also be expressed as a Markov Chain: Let's denote $p_j^{*i}$ the probability law resulting from the convolution of the probability law of reproduction of the process:

$$ p_j^{*i} = \sum_{k_1+\dots+k_i=j} p_{k_1}\dots p_{k_i}. $$

A Galton-Watson process is a Markov chain on positive integers with transition probability:

$$ Q(i,j) = \mathbb{P}\left( Z_{n+1} = j \mid Z_n = i\right) = \begin{cases} p_j^{*i}\quad \text{if}\\: i\neq 0,\cr \delta_{0j}\quad \text{otherwise}\end{cases}. $$

Little calculus show that the first two moments of $Z_n$ using recurrence are:[^1]

$$
\begin{align}
\mathbb{E}(Z_n) &= m^n,\cr
\mathbb{V}(Z_n) &= \begin{cases} \sigma^2m^{n-1}\frac{m^n-1}{m-1}\quad \text{if}\\: m\ne 1,\cr n\sigma^2\quad\text{otherwise}\end{cases}
\end{align}
$$

It can further be shown that population extinction (i.e., $Z_n=0$) occurs with probability 1 if $\mathbb{E}(Z_n)\le 1$. If, on the other hand, $\mathbb{E}(Z_n) > 1$, then the probability of extinction $q<1$ is the unique solution of $\phi(s)=s$, $s\in [0;1[$, where $\phi(s) = \sum_{k=0}^{+\infty} p_ks^k$, $\forall s\in [0;1]$, is the moment generating function of $Z_n$.

Here is a little application of this process in biology. Polymerase Chain Reaction (PCR) is a technique of in vitro enzymatic amplification which can be used to increase the number of available DNA strands. Denaturation, cooling and extension of DNA strands are the three main steps in each cycle of amplification. When this cycle is correctly achieved, the number of DNA strands is doubled. However, a certain number of failures can be observed.

Suppose there are $N_0$ DNA strands at the start of this process. Each of those $N_0$ strands serves as an ancestor of a Galton-Watson process, where the probability law is given by $p_1=1-p$, $p_2=p$ and $p_k=0$ for $k\ne 1, 2$. Here, $p$ denotes the probability of success of an amplification cycle. The mathematical expectation of reproduction equals $m=1+p$, and the variance is $\sigma^2 = p(1-p)=(m-1)(2-m)$, with $q=0$ (probability of extinction). The expected number of DNA strands after $n$ cycles is thus $N_0m^n$.[^2]

[^1]: Jacques Istas, _Introduction aux modélisations mathématiques pour les sciences du vivant_, Springer, 2000.
[^2]: From a practical point of view, it is often desired to know $N_0$ in advance, although $N_0$ cannot be identified uniquely. Note, however, that it is possible to consistently estimate the mathematical expectation of the reproduction $m$ with th estimator $\hat m_n = \sum_{k=0}^{\infty} k\hat p_{k_n} = \frac{Y_{(n+1)}-1}{Y_n}$, that is $m$ can be estimated from the observed size of each generation. Hence, the following estimator has been proposed: $\hat N_{0n} = \frac{Z_n}{\hat m_n}$. As an illustration, if the success rate of the PCR is 80% (i.e., $p = 0.8$), its variance equals $\frac{1-p}{1+p}=0.11$.
