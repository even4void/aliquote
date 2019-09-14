+++
title = "Fitting Rasch model with R lme4"
date = 2011-03-12T17:51:32+01:00
draft = false
tags = ["psychometrics", "rstats"]
categories = ["2011"]
+++

The [last issue](http://www.jstatsoft.org/v39) of the *Journal of Statistical Software* features an article on [The Estimation of Item Response Models with the lmer Function from the lme4 Package in R](http://www.jstatsoft.org/v39/i12), by De Boeck and coll. As the title suggests, this article is about fitting IRT models with a mixed-effects model approach.

<!--more-->

This is an interesting article because I've been working on that some four years ago now. The code I produced at that time was based on the De Boeck's book: Paul De Boeck & Mark Wilson, *Explanatory Item Response Models: A Generalized Linear and Nonlinear Approach* (Springer, 2004).

but, due to lack of time, was never pursued to its end (maybe like most of tutorials I wrote actually). Also, I started writing a short note on fitting Rasch models in R (using classical CML- or MML-based approaches, JAGS, Poisson model, etc.). I will link to it at a later time.

Back to De Boeck's article. It all starts with the idea of applying an GLMM to the matrix of items responses, with additional indicators for item- or subject-specific cofactors. Using an GLMM has already been described by Doug Bates in an older issue, Doran, H, Bates, D, Bliese, P, and Downling, M. (2007). [Estimating the Multilevel Rasch Model: With the lme4 Package](http://www.jstatsoft.org/v20/i02/paper), JSS 20(2), and also in some of his talk at UseR! or elsewhere, see e.g. the [slides section](http://lme4.r-forge.r-project.org/slides/) on RForge.

The Rasch model (RM) takes the form

$$ \eta\_{pi}=\theta_pX\_{i0}+\sum\_{i=1}^K\beta_iX\_{ik} $$

where i and p are indexes for items and persons, and X is the design matrix where $X\_{ik} = 1$, if $i = k$ ($i=1, \dots, K)$, and $X\_{i0} = 1$ for all items. The distribution of ability is gaussian with SD $σ_\theta$. In a simplified form, we find the well-known formulation of the RM as denoting an interactive effect of subject's ability and item difficulty on the logit scale:

$$ \eta\_{pi}=\theta_p+\beta_i $$

Of course, we can use a different link function, such as the `probit` if we want the so-called normal ogive model.

A general formula interface for such a model under lme4 reads

```r
lmer(resp ~ -1 + it + (1|id), family=binomial("logit"))
```

where everything that follows the `~` operator stands for the *linear component* described in the first equation above.

More interestingly, De Boeck's et al. then give detailed explanations on how to fit more customized IRT models.

Here is a short memo of common R notation for the main models used in psychometric research.

- Item covariates, i.e. the linear logistic test model (LLTM) with ot without an added error term (which allows for imperfect predictions and seems more realistic in many situations). The general R syntax for this kind of model is `-1 + i1 + i2 + (1 | id)`, and the error term is added as `+ (1 | item)`, which means that we assume an homoscedastic effect.
- Item partitioning, that is considering a multidimensional model instead of a single latent trait as in the RM. This means modifying the design matrix, $X$, so that it becomes a (P x I) x K matrix (in long format) with $K = I + K^\star$, where $K^\star$ is the number of binary item partition covariates. Of note, partition can correspond to a nesting or crossing structure. More importantly, "a multidimensional model for a crossed item design is not identified unless restrictions are imposed on the model. For example, the model is again identified if the correlations between the dimensions referring to different partitions are fixed to zero." (p. 13) A model with two groups of items would read `-1 + item + (1 + i1 + i2 | id)`.
- Person covariates, as commonly found in the latent rxegression Rasch model can be fitted easily, assuming two kind of covariance structure (homo- or heteroscedastic). The general syntax is `-1 + item + p1 + (1 | id)` (or `-1 + item + p1 + (-1 + p1 | id)`, under the heteroscedasticity asumption).
- Person partitioning, also known as multilevel models when talking about nested structure. The syntax is rather simple: `-1 + item + (1 | id) + (1 | group)`.
- Person-by-item covariates, which mainly concern differential effect functioning, local dependency models, and dynamic model. The latter is useful for modeling learning effect, for example. In all three cases, we need to build an "extended" design matrix.

In conclusion, this article might be very useful for extending the class of IRT models available under R. With the recent development of packages dedicated to structural equation modeling, like [lavaan](http://lavaan.ugent.be/) or [OpenMx](http://openmx.psyc.virginia.edu/), R will probably become the de facto standard in IRT modeling.
