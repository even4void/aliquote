---
title: "Statistical Models for cross-classified data structures"
date: 2008-05-15T08:54:26+01:00
draft: false
tags: ["statistics"]
categories: ["2008"]
---

The following discussion aims at describing statistical tools used to estimate the parameters of multilevel models. It is derived from an article published in *Methodology*,<sup>(1)</sup> part of which is briefly extended with additional references and some applications in educational testing.

There are two main approaches to the estimation of statistical models for cross-classified data structures in the literature on multilevel models: [likelihood-based][likelihood-based] frequentist methods and [Markov Chain Monte Carlo][Markov Chain Monte Carlo], i.e. MCMC procedures, which are based on [Bayesian][Bayesian] statistics.<sup>(2)</sup>

The estimation of the parameters in multilevel modeling programs is usually carried out by likelihood-based frequentist methods that result in maximum likelihood (ML) estimates. These are:

- the iterative generalized least squares ([IGLS][IGLS]) method 
- the restrictive iterative generalized least squares (RIGLS) method 
- the expectation-maximization ([EM][EM]) algorithm

There exists specialized software for multilevel analysis, and probably the most widely used are: [MlwinN][MlwinN] and [HLM][HLM].[^1] The methods implemented in these programs are designed specifically for estimating hierarchical multilevel models, although they can be adapted to fit other models. For instance, models with crossed random effects can be estimated with ML using ordinary hierarchical multilevel models<sup>(8,9)</sup>. Likewise, the EM algorithm can be applied to cross-classified data<sup>(10)</sup>. ML estimates for cross-classified multilevel models can also be obtained within the framework of linear mixed-effects models<sup>(11)</sup>. This approach will be discussed in the next section, with an emphasis on the use of [SAS][SAS] and [R][R] for LME fitting. In contrast to the previous software, LME models are based on the specification of sizable design matrices, which require more computing time and may lead to estimation problems in complex data structures.

MCMC methods represent a different approach to the estimation of cross-classified multilevel models. They provide a very general, simulation-based approach that can be used to fit many more statistical models than ML procedures. A general overview of such capabilities and its implementation within the R framework is provided in [R News][R News], March 2006, but see also these [additional references]. For every model parameter, a prior distribution is determined that reflects the previous knowledge about the parameter. Based on the observed data, the posterior distribution, which is the analog to the likelihood function in the ML approach, is then determined. If a “non-informative” prior distribution is selected (i.e., we have only marginal previous knowledge about the parameter of interest), the likelihood function and the posterior distribution will be essentially the same.

Instead of using a relatively complex joint posterior distribution, which is in many cases analytically intractable, MCMC simulates the parameters from the conditional distributions, usually by means of Gibbs sampling<sup>(12)</sup> or Metropolis-Hastings sampling.<sup>(13)</sup> Again, dedicated software are available, e.g. [BUGS and WinBUGS][BUGS and WinBUGS], but see also this article on [Bayesian inference using BUGS][Bayesian inference using BUGS].

