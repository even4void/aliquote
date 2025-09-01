---
title: "Coin tossing experiment: Score and Wald tests"
date: 2019-09-13T17:33:21+02:00
draft: false
tags: ["statistics"]
categories: ["2019"]
---

I was recently re-reading Polanski & Kimmel's nice book, _Bioinformatics_, where the very first chapters are dedicated to mathematical statistics.

I have a French translation lying in one of the [obscure folder](/cours/stats_bioinfo/stats.pdf) of this website. Coin tossing experiments are a fun way to introduce some concepts related to mathematical statistics or hypothesis testing. Here is how the three common test statistics (Wald, Score and Likelihood Ratio) relate one to the other.

Let us first focus on estimating a parameter of interest, in this case the probability of observing a tail in a serie of independant draws. First, some notation. We will consider a random experiment composed of $n$ independant trials, where $\theta = \Pr(\text{''the result is tail''})$ is the parameter of interest. In other word, we would like to find a good estimator for the probability of observing such a result. We observe

$$
\begin{cases}
Y_i = 1 & \text{if the }i\text{th trial is tail}, \newline
Y_i = 0 & \text{otherwise},
\end{cases}
$$

such that $Y_i\sim\mathcal{B}(1,\theta)$, where $\mathcal{B}$ is a Bernoulli distribution with parameter 1 and $\theta$. We want an estimator $\hat\theta$. Beforehand, we could compute the Fisher information and the MLE $\hat\theta$ of $\theta$. We just need the likelihood function for a single observation, which reads:

$$ \tilde f(y_i;\theta) = \theta^{y_i}(1-\theta)^{1-y_i}. $$

Whence we have

$$ \log \tilde f(y_i;\theta) = y_i\log\theta + (1-y_i)\log(1-\theta), $$

and

$$
\begin{align}
\frac{\partial \log \tilde f(y_i;\theta)}{\partial \theta} & = \frac{y_i}{\theta} - \frac{1-y_i}{1-\theta} \newline
& = \frac{y_i-\theta}{\theta(1-\theta)}
\end{align}
$$

This last expression should sound familiar as it is just the difference between the observed value and the parameter, normalized by its variance (think of usual test statistic like Student's t, except that in this case we are only considering a single observation). Meanwhile, notice that the score vector is centered since $\mathbb{E}(Y_i) = 1\times\theta + 0\times(1-\theta) = \theta$. Hence, the Fisher information is just the variance of the score vector:

$$
\begin{align}
\tilde I(\theta) & = \mathbb{V}\left( \frac{\partial \log \tilde f(y_i;\theta)}{\partial \theta} \right) \newline
& = \mathbb{V}\left( \frac{Y_i-\theta}{\theta(1-\theta)} \right) \newline
& = \frac{1}{\big( \theta(1-\theta) \big)^2}\mathbb{V}(Y_i-\theta) \newline
& = \frac{1}{\theta(1-\theta)},\, \text{since }\mathbb{V}(Y_i) = \theta(1-\theta).
\end{align}
$$

Now let's focus on $\hat\theta$. We need the log likelihood for all observations:

$$ L_n(\theta) = \sum\_{i=1}^n \log \tilde f(y_i;\theta) = \sum\_{i=1}^n y_i\log\theta + (1-y_i)\log(1-\theta). $$

Its first derivative is easily computed as follows:

$$
\begin{align}
\frac{\partial L_n(\theta)}{\partial \theta} & = \sum\_{i=1}^n \frac{\partial}{\partial \theta}\log \tilde f(y_i;\theta) \newline
& = \sum\_{i=1}^n \frac{y_i-\theta}{\theta(1-\theta)} \newline
& = \frac{\left( \sum\_{i=1}^n y_i \right) - n\theta}{\theta(1-\theta)},
\end{align}
$$

and it can be checked that $\frac{\partial L_n(\theta)}{\partial \theta}\big|\_{\hat\theta} = 0$, where $\hat\theta = \sum\_{i=1}^n y_i/n$ --- the empirical frequency of tails. Now, let $H_0$ be the null hypothesis according to which $\theta = \frac{1}{2}$. It is then possible to compute three different test statistics. Notice that this hypothesis can be rewritten as $H_0:\, \theta-\frac{1}{2}=0$, and let's consider the real-valued function $g(\theta) = \theta-\frac{1}{2}$.

A _Wald test_ can be constructed as $\xi^W = n(\hat\theta - \frac{1}{2})\tilde I^{-1}(\hat\theta - \frac{1}{2})$, whence upon simplication we have

$$ \xi^W = \left( \frac{\hat\theta - \frac{1}{2}}{\sqrt{\frac{\hat\theta(1-\hat\theta)}{n}}} \right). \qquad (\star)$$

Under $H_0$, $\xi^W \to_l \chi^2(1)$ and the 5% critical region is approximately $W = \big{ \xi^W \geq 4 \big) = \big( \star \geq 2 \big}$.

In the case of the score test, the test statistic reads

$$ \xi^S = \frac{1}{n}\frac{\partial}{\partial \theta'}L_n(\hat\theta^0)\hat I^{-1}(\hat\theta^0)\frac{\partial}{\partial \theta}L_n(\hat\theta^0). $$

In this case, $\theta'$ means that we took the transposed vector. We are also considering $\hat\theta^0=\frac{1}{2}$, as in $H_0$. Whence we have

$$ \frac{\partial}{\partial\theta}L_n = \sum\_{i=1}^n\frac{y_i-\hat\theta^0}{\hat\theta^0(1-\hat\theta^0)}. $$

Our test statistic becomes:

$$
\begin{align}
\xi^S & = \frac{1}{n}\left( \frac{\left( \sum_i y_i \right) - n\hat\theta^0}{\hat\theta^0(1-\hat\theta^0)}\right)^2 \hat\theta^0(1-\hat\theta^0) \newline
& = n\frac{\left( \sum_i - \hat\theta^0 \right)^2}{\hat\theta^0(1-\hat\theta^0)} \newline
& = \left( \frac{\hat\theta - \frac{1}{2}}{\sqrt{\frac{\frac{1}{2}\left(1-\frac{1}{2}\right)}{n}}} \right)^2
\end{align}
$$

Under $H_0$, we also have $\xi^S \to_l \chi^2(1)$. However, while in the case of the Wald test we evaluated the test statistic under the general model, in the case of the score test we work directly under the null model for estimating $\hat\theta$.

Finally, the likelihood ratio test is probably simpler to formulate since we only need the log likelihood at $\hat\theta$ and $\hat\theta^0$, and we have $\xi^R = 2\left(L_n(\hat\theta)-L_n(\hat\theta^0)\right)$. Thus we have:

$$
\begin{align}
\xi^R & = 2\left[ \sum_i (y_i)\log\hat\theta + \left(n-\sum_i y_i \right)\log(1-\hat\theta) \right.\newline
& \phantom{\qquad} \left. - \left( \sum_i y_i \right)\log\frac{1}{2} + \left( n-\sum_i y_i \right)\log\left(1-\frac{1}{2}\right) \right] \newline
& = 2 \left[ \left( \sum_i y_i \right)\log\left( \frac{\hat\theta}{\frac{1}{2}} \right) +  \left( n-\sum_i y_i \right)\log\left( \frac{1-\hat\theta}{1-\frac{1}{2}} \right) \right]
\end{align}
$$

Again, we have the same asymptotic chi-squared convergence property.
