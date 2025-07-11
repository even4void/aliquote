---
title: "ArXiving on July 2025"
date: 2025-07-12T15:27:46+02:00
draft: true
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

### Dynamic Similarity Graph Construction with Kernel Density Estimation (https://arxiv.org/abs/2507.01696)

> In the kernel density estimation (KDE) problem, we are given a set $X$ of
> data points in $\mathbb{R}^d$, a kernel function $k: \mathbb{R}^d \times
> \mathbb{R}^d \rightarrow \mathbb{R}$, and a query point $\mathbf{q} \in
> \mathbb{R}^d$, and the objective is to quickly output an estimate of
> $\sum_{\mathbf{x} \in X} k(\mathbf{q}, \mathbf{x})$. In this paper, we consider
> $\textsf{KDE}$ in the dynamic setting, and introduce a data structure that
> efficiently maintains the estimates for a set of query points as data points
> are added to $X$ over time. Based on this, we design a dynamic data structure
> that maintains a sparse approximation of the fully connected similarity graph
> on $X$, and develop a fast dynamic spectral clustering algorithm. We further
> evaluate the effectiveness of our algorithms on both synthetic and real-world
> datasets.

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

### On the Adversarial Robustness of Online Importance Sampling (https://arxiv.org/abs/2507.02394)

> This paper studies the adversarial-robustness of importance-sampling (aka
> sensitivity sampling); a useful algorithmic technique that samples elements
> with probabilities proportional to some measure of their importance. A
> streaming or online algorithm is called adversarially-robust if it succeeds
> with high probability on input streams that may change adaptively depending on
> previous algorithm outputs. Unfortunately, the dependence between stream
> elements breaks the analysis of most randomized algorithms, and in particular
> that of importance-sampling algorithms. Previously, Braverman et al. [NeurIPS
> 2021] suggested that streaming algorithms based on importance-sampling may be
> adversarially-robust; however, they proved it only for well-behaved inputs.
>  We focus on the adversarial-robustness of online importance-sampling, a
> natural variant where sampling decisions are irrevocable and made as data
> arrives. Our main technical result shows that, given as input an adaptive
> stream of elements $x_1,\ldots,x_T\in \mathbb{R}_+$, online importance-sampling
> maintains a $(1\pm\epsilon)$-approximation of their sum while matching (up to
> lower order terms) the storage guarantees of the oblivious (non-adaptive) case.
> We then apply this result to develop adversarially-robust online algorithms for
> two fundamental problems: hypergraph cut sparsification and $\ell_p$ subspace
> embedding.

{{% music %}}XXX • _XXX_{{% /music %}}
