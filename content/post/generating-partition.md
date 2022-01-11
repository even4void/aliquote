---
title: "Generating partitions"
date: 2022-01-09T10:19:18+01:00
draft: true
tags: ["statistics", "clang"]
categories: ["2022"]
---
In a [previous post](/post/power-set) we showed how to efficiently generate the power set of a given set of elements. Other than its relation to Binomial coefficient as documented on Wikipedia, I don't know if they are of any use on statistics. We also mentioned the case of partitions, which are more interesting from a statistical point of view since they are at the heart of partitioning methods in cluster analysis. How do we generate all partitions? Don Knuth discusses several algorithms to generate integer (algorithm P) or set (algorithm H) partitions,[^1] but see also [The Algorithm Design Manual](https://algorist.com/problems/Generating_Partitions.html) (or this [older course](https://www8.cs.umu.se/kurser/TDBAfl/VT06/algorithms/BOOK/BOOK2/NODE45.HTM) by Steven Skiena).

The main idea of the algorithm to generate set partition is as follows:

The number of partitions, $p(n)$, can be formulated using recursion. Let $p_1(k) = 1$ ($1\le k \le n$), then

$$ p_m(k) = \begin{cases} p_{m-1}(k) & \mbox{if } k > n,\cr p_{m-1}(k) + p_m(k-m) & \mbox{if } k \ge m > 1, \end{cases} $$

and we evaluate $p_m(k)$ for $1 \le m \le n$ and $m \ge k \ge n$. Note that $p(n) = p_n(n)$. Berstel et al. offer an implementation in Pascal to compute $p(n)$ as $\alpha 10^4 + \beta$, whose literal translation in C looks like this:[^2]

```c
void npartitions(int n, int *alpha, int *beta) {
  int nmax = 100;
  int base = 10000;
  int a[nmax];
  int b[nmax];
  int k, m, s;

  for (k = 0; k < n; ++k) {
    a[k] = 0;
    b[k] = 1;
  }

  for (m = 2; m < n; ++m) {
    for (k = m; k < n; ++k) {
      s = b[k] + b[k - m];
      b[k] = s % base;
      div_t q = div(s, base);
      a[k] = a[k] + a[k - m] + q.quot;
    }
  }

  *alpha = a[n];
  *beta = b[n];
}
```

{{% music %}}Leisure • _Take You Higher_{{% /music %}}

[^1]: D. E. Knuth. _The Art of Computer Programming, Vol. 4A: Combinatorial Algorithms_. Addison-Wesley, 2011.
[^2]: J. Berstel, J.-E. Pin, and M. Pocchiola. _Mathématiques et Informatique : Combinatoire et Arithmétique_. Ediscience International, 1991.
