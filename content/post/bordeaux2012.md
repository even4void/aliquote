---
title: "Back from the BoRdeaux conference"
date: 2012-07-04T20:28:34+01:00
draft: false
tags: ["travels", "rstats"]
categories: ["2012"]
---

Here is a quick wrap up of the BoRdeaux conference. I won't detail the conference program itself, but just drop some words on packages that were presented together with their applications (in various fields: epidemiology, social sciences, teaching, high dimensional data, chemometrics).

## Multivariate data analysis

Stéphanie Bougeard talked about two new functions in the [ade4](http://cran.r-project.org/web/packages/ade4/index.html) package aiming at the analysis of K+1 tables (several blocks of explanatory variables and a block of response variables). I can't find those functions, `mbpls` and `mbpcaiv`, but they look interesting. I wonder how they compare to [RGCCA](http://cran.r-project.org/web/packages/RGCCA/index.html) or PLS path modeling (e.g., [plspm](http://cran.r-project.org/web/packages/plspm/index.html) or [semPLS](http://cran.r-project.org/web/packages/semPLS/index.html)).

Her slides from other conferences include more mathematical details: [AGROSTAT 2010](http://www.agrostat2010.unisannio.it/Presentazioni%20Agrostat/Session%2010/Bougeard.pdf),  [CARME 2011](http://carme2011.agrocampus-ouest.fr/slides/Bougeard_Qannari_Fablet.pdf). Currently, the key paper seems to be: Bougeard, S, Qannari, EM, Rose, N (2011). Multiblock redundancy analysis: interpretation tools and application in epidemiology. *Journal of Chemometrics*, 25(9): 467–475.

Other (related) papers of interest:

1. Bougeard, S, Qannari, EM, Lupo, C, and Hanafi, M (2011). [From Multiblock Partial Least Squares to Multiblock Redundancy Analysis. A Continuum Approach](http://www.mii.lt/Informatica/pdf/INFO811.pdf). *Informatica*, 22(1): 11-26.
2. Bougeard, S, Qannari, EM, Lupo, C, and Chauvin, C (2011). [Multiblock redundancy analysis from a user's perspective. Application in veterinary epidemiology](http://212.189.136.205/index.php/ejasa/article/viewFile/11014/10507). *Electronic Journal of Applied Statistical Analysis*, 4(2): 203-214.

I've also learned that [ade4](http://cran.r-project.org/web/packages/ade4/index.html) graphics capabilities will be rebased on the lattice package, allowing for complex layout on graphical device (Alice Julien-Laferriere's talk). This was done using S4 classes on top of existing functions visible to the user (`s.class`, `dudi.pca`, etc.).

Aurélie Thébault presented her work on locally-weighted PLS regression, with applications in infrared spectral analysis. The idea is to introduce a local calibration stage, before computing PLS components. The idea of local PLS is to predict new observations from a subset of the original samples that resemble the characteristics of these new observations (weighting process). This seems to be highly specific of near-infrared spectroscopy, but it might be interesting for signal processing.

The PCAmixdata was discussed by Vanessa Kuentz-Simonet. This is a package that deals with VARIMAX rotation in factor analysis: Chavent, M, Vanessa, K, and Saracco, J (2011), Orthogonal rotation in PCAMIX ([arXiv:1112.0301](http://fr.arXiv.org/abs/1112.0301)).
At UseR! 2011, there was a related talk on the selection of variables by those authors: [ClustOfVar: an R package for the clustering of variables](http://bit.ly/KZXzYQ). 

Other interesting papers I have to read or reread:

1. Kiers, HAL and Krijnen, W (1991). An efficient algorithm for PARAFAC of three-way data with large numbers of observation units, *Psychometrika*, 56(1): 147-152.
2. Takane, Y and Shibayama, T (1991). Principal component analysis with external information on both subjects and variables, *Psychometrika*, 56(1): 97-120.
3. Takane, Y, Kiers, HAL, and de Leeuw, J (1995). Component analysis with different sets of constraints on different dimensions. *Psychometrika*, 60(2): 259-280.
4. Kiers, HAL (1991) Simple structure in component analysis techniques for mixtures of qualitative and quantitative variables. *Psychometrika*, 56: 197-212.
5. Lorenzo-Seva, U, van de Velden, M, and Kiers, HAL (2009). [CAR: A MATLAB Package to Compute Correspondence Analysis with Rotations](http://www.jstatsoft.org/v31/i08/). *Journal of Statistical Software*, 31(8).

The [mixOmics](http://cran.r-project.org/web/packages/mixOmics/index.html) package has been updated with new functions, including Independent Principal Component Analysis. It now has an official [website](http://perso.math.univ-toulouse.fr/mixomics/) where more information are available, and a there is also a [mixOmics wizard](http://mixomics.qfab.org/) where users can see online illustrations and get explanation of the techniques used therein (good point for reproducible research!).

## Model-based clustering

Charles Bouveyron provided a general overview of the [HDclassif](http://cran.r-project.org/web/packages/HDclassif/index.html) package (but see the JSS paper, [HDclassif: An R Package for Model-Based Clustering and Discriminant Analysis of High-Dimensional Data](http://www.jstatsoft.org/v46/i06/)), which is for supervised and unsupervised classification. There was a nice demo of clustering with the `crabs` dataset, which can be found in `demo_hddc()`. Below is a screenshot from running model-based clustering with the EM algorithm, k-means initialization for cluster centres, and `AkBkQkDk` model for the general variance-covariance structure (see section 2.1 of the JSS paper for more explanation).

![Clustering](/img/20120704141942.png)

Florent Langrognet presented the [Rmixmod](http://cran.r-project.org/web/packages/Rmixmod/index.html) package; this is a porting from the [mixmod project](http://www.mixmod.org/) for high performance model-based cluster and discriminant analysis, which comes as a C++ library with command-line utilities and a MATLAB frontend. Interestingly, this package also works with semi-supervised problem, and it allows for case weighting.

