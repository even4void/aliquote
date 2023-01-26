---
title: "Hash collision"
date: 2023-01-26T09:17:27+01:00
draft: false
tags: ["math"]
categories: ["2023"]
---

It is usually assumed that the probability of getting the same hash value for two different input items is approximately $\frac{k^2}{2N}$, for $k$ random hash keys ($0 < k < N$) taking up to $N$ possible values.

In essence, it is a lot like the [birthday paradox](/post/paradoxe-anniversaires/) that we discussed earlier. Let us start to enumerate the case where hash keys are all unique. With $N$ possible values, after we pick the first key, there are $N-1$ remaining keys out of $N$, hence the probability $\frac{N-1}{N}$ of randomly generating two distinct integers. Then, $N-2$ keys remains, and so forth, so that in the end the probability of randomly generating $k$ integers that are all unique is $\frac{N-1}{N} \times \frac{N-2}{N} \times \cdots \times \frac{N-(k-1)}{N}$. Using Taylor expansion, this last expression can be approximated by $e^{\frac{-k(k-1)}{2N}}$, which is what we ended up considering in the Birthday's paradox as well. The probability of a hash collision is therefore

$$1 - e^{\frac{-k(k-1)}{2N}}.$$

However, it can further be shown that for $x$ small, $1-e^{-x} \approx x$, which means that the probability expressed above can also be approximated with $\frac{k(k-1)}{2N}$. No more floating points! FInally, if $k$ is large, then $k(k-1) \approx k^2$, and we find our $\frac{k^2}{2N}$ expression from the beginning.

You may also like [How do you find quantiles in this balls-in-bins problem?](https://stats.stackexchange.com/a/524418/930).

{{% music %}}Toggi Jonsson Quarted • _Von_{{% /music %}}
