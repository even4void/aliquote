---
title: "Generating partitions"
date: 2022-01-09T10:19:18+01:00
draft: false
tags: ["statistics", "clang"]
categories: ["2022"]
---
In a [previous post](/post/power-set) we showed how to efficiently generate the power set of a given set of elements. Other than its relation to Binomial coefficient as documented on Wikipedia, I don't know if they are of any use on statistics. We also mentioned the case of partitions, which are more interesting from a statistical point of view since they are at the heart of partitioning methods in cluster analysis. How do we generate all partitions? Don Knuth discusses two algorithms to generate integer (algorithm P) or set (algorithm H) partitions,[^1] but see also [The Algorithm Design Manual](https://algorist.com/problems/Generating_Partitions.html) (or this [older course](https://www8.cs.umu.se/kurser/TDBAfl/VT06/algorithms/BOOK/BOOK2/NODE45.HTM) by Steven Skiena).

The main idea of algorithm H to generate set partition is as follows:

1. Set $a_1\dots a_n \leftarrow 0\dots 0, b_1\dots b_{n-1} \leftarrow 1\dots 1, \text{and } m \leftarrow 1$.
2. Visit the restricted growth string $a_1\dots a_n$,[^2] which represents a partition into $m + \[a_n=m\]$ blocks. Then go to (4) if $a_n=m$.
3. Set $a_n \leftarrow a_n + 1$ and return to (2).
4. Set $j \leftarrow n - 1$; then, while $a_j = b_j$, set $j \leftarrow j - 1$.
5. Terminate if $j = 1$. Otherwise set $a_j \leftarrow a_j + 1$.
6. Set $m \leftarrow b_j + \[a_j=b_j\]$ and $j \leftarrow j + 1$. Then, while $j < n$, set $a_j \ leftarrow 0$, $b_j \leftarrow m$, and $j \leftarrow j + 1$. Finally set $a_n \leftarrow 0$ and go back to (2).

An Haskell solution to multiset partitions is available in [Generating Multiset Partitions](https://wiki.haskell.org/wikiupload/d/dd/TMR-Issue8.pdf), by Brent Yorgey.

What about the total number of partitions? The number of partition, $p(n)$, can be formulated using recursion. Let $p_1(k) = 1$ ($1\le k \le n$), then

$$ p_m(k) = \begin{cases} p_{m-1}(k) & \mbox{if } k > n,\cr p_{m-1}(k) + p_m(k-m) & \mbox{if } k \ge m > 1, \end{cases} $$

and we evaluate $p_m(k)$ for $1 \le m \le n$ and $m \ge k \ge n$. Note that $p(n) = p_n(n)$. Berstel et al. offer an implementation in Pascal to compute $p(n)$ as $\alpha 10^4 + \beta$, whose literal translation in C looks like this:[^3] (untested code)

```c
#include <stdlib.h>

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
[^2]: A restricted growth string is a string $a_1a_2\dots a_n$ of nonnegative integers in which we have $a_1=0$ and $a_{j+1} \le 1 + \text{max}(a_1,\dots, a_j)$ for $1 \le j < n$.
[^3]: J. Berstel, J.-E. Pin, and M. Pocchiola. _Mathématiques et Informatique : Combinatoire et Arithmétique_. Ediscience International, 1991.
