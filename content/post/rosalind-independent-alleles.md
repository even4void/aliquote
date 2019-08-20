---
title: "Independent Alleles and Mendel's second law"
date: 2019-08-20T07:11:17+02:00
draft: false
tags: ["bioinformatics", "python"]
categories: []
---

<!--more-->

One of the [Rosalind](http://rosalind.info/) problems deals with Mendel's second law according to which traits are inherited independently one of each other. Let us assume we have two heterozygous organisms with genotypes Aa and Bb. Such independant assortment implies that the probability of an aa BB offspring is equal to $\Pr(\text{aa})\times\Pr(\text{BB})=\frac{1}{4}\times\frac{1}{4}=\frac{1}{16}$. The value $\frac{1}{4}$ comes from the fact that the probability of any offspring of this subtype is evenly the same for each crossing:

|        |  AB   |  Ab   |  aB   |  ab   |
| ------ | :---: | :---: | :---: | :---: |
| **AB** | AA BB | AA Bb | Aa Bb | Aa Bb |
| **Ab** | AA bB | AA bb | Aa bB | Aa bb |
| **aB** | aA BB | aA Bb | aa BB | aa Bb |
| **ab** | aA bB | aA bb | aa bB | aa bb |

No need to enumerate the cases manually, since Python can handle this [Punnett square](https://en.wikipedia.org/wiki/Punnett_square) quite easily, provided we take care of bypassing the ASCII-based lexicographic order that `sorted()` returns:

```python
from itertools import product
crossing = list(product('Aa', 'Bb', repeat=2))
[''.join(sorted(x, key=lambda x: x.lower()))) for x in crossing]
```

Surprisingly, the correct ratio is less than 65% for this particular problem. Here are my computations using Python:

```python
from scipy.special import binom

def foo(k, N):
    def p(n, k):
        return binom(2**k, n) * 0.25**n * 0.75**(2**k - n)
    return 1 - sum(p(n, k) for n in range(N))

round(foo(7, 35), 3)
```

We first need to compute the probability to observe $n$ Aa Bb offspring after $k$ generations. This involves a succession of Bernoulli trials until we reach the $k$-th generation, hence $\Pr(n, k) = {2^k \choose n} \left(\frac{1}{4}\right)^n \left(1-\frac{1}{4}\right)^{2^k-n}$, which we recognize as the pmf of a random variable that follows a Binomial distribution $\mathcal{B}(n,p)$, with $n=2k$ (there are two children at each step) and $p=\frac{1}{4}$ (see above). Now, we need to find the probability that _at least_ $N$ such organisms will belong to the $k$-th generation, which is $1-\sum_{x=0}^{N-1}\Pr(X=x)$, where $X$ is a random variable denoting the number of offspring, that is one minus all the cases $\Pr(X\neq N)$.
