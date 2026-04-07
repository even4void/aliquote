---
title: "ArXiving on March 2026"
date: 2026-04-07T09:33:56+01:00
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

### [Trajectory-informed graph-based clustering for longitudinal cancer subtyping][5]

> Cancer subtyping plays a crucial role in informing prognosis and guiding
> personalized treatment strategies. However, conventional subtyping approaches
> often rely on static, biopsy-derived scores that hardly capture the biological
> heterogeneity and temporal evolution of the disease. In this study, we propose
> a novel trajectory-informed clustering method for cancer subtyping that
> integrates multi-modal clinical data and longitudinal patient trajectories.
> Our method constructs a patient similarity graph using time-varying
> imaging-derived features, clinical covariates, and transitions among key
> clinical states such as therapy, surveillance, relapse, and death. This graph
> structure enables the identification of patient subgroups that are not only
> phenotypically and genotypically distinct but also aligned with patterns of
> disease progression. We position our approach within the landscape of existing
> subtyping methods and highlight its advantages in terms of temporal modeling
> and graph-based interpretability. Through simulation studies and application
> to a real world dataset of liver metastases, we demonstrate the ability of our
> framework to uncover clinically relevant subtypes with distinct prognostic
> trajectories. Our results underscore the potential of trajectory-informed
> clustering to enhance personalized oncology by bridging cross-sectional
> biomarkers with dynamic disease evolution.

### [Cancer Survival Rates Are Misleading][6]

> Five-year cancer survival rates are widely reported and often interpreted to
> mean that early detection saves lives, that a late fatal diagnosis would have
> been prevented by earlier detection, and that increasing survival over time
> proves better treatment. This expository article explains why such inferences
> are not supported by survival statistics alone. A simple Markov model of tumor
> progression, calibrated to patterns like those in SEER data, shows that high
> survival after early diagnosis, large gaps between early and late stage, and
> improving survival can all appear even when treatment is ineffective and
> screening does not reduce mortality. The discussion ties these points to the
> clinical literature and argues that randomized trials and mortality outcomes
> are needed to support screening and treatment claims; five-year survival alone
> provides little actionable evidence and is easily misread.

### [A practical introduction to ODE modelling in Stan for biological systems][7]

> Integrating dynamical systems models with time series data is a central part
> of contemporary mathematical biology. With the rich variety of available
> models and data, numerous methods and computational tools have been developed
> for these purposes. One such tool is Stan, a freely available and open-source
> probabilistic programming framework that provides efficient methods for
> estimating model parameters from data using computational Bayesian inference
> algorithms. Stan includes built-in mechanisms for working with ordinary
> differential equation (ODE) models, which are widely used in mathematical
> biology and related fields to study simulated, experimental, and real-world
> systems that change over time. Through step-by-step worked examples, including
> both pedagogical toy models and applications with real data, this article
> provides a practical, self-contained introduction to performing parameter
> estimation and model evaluation for first-order linear and nonlinear ODE
> models in Stan. The article also explains key statistical methods that
> underpin Stan and discusses computational Bayesian modelling in the context of
> biological applications.

### [Tiny but uniform improvements of adaptive BH procedures via compound e-values][8]

> After the seminal Benjamini-Hochberg (BH) procedure for controlling the false
> discovery rate (FDR) was proposed, dozens of papers have attempted to improve
> its power by adapting to the unknown proportion of nulls. We observe that most
> null proportion estimates are simply compound e-values in disguise, and thus
> most adaptive FDR procedures can be interpreted as instances of the e-weighted
> BH (ep-BH) procedure of Ignatiadis, Wang, and Ramdas [2024], i.e., the BH
> procedure weighted by compound e-values. This lens helps us show that most
> existing procedures are inadmissible, and we provide uniform improvements to
> them. While the improvements are small in practice, they still come for free
> (without additional assumptions), and help unify the literature. We also use
> our "leave-one-out ep-BH method" to design a new method with finite-sample FDR
> control for the simultaneous t-test setting.

{{% music %}}The Wake • _Rusted 20_{{% /music %}}

[1]: https://arxiv.org/abs/2602.23640
[2]: https://arxiv.org/abs/2602.23815
[3]: https://arxiv.org/abs/2602.23507
[4]: https://arxiv.org/abs/2603.03154
[5]: https://arxiv.org/abs/2603.10089
[6]: https://arxiv.org/abs/2603.19945
[7]: https://arxiv.org/abs/2603.20343
[8]: https://arxiv.org/abs/2603.21424
