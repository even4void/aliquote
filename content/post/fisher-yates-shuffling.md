---
title: "Fisher-Yates shuffling"
date: 2021-04-13T10:14:45+02:00
draft: false
tags: ["scheme", "statistics"]
categories: ["2021"]
---

Yesterday I came across a [nice post](https://danluu.com/sattolo/) on the (Durstenfeld-)Fisher-Yates[^1] and Sattolo's algorithms. Briefly, the Fisher-Yates shuffling algorithm is a robust and efficient technique to generate a random permutation of elements in a list, with uniform probability. The Sattolo's algorithm relies on a similar approach but produces permutation consisting of a single cycle. Donald Knuth coined the former Algorithm P (TAOCP, vol. 2), and later acknowledged the original work of Fisher and Yates. If you want to get an idea of how this works, trust Mike Bostock for providing so much [enlightening visualisation](https://bost.ocks.org/mike/shuffle/).

There's a nice implementation available on Programming Praxis:[^2]

```scheme
(define (shuffle x)
  (do ((v (list->vector x)) (n (length x) (- n 1)))
      ((zero? n) (vector->list v))
    (let* ((r (randint n)) (t (vector-ref v r)))
      (vector-set! v r (vector-ref v (- n 1)))
      (vector-set! v (- n 1) t))))
```

Reservoir sampling[^3] is another efficient technique for generating a random sample of a collection of elements, although in this case the sample is a subset of the whole population, and thus is not a single permutation like before. Usually, the population size is not known in advance and cannot fit in memory, such as when presented with streams of data. It is an elegant algorithm where we store the k elements to sample from a stream of unknown size in a reservoir of size k while we add the i-th element to the reservoir with a probability of k/i by replacing a randomly selected element in the reservoir. See [this post](https://florian.github.io/reservoir-sampling/) for more details.

{{% alert note %}}
<small>[2021-04-13]</small><br>
This post was originally drafted on 2020-09-17. It has been slightly edited and it will eventually get revised in the future. For now, it will stay unfinished.
{{% /alert %}}

[^1]: Durstenfeld, R., Algorithm 235: Random Permutation, *Communications of the ACM*, 7(7), 1964. [PDF](https://dl.acm.org/doi/pdf/10.1145/364520.364540)
[^2]: Crypto folks also provide some advanced [Python implementations](https://github.com/ethereum/research/tree/master/shuffling) (see this [related discussion](https://github.com/ethereum/eth2.0-specs/issues/323)).
[^3]: Vitter, J.S., Random Sampling with a Reservoir, *ACM Transactions on Mathematical Software*, 11(1), 1985. [PDF](https://www.cs.umd.edu/~samir/498/vitter.pdf)
