---
title: "On condition number"
date: 2020-03-26T09:46:55+01:00
draft: true
tags: ["math"]
categories: ["2020"]
---

In statistical computing, we describe a _condition number_ as a quantity that describes the stability of a data set with respect to a function _S_, say a certain moment like the mean or the variance. Nick Higham[^1] discusses condition numbers in two of his [recent](https://nhigham.com/2019/01/23/who-invented-the-matrix-condition-number/) [posts](https://nhigham.com/2020/03/19/what-is-a-condition-number/), mostly in the case of matrix algebra. In this respect, the condition number (with respect to inversion) of a nonsingular square matrix is $\kappa(A)=\|A\| \|A^{-1}\|$. Note that this is also the condition number for a linear system $Ax=b$ (exactly if $A$ is the data).

We already discussed a two-pass algorithm for [computing variance](/post/computing-variance/) without suffering from cancellation errors. As is the case in many numerical algorithms, cancellation of significant digits occurs only arises in substraction (i.e., addition of 2 floating-point numbers with opposite signs), a problem that can hopefully be solved with centering most of the times. This is why it is advised to center the calculation in order to get maximum accuracy when computing statistical moments.

Since condition number applies to any statistic (i.e., a quantity that depends on data), here is what happens with variance.

[^1]: Nicholas J. Higham, _Accuracy and Stability of Numerical Algorithms_ (2nd ed.), Society for Industrial and Applied Mathematics, 2002.
[^2]: Ronald A. Thisted, _Elements of Statistical Computing_, Chapman and Hall, 1988.
