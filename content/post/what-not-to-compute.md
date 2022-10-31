---
title: "What not to compute"
date: 2022-10-30T09:14:07+01:00
draft: false
tags: ["math"]
categories: ["2022"]
---

In _Numerical Methods That (Usually) Work_, Forman S. Acton included a short interlude on what not to compute. This section is intended as a way to think carefully about numerical computation with a computer based on analytic solutions and rather think whether good enough approximations can be used.

As an example, consider the expression $\int_0^{0.3} \sin^8\theta\cdot d\theta$. We have

$$
\begin{equation}
\begin{aligned}
\int_0^{0.3} \sin^8\theta\cdot d\theta &= \left[(-\frac{1}{8}\cos\theta)(\sin^4\theta + \frac{7}{6}\sin^2\theta + \frac{35}{24})(\sin^3\theta) + \frac{105}{384}(\theta - \sin 2\theta)\right]_0^{0.3}\cr
&= (-0.119417)(0.007627 + 0.101887 + 1.458333)(0.0258085) + 0.004341\cr
&= -0.0048320 + 0.0048341 = 0.0000021
\end{aligned}
\end{equation}
$$

Note that this formula allows to compute a small number based on the difference between two much larger numbers. However, using a crude approximation for $\sin\theta$, we get

$$ \int_0^{0.3} \theta^8\cdot d\theta = \frac{1}{9}\left[\theta^9\right]_0^{0.3} = 0.00000219. $$

A second term in the series can be added if more precision is required.


{{% music %}}Christian Death • _Spiritual Cramp_{{% /music %}}
