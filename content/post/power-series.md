---
title: "Power Series and Fibonacci"
date: 2019-07-06T09:07:29+02:00
draft: true
tags: ["math", "statistics", "mathematica"]
categories: []
---

Here is a little fact about Fibonacci numbers and their relation to some power series.

<!--more-->

Let us assume a fair coin is tossed independently until two consecutive heads are observed.<sup>[^1]</sup> The number of trials required to observe two heads follows a negative binomial distribution. We have to wait longer to observe the two heads in immediate succession. Consider the sequence $HTTHTHH$ and let $X+2$ be the number of trials required. Then in this case $X=5$. If we note $p_n=\Pr(X=n)$, enumerating the possible outcomes in the first two or three cases yields $p_0=\tfrac{1}{4}$ and $p_1=\tfrac{1}{8}$. A recursion relation can be found constructed for larger values of $n$:

$$ p_n = \frac{1}{2}p_{n-1} + \frac{1}{4}p_{n-2}. $$

Using Mathematica, we can find the probability generating function as follows:

[^1]: Small, C. _Expansions and Asymptotics for Statistics_. Chapman & Hall/CRC, 2010.
