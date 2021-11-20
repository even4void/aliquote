---
title: "Student's t distribution"
date: 2021-11-18T21:23:27+01:00
draft: true
tags: ["statistics"]
categories: ["2021"]
---

In a previous post, we discussed how p-values are computed in the case of [Student t-test](/post/computing-student-t/) in LispStat, R, Stata and Python. John Monahan has more to say about the Student's t distribution in his book _Numerical Methods in Statistics_,[^1] and how it can be approximated.

Specifically, let's denote $Q(t\mid k) = \Pr(X > t)$, assuming $X$ follows a Student's t distribution with $k$ df. As we noted earlier, the fact that $k$ ($\eta$ in our previous post) is an integer or not plays a role when one looks for an analytical solution. If $k$ is an integer, Abramowitz and Stegun gave the following formula:[^2]

[^1]: John F. Monahan. _Numerical Methods in Statistics_. Cambridge University Press ()
[^2]: Abramowitz and Stegun
