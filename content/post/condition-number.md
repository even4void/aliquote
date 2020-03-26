---
title: "On condition number"
date: 2020-03-26T09:46:55+01:00
draft: false
tags: ["math"]
categories: ["2020"]
---

In statistical computing, we describe a _condition number_ as a quantity that describes the stability of a data set with respect to a function _S_, say a certain moment like the mean or the variance. Nick Higham[^1] discusses condition numbers in two of his [recent](https://nhigham.com/2019/01/23/who-invented-the-matrix-condition-number/) [posts](https://nhigham.com/2020/03/19/what-is-a-condition-number/), mostly in the case of matrix algebra. In this respect, the condition number (with respect to inversion) of a nonsingular square matrix is $\kappa(A)=\|A\| \|A^{-1}\|$. Note that this is also the condition number for a linear system $Ax=b$ (exactly if $A$ is the data).

We already discussed a two-pass algorithm for [computing variance](/post/computing-variance/) without suffering from cancellation errors. As is the case in many numerical algorithms, cancellation of significant digits occurs only arises in substraction (i.e., addition of 2 floating-point numbers with opposite signs), a problem that can hopefully be solved with centering most of the times. This is why it is advised to center the calculation in order to get maximum accuracy when computing statistical moments.

Since condition number applies to any statistic (i.e., a quantity that depends on data), here is what happens with variance. Let $s$ be the sum of squared deviations defined as $s = \sum_{i=1}^n x_i^2 - n\bar x^2$, or equivalently:

$$ \sum_{i=1}^n x_i^2 = s + n\bar x^2. $$

Note that we omitted the sampling correction factor ($\frac{1}{n-1}$) commonly used for the sample variance. When the left-hand side and the second term on the RHS are of equal magnitude, that is when the relative size of $n\bar x^2$ is too large compared to the relative size of $s$, then cancellation of significant digits occurs.[^2] To see why, it is useful to reexpress the above formula in relative terms, by dividing both sides by $s$. This gives:

$$ 1 + \frac{n\bar x^2}{s} = 1 + \text{CV}^{-2}, $$

where $\text{CV}$ is the [coefficient of variation](https://en.wikipedia.org/wiki/Coefficient_of_variation). When $\text{CV}^2 < \beta^{-t}$ ($\beta$ is the radix and $t$ the floating-point precision[^3]) all significant digits will be lost. A very small CV is a good way to pinpoint possible numerical issue when computing the variance. In our [example from last year](/post/computing-variance/), we used $x={1, 2, 3, 4, 5} + 10^{10}$, and CV = 1.581139e-10 in this case.

The coefficient of variation is related to the condition number discussed above, specifically the condition number of the data with respect to the computation of variance. In this case, $\kappa$ bounds the amount by which realtive errors introduced into the data set under consideration are magnified in the variance estimate. If relative errors of size $u$ are introduced into the $x_i$'s, the relative change in $s$ cannot exceed $\kappa u$. If $\kappa$ is large, we say that the corresponding data set is ill-conditioned. In statistical application, $u$ is often larger than $\beta^{-t}$, and it has been shown that:

$$ \kappa = \sqrt{1 + \frac{n\bar x^2}{s}} = \sqrt{1 + \text{CV}^{-2}}. $$

In practice, $\kappa\approx \text{CV}^{-1}$ constitutes a good approximation. If relative errors in the data are on the order of $u  = \beta^{-t}$, then relative errors in $s$ using the two-pass algorithm are bounded by $nu+n^2\kappa^2u^2$. Still, an error bound of $\kappa u \log_2 n$ can be obtained using the "pairwise updating" algorithm proposed by Chan, Golub & LeVeque.[^4]

[^1]: Nicholas J. Higham, _Accuracy and Stability of Numerical Algorithms_ (2nd ed.), Society for Industrial and Applied Mathematics, 2002.
[^2]: Ronald A. Thisted, _Elements of Statistical Computing_, Chapman and Hall, 1988.
[^3]: In the [IEEE 754 standard](https://en.wikipedia.org/wiki/Machine_epsilon), a double precision variable (`double` in C/C++), $\beta=2$ and $t=53$, so that machine precision is 2<sup>-52</sup> ≈ 2.22e-16.
[^4]: Chan, T.F., Golub, G.H. and LeVeque, R.J., Algorithms for computing the sample variance: Analysis and recommendations, _The American Statistician_ 37: 242-247. Described on [Wikipedia](https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance) under the heading "Parallel algorithm".