If the simulations of a conditional distribution converge to a stationary distribution, the single draws from the (conditional) distribution can be regarded as realizations of the posterior distribution that forms the central basis for statistical inference (for a detailed discussion of assessing convergence in MCMC, see (14). This procedure bears some resemblance to [bootstrapping][bootstrapping]<sup>(15)</sup>, which facilitates, by repeated sampling from the observed data, the determination of the empirical sampling distribution of a parameter of interest. For Bayesian results, the mean, median, or mode of the posterior distribution is used as a point estimate. Comparable to a confidence interval in the frequentist approach, the Bayesian credibility interval (BCI) is based on the 2.5th and the 97.5th percentile points of the posterior distribution.

In contrast to the ML approach, the MCMC method not only gives a point estimate and a standard error for every parameter, but also provides a distribution of the parameter (posterior distribution). The two approaches have now been compared in a number of studies. For instance, in (16) the authors showed that, relative to the MCMC method, ML has the tendency to underestimate the variance components, but that the performance difference between the two methods in terms of the bias of the fixed effects is negligible. Another crucial advantage of the MCMC method is that it can be easily generalized to fit more complex multilevel models that might not be estimable in a ML framework with the statistical software packages currently available.

### References

1. Lüdtke, O., Robitzsch, A., Trautwein, U., Kreuter, F., and Ihme, J.M. (2007). Are there Test Administrator effects in large-scale educational assessments? Using cross-classified multilevel analysis to probe for effects on mathematics achievement and sample attrition. *Methodology*, *3(4)*, 149-159.
2. Goldstein, H. (2003). *Multilevel Statistical Models* (3rd Ed.). London: Edward Arnold. See also this <a href="http://www.aliquote.org/memos/2008/02/16/applications-of-latent-trait-and-latent-class-models-in-the-social-sciences/">Note</a>.
3. Goldstein, H. (1989). Restricted unbiased iterative generalized least squares estimation. *Biometrika*, *76(3)*, 622-623.
4. del Pino, G. (1989). <a href="http://projecteuclid.org/DPubS/Repository/1.0/Disseminate?view=body&amp;id=pdf_1&amp;handle=euclid.ss/1177012408">The Unifying Role of Iterative Generalized Least Squares in Statistical Algorithms</a>. *Statistical Science*, *4(4)*, 394-403.
5. Björck, Å (1996). <a href="http://www.mai.liu.se/~akbjo/LSPbook.html">Numerical Methods for Least Squares Problems</a>. SIAM. 
6. Dear, K.B. (1994). Iterative generalized least squares for meta-analysis of survival data at multiple times. *Biometrics*, *50(4)*, 989-1002.
7. Díaz, M.M. and Ones, V.G. (2005). <a href="http://www.emis.de/journals/RCE/V28/V28_1_63MonteroGuerra.pdf">Estimating multilevel models for categorical data via generalized least squares</a>. *Revista Colombiana de Estadística*, *28(1)*, 63-76.
8. Goldstein, H. (1987). *Multilevel Models in Educational and Social Research*. London: Griffin.
9. Hox, J.J. (2002). *Multilevel Analysis: Techniques and Applications*. Mahwah, NJ: Erlbaum.
10. Raudenbush, S.W. (1993). A crossed random effects model for unbalanced data with applications in cross-sectional and longitudinal research. *Journal of Educational Statistics*, *18*, 321-349.
11. McCulloch, C.E. and Searle, S.R. (2001). *Generalized, Linear, and Mixed Models*. New York: Wiley.
12. Casella, G. and George, E.I. (1992). Explaining the Gibbs sampler. *The American Statistician*, *46*, 167-174.
13. Chib, S. and Greenberg, E. (1995). <a href="http://allman.rhon.itam.mx/~lnieto/index_archivos/Chib&amp;Greenberg1995.pdf">Understanding the Metropolis-Hastings algorithm</a>. *The American Statistician*, *49*, 327-335.
14. Cowles, M.K. and Carlin, B.P. (1996). <a href="http://www.public.iastate.edu/~alicia/stat544/rr94-008.pdf">Markov Chain Monte Carlo convergence diagnostics: A comparative review</a>. *Journal of the American Statistical Association*, *91*, 833-904.
15. Efron, B. and Tibshirani, R.J. (1993). *An introduction to the bootstrap*. New York: Chapman and Hall.
16. Browne, W.J. and Draper, D. (2006). <a href="http://ba.stat.cmu.edu/journal/2006/vol01/issue03/draper2.pdf">A comparison of Bayesian and likelihood-based methods for fitting multilevel models</a>. *Bayesian Analysis*, *3*, 473-514.

[^1]: Note that there are also other option to keep in line with more traditional software, e.g., [SAS](http://www.estat.us/id38.html) or SPSS.


[likelihood-based]: http://en.wikipedia.org/wiki/Likelihood_principle "Wikipedia"
[Markov Chain Monte Carlo]: http://en.wikipedia.org/wiki/Markov_Chain_Monte_Carlo "Wikipedia"
[Bayesian]: http://en.wikipedia.org/wiki/Bayesian_inference "Wikipedia"
[IGLS]: http://en.wikipedia.org/wiki/Iteratively_re-weighted_least_squares "Wikipedia"
[EM]: http://en.wikipedia.org/wiki/Expectation-maximization_algorithm "Wikipedia"
[MlwinN]: http://www.cmm.bristol.ac.uk/MLwiN/index.shtml
[HLM]: http://www.ssicentral.com/hlm/index.html
[SAS]: http://www.sas.com
[R]: http://cran.r-project.org
[R News]: http://cran.r-project.org/doc/Rnews/Rnews_2006-1.pdf
[additional references]: http://tolstoy.newcastle.edu.au/R/help/05/09/12589.html
[BUGS and WinBUGS]: http://www.mrc-bsu.cam.ac.uk/bugs/
[Bayesian inference using BUGS]: http://citeseer.ist.psu.edu/298379.html
[bootstrapping]: http://en.wikipedia.org/wiki/Bootstrapping_%28statistics%29 "Wikipedia"