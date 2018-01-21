+++
title = "Multi-Group comparison in Partial Least Squares Path Models"
date = 2016-05-28T14:52:01+01:00
draft = false

tags = ["psychometrics", "rstats"]
categories = []

[header]
image = ""
caption = ""
preview = true

[[gallery_item]]
album = "1"
image = "multi-group-sem-pls-fig01.png"
caption = ""

[[gallery_item]]
album = "1"
image = "multi-group-sem-pls-fig02.png"
caption = ""

[[gallery_item]]
album = "2"
image = "multi-group-sem-pls-fig03.png"
caption = ""

[[gallery_item]]
album = "2"
image = "multi-group-sem-pls-fig04.png"
caption = ""

+++

This post is about multi-group partial least squares path modeling (PLS-PM).


There is already a useful list of references on this [blog post][blog]. As the author noticed, ensuring measurement invariance is often thought of as a prerequisite before dwelling into multi-group comparison, at least in the psychometric literature that I am familiar with. From a measurement perspective, this is easily understandable since we need to ensure that we are indeed measuring in a similar way the exact same construct in specific subpopulation. I am not sure this apply to more general SEM or PLS models which may include a mix of reflexive and formative indicators, but anyway we will consider that PLS-PM is used to answer the same kind of questions as factor analysis does in general, and that we are interested in PLS approaches because of their relaxed assumptions regarding data properties (sample size, distribution, etc.). A nice overview of PLS approaches in SEM is available in Monecke et Leisch, [semPLS: Structural Equation Modeling Using Partial Least Squares][paper] (JSS 2012, 48(3)). 

In the aforementioned blog, I found two references that deal with multi-group comparison issues in the context of PLS-PM. Both are available as PDFs:

1. Chin, W. W., Mills, A. M., Steel, D. J., & Schwarz, A. (2012). [Multi-group invariance testing: An illustrative comparison of PLS permutation and covariance-based SEM invariance analysis][chin12]. *7th International Conference on Partial Least Squares and Related Methods*, May 19-22, 2012, Houston.
2. Visinescu, L. (2012). [PLS group comparison: A proposal for relaxing measurement invariance assumptions][visinescu12]. 7th International Conference on Partial Least Squares and Related Methods, May 19-22, 2012, Houston.

The [*Handbook of Partial Least Squares*][pls-handbook], edited by Esposito Vinzi et coll., further includes several chapters dedicated to multi-group comparison using permutation-based approaches. 

In the R packages [semPLS][semPLS] and [plspm][plspm] the authors offer bootstrap and/or permutation-based procedures to assess the significance of path coefficients in single or multi-group settings. I should note that there is also a general purpose package for multi-group analysis on CRAN: [multigroup][multigroup]. Since I am mostly using factor analysis or item response models, I generally rely on [lavaan][lavaan] and [semTools][semTools] for multi-group comparisons. 

Back to PLS models, Gaston Sanchez (author of [plspm][plspm]) provides some illustration of multi-group comparison in his handbook, [PLS Path Modeling with R][plspm-handbook], using resampling methods (bootstrap t-test and permutation). The `plspm::plspm.groups()` function simplify the task since it allows the user to specifiy a PLS model (inner and outer blocks, modes) and a grouping factor. However, it is assumed that we are interested in inspecting and comparing each parameter estimates in different subsamples, which of course is what generally matters. But what if we are only interested in assessing the model as a whole, at the level of model parameters (and not other indices of model quality like RMSEA, BIC or whatever)?

Here is a short illustration of permutation technique to assess the diference between two groups in terms of path coefficients estimated from PLS-PM. I am using the [simsem][simsem] package to generate artificial data according to a 3-factor model composed of a direct (F1-F3) and an indirect (F1-F2-F3) effect, with a pre-defined difference between two groups at the level of path coefficients (loadings, residuals errors and intercept/variance of the factors were constrained to be equal in the two groups). I will compute two summary measures, the difference between geometric mean[^1] and between total effect of F1 onto F3 (b<sub>13</sub> + b<sub>12</sub> x b<sub>23</sub>) in the two groups. The complete code is available as a [Gist][gist] (it could certainly be optimized here and there, but I wrote this R script very quickly to illustrate those ideas).

Here are the distributions I got when considering a pre-defined difference of `delta=0.03` (top) and 0.06 (bottom) between group-specific parameters (regression coefficients among endogeneous variables, called `BE` in `simsem::model()`), for a fixed sample size of `n=200` (these values can be changed at the top of the R script).

{{< gallery album="1" >}}

And here are the same results in the case of N = 300.

{{< gallery album="2" >}}

The above simulations just confirm that with a larger sample size we are more likely to demonstrate significant difference in multi-group comparison, especially when effect size increases. However, the main point is that it is quite easy to implement permutation- or bootstrap-based procedures to compare combination of parameter estimates between several groups.

The same resampling strategy could of course be applied to estimate number of subjects needed to reach a certain statistical power, but in fact the [simsem][simsem] package does that particularly well.


[^1]: In this case, it may be more interesting to take the square of the regression coefficients before combining them using the geometric mean.



[blog]: https://ckummer.wordpress.com/2014/04/06/research-note-multi-group-comparison-in-partial-least-squares-pls-path-modelling/
[paper]: https://www.jstatsoft.org/article/view/v048i03
[chin12]: http://www.plsconference.com/Slides/PLS2012%20(Chin,%20Mills,%20Steel,%20Schwarz).pdf
[visinescu12]: http://www.plsconference.com/Slides/PLS%20Group%20Comparison.pdf
[pls-handbook]: http://www.springer.com/us/book/9783540328254
[semPLS]: https://cran.r-project.org/web/packages/semPLS/index.html
[plspm]: https://cran.r-project.org/web/packages/plspm/index.html
[multigroup]: https://cran.r-project.org/web/packages/multigroup/index.html
[lavaan]: http://lavaan.ugent.be
[semTools]: https://cran.r-project.org/web/packages/semTools/index.html
[plspm-handbook]: http://gastonsanchez.com/PLS_Path_Modeling_with_R.pdf
[simsem]: https://cran.r-project.org/web/packages/simsem/index.html
[gist]: https://gist.github.com/chlalanne/58bc59ba459d622d3a530f700bfc697d
