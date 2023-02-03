---
title: "On the sweep operator in regression settings"
date: 2023-01-20T20:32:57+01:00
draft: true
tags: ["statistics"]
categories: ["2023"]
---

Regression involves many linear algebra tricks. We already discussed the case of influence measure which can be computed most of the time in one pass, even in the case of ML.[^1] Beside model diagnostics, several other algebraic properties are in use when dealing with the normal equations. Recall that parameters of a linear regression model can be found using iterative solution (e.g., gradient descent) or the following algebraic equation: $\hat\theta =(X^TX)^{-1}X^Ty$, where $\theta$ is the parameter of interest (a vector of regression coefficients), $X$ the design matrix and $y$ the response variable. This requires inverting a matrix but there are ways to alleviate its cost as we've seen in a [previous post](/post/lisp-qr-regression/) on matrix decomposition.

Under the OLS framework, two elimination methods gained popularity long ago. Since we are dealing with a system of linear equations, Doolittle method, which is based on Gaussian elimination, is one option, the other being the Gauss-Jordan (full) elimination. The latter leads to the sweep operator.[^2] Rick Wicklin wrote [two](https://blogs.sas.com/content/iml/2018/04/18/sweep-operator-sas.html) nice [blog](https://blogs.sas.com/content/iml/2021/08/11/sweep-operator-ls-regression.html) posts on this topic. Basically, the sweep operator allows to "sweep in" or "sweep out" rows of the $X^TX$ matrix, and you can even "sweep in" columns in any order, which amounts to add effects to a model.

{{% music %}}Poppy • _Flux_{{% /music %}}

[^1]: W.J. Shih and S. Weisberg. [Assessing Influence in Multiple Linear Regression With Incomplete Data](/pub/v2803231.pdf). Technometrics, 28(3): 231-239, 1986.
[^2]: John F. Monahan. _Numerical Methods in Statistics_. Cambridge University Press (2011).
