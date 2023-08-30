---
title: "Gaussian credible intervals"
date: 2023-08-30T09:33:34+02:00
draft: true
tags: ["statistics"]
categories: ["2023"]
---

We are often tasked with computing the number of subjects needed to achieve a certain statistical power, especially in biomedical sciences. Various formulae are available online or in dedicated textbooks.[^1] Here is a simple illustration with a two-sample proportion: Let's say we want to compare the efficacy of a new treatment (N) with that of the reference treatment (R) in a clinical trial. The outcome is the percentage of complete remission after one week. We know that this percentage equals 50% with R, and we expect 80% of recovery with N.[^2] To achieve 95% statistical power, how many patients do we need to enroll?

First, let's say we can only enroll 50 patients per group. Then, considering a 5% type I error, $\Phi = \frac{1.107 - 0.785}{\sqrt{0.25 \times 2/50}} = 3.22$, which means we will end up with 90% power.[^3] Now, to achieve 95% statistical power, $\Phi = 3.61$, hence $n = \frac{2 \times 0.25 \times 3.61^2}{(1.107 - 0.785)^2} = 63$ subjects per group.

The same principle applies to the case of the arithmetic mean and a two-sample Student t-test, of course. Note that in the case of small proportion (here, the difference between $P_N$ and $P_R$, the number of subjects required to achieve a certain power $1-\beta$ will grow up quickly as $\beta$ decreases, as shown in the following picture where the statistical power is shown on y-axis and the sample size on the x-axis.

![img](/img/2023-08-30-10-26-57.png)

Now, we can take a different approach and rely on credible intervals, as illustrated in Murphy's updated edition of his famous ML textbook,[^4] which I am currently reading. Here is the full derivation in the case of a two-sample problem with a continuous outcome.

We want an interval that verifies $P(l\leq \mu_n \leq u\mid D) > 0.95$, where as usual:

$$
\begin{equation}
\begin{aligned}
l & = \mu_n + \Phi^{-1}(\alpha/2)\sigma_n = \mu - 1.96\sigma_n \cr
u & = \mu_n + \Phi^{-1}(1-\alpha/2)\sigma_n = \mu + 1.96\sigma_n
\end{aligned}
\end{equation}
$$

where $\Phi$ is the cumulative distribution function for the standard normal distribution (with mean 0 and variance 1), and $\alpha$ is the predefined type I error rate. Typically, $\alpha=0.05$, and $\Phi^{-1}(0.025)=-1.96$ and $\Phi^{-1}(0.975)=1.96$. We need to find $n$ such that $u - l = 1$, that is $2(1.96)\sigma_n = 1$, or $\sigma_n^2 = \frac{1}{4(1.96)^2}$ with $\sigma_n^2 = \frac{\sigma^2\sigma_0^2}{n\sigma_0^2+\sigma^2}$. Hence we have

$$
\begin{equation}
\begin{aligned}
n\sigma_0^2 + \sigma^2 & = (\sigma^2\sigma_0^2)4(1.96)^2 \cr
n & = \frac{\sigma^2(\sigma_0^24(1.96)^2-1}{\sigma_0^2} \cr
& = \frac{4(9\times (1.96)^2-1}{9} = 61.0212
\end{aligned}
\end{equation}
$$

We would need at least $n\geq 62$ subjects per group.

[^1]: Thomas P. Ryan. _Sample Size and Determination and Power_. Wiley, 2013.
[^2]: Bouvenot & Vray. _Essais Cliniques. Théorie, Pratique et Critique_ (4ème éd.). Lavoisier, 2006 (p. 248).
[^3]: An other interesting question would be to ask what is the minimal expected recovery percentage we would get with 50 patients per group at 80% power. The derivation is as follows: $\Pi_N - \Pi_R = 2.80\sqrt{(2 \times 0.25)/50} = 0.28$, so that $\Pi_N = \Pi_R + 0.28 = 0.785 + 0.28 = 1.065$. In other words, $P_N = 76\%$.
[^4]: _Probabilistic Machine Learning: An introduction_. See all available textbooks [here](https://probml.github.io/pml-book/).

{{% music %}}Jean Carn, Adrian Younge & Ali Shaheed Muhammad • _Black Rainbows_{{% /music %}}
