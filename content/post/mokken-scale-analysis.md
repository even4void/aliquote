+++
title = "Mokken scale analysis"
date = 2012-02-23T17:38:39+01:00
draft = false

tags = ["readings", "psychometrics"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

My recent lectures focus on *Mokken Scale Analysis* which is based on an item response model known as the monotone homogeneity model.

Mokken scale analysis can be seen as a hierarchical scaling method where we make the assumption that there exist an underlying latent trait that explain covariation between item responses. As in other IRT models, items are thought to be orderable by 'difficulty' such that any individual who endorses a particular item should endorse one with a lower difficulty (as in [Guttman scaling](http://en.wikipedia.org/wiki/Guttman_scale), but perfectly ordered response patterns are rarely met in practice, especially in some fields of research). Individual scores are then computed as the rank of the highest endorsed item in this hierarchy, i.e. it is a simple total score (sum of positive responses). Unlike Guttman scaling, however, Mokken scaling relies on a probabilistic framework.[^1] The reproducibility of response patterns are typically assessed using a coefficient of reproducibility, a coefficient of scalability and/or Loevinger's coefficient of homogeneity.<sup>(1)</sup>

More discussion can be found in, e.g., Sijtsma and Verweij<sup>(2)</sup> or Mokkan and Lewis<sup>(3)</sup>. The use of Mokken scale analysis is largely found in patient outcome research, ranging from psychiatric or clinical research<sup>(4-6)</sup> to health-related quality of life.<sup>(7,8)</sup>

In practice, Mokken scaling is attracting because it is supposed to require lower sample size compare to traditional IRT model. This is perhaps discussed in Mokken's book but I don't have it and I was unable to find a single paper on sample size requirement for Mokken scale analysis.

Andries van der Ark has a [lot of papers](http://spitswww.uvt.nl/~avdrark/research/research.htm) on this topic, including an upcoming paper for the [Journal of Statitical Software](http://www.jstatsoft.org/):
Van der Ark, L. A. (in press). New developments in Mokken scale analysis in R. *Journal of Statistical Software*.

I don't have access to the preprint at the time I'm writing these notes, but I guess it is sort of a follow-up on his earlier paper, [Mokken Scale Analysis in R](http://www.jstatsoft.org/v20/i11/) (JSS 2007, 20(11)). There is even an on-line tutorial on <i class="fa fa-file-pdf-o fa-1x"></i> [Getting started with Mokken scale analysis in R](http://spitswww.uvt.nl/~avdrark/research/mokkenstart.pdf).

Here are some other links to papers that I found useful (and mostly available as PDFs).

1. van Abswoude, A.A.H. et al. <i class="fa fa-file-pdf-o fa-1x"></i> [Mokken Scale Analysis Using Hierarchical Clustering Procedures](http://spitswww.uvt.nl/~vermunt/abswoude2004.pdf). *Applied Psychological Measurement*, 28(5):332–354, 2004.
2. Andries van der Ark, L. et al. [Mokken scale analysis for dichotomous items using marginal models](http://arno.uvt.nl/show.cgi?fid=80557). *Psychometrika*, 73(2):183-208, 2008.
3. Sijtsma, K. et al. [Mokken scale analysis for polychotomous items: theory, a computer program and an empirical application](http://arno.uvt.nl/show.cgi?fid=81040). *Quality & Quantity*, 24:173-188, 1990.


One paper that has attracted my attention is

> Zijlstra, W.P. et al. [Robust Mokken scale analysis by means of the forward search algorithm for outlier detection](http://arno.uvt.nl/show.cgi?fid=113834). *Multivariate Behavioral Research*, 46:58-89, 2011.

It deals with automated item selection and the use of the forward search algorithm<sup>(9,10)</sup> to detect possible outliers, where outliers are defined as "observations that are inconsistent with the remainder of the data or have a disproportionate influence on interesting results such as parameter estimates, goodness-of-fit statistics, and significance tests." The authors used the squared distance between item score and the corresponding item response function (IRF), summated over all items for each respondent, which define respondents' residuals relative to the IRFs and the objective function for the forward search (FS) method. Briefly, a first FS serves to find a good partition of the items into unidimensional scales; then, FS is run on each sale separately and scalability coefficients are examined on-line.

As a sidenote, I was recently wondering if any research has been published that compares Mokken scaling for exploratory scale construction *vs.* Revelle's item cluster analysis.<sup>(11)</sup>

### References

1. Loevinger, J. (1948). The technic of homogeneous tests compared with some aspects of scale analysis and factor analysis. *Psychological Bulletin*, 45, 507-529.
2. Sijtsma, K. and Verweij, A.C. (1992). [Mokken scale analysis: Theoretical considerations and application to transitivity tasks](http://arno.uvt.nl/show.cgi?fid=114619). *Applied Measurement in Education*, 5(4), 355-373.
3. Mokkan, R.J. and Lewis, C. (1982). [A nonparametric approach to the analysis of dichotomous item responses](http://apm.sagepub.com/content/6/4/417.short). *Applied Psychological Measurement*, 6(4), 417-430.
4. DeJong, A. and Molenaar, I.W. (1987). [An application of Mokken's model for stochastic, cumulative scaling in psychiatric research](http://www.journalofpsychiatricresearch.com/article/0022-3956(87)90014-8/abstractref). *Journal of Psychiatric Research*, 21(2), 137-149.
5. Bedford, A., Watson, R., Lyne, J., Tibbles, J., Davies, F., and Deary, I.J. (2010). [Mokken scaling and principal components analyses of the CORE-OM in a large clinical sample](http://www.ncbi.nlm.nih.gov/pubmed/19728291). *Clinical Psychology and Psychotherapy*, 17, 51-62.
6. Bedford, A., Watson, R., Henry, J.D., Crawford, J.R., and Deary, I.J. (2011). [Mokken scaling analyses of the Personal Disturbance Scale (DSSI/sAD) in large clinical and non-clinical samples](http://www.abdn.ac.uk/~psy086/dept/pdfs/PAID_2011_Mokken_Scaling_of_sAD.pdf). *Personality and Individual Differences*, 50, 38-42.
7. Watson, R., Wang, W., Ski, C.F., and Thompson, D.R. (2012). [The Chinese version of the Myocardial Infarction Dimensional Assessment Scale (MIDAS): Mokken scaling](http://www.hqlo.com/content/10/1/2). *Health and Quality of Life Outcomes*, 10:2.
8. Hankins, M. (2008). [How discriminating are discriminative instruments?](http://www.hqlo.com/content/6/1/36) *Health and Quality of Life Outcomes*, 6:36.
9. Mavridis, D. and Moustaki, I. (2009). [The forward search algorithm for detecting aberrant response patterns in factor analysis for binary data](http://pubs.amstat.org/doi/abs/10.1198/jcgs.2009.08060?journalCode=jcgs). *Journal of Computational and Graphical Statistics*, 18(4), 1016-1034.
10. Atkinson, A.C., Riani, M., and Cerioli, A. (2010). [The forward search: Theory and data analysis](http://www.riani.it/pub/ARC10JKSS.pdf). *Journal of the Korean Statistical Society*, 39, 117–134
11. Revelle, W. (1979). [Hierarchical cluster analysis and the internal structure of tests](http://personality-project.org/revelle/publications/iclust.pdf). *Multivariate Behavioral Research*, 14, 57-74.
	 
[^1]: The same argument is often heard when one opposes classical test theory (which only ranks individuals based on their total scores, in the sample under consideration) and Rasch model (which uses a probabilistic model allowing to draw inference regarding different pool of respondents or items, but see [specific objectivity](http://www.rasch.org/rmt/rmt83e.htm)).
