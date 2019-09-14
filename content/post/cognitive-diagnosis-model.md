+++
title = "Cognitive diagnosis models"
date = 2012-12-10T15:27:40+01:00
draft = false
tags = ["readings", "psychometrics"]
categories = ["2012"]
+++

As its name suggests, a cognitive diagnosis model aims at "diagnosing" which skills examinees have or do not have. It has become very popular in recent years because it overcomes standard limitations of summated scale scores derived from classical test or item response theory.

There is a detailed overview of CDM by DiBello and coll. in the *Handbook of Statistics*, vol. 26:
DiBello, L.V., Roussos, L.A., and Stout, W.F. (2007). Review of cognitively diagnostic assessment and a summary of psychometric models. In C.R. Rao & S. Sinharay (Eds.), *Handbook of Statistics, Volume 26: Psychometrics* (pp. 979–1030). Amsterdam, Netherlands: Elsevier.
Mark J. Giel and Jacqueline P. Leighton<sup>(1)</sup> also explain how cognitive models can be used together with psychometric models to account for a hierarchical processing of information, where "problem solving is assumed to require the careful processing of complex information using a relevant sequence of operations (p. 1103)." 

The definitive reference is, however, the book authored by Rupp and coll.: Rupp, A.A., Templin, J., and Henson, R.A. (2010). [*Diagnostic Measurement: Theory, Methods, and Applications*](http://dcm.coe.uga.edu). Guilford Press. 

A well-known model is the so-called DINA model for dichotomous items, which stands for deterministic-input noisy-AND model. It relies on the idea that a particular examinee need to master some skills (attributes) to endorse a given set of items. This relationship between items and attributes is operationalized into a Q-matrix which has binary elements q<sub>jk</sub> indicating whether mastery of the kth attribute is required by the jth item. We also consider a vector of indicators for subject i's attribute mastery for the k attributes. In the DINA model, items divide the population of examinees in two latent classes: those who have all required attributes and those who don't.<sup>(2)</sup> Lacking one required attribute for an item is the same as lacking all the required attributes, and this model assumes equal probability of success for all attribute vectors in each latent group, a condition that is relaxed in the generalized DINA model.<sup>(3)</sup>

At first sight, it shares some of the ideas of clustering or, better, <i class="fa fa-file-pdf-o fa-1x"></i> [latent class models](http://www.iea.nl/fileadmin/user_upload/IRC/IRC_2008/Papers/IRC2008_Chiu_Seo_etal.pdf). The idea of considering "items bundle" is not new, think [testlet]({{< ref "/post/testlet-response-theory.md" >}}) or the linear logistic test model<sup>(9–11)</sup> which allows to take into account item properties, or its generalization, the random weights LLTM<sup>(13)</sup>. Other IRT models are listed in Table 2 (p. 997) of DiBello et al's chapter.

The Q-matrix in the DINA model specifies the set of latent traits necessary for each item, and it is comparable to the weight matrix in the LLTM (or loadings in factor analysis). Importantly, it permits within-item multidimensionality (items needing more than one attribute). However, the LLTM is essentially used with unidimensional constructs; items parameters are linked linearly in this log-linear approach. Cognitive diagnosis model, like the DINA model, are sort of mixture models where several population and several dimensions are considered at once. Only the latter provide basis for individual feedback about skill mastery.

Regarding existing software, here are few links:

- DeCarlo<sup>(14)</sup> provides an [OpenBUGS](http://www.openbugs.info/w/) program for the Bayesian RDINA (reparametrized deterministic input noisy and model), see <http://www.columbia.edu/~ld208/>.
- Jonathan Templin offers Mplus scripts (among others) to accompany his book, see <http://dcm.coe.uga.edu/supplemental/chapter9.html>.
- There's even an R package with empirical (i.e., fraction subtraction) and artificial data for cognitive diagnosis modeling (DINA, DINO, and mixed DINA/DINO models): [CDM](http://http://cran.r-project.org/web/packages/CDM).

### References

1. Gierl, M.J. and Leighton, J.P. (2007). Linking cognitively-based models and psychometric methods. In C.R. Rao & S. Sinharay (Eds.), *Handbook of Statistics, Volume 26: Psychometrics* (pp. 979–1030). Amsterdam, Netherlands: Elsevier.
2. Henson, R. and Douglas, J. (2005). [Test Construction for Cognitive Diagnosis](http://bit.ly/122gGb5). *Applied Psychological Measurement*, 29(4), 262–277.
3. de la Torre, J. (2011). The generalized DINA model framework. *Psychometrika*, 76, 179–199.
4. de la Torre, J., & Douglas, J. (2004). <i class="fa fa-file-pdf-o fa-1x"></i> [Higher-order latent trait models
for cognitive diagnosis](http://aliquote.org/pub/delatorre2004.pdf). *Psychometrika*,
69, 333–353. 
5. de la Torre, J. (2009). DINA model and parameter estimation: A didactic. *Journal of Educational and Behavioral Statistics*, 34, 115–130.
6. Huebner, A. (2010). <i class="fa fa-file-pdf-o fa-1x"></i> [An overview of recent developments in cognitive diagnostic computer adaptive assessments](http://pareonline.net/pdf/v15n3.pdf).*Practical Assessment, Research & Evaluation*, 15(3).
7. Junker, B. and Sijtsma, K. (2001). <i class="fa fa-file-pdf-o fa-1x"></i> [Cognitive assessment models with few assumptions, and connections with nonparametric IRT](http://www.stat.cmu.edu/~brian/apm/np-cog4.pdf). *Applied Psychological Measurement*, 25, 258–272.
8. Templin, J. and Henson, R. (2006). Measurement of psychological disorders using cognitive diagnosis models. *Psychological Methods*, 11, 287–305. (<i class="fa fa-file-pdf-o fa-1x"></i> [slides](http://jtemplin.coe.uga.edu/files/presentations/jtemplin_ku2005.pdf))
9. Fischer, G.H. and Formann, A.K. (1982). [Some applications of logistic latent trait models with linear constraints on the parameters](http://bit.ly/U79zrk). *Applied Psychological Measurement*, 6(4), 397-416.
10. De Boeck, P. and Wilson, M. (2004). *Explanatory Item Response Models. A Generalized Linear and Nonlinear Approach*. Springer
11. Poinstingl, H. (2009). [The linear logistic test model (LLTM) as the methodological foundation of item generating rules for a new verbal reasoning test](http://bit.ly/U77njF). *Psychology Science Quarterly*, 51(2), 123–134.
12. MacDonald, G. and Kromrey, G. (2011). [Linear Logistic Test Model: Using SAS® to Simulate the Decomposition of Item Difficulty by Algorithm, Sample Size, Cognitive Component and Time to Convergence](http://bit.ly/UOiul0). SESUG, Paper ST-13.
13. Rijmen, F. and de Boeck, P. (2002). [The Random Weights Linear Logistic Test Model](http://bit.ly/U7c50V). *Applied Psychological Measurement*, 26(3), 271–285.
14. DeCarlo, L.T. (2012). Recognizing uncertainty in the Q-matrix via a Bayesian extension of the DINA model. *Applied Psychological Measurement*, 36(6), 447–468.
15. Junker, B.W. and Sijtsma, K. (2001). [Cognitive Assessment Models With Few Assumptions, and Connections With Nonparametric Item Response Theory](http://bit.ly/VKu7Md). *Applied Psychological Measurement*, 25(3), 258–272.
