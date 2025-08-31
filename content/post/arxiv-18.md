---
title: "ArXiving on August 2025"
date: 2025-08-26T16:22:28+02:00
draft: false
tags: ["arxiv"]
categories: ["2025"]
---

### Statistical methods: Basic concepts, interpretations, and cautions (https://arxiv.org/abs/2508.10168)

> The study of associations and their causal explanations is a central research
> activity whose methodology varies tremendously across fields. Even within
> specialized subfields, comparisons across textbooks and journals reveals that
> the basics are subject to considerable variation and controversy. This
> variation is often obscured by the singular viewpoints presented within
> textbooks and journal guidelines, which may be deceptively written as if the
> norms they adopt are unchallenged. Furthermore, human limitations and the
> vastness within fields imply that no one can have expertise across all
> subfields and that interpretations will be severely constrained by the
> limitations of studies of human populations.
> The present chapter outlines an approach to statistical methods that attempts
> to recognize these problems from the start, rather than assume they are absent
> as in the claims of 'statistical significance' and 'confidence' ordinarily
> attached to statistical tests and interval estimates. It does so by grounding
> models and statistics in data description, and treating inferences from them as
> speculations based on assumptions that cannot be fully validated or checked
> using the analysis data.

This is a chapter from the 3rd edition of the _Handbook of Epidemiology_ (Pigeot and Ahrens, eds.). It's been a long time since I haven't read papers or textbook on epidemiology, but I had this one on my bookshelf at some point in my life. This is all about the study of associations and causal relationships outside the field of randomized clinical trials, which are discussed upfront:

> The methods thus provide logically sound inferences only in ideal cases, rather
than correct answers for our actual imperfect applications. They are however widely applied and
misinterpreted in studies that fall far short of their assumptions, as when actual participation and
treatment are not random. These problems are only partially accounted for by discussions of
study limitations; occasionally they are further analyzed with speculative models for the non-
random (systematic) aspects of the causal processes generating the data.

But the simplifying assumptions are a recurring theme in the rest of the chapter, as well as that of a fictional world in which all assumptions hold. There is a very enlightning discussion on $p$-values, how they are often misinterpreted, and how they should be regarded in light of observed data (see pp.19 ff.). And basically, the whole paper is about statistical significance and how not to fool onto the trap of significant or non-signifcant $p$-values. Of note, Bayesian statistics are briefly discussed. I must admit I never encountered a single epidemiological paper using Bayesian inference.

### A Comprehensive Comparison of the Wald, Wilson, and adjusted Wilson Confidence Intervals for Proportions (https://arxiv.org/abs/2508.10223)

> The standard confidence interval for a population proportion covered in the
> overwhelming majority of introductory and intermediate statistics textbooks
> surprisingly remains the Wald confidence interval despite having a poor
> coverage probability, especially for small sample sizes or when the unknown
> population proportion is close to either 0 or 1. Using the mean coverage
> probability, and for some sample sizes, Agresti and Coull showed not only that
> the 95\% Wilson confidence interval performs better, but also showed that 95\%
> adjusted Wilson of type 4 confidence interval, obtained by simply adding four
> pseudo-observations, outperforms both the Wald and the Wilson confidence
> intervals. In this paper, we introduce a rainbow color code and pixel-color
> plots as ways to comprehensively compare the Wald, Wilson, and adjusted-Wilson
> of type $\epsilon$ confidence intervals across all sample sizes $n=1, 2, \dots,
> 1000$, population proportion values $p=0.01, 0.02, \dots, 0.99$, and for the
> three typical confidence levels. We show not only that adding 3 (resp., 4 and
> 6) pseudo-observations is the best for the 90\% (resp., 95\% and 99\%) adjusted
> Wilson confidence interval, but it also performs better than both the 90\%
> (resp., 95\% and 99\%) Wald and Wilson confidence intervals.

While two-group comparisons with a continuous outcome are generally easily understood and carried out using a $t$ or Wilcoxon test (although, in the latter case, with bad assumptions), estimating the precision of proportion estimates always rely on Wald confidence intervals, aka the "normal approximation". In this case, the proprtion of success is estimated as $\hat p \pm z_{\alpha}\sqrt{\frac{\hat p(1 - \hat p)}{n}}$, where $z_{\alpha}$ is the $1-\alpha/2$ quantile of the standard normal distribution ($z=1.96$ for a 95% confidence interval). An alternative option is to rely on Wilson's CI, and the well-known Agresti-Couli interval provides a very good approximation to it. You may recall that in the case of proportion, the standard error may be computed from the estimated proportion, $\hat p$, which yield Wald CIs,  or from the proportion under $H_0$, $p_0$, which is the [score test](https://en.wikipedia.org/wiki/Score_test) statistic (also called $z$-test in most statistical packages).[^1] The Wilson CIs are more tedious to compute (see Formula 2 in the paper and this [blog post](https://www.econometrics.blog/post/the-wilson-confidence-interval-for-a-proportion/)). The authors describe adjusted Wilson intervals for 90, 95, and 99% confidence level. The color scheme retained for these analyses remain, however, quite surprising.

[^1]: See also [Coin tossing experiment: Score and Wald tests](/post/coin-tossing-experiment/).

### Better bootstrap t confidence intervals for the mean (https://arxiv.org/abs/2508.10083)

