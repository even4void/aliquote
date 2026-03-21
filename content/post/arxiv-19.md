---
title: "ArXiving on March 2026"
date: 2026-03-17T09:33:56+01:00
draft: true
tags: ["arxiv"]
categories: ["2026"]
---

### [Stress-Testing Assumptions: A Guide to Bayesian Sensitivity Analyses in Causal Inference][1]

> While observational data are routinely used to estimate causal effects of
> biomedical treatments, doing so requires special methods to adjust for
> observed confounding. These methods invariably rely on untestable statistical
> and causal identification assumptions. When these assumptions do not hold,
> sensitivity analysis methods can be used to characterize how different
> violations may change our inferences. The Bayesian approach to sensitivity
> analyses in causal inference has unique advantages as it allows users to
> encode subjective beliefs about the direction and magnitude of assumption
> violations via prior distributions and make inferences using the updated
> posterior. However, uptake of these methods remains low since implementation
> requires substantial methodological knowledge. Moreover, while implementation
> with publicly available software is possible, it is not straight-forward. At
> the same time, there are few papers that provide practical guidance on these
> fronts. In this paper, we walk through four examples of Bayesian sensitivity
> analyses: 1) exposure misclassification, 2) unmeasured confounding, and
> missing not-at-random outcomes with 3) parametric and 4) nonparametric
> Bayesian models. We show how all of these can be done using a unified Bayesian
> "missing data" approach. We also cover implementation using Stan, a publicly
> available open-source software for fitting Bayesian models. To the best of our
> knowledge, this is the first paper that presents a unified approach with code,
> examples, and methodology in a three-pronged illustration of sensitivity
> analyses in Bayesian causal inference. Our goal is for the reader to walk away
> with implementation-level knowledge.

### [Efficient Tests for Testing in Two-way ANOVA under Heteroscedasticity][2]

> New tests are developed for two-way ANOVA models with heterogeneous error
> variances. The testing problems are considered for testing the significant
> interaction effects, simple effects, and treatment effects. The likelihood
> ratio tests (LRTs) and simultaneous comparison tests are derived for all three
> problems. Hill climbing algorithms have been proposed to compute the maximum
> likelihood estimators (MLEs) of parameters under the restrictions on the null
> and alternative hypotheses. It is proved that the proposed algorithms converge
> to the MLEs. A parametric bootstrap algorithm is provided for the computation
> of the critical points. The simulated power values of the proposed tests are
> compared with two existing tests. For testing main effects in the additive
> ANOVA model, the LRT appears to be about 30% to 50% gain in power over the
> available tests. Also, the proposed tests for the interaction and simple
> effects are seen to have comparable power and size performance to the existing
> tests. The behavior of the proposed tests under the non-normal error
> distribution is also discussed. Four real data sets are used to demonstrate
> the application of the proposed tests. A software package is made in `R' to
> make it simple to apply the tests to experimental data sets.

### [Sample Size Calculations for Developing Clinical Prediction Models: Overview and pmsims R package][3]

> Background: Clinical prediction models are increasingly used to inform
> healthcare decisions, but determining the minimum sample size for their
> development remains a critical and unresolved challenge. Inadequate sample
> sizes can lead to overfitting, poor generalisability, and biased predictions.
> Existing approaches, such as heuristic rules, closed-form formulas, and
> simulation-based methods, vary in flexibility and accuracy, particularly for
> complex data structures and machine learning models. Methods: We review
> current methodologies for sample size estimation in prediction modelling and
> introduce a conceptual framework that distinguishes between mean-based and
> assurance-based criteria. Building on this, we propose a novel
> simulation-based approach that integrates learning curves, Gaussian Process
> optimisation, and assurance principles to identify sample sizes that achieve
> target performance with high probability. This approach is implemented in
> pmsims, an open-source, model-agnostic R package. Results: Through case
> studies, we demonstrate that sample size estimates vary substantially across
> methods, performance metrics, and modelling strategies. Compared to existing
> tools, pmsims provides flexible, efficient, and interpretable solutions that
> accommodate diverse models and user-defined metrics while explicitly
> accounting for variability in model performance. Conclusions: Our framework
> and software advance sample size methodology for clinical prediction modelling
> by combining flexibility with computational efficiency. Future work should
> extend these methods to hierarchical and multimodal data, incorporate fairness
> and stability metrics, and address challenges such as missing data and complex
> dependency structures.

### [Extending the saemix package for R to fit non Gaussian outcomes][4]

> Background and Objectives: Longitudinal data are increasingly collected in
> clinical trials to provide information on treatment action and disease
> evolution. The trajectory of continuous biomarkers such as target hormone
> concentrations or viral loads can then be modelled in relationship to the
> occurrence of events such as recovery or hospitalisation. Other studies may
> include repeated measurements of discrete pain scores, number of episodes
> (count) or occurrence of events (survival). Non-linear mixed-effect models
> (NLMEM) can handle individual differences in trajectories while modelling the
> underlying population evolution and are the natural choice for their analysis.
> The saemix package for R is one of the few open-source solutions and the most
> flexible. In this paper, we extend it to accommodate a variety of models for
> non-Gaussian data. Methods: The saemix package estimates parameters through
> the Stochastic Approximation Expectation-Maximisation (SAEM) algorithm. Within
> the package, non-Gaussian models are specified by their log-likelihood
> functions, affording maximal control over model formulation. We extend
> estimation algorithms as well as exploratory and diagnostic plots for
> non-Gaussian data. Bootstrap approaches were implemented to estimate parameter
> uncertainty. To evaluate the performance of saemix, we performed a simulation
> study based on the toenail dataset, containing repeated binary data from a
> randomised clinical trial. Results: saemix showed good performance to recover
> the true parameter values in the simulation study, and was stable across
> different starting values for the parameters. An algorithm jointly searching
> for covariate and interindividual variability model was also implemented to
> build the covariate model and applied to categorical and survival-type data.

{{% music %}}The Wake • _Rusted 20_{{% /music %}}

[1]: https://arxiv.org/abs/2602.23640
[2]: https://arxiv.org/abs/2602.23815
[3]: https://arxiv.org/abs/2602.23507
[4]: https://arxiv.org/abs/2603.03154
