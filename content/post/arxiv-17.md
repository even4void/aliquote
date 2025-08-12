---
title: "ArXiving on July 2025"
date: 2025-07-23T15:27:46+02:00
draft: false
tags: ["readings", "arxiv"]
categories: ["2025"]
---

### Multiple Hypothesis Testing in Genomics (https://arxiv.org/abs/2506.23428)

> This analysis report presents an in-depth exploration of multiple hypothesis
> testing in the context of Genomics RNA-seq differential expression (DE)
> analysis, with a primary focus on techniques designed to control the false
> discovery rate (FDR). While RNA-seq has become a cornerstone in transcriptomic
> research, accurately detecting expression changes remains challenging due to
> the high-dimensional nature of the data. This report delves into the
> Benjamini-Hochberg (BH) procedure, Benjamini-Yekutieli (BY) approach, and
> Storey's method, emphasizing their importance in addressing multiple testing
> issues and improving the reliability of results in large-scale genomic studies.
> We provide an overview of how these methods can be applied to control FDR while
> maintaining statistical power, and demonstrate their effectiveness through
> simulated data analysis.<br>
> The discussion highlights the significance of using adaptive methods like
> Storey's q-value, particularly in high-dimensional datasets where traditional
> approaches may struggle. Results are presented through typical plots (e.g.,
> Volcano, MA, PCA) and confusion matrices to visualize the impact of these
> techniques on gene discovery. The limitations section also touches on
> confounding factors like gene correlations and batch effects, which are often
> encountered in real-world data.<br>
> Ultimately, the analysis achieves a robust framework for handling multiple
> hypothesis comparisons, offering insights into how these methods can be used to
> interpret complex gene expression data while minimizing errors. The report
> encourages further validation and exploration of these techniques in future
> research.

An overview of different approach to control the false discovery rate in multiple testing: Benjamini-Hochberg (BH), Benjamini-Yekutieli (BY), and Storey's method. The BH method is already available in R's `p.adjust()`. The BY method is just an extension of the BH method that accounts for positive correlations among test statistics, while Storey’s technique estimates the proportion of null hypotheses $\pi_0$ among the tested CDS. Whether you rely on a nominal $\alpha$ level or $q$-value cutoffs, as in proteomics analyses, all those methods work equally well. The author's conclusion is as follows:

- BH is best for balanced performance between false discovery control and power.
- BY is suited for avoiding false positives but sacrifices true positive identification.
- StoreyQ is optimal for maximizing significant discoveries in exploratory genomics research.

