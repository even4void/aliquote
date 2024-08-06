---
title: "ArXiving on February 2024"
date: 2024-06-27T12:24:09+02:00
draft: false
tags: ["readings", "arxiv"]
categories: ["2024"]
---

Old reads...

### Looking Back at Postgres (https://arxiv.org/abs/1901.01973)

I rarely use Postgres for my personal hobbies (I usually find that SQLite provides me with convenient cost-effectiveness tradeoff for pet projects), but I always appreciated it for long term projects as well as its extensions. This paper is a recollection of the early days of Postgres in the 80s.

> Postgres was Stonebraker’s second system, and it was certainly chock full of features and ideas. Yet the system succeeded in prototyping many of the ideas, while delivering a software infrastructure that carried a number of the ideas to a successful conclusion. This was not an accident—at base, Postgres was designed for extensibility, and that design was sound. With extensibility as an architectural core, it is possible to be creative and stop worrying so much about discipline: you can try many extensions and let the strong succeed.

### Prediction of causal genes at GWAS loci with pleiotropic gene regulatory effects using sets of correlated instrumental variables (https://arxiv.org/abs/2401.06261)

I wrote about [Mendelian randomization](/post/mendelian-randomization) a while ago. This paper is about its multivariate extension in the context of causal inference using instrumental variables in a study of genome-wide significant GWAS loci. When the [instrumental set condition](https://academic.oup.com/biomet/advance-article/doi/10.1093/biomet/asad066/7342182?login=false) is satisfied, direct causal effects of all exposures in the model on the outcome variable of interest can be identified.

{{< figure src="/img/gwas_mendelian_instruments.png" >}}

### Asymptotic Online FWER Control for Dependent Test Statistics (https://arxiv.org/abs/2401.09559)

If you ever applied Bonferroni correction (or any stepwise procedure) for multiple comparison, you know that we assume that tests are independent, and in the case of Bonferonni it may be way too much conservative. This is even more complicated in the case of online testing. An alternative approach is proposed in this article, namely an adaptive version of the alpha-spending algorithm used, e.g., in interim analyses, [^1] where we update the p-values depending on whether they are believed to have arisen under the null hypothesis or the alternative.

A Computationally Efficient Approach to False Discovery Rate Control and Power Maximisation via Randomisation and Mirror Statistic (https://arxiv.org/abs/2401.12697) is yet another paper on FDR rather than FWER control. See also [Gridsemble: Selective Ensembling for False Discovery Rates](https://arxiv.org/abs/2401.12865) for related to estimating local false discovery rates in large-scale multiple hypothesis testing.

### Likelihood-ratio inference on differences in quantiles (https://arxiv.org/pdf/2401.10233)

I barely used quantile regression in my previous life (aka when I was working as a full-time statistician), except in a few cases when dealing with growth curves and newborn data. I came across this paper because I've been a long time follower of Evan Miller's posts. He's actually discussing how to implement a two-sample difference-in-quantile hypothesis test and how to construct confidence intervals based on a likelihood ratio test.

### On the visualisation of the correlation matrix (https://arxiv.org/abs/2401.12730)

I like biplot graphical displays, despite their subtleties regarding how rows and/or columns of a correlation or distance matrix are adjusted. In this paper, the author suugests "a weighted alternating least squares algorithm is used, with either a single scalar ad- justment, or a column-only adjustment with symmetric factorization; these choices form a compromise between the numerical accuracy of the approximation and the comprehensibility of the obtained correlation biplots."

[Are the Signs of Factor Loadings Arbitrary in Confirmatory Factor Analysis? Problems and Solutions](https://arxiv.org/abs/2401.12937) was also mentioned in my daily arxiv digest. As I am slowly forgetting 15 years of previous work in psychometrics, I find it particularly hard to come back from time to time to such papers. Anyway, I'm happy to see that research continues in this field, especially for old questions like those. Finally, I came across this related work on PCA: [Estimating the construct validity of Principal Components Analysis](https://arxiv.org/abs/2401.12905).

### (https://arxiv.org/abs/2401.12911)

A potentially interesting paper I should read.

> In this paper, we ask the question “Can pretraining help the lasso?”. We develop a framework for the lasso in which an overall model is fit to a large set of data, and then fine-tuned to a specific task on a smaller dataset. This latter dataset can be a subset of the original dataset, but does not need to be. We find that this framework has a wide variety of applications, including stratified models, multinomial targets, multi-response models, conditional average treatment estimation and even gradient boosting.<br>
> In the stratified model setting, the pretrained lasso pipeline estimates the coefficients common to all groups at the first stage, and then group-specific coefficients at the second “fine-tuning” stage. We show that under appropriate assumptions, the support recovery rate of the common coefficients is superior to that of the usual lasso trained only on individual groups. This separate identification of common and individual coefficients can also be useful for scientific understanding.

{{% music %}} Keith Jarrett Trio • _Sun Prayer_{{% /music %}}

[^1]: DeMets, D.L. and Lan, K.K. Interim analysis: the alpha spending function approach. _Statistics in Medicine_ 13(13-14): 1341-1352, 1994. See also [Introduction to Conducting Interim Analyses Using Alpha Spending](https://jfiksel.github.io/2021-02-03-alpha_spending_explained/).
