---
title: "Delta method and moments"
date: 2026-11-02T18:29:21+01:00
draft: true
tags: ["statistics"]
categories: ["2026"]
---

The [Delta method][1] is used to find the asymptotic distribution of a non-linear function of a random variable (r.v.) following a normal distribution. In practice, it is a Taylor series expansion around the mean of the r.v.. Let's say we have an estimator $\hat\theta$ which converges toward the true parameter $\theta$ and is asymptotically gaussian, i.e. $\sqrt{n}(\hat\theta - \theta) \to \mathcal{N}(0,\sigma^2)$. Now, we want to know the distribution of $g(\hat\theta)$, where $g$ is a differentiable function. Using linearization, we have $g(\hat\theta)\approx g(\theta)+g'(\theta)(\hat\theta - \theta)$, and it can be shown that:

$$ \sqrt{n}\left(g(\hat\theta)-g(\theta)\right) \to \mathcal{N}\left(0,(g'(\theta))^2\sigma^2\right). $$

It can also be used to compute the moments of a given distribution, as discussed in _Expansions and Asymptotics for Statistics_, by Christopher G. Small (CRC Press, 2010; § 4.3).

As an example, let's consider the Poisson distribution $\mathcal{P}(\lambda)$ for which all cumulants $k_n$ are equal to $\lambda$ for $n\geq 1$.

{{% music %}}Nick Cave & The Bad Seeds • _Knockin' on Joe_{{% /music %}}

[1]: https://fr.wikipedia.org/wiki/Méthode_delta