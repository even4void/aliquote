---
title: "Josephus Problem"
date: 2020-01-29T20:27:54+01:00
draft: true
tags: ["math"]
categories: ["2020"]
---

I started rereading _Concrete Mathematics_ recently. Chapter 1 is about recurrence relations and a specific section deals with [Josephus problem](https://en.wikipedia.org/wiki/Josephus_problem). Quoting Wikipedia, the idea amounts to the following:

> People (n) are standing in a circle waiting to be executed. Counting begins at a specified point in the circle and proceeds around the circle in a specified direction. After a specified number of people are skipped (m), the next person is executed. The procedure is repeated with the remaining people, starting with the next person, going in the same direction and skipping the same number of people, until only one person remains, and is freed.

The authors decided to eliminate every _second_ remaining person until only one survives, while in the original formulation of the "game" _n_ = 41 and _m_ = 3. This is followed by a very pedagogical approach to build the recurrence that is of interest, namely:

$$
\begin{array}{rcl}
J(1)      & = & 1\cr
J(2n)     & = & 2J(n)-1,\quad \text{for}\, n \ge 1\cr
J(2n + 1) & = & 2J(n) + 1,\quad \text{for}\, n\ge 1
\end{array}
$$

Note that $J(n)$ is not defined in term of $J(n-1)$, but there's more to see. It can be seen that $J(n)$ is an increasing odd sequence that restarts with $J(n) = 1$ as soon as _n_ is a power of 2. This yields the following theorem:

$$\text{If}\, n=2^m+l\,\text{and}\, 0\le l \le 2^m,\, \text{then}\, J(n) = 2l+1.$$

This yields an explicit expression for $J(n)$, by the way: $J(n) = 2(n-2^{\lfloor\log_2(n)\rfloor})+1$. Using Mathematica, indeed we can confirm that $J(40)=17$ (p. 9, 2nd ed.):

```mathematica
In[1]:= With[{n = 40}, 2 (n - 2^Floor[Log2[n]]) + 1]
Out[1]= 17
```

There is also a nice discussion of radix 2 representations of _n_ and $J(n)$, where it is shown that $J(n)$ is obtained by performing a one-bit cyclic shift left. This is [RotateLeft](https://mathematica.stackexchange.com/a/33598) in Mathematica.

Later, the authors introduce the _repertoire method_, whereby we accumulate special cases with known answers and combine them altogether to obtain the general case. You will need as many special cases as there are independant parameters. Exercise 16 asks us to use this approach to solve the following recurrence relations:

$$
\begin{array}{rcl}
g(1)    & = & \alpha\cr
g(2n+j) & = & 3g(n) + \gamma n + \beta_j, \quad \text{for}\, j=0, 1\, \text{and}\, n\ge 1
\end{array}
$$

https://blog.wakatta.jp/blog/2012/01/14/concrete-mathematics-repertoire-method/
