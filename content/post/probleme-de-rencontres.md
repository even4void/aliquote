---
title: "Un problème de rencontres"
date: 2022-01-14T20:17:44+01:00
draft: true
tags: ["math"]
categories: ["2022"]
---

Asking for the number of permutations of $n$ distinct elements such that element $k$ is not in the $k$th position, $k=1, \dots, n$, is just the "problème des rencontres".[^1] As stated on Wikipedia, it amounts to determine the probability that a random permutation is a [derangement](https://en.wikipedia.org/wiki/Derangement).[^2]

The total number of objects to be considered is $N=n!$, by definition. All those $a_n$ permutations are distinguished by the fact that element $a_k$ is in the $k$th position. The problem is symmetric because the selection of a set of size $j$ determines a number independent of the particular set that is being selected. For instance, if $b_1, b_2, \dots, b_j$ is such a subset, then $N(b_1b_2\dots b_j) = (n-j)!$. From there, the relative sum $S_j$ over such a subset turns out to be:

$$ S_j = \frac{{n \choose j}(n-j)!}{n!} = \frac{1}{j!}. $$

[^1]: Riordan, John. _Introduction to Combinatorial Analysis_. Dover Publications Inc., 2002.
[^2]: An $\mathcal{O}(N)$ algorithm to find a particular derangement of a sequence of $n$ items consists in dividing the original sequence in pairs of items and then swap each item from each pair; if $n$ is odd the last pair must be swapped twice, which means there are at most $n/2+1$ swaps. It does not help generating a random derangement, but it finds the derangement with the least perturbation in lexicographic order.
