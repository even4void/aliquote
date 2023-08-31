---
title: "Bayesian power analysis and confidence intervals"
date: 2023-08-30T09:33:34+02:00
draft: false
tags: ["statistics", "bayesian"]
categories: ["2023"]
---

We are often tasked with computing the number of subjects needed to achieve a certain statistical power, especially in biomedical sciences. Various formulae are available online or in dedicated textbooks.[^1] Here is a simple illustration with a two-sample proportion: Let's say we want to compare the efficacy of a new treatment (N) with that of the reference treatment (R) in a clinical trial. The outcome is the percentage of complete remission after one week. We know that this percentage equals 50% with R, and we expect 80% of recovery with N.[^2] To achieve 95% statistical power, how many patients do we need to enroll?

First, let's say we can only enroll 50 patients per group. Then, using standard formulae and considering a 5% type I error, $\Phi = \frac{1.107 - 0.785}{\sqrt{0.25 \times 2/50}} = 3.22$, which means we will end up with 90% power.[^3] Now, to achieve 95% statistical power, $\Phi = 3.61$, hence $n = \frac{2 \times 0.25 \times 3.61^2}{(1.107 - 0.785)^2} = 63$ subjects per group. Dealing with proportions usually involves the arcsin transformation, which can be applied to raw data or directly to estimated proportions. This is discussed in Ryan[^1], pp. 116-117. Here is what I get with Stata 13 for a two-sample proportions likelihood-ratio test: (Note that we get N=63 when using a chi-squared test)

```stata
. power twoproportions 0.5 0.8, test(lrchi2) power(0.95)

Performing iteration ...

Estimated sample sizes for a two-sample proportions test
Likelihood-ratio test
Ho: p2 = p1  versus  Ha: p2 != p1

Study parameters:

        alpha =    0.0500
        power =    0.9500
        delta =    0.3000  (difference)
           p1 =    0.5000
           p2 =    0.8000

Estimated sample sizes:

            N =       130
  N per group =        65
```

The same principle applies to the case of the arithmetic mean and a two-sample Student t-test, of course. Note that in the case of small proportion (here, the difference between $P_N$ and $P_R$, the number of subjects required to achieve a certain power $1-\beta$ will grow up quickly as $\beta$ decreases: to detect a 5% difference in proportion, with $P_R=0.5$, using 1000 subjects per arm will give you only 61% power; for a 2.5% difference with the same number of subjects, don't expect to get more than 20% power.

Bayesian approaches[^4] usually yield smaller sample sizes compared to frequentist approaches, and most of the time no closed-form solutions do exist which means numerical computation must be undergone. I found an interesting review of the pros and cons of those approaches in a recent article of The American Statistician: [A Review of Bayesian Perspectives on Sample Size Derivation for Confirmatory Trials](https://www.tandfonline.com/doi/full/10.1080/00031305.2021.1901782). And here is a blog post that discusses a simulation-based approach for power analysis using posterior distributions: [Sample size determination in the context of Bayesian analysis](https://www.rdatagen.net/post/2021-06-01-bayesian-power-analysis/).

Likewise, computing confidence intervals most of the time relies on the use of a normal approximation in the case of two-sample proportions, and it is covered in most textbooks in the case of two-sample experiments. Basically, we would compute a 95% CI for the difference between two proportions as follows: $(P_N–P_R) \pm \Phi^{-1}(\alpha/2)\sqrt{P_N(1-P_N)/n_N + P_R(1-P_R)/n_R}$, where $\Phi$ is the cumulative distribution function for the standard normal distribution (with mean 0 and variance 1), and $\alpha$ is the predefined type I error rate. Typically, $\alpha=0.05$, and $\Phi^{-1}(0.025)=-1.96$ and $\Phi^{-1}(0.975)=1.96$.

Now, we can take a different approach and rely on credible intervals, as illustrated in Murphy's updated edition of his famous ML textbook,[^5] which I am currently reading. The problem is stated as follows: Let $X\sim\mathcal{N}(\mu, \sigma^2=4)$ where $\mu$ is unknown but has prior $\mu\sim\mathcal{N}(\mu_0,\sigma_0^2=9)$. The posterior after seeing $n$ samples is $\mu_n\sim\mathcal{N}(\mu_n,\sigma_n^2)$. How big does $n$ have to be to ensure $P(l\leq\mu_n\leq u\mid D) \geq 0.95$, where $(l,u)$ is an interval centered on $\mu_n$ of width 1, and $D$ is the data?

Here is the full derivation in the case of a two-sample problem with a continuous outcome. As stated, we want an interval that verifies $P(l\leq \mu_n \leq u\mid D) \geq 0.95$, where as usual:

$$
\begin{equation}
\begin{aligned}
l & = \mu_n + \Phi^{-1}(\alpha/2)\sigma_n = \mu - 1.96\sigma_n \cr
u & = \mu_n + \Phi^{-1}(1-\alpha/2)\sigma_n = \mu + 1.96\sigma_n
\end{aligned}
\end{equation}
$$

We need to find $n$ such that $u - l = 1$, that is $2(1.96)\sigma_n = 1$, or $\sigma_n^2 = \frac{1}{4(1.96)^2}$ with $\sigma_n^2 = \frac{\sigma^2\sigma_0^2}{n\sigma_0^2+\sigma^2}$. Hence we have

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
[^4]: I'm not talking about Bayesian updating whereby we sample size is increased during the course of a study by using the Bayes factor to quantify the degree of support for a hypothesis agaisnt the alternative given the observed data.
[^5]: _Probabilistic Machine Learning: An introduction_. See all available textbooks [here](https://probml.github.io/pml-book/).

{{% music %}}Jean Carn, Adrian Younge & Ali Shaheed Muhammad • _Black Rainbows_{{% /music %}}
