---
title: "Bayesian analysis with R"
date: 2010-06-27T18:17:38+01:00
draft: false
tags: ["readings", "rstats", "bayesian"]
categories: ["2010"]
---

I am just reading *Data Analysis Using Regression and Multilevel/Hierarchical Models* from Andrew Gelman and Jennifer Hill (Cambridge University Press, 6th printing 2008). The [companion website][companion website] includes all data sets and R code. Another useful reference for R users is *Bayesian Computation with R* in the Springer's UseR series, from J. ALbert.

First of all, I found that graphical displays are overall very nicely drawn on the B&W version of the book. For instance, the two plots below include all information I ever wanted to see from a logistic regression (here, exported at 300 DPI for better viewing).

{{< fluid_imgs
  "pure-u-1-2|/img/20100627100818.png"
  "pure-u-1-2|/img/20100627100829.png" >}}


Chapters 9, 10, and 23 provide important discussions and illustrations regarding causal inference, and are well-suited for biomedical studies (e.g., what variables shall we control for in pre- and post-treatment studies). There are also interesting illustration with IRT in Chapter 14.

A. Gelman makes extensive use of [BUGS] for bayesian computation, but BUGS software doesn't work on Mac OS X. With the newly released version of [JAGS] 2.1.0 (as of May, the 12th), it must, however, be possible to do most of the computation shown in Gelman's book. The corresponding R packages are called [rjags][rjags] and [R2jags][R2jags], the latter being developed by one of Gelman's student, [Yu-Sung Su].

JAGS stands for “Just Another Gibbs Sampler” and is a tool for analysis of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation, but see M. Plummer's main article.[^1] In R2jags, the `rjags()` function ensures the main part of the computation and need a proper BUGS model stored in a text file. In what follows, we will restrict ourselves on the original rjags package.


For the sake of illustration, we will consider the following example from Broemeling's book, *Bayesian Biostatistics and Diagnostic Medicine* (Chapman & Hall/CRC, 2007). It is a meta-analysis on 22 RCTs of beta-blockers to prevent mortality after myocardial infarction, which is available in WinBUGS example data set.[^2] An example of the available data is shown in the following table.

<table border="0">
<tbody>
<tr>
<td><strong>Trial</strong></td>
<td><strong>Treated</strong></td>
<td><strong>Control</strong></td>
</tr>
<tr>
<td>1</td><td>3/38</td><td>3/39</td>
</tr>
<tr>
<td>2</td><td>7/114</td><td>14/116</td>
</tr>
<tr>
<td>3</td><td>5/69</td><td>11/93</td>
</tr>
<tr>
<td>4</td><td>102/1533</td><td>127/1520</td>
</tr>
<tr>
<td>•••</td><td>•••</td><td>•••</td>
</tr>
<tr>
<td>20</td><td>32/209</td><td>40/218</td>
</tr>
<tr>
<td>21</td><td>27/391</td><td>43/364</td>
</tr>
<tr>
<td>22</td><td>22/680</td><td>39/674</td>
</tr>
</tbody>
</table>

The corresponding BUGS model reads as follows:

```
model {
   for (i in 1:Num) {
     rt[i] ~ dbin(pt[i], nt[i]);
     rc[i] ~ dbin(pc[i], nc[i]);
     logit(pc[i]) <- mu[i] 
     logit(pt[i]) <- mu[i] + delta[i];
     delta[i] ~ dnorm(d, tau);
     mu[i] ~ dnorm(0.0, 1.0E-5);
   }
   d ~ dnorm(0.0, 1.0E-6);
   tau ~ dgamma(1.0E-3, 1.0E-3);
   delta.new ~ dnorm(d,tau);
   sigma <- 1/sqrt(tau);
}
```

Here, each trial is modeled with a different probability of success for the control and treated patients, and the binomial probabilities are expressed on the logit scale with a differential, `d[i]`, between the two groups. This difference is assumed to follow a gaussian with parameters `delta` and `tau`, drawn from an $\mathcal{N}(0,10^6)$ and a $\text{Gamma}(0.001,0.001)$, respectively. All $\mu$ and $\delta$ are initialized to 0.

The R code is rather simple:

```r
m <- jags.model("blocker.bug", data, list(inits,inits), 2)
update(m, 3000)
x <- coda.samples(m, c("d","delta.new","sigma"), n.iter=30000, thin=10)
plot(x)
apply(x[[1]], 2, summary)
```

where `blocker.bug` is simply the model in BUGS syntax, `data` is a list with the 22 `rc`, `nc`, `rt`, and `nt` values. In the `inits` list, all is set to 0 except `tau` which is given a value of 1.

This took about 20 sec. to complete on my Mac (Core 2 Duo, 2.8 GHz) and the MCMC results are summarized below (thanks to the `coda` package).

{{< figure src="/img/20100627175212.png" >}}

For the first chain, we get as posterior estimates:

<table border="0">
<tbody>
<tr>
<td><strong>Parameter</strong></td>
<td><strong>Mean</strong></td>
<td><strong>SD</strong></td>
<td><strong>1st Qu.</strong></td>
<td><strong>Median</strong></td>
<td><strong>3rd Qu.</strong></td>
</tr>
<tr>
<td>δ</td><td>-0.2523</td><td>0.1481</td><td>-0.3239</td><td>-0.2564</td><td>-0.1810</td>
</tr>
<tr>
<td>σ</td><td>0.1040</td><td>0.0668</td><td>0.0617</td><td>0.1040</td><td>0.1560</td>
</tr>
</tbody>
</table>

This is close to values reported in Broemeling although they use a different setting with 50,000 draws from the posterior distribution of $\delta$ and $\sigma=1/\tau$.
  
There are other diagnostic plots useful for assessing chains convergence, including `gelman.plot()`, `crosscorr.plot()`. For assessing goodness of fit or comparing two models, the deviance information criterion (DIC) can be calculated with `dic.samples`. But I think I will definitively deserve this to another post.


[^1]: Plummer, M. (2003). JAGS: A program for analysis of Bayesian graphical models using Gibbs sampling.

[^2]: Carlin, B.P. (2003). Blocker: Random affects meta analysis of clinical trials. Help section of Vol. I of WinBUGS version 1.4.

[companion website]: http://www.stat.columbia.edu/~gelman/arm/
[BUGS]: www.mrc-bsu.cam.ac.uk/bugs/
[JAGS]: http://www-fis.iarc.fr/~martyn/software/jags/
[rjags]: http://cran.r-project.org/web/packages/rjags/
[R2jags]: http://cran.r-project.org/web/packages/R2jags/
[Yu-Sung Su]: http://www.stat.columbia.edu/~yusung/

