---
title: "Fitting genetic models for twin studies"
date: 2011-12-10T17:58:11+01:00
draft: false
tags: ["statistics", "bioinformatics"]
categories: ["2011"]
---

In their 2008 paper entitled "Biometrical modeling of twin and family data using standard mixed model software",<sup>(1)</sup> [Sophia Rabe-Hesketh](http://www.gllamm.org/sophia.html) and coll. described a mixed-effects model approach to fitting ACE structural equation models to twin data using Stata [GLLAMM](http://www.gllamm.org/). This was also discussed in a recent [Stata meeting](http://www.stata.com/meeting/germany10/abstracts.html) that was held in Germany.

Other papers (not very exhaustive --- I have a lot more paper on my HD) dealing with the mixed-effects approach are listed in the bibliography section.

The *de facto* standard software has long been the [Mx](http://www.vcu.edu/mx/) software developed by Michael Neale, and the [Mx scripts Library](http://www.psy.vu.nl/mxbib/) holds a lot of example datasets and ready-to-run scripts. Now, the Mx software has been ported to R under the [OpenMx](http://openmx.psyc.virginia.edu/) project. I don't really like the syntax although it offers two types of model formulation: raw matrices and path specification (as I understand it, the matrix notation was kept for those already familiar with `Mx`, but maybe some models cannot be expressed using path diagrams).

Some implementations are also available in Mplus,<sup>(2,3)</sup> SAS,<sup>(4,5)</sup> or BUGS.<sup>(6)</sup> I don't use SAS so I cannot go through extensive review of available code. However, I should mention that I once brought one of their book: Saxton, A.M. (ed.) 2004. *Genetic Analyses of Complex Traits Using SAS*. Carry, NC: SAS Institute Inc. It has a lot of examples with `PROC MIXED`.

Stata 12 comes with a module for structural equation modeling (`sem`), but I hadn't find enough time to play with it and see how it compares to existing R packages (`sem`, `lavaan` or `OpenMx`). The UCLA server already has some good illusrtations of what's available in the new version, see [Problem Solving in Stata 12](http://www.ats.ucla.edu/stat/stata/seminars/stata12/). But, there are also some good examples of the use of the `sem` module here: <http://sites.google.com/site/ifarwf/home/stata-12-sem-package>. About the mixed-effects model approach, there is also an interesting [post on Stata blog](http://blog.stata.com/2011/09/28/multilevel-random-effects-in-xtmixed-and-sem-the-long-and-wide-of-it/).

I personally had the opportunity to test OpenMx against Mplus on a small dataset coming from a neuro-imaging study: Wright, I.C., Sham, P., Murray, R.M., Weinberger, D.R., and Bullmore, E.T. (2002). [Genetic Contributions to Regional Variability in Human Brain Structure: Methods and Preliminary Results](http://www-bmu.psychiatry.cam.ac.uk/PUBLICATION_STORE/wright02gen.pdf). *NeuroImage*, 17: 256-271.

The article describes univariate and bivariate ACE models, fitted using Cholesky decomposition, on brain and ventricles volumes. The results I got are summarized below:

```
Univariate/Brain
----------------
            A      C      E
Wright   0.66   0.22   0.12
OpenMx  0.753  0.199  0.048
Mx      0.620  0.331  0.048
Mplus   0.753  0.199  0.048


Bivariate/*1=Brain + *2=Ventricle
---------------------------------
            A1/A2         C1/C2         E1/E2
Wright    0.67/0.03     0.20/0.46     0.11/0.49  (sum sf + cf)
OpenMx   0.779/0.000   0.176/0.537   0.046/0.463
Mx       0.657/0.021   0.299/0.591   0.045/0.388
```

<small>(Unless I made some mistake, OpenMx and Mx yielded different results, although for univariate ACE model OpenMx and Mplus outputs were identical.)</small>

### References

1. Rabe-Hesketh, S., Skrondal, A., and Gjessing, H.K. (2008). [Biometrical modeling of twin and family data using standard mixed model software](http://onlinelibrary.wiley.com/doi/10.1111/j.1541-0420.2007.00803.x/abstract). *Biometrics*, 64(1): 280-288.
2. Muthén B., Asparouhov T., and Rebollo I. (2006). [Advances in behavioral genetics modeling using Mplus: Applications of factor mixture modeling to twin data](http://www.statmodel.com/download/TRHG-Muthen.pdf). *Twin Research and Human Genetics*, 9(3): 313-24.
3. Prescott (2004). [Using the Mplus Computer Program to Estimate Models for Continuous and Categorical Data from Twins](http://www.statmodel.com/download/BG-Prescott2004.pdf). *Behavior Genetics*, 34(1): 17-40.
4. Zheng, M. (2009). [A Biometric Analysis of Twin Data Using PROC MIXED](http://www.wuss.org/proceedings09/09WUSSProceedings/papers/pos/POS-Zheng.pdf). WUSS Conference. 
5. Feng, R., Zhou, G., Zhang, M., and Zhang, H. (2009). [Analysis of twin data using sas](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2700843/). *Biometrics*, 65(2): 584–589.
6. van den Berg, S., Beem, L., and Boomsma, D.I. (2006). [Fitting genetic models using Markov Chain Monte Carlo algorithms with BUGS](http://www.atypon-link.com/AAP/doi/pdf/10.1375/twin.9.3.334?cookieSet=1). *Twin Research and Human Genetics*, 9(3): 334–342.
7. McArdle, J. and Prescott, C.A. (2005). [Mixed-effects variance components models for biometric family analyses](http://www.springerlink.com/content/gjj5t61672305qh6/). *Behavior Genetics*, 35(5): 631-652.
8. McArdle J. (2006). [Latent curve analyses of longitudinal twin data using a mixed-effects biometric approach](http://www.ncbi.nlm.nih.gov/pubmed/16790145). *Twin Research and Human Genetics*, 9(3): 343-359.
9. Ozaki, K. (2008). [Twin Analysis on Paired Comparison Data](http://www.springerlink.com/content/h715w093g171k650/). *Behavior Genetics*, 38(2): 212-222.
