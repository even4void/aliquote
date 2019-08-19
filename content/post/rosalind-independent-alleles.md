---
title: "Independent Alleles and Mendel's second law"
date: 2019-08-19T11:11:17+02:00
draft: true
tags: ["bioinformatics", "python"]
categories: []
---

<!--more-->

One of the [Rosalind](http://rosalind.info/) problems deals with Mendel's second law accoridng to which traits are inherited independently one of each other. Let us assume we have two heterozygous organisms with genotypes Aa and Bb. Such independant assortment implies that the probability of an aa BB offspring is equal to $\Pr(\text{aa})\times\Pr(\text{BB})=\frac{1}{4}\times\frac{1}{4}=\frac{1}{16}$. The value $\frac{1}{4}$ comes from the fact that the probability of any offspring

Surprisingly, the correct ratio is less than 65% for this particular problem. Here are my computations using Python:

```python
from scipy.special import binom

def ia_prob(k, N):
    def P(n, k):
        return binom(2**k, n) * 0.25**n * 0.75**(2**k - n)
    return 1 - sum(P(n, k) for n in range(N))

round(ia_prob(7, 35), 3)
```

We first need to compute the probability to observe $n$ Aa Bb offspring after $k$ generations. This involves a succession of Bernoulli trials until we reach the $k$-th generation, hence $\Pr(n, k) = {2^k \choose n} \left(\frac{1}{4}\right)^n \left(1-\frac{1}{4}\right)^{2^k-n}$. Now, we need to find the probability that _at least_ $N$ such organisms will belong to the $k$-th generation, which means we are interested in $1-\sum_{x=0}^{N-1}\Pr(X=x)=1-\Pr(X=0)-\Pr(X=1)-\dots-\Pr(X=N-1)$, where $X$ is a random variable denoting the number of Aa Bb offspring.