Note that although this targets RNA-Seq analysis, where Multiple Hypothesis Testing is one of the many challenges raised by the big data omics era, this should apply to other contexts as well. It is worth noting that the authors included a simulation model for count data, using a Negative Binomial Model, which is what is usually found in pipeline like [DESeq2](https://bioconductor.org/packages/devel/bioc/vignettes/DESeq2/inst/doc/DESeq2.html).

I appreciated that the author provided a sidenote on statistical significance and biological relevance: "It is also crucial to recognize that statistical significance does not always imply biological importance, nor does a lack of significance disprove a biological hypothesis. In highly variable, small-sample contexts, meaningful changes may evade detection, reinforcing the need for well-powered experiments. Similarly, even a modest difference can be flagged as significant in extremely large datasets. These nuances highlight that DE detection should be interpreted within the broader scope of effect sizes, reproducibility, and biological validation."

### Controlling the false discovery rate under a non-parametric graphical (https://arxiv.org/abs/2506.24126)

> We propose sufficient conditions and computationally efficient procedures for
> false discovery rate control in multiple testing when the $p$-values are
> related by a known \emph{dependency graph} -- meaning that we assume
> independence of $p$-values that are not within each other's neighborhoods, but
> otherwise leave the dependence unspecified. Our methods' rejection sets
> coincide with that of the Benjamini--Hochberg (BH) procedure whenever there are
> no edges between BH rejections, and we find in simulations and a genomics data
> example that their power approaches that of the BH procedure when there are few
> such edges, as is commonly the case. Because our methods ignore all hypotheses
> not in the BH rejection set, they are computationally efficient whenever that
> set is small. Our fastest method, the IndBH procedure, typically finishes
> within seconds even in simulations with up to one million hypotheses.

Yet another paper on controlling the false discovery rate. As mentioned above, when there's some correlation between tested markers, modification of the default FDR correction (Benjamini–Hochberg) is in order. The trick the authors used in this work is to take into account a dependecy graph for $p$-values, allowing to assume independence of $p$-values that are not within each other’s neighborhoods, and otherwise leave the dependence unspecified.

### clustra: A multi-platform k-means clustering algorithm for analysis of longitudinal trajectories in large electronic health records data (https://arxiv.org/abs/2507.00962)

> Background and Objective: Variables collected over time, or longitudinally,
> such as biologic measurements in electronic health records data, are not simple
> to summarize with a single time-point, and thus can be more holistically
> conceptualized as trajectories over time. Cluster analysis with longitudinal
> data further allows for clinical representation of groups of subjects with
> similar trajectories and identification of unique characteristics, or
> phenotypes, that can be investigated as risk factors or disease outcomes. Some
> of the challenges in estimating these clustered trajectories lie in the
> handling of observations at inconsistent time intervals and the usability of
> algorithms across programming languages.
> Methods: We propose longitudinal trajectory clustering using a k-means
> algorithm with thin-plate regression splines, implemented across multiple
> platforms, the R package clustra and corresponding \SAS macros. The \SAS macros
> accommodate flexible clustering approaches, and also include visualization of
> the clusters, and silhouette plots for diagnostic evaluation of the appropriate
> cluster number. The R package, designed in parallel, has similar functionality,
> with additional multi-core processing and Rand-index-based diagnostics.
> Results: The package and macros achieve comparable results when applied to an
> example of simulated blood pressure measurements based on real data from
> Veterans Affairs Healthcare recipients who were initiated on anti-hypertensive
> medication.
> Conclusion: The R package clustra and the SAS macros integrate a K-means
> clustering algorithm for longitudinal trajectories that operates with large
> electronic health record data. The implementations provide comparable results
> in both platforms, satisfying the needs of investigators familiar with, or
> constrained by access to, one or the other platform.

It's been years I'm no longer involved in healths analytics and patient-reported outcomes, but this one reminded me of [a post](https://stats.stackexchange.com/a/3363) on Cross Validated about clustering of longitudinal data. Since I'm barely reminescent of those days, I remember [one answer](https://stats.stackexchange.com/a/3673) of mine which took up my entire morning and into which I put a lot of effort and attention.

### Targeted tuning of random forests for quantile estimation and prediction intervals (https://arxiv.org/abs/2507.01430)

> We present a novel tuning procedure for random forests (RFs) that improves
> the accuracy of estimated quantiles and produces valid, relatively narrow
> prediction intervals. While RFs are typically used to estimate mean responses
> (conditional on covariates), they can also be used to estimate quantiles by
> estimating the full distribution of the response. However, standard approaches
> for building RFs often result in excessively biased quantile estimates. To
> reduce this bias, our proposed tuning procedure minimizes "quantile coverage
> loss" (QCL), which we define as the estimated bias of the marginal quantile
> coverage probability estimate based on the out-of-bag sample. We adapt QCL
> tuning to handle censored data and demonstrate its use with random survival
> forests. We show that QCL tuning results in quantile estimates with more
> accurate coverage probabilities than those achieved using default parameter
> values or traditional tuning (using MSPE for uncensored data and C-index for
> censored data), while also reducing the estimated MSE of these coverage
> probabilities. We discuss how the superior performance of QCL tuning is linked
> to its alignment with the estimation goal. Finally, we explore the validity and
> width of prediction intervals created using this method.

Again, it's been a long time since I ever ran an RF algorithm on real data points. It looks like the RF framework has been extended far and long, and even for quantile regression. In this regard, the out-of-bag sample is used to estimate the bias of the marginal quantile coverage probability estimate.

### Tensor-product interactions in Markov-switching models (https://arxiv.org/abs/2507.01555)

> Markov-switching models are a powerful tool for modelling time series data
> that are driven by underlying latent states. As such, they are widely used in
> behavioural ecology, where discrete states can serve as proxies for behavioural
> modes and enable inference on latent behaviour driving e.g. observed movement.
> To understand drivers of behavioural changes, it is common to link model
> parameters to covariates. Over the last decade, nonparametric approaches have
> gained traction in this context to avoid unrealistic parametric assumptions.
> Nonetheless, existing methods are largely limited to univariate smooth
> functions of covariates, based on penalised splines, while real processes are
> typically complex requiring consideration of interaction effects. We address
> this gap by incorporating tensor-product interactions into Markov-switching
> models, enabling flexible modelling of multidimensional effects in a
> computationally efficient manner. Based on the extended Fellner-Schall method,
> we develop an efficient automatic smoothness selection procedure that is robust
> and scales well with the number of smooth functions in the model. The method
> builds on a random effects view of the spline coefficients and yields a
> recursive penalised likelihood procedure. As special cases, this general
> framework accommodates bivariate smoothing, function-valued random effects, and
> space-time interactions. We demonstrate its practical utility through three
> ecological case studies of an African elephant, common fruitflies, and Arctic
> muskoxen. The methodology is implemented in the LaMa R package, providing
> applied ecologists with an accessible and flexible tool for semiparametric
> inference in hidden-state models. The approach has the potential to drastically
> improve the level of detail in inference, allowing to fit HMMs with hundreds of
> parameters, 10-20 (potentially bivariate) smooths to thousands of observations.

This is a novel approach for semiparametric inference in hidden-state models, which relies on incorporating tensor-product interactions into Markov-switching models, also known as Hidden Markov Model, a mix of two stochastic processes (one observed and the other latent). It's dense and I need to read this when I'll have more time. Now, let's go back to holidays, FWIW.

{{% music %}}Within Temptation • _Faster_{{% /music %}}