> This article explores combinations of weighted bootstraps, like the Bayesian
> bootstrap, with the bootstrap $t$ method for setting approximate confidence
> intervals for the mean of a random variable in small samples. For this problem
> the usual bootstrap $t$ has good coverage but provides intervals with long and
> highly variable lengths. Those intervals can have infinite length not just for
> tiny $n$, when the data have a discrete distribution. The BC$_a$ bootstrap
> produces shorter intervals but tends to severely under-cover the mean.
> Bootstrapping the studentized mean with weights from a Beta$(1/2,3/2)$
> distribution is shown to attain second order accuracy. It never yields infinite
> length intervals and the mean square bootstrap $t$ statistic is finite when
> there are at least three distinct values in the data, or two distinct values
> appearing at least three times each. In a range of small sample settings, the
> beta bootstrap $t$ intervals have closer to nominal coverage than the BC$_a$
> and shorter length than the multinomial ootstrap $t$. The paper includes a
> lengthy discussion of the difficulties in constructing a utility function to
> evaluate nonparametric approximate confidence intervals.

For small samples and/or skewed data, the Bayesian $t$-test is a good option (see this [unfinished post](/post/bayesian-t-test/) of mine). BCA correction for a bootstrap $t$-test usually undercovers the mean, and other problems appear when we consider the studentized rather than the arithmetic mean. In this paper the authors consider various techniques to overcome limitations arising from small samples and they show that the  power law bootstrap $t$ and the beta bootstrap $t$ (decsribed in §2.5) provide good results, the latter being second order accurate.

See also, Hall, P. (1988). [Theoretical comparisons of bootstrap confidence intervals](https://projecteuclid.org/journals/annals-of-statistics/volume-16/issue-3/Theoretical-Comparison-of-Bootstrap-Confidence-Intervals/10.1214/aos/1176350933.full). The Annals of Statistics, 16(3):927–953.

### Dissecting Microbial Community Structure and Heterogeneity via Multivariate Covariate-Adjusted Clustering (https://arxiv.org/abs/2508.11036)

> In microbiome studies, it is often of great interest to identify clusters or
> partitions of microbiome profiles within a study population and to characterize
> the distinctive attributes of each resulting microbial community. While raw
> counts or relative compositions are commonly used for such analysis, variations
> between clusters may be driven or distorted by subject-level covariates,
> reflecting underlying biological and clinical heterogeneity across individuals.
> Simultaneously detecting latent communities and identifying covariates that
> differentiate them can enhance our understanding of the microbiome and its
> association with health outcomes. To this end, we propose a
> Dirichlet-multinomial mixture regression (DMMR) model that enables joint
> clustering of microbiome profiles while accounting for covariates with either
> homogeneous or heterogeneous effects across clusters. A novel symmetric link
> function is introduced to facilitate covariate modeling through the
> compositional parameters. We develop efficient algorithms with convergence
> guarantees for parameter estimation and establish theoretical properties of the
> proposed estimators. Extensive simulation studies demonstrate the effectiveness
> of the method in clustering, feature selection, and heterogeneity detection. We
> illustrate the utility of DMMR through a comprehensive application to
> upper-airway microbiota data from a pediatric asthma study, uncovering distinct
> microbial subtypes and their associations with clinical characteristics.

I had to help a student two years ago for a microbial analysis, and she found an arcane R package on GitHub which relied on Spearman correlation of table of counts, IIRC, and allowed to build a network of co-occurring species, but this didn't allow to take into account co-factors of interest. Unfortunately, the experimental design was flawed, so the analysis ended up early. It is interesting to see that covariates can be taken into account in the analysis of such large dataset .

### What makes a study design quasi-experimental? The case of difference-in-differences (https://arxiv.org/abs/2508.13945)

> Study designs classified as quasi- or natural experiments are typically
> accorded more face validity than observational study designs more broadly.
> However, there is ambiguity in the literature about what qualifies as a
> quasi-experiment. Here, we attempt to resolve this ambiguity by distinguishing
> two different ways of defining this term. One definition is based on
> identifying assumptions being uncontroversial, and the other is based on the
> ability to account for unobserved sources of confounding (under assumptions).
> We argue that only the former deserves an additional measure of credibility for
> reasons of design. We use the difference-in-differences approach to illustrate
> our discussion.

This papers provides a use case of difference-in-differences, and its relation with the parallel trends assumption, which usually holds if the exposure is randomly assigned. Random treatment allocation, however, does not mean we need to use a DID estimator, and post-treatment comparison should be preferred.

### Perspective: An outlook on fluorescence tracking (https://arxiv.org/abs/2508.13668)

> Tracking single fluorescent molecules has offered resolution into dynamic
> molecular processes at the single-molecule level. This perspective traces the
> evolution of single-molecule tracking, highlighting key developments across
> various methodological branches within fluorescence microscopy. We compare the
> strengths and limitations of each approach, ranging from conventional widefield
> offline tracking to real-time confocal tracking. In the final section, we
> explore emerging efforts to advance physics-inspired tracking techniques, a
> possibility for parallelization and artificial intelligence, and discuss
> challenges and opportunities they present toward achieving higher
> spatiotemporal resolution and greater computational and data efficiency in
> next-generation single-molecule studies.

For someone like me who deal with data coming from cellular biology, this provides an excellent overview of fluorescence microscopy.

{{% music %}}Stone Temple Pilots • _Crackerman_{{% /music %}}
