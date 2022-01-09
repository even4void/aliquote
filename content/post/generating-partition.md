---
title: "Generating partitions"
date: 2022-01-09T10:19:18+01:00
draft: true
tags: ["statistics", "clang"]
categories: ["2022"]
---
In a [previous post](/post/power-set) we showed how to efficiently generate the power set of a given set of elements. Other than its relation to Binomial coefficient as documented on Wkikipedia, I don't know if they are of any use on statistics. We also discussed the case of partitions, which are more interesting from a statistical point of view since they are at the heart of partioning methods in cluster analysis. How do we generate all partitions?

The number of partition, $p(n)$, can be formulated using recursion. Let $p_1(k) = 1$ ($1\le k \le n$), then

$$ p_m(k) = \begin{cases} p_{m-1}(k) & \mbox{if } k > n,\cr p_{m-1}(k) + p_m(k-m) & \mbox{if } k \ge m > 1, \end{cases} $$

and we evaluate $p_m(k)$ for $1 \le m \le n$ and $m \ge k \ge n$. Note that $p(n) = p_n(n)$. Here is a quick implementation in C:

```c
void npartitions(int n, int *alpha, int *beta) {
  int nmax = 100;
  int base = 10000;
  int a[nmax];
  int b[nmax];
  int k, m, n;

  for (k = 0; k < n; ++k) {
    a[k] = 0;
    b[k] = 1;
  }

  for (m = 2; m < n; ++m) {
    for (k = m; k < n, ++k) {
      s = b[k] + b[k-m];
      b[k] = n % base;
      a[k] = a[k] + a[k-m] + s % base;
    }
  }

  *alpha = a[n];
  *beta = b[n];
}
```
