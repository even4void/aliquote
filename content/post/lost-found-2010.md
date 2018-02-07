+++
title = "lost+found 2010"
description = ""
date = 2011-01-01T20:20:45+01:00
draft = false
tags = ["misc"]
categories = []
+++

Mostly draft versions of never ending blog posts...

<!--more-->

## Weighted vs. simple summated scale scores

I just ran across this abstract:
Weighted index explained more variance in physical function than an additively scored functional comorbidity scale, from Resnik, L., Gozalo, P., and Hart, D.L., in press in *Journal of Clinical Epidemiology*

> **Objective** 1) examine association between the Functional Comorbidity Index (FCI) and discharge functional status (FS); 2) examine impact of FCI on FS when added to comprehensive models; and 3) compare additive FCI with weighted FCI and list of condition variables (list). **Study Design and Setting** Patients were drawn from Focus On Therapeutic Outcomes, Inc. (FOTO) database (1/1/06–12/31/07). FS collected using computer adaptive tests. Linear regression examined association between FCI and FS. Three methods of including functional comorbidities (FC) were compared. **Results** Relationship between FCI and FS varied by group (range, 0.02–0.9). Models with weighted index or list had similar R2. Weighted FCI or list increased R2 of crude models by &lt;0.01 for cervical, shoulder, and lumbar; by 0.01 for wrist/hand, knee, and foot/ankle; by 0.02 for hip; by 0.03 for elbow; and by 0.08 for neurological. Addition of FCI to comprehensive models added &lt;0.01 to R2 (all groups). Weighted FCI increased R2 by &lt;0.01 for cervical, lumbar, and shoulder; by 0.01 for wrist/hand, hip, knee, and foot/ankle; by 0.02 for elbow; and by 0.04 for neurological; whereas list increased R2 by &lt;0.01 for cervical, shoulder, and lumbar; by 0.01 for knee and foot/ankle; by 0.02 for elbow, wrist/hand, and hip; and by 0.05 for neurological. **Conclusion** List of comorbidities or weighted FCI is preferable to using additive FCI.


## Variations around the Lasso
<small>(October 2010)</small>

The [Lasso page](http://www-stat.stanford.edu/~tibs/lasso.html) contains most of what is needed to get started with lasso regression and technical details about L1-penalty. In what follows, I will just review some of the well-known applications of the Lasso and several case-specific derivations.

<u>TODO</u>: Applications in omics studies<sup>(10-12)</sup>

Some results support the idea that forward selection performs as well as the Lasso<sup>(6)</sup>, and the same authors have proposed the Forward-Lasso Adaptive SHrinkage (FLASH), based on the LARS algorithm.

It can be shown that the <i class="fa fa-file-pdf-o fa-1x"></i> [LARS algorithm](http://www-stat.stanford.edu/~hastie/Papers/LARS/LeastAngle_2002.pdf) yields the entire path of Lasso solutions. Quoting the Lasso page, the LARS algorithm basically reads:

1. Start with all coefficients b<sub>j</sub> equal to zero;
2. Find the predictor x<sub>j</sub> most correlated with y;
3. Increase the coefficient b<sub>j</sub> in the direction of the sign of its correlation with y. Take residuals r=y-ŷ along the way. Stop when some other predictor x<sub>k</sub> has as much correlation with r as x<sub>j</sub> has;
4. Increase (b<sub>j</sub>, b<sub>k</sub>) in their joint least squares direction, until some other predictor xm has as much correlation with the residual r;
5. Continue until: all predictors are in the model.

To get Lasso solutions, we just have to modify the above steps as follows: if a non-zero coefficient hits zero, remove it from the active set of predictors and recompute the joint direction.

- LARS is available in [biglars](http://cran.r-project.org/web/packages/biglars/index.html)
- [glmnet](http://cran.r-project.org/web/packages/glmnet/index.html) R package, with implementation detailed in the [Journal of Statistical Software](http://www.jstatsoft.org/v33/i01/)

### Group Lasso

The basic idea of Group Lasso<sup>(1-3)</sup> is to achieve shrinkage on block of covariates, that is some blocks of regression coefficients are exactly zero. Blockwise Sparse Regression<sup>(4)</sup> extends that idea to general loss functions and GLMs.

### Fused Lasso

- Matlab SLEP package<sup>(15)</sup>
- [cghFlasso](http://www-stat.stanford.edu/~tibs/cghFLasso.html), fused lasso for CGH data

### Graphical Lasso

- R [glasso](http://www-stat.stanford.edu/~tibs/glasso/index.html)
- Matlab code is available on [Mark Schmidt](http://www.cs.ubc.ca/~schmidtm/Software/code.html)'s webpage.


### References

1. Meier, L, van de Geer, S, and Bühlmann, P. (2008). <i class="fa fa-file-pdf-o fa-1x"></i> [The group lasso for logistic regression](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.156.7200&rep=rep1&type=pdf), *Journal of the Royal Statistical Society Series B*, 70, Part 1, 53-71.
2. Roth, V and Fischer, B (2008). <i class="fa fa-file-pdf-o fa-1x"></i> [The Group-Lasso for Generalized Linear Models: Uniqueness of Solutions and Efficient Algorithms](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.149.8295&rep=rep1&type=pdf). *Proceedings of the 25th International Conference on Machine Learning*, Helsinki, Finland.
3. Friedman, J, Hastie, T, and Tibshirani, R (2010). <i class="fa fa-file-pdf-o fa-1x"></i> [A note on the group lasso and a sparse group lasso](http://www-stat.stanford.edu/~tibs/ftp/sparse-grlasso.pdf).
4. Kim, Y, Kim, J, and Kim, Y (2006). [Blockwise sparse regression](http://www3.stat.sinica.edu.tw/statistica/password.asp?vol=16&num=2&art=3). *Statistica Sinica*, 16, 375-390
5. Bach, FR (2008). <i class="fa fa-file-pdf-o fa-1x"></i> [Consistency of the Group Lasso and Multiple Kernel Learning](http://www.di.ens.fr/~fbach/bach08b.pdf). *Journal of Machine Learning Research*, 9, 1179-1225.
6. Radchenko, P and James, GH (2009). <i class="fa fa-file-pdf-o fa-1x"></i> [Forward-LASSO with Adaptive Shrinkage](http://www-bcf.usc.edu/~gareth/research/flash.pdf).
7. Friedman, J, Hastie, T, and Tibshirani, R (2007). <i class="fa fa-file-pdf-o fa-1x"></i> [Sparse inverse covariance estimation with the graphical lasso](http://www-stat.stanford.edu/~jhf/ftp/glasso-bio.pdf). *Biostatistics*
8. Huang, J, Ma, S, and Zhang, C-H (2008). <i class="fa fa-file-pdf-o fa-1x"></i> [Adaptive lasso for sparse high-dimensional regression models](http://www3.stat.sinica.edu.tw/statistica/oldpdf/A18n420.pdf). Statistica Sinica, 18, 1603-1618.
9. Tibshirani, R. (1996). <i class="fa fa-file-pdf-o fa-1x"></i> [Regression shrinkage and selection via the lasso](https://www.statistik.tu-dortmund.de/fileadmin/user_upload/Lehrstuehle/Genetik/MW0910/Tibshirani1996.pdf). *Journal of the Royal Statistical Society Series B*, 58, 267–288.
10. Martinez, JG, Carroll, RJ, Müller, S, Sampson, JN, and Chatterjee, N (2009). [Empirical Performance of Crossvalidation with the Adaptive Lasso in a Genomics Context](http://iamcs.tamu.edu/file*dl.php?type=preprint&preprint*id=194). IAMCS.
11. Mutshinda, CM and Sillanpä, MJ (2010). <i class="fa fa-file-pdf-o fa-1x"></i> [Extended Bayesian LASSO for Multiple Quantitative Trait Loci Mapping and Unobserved Phenotype Prediction](http://www.genetics.org/cgi/rapidpdf/genetics.110.119586v1.pdf). *Genetics*, 
12. Krämer, N, Schäfer, J, and Boulesteix, A-L, (2009). [Regularized estimation of large-scale gene association networks using graphical Gaussian models](http://www.biomedcentral.com/1471-2105/10/384). BMC Bioinformatics, 10, 384.
13. Rinaldo, A (2008). <i class="fa fa-file-pdf-o fa-1x"></i> [Properties and Refinements of The Fused Lasso](http://www.stat.cmu.edu/~arinaldo/Papers_Posters/Rinaldo_Fused_Lasso.pdf).
14. Liu, J, Yuan, L, and Ye, J (2010). <i class="fa fa-file-pdf-o fa-1x"></i> [An Efficient Algorithm for a Class of Fused Lasso Problems](http://www.public.asu.edu/~jye02/Publications/Papers/rp589f-liu.pdf). KDD'10, July 25–28, 2010, Washington, DC, USA.
15. Tibshirani, R, Saunders, M, Rosset, S, Zhu, J, and Knight, K <i class="fa fa-file-pdf-o fa-1x"></i> [Sparsity and smoothness via the fused lasso](http://www-stat-class.stanford.edu/~tibs/ftp/fuse0.pdf).
16. Liu, J, Ji, S, and Ye, J (2010). <i class="fa fa-file-pdf-o fa-1x"></i> [SLEP: Sparse Learning with Efficient Projections](http://www.public.asu.edu/~jye02/Software/SLEP/manual.pdf).

## Medicine 2.0
<small>(December 2010)</small>

Back from the Medicine 2.0 conference held in Maastricht. I must admit this was not really what I expected to find (ePRO, CAT system, etc.), but it was nevertheless interesting to see what is actually headed under eHealth and how it applies in real study.

It appears that very few RCTs are carried out with truly distant intervention programs, but electronic coaching, especially in psychiatric or psychological follow-up, are increasingly in use, at least in the USA. What is striking is that numbers clearly show that there are more blacks or hispanics people that are actually using (or owning) a mobile device than white. I would have expected that socio-economic factors will moderate this difference nowadays, but this is apparently not the case. 


## Many ways to fit a Rasch model
<small>(December 2010)</small>

Here is a short memo on the many ways to fit a Rasch Model. After describing the two most commonly used Likelihood-based approaches (marginal and conditional), I shall move onto Bayesian models as implemented in the [MCMCpack](http://cran.r-project.org/web/packages/MCMCpack/index.html) and [DPpackage](http://cran.r-project.org/web/packages/DPpackage/index.html).

### Classical approaches: marginal and conditional approaches

Basically, omitting the joint ML approach (as in Lord<sup>(1)</sup> or the [Winsteps](http://www.winsteps.com/index.htm) software), we will consider two different ways of estimating parameters of a Rasch Model, namely maximizing of the marginal likelihood (MML) or conditional likelihood (CML).
Actually, I drafted a quick and dirty <i class="fa fa-file-pdf-o fa-1x"></i> [memo](http://www.aliquote.org/cours/psychometrics/ltm/ltm.pdf) some time ago, but it's in French and is roughly taken from Baker and Kim.<sup>(2)</sup> The bery brief idea are summarized in the following paragraphs.

Following the MML approach, as implemented in the [ltm](http://cran.r-project.org/web/packages/ltm/index.html) package, we assume that individual effects are random realizations taken from a population density, g(θ<sub>p</sub>|ψ). This density is characterized by a vector of parameters, ψ, from an unknown population, and that has to be estimated like the parameters of the fixed effects β<sub>i</sub>. The likelihood to be maximized looks like

$$ \ell_{\text{MML}}(\beta,\psi)=\prod_{p=1}^P\int_{-\infty}^{+\infty}\Pr(Y_{pi}=y_{pi}\mid\theta_p)g(\theta_p\mid\psi)d\theta_p. $$

Depending on the assumptions made on g(θ<sub>p</sub>|ψ), three approaches are available, namely a non-parametric, semi-parametric, and parametric approach. In most parametric settings,we consider an N(0;σ<sup>2</sup>) (σ unknown). In this case, the likelihood can be written as

$$ \ell(\beta,\sigma_\theta^2)=\prod_{p=1}^P\ell_p(\beta,\sigma_\theta^2)=\prod_{p=1}^P\int\Pr(y_p\mid\beta,\theta_p)\phi(\theta_p\mid 0,\sigma_\theta^2)d\theta_p, $$

where _l<sub>p</sub>_ denotes the contribution of person p to the marginal likelihood.

On the contrary, under the CML approach, subject-specific effects disappear from the likelihhod (hence the name "conditional") which now reads 

$$ \ell_{\text{CML}}(\beta)=\prod_{p=1}^P\Pr(Y_{p1}=y_{p1},\dots,Y_{pI}=y_{pI}\mid s_p), $$

and is maximized with repsect to β. The total score s<sub>p</sub> is a sufficient statistic for the specific person effect θ<sub>p</sub>. After conditioning, the probability of observing a given response pattern no longer depends on this effect, but only on the sufficient statistic. The [eRm](http://cran.r-project.org/web/packages/eRm/index.html) package offers many IRT models that are members of the Rasch family.

The disadvantage of this method is that it does not allow for any inference on the individuals, unless we consider item parameters as known values (after their estimation) and plug them into the joint likelihood.

<u>TODO</u>: See JSS issue 20

In their JSS paper, [Extended Rasch Modeling: The eRm Package for the Application of IRT Models in R](http://www.jstatsoft.org/v20/i09/paper), Patrick Mair and coll. clearly pointed to the advantages of using CML

### Mixed-effects logistic model

Doug Bates already illustrated the use of his [lme4](http://cran.r-project.org/web/packages/lme4/index.html) package to fit a Rasch Model. In fact, this is basically the way the marginal approach works. Again, the problem is merely from a conceptual point of view, namely that of treating person parameters as random effects as was discussed in the preceding section.

### Using Poisson regression

An example was already provided in Carstensen 2nd book series on Log-linear models (chapter xx).

### Estimation with MCMC

<u>TODO</u>: `MCMCirtKd`

### Estimation with Dirichlet

The semi-parametric Rasch model proposed by San Martin et al.<sup>(3)</sup> is shortly described in the online help for `DPMrasch()`. Well, I must admit I had a hard time to read it as is, so that, for convenience, I put it here with proper LaTeX formatting. Even after having that, I needed to resort the San Martin's article to understand the notation used therein.

$$ \eta_{ij}=\theta_i-\beta_j $$

with the following prior distributions

$$
\left\{\begin{array}{rcl}
\theta_i\mid G & \sim & \int\mathcal{N}(\mu;\sigma)G(d\mu, d\sigma)\\
\beta\mid \beta_0, S\beta_0 & \sim & \mathcal{N}(\beta_0;S\beta_0)\\
G\mid\alpha, G_0 & \sim & \text{DP}(\alpha G_0)
\end{array}\right.
$$

Independent hyperpriors are also given as

$$
\left\{\begin{array}{rcl}
\alpha\mid a_0,b_0 & \sim & \Gamma(a_0,b_0) \\
\mu_b\mid m_0, s_0 & \sim & \mathcal{N}(m_0;s_0) \\
\sigma_b^2\mid \tau_{b1}, \tau_{b2} & \sim & \Gamma(\tau_{b1|2},\tau_{b2|2}) \\
\tau_{k2}\mid \tau_{s1}, \tau_{s2} & \sim & \Gamma(\tau_{s1|2},\tau_{s2|2})
\end{array}\right.
$$

More details can be found in the corresponding <i class="fa fa-file-pdf-o fa-1x"></i> [JSS article](http://www.mat.puc.cl/~quintana/DPpackage.pdf) and <i class="fa fa-file-pdf-o fa-1x"></i> [R News](http://www.stat.sc.edu/~wangl/DPpackage-edited.pdf). In the meantime, I worked through the online example hich is based on simulated data with N=250 subjects and k=40 binary items.


<u>TODO</u>: 

- What is slice sampling? see p. 13
- `DPMraschpoisson` also available
- Also take a look at `pscl`

### References

1. Lord, F.M. (1980). _Applications of item response theory to practical testing problems_. Mahwah, NJ: Erlbaum.
2. Baker, F. B., & Kim, S.-H. (2004). _Item response theory: Parameter estimation techniques_ (2nd ed.). New York: Marcel Dekker.
3. San Martin, E., Jara, A., Rolin, J.-M., and Mouchart, M. (2009). <i class="fa fa-file-pdf-o fa-1x"></i> [On the Analysis of Bayesian Semiparametric IRT-type Models](http://www.stat.ucl.ac.be/ISpub/tr/2008/TR08029.pdf). In preparation.




## Fitting Rasch model with JAGS
<small>(December 2010)</small>

In a [recent post]({{< ref "/post/the-17th-annual-isoqol-conference.md" >}}), I talked about the idea of fitting IRT models within a Bayesian framework. Usually, this is done with the [BUGS](http://www.mrc-bsu.cam.ac.uk/bugs/) sofwtare. Here is an illustration of Rasch modelling with [JAGS](www-fis.iarc.fr/~martyn/software/jags/).

Let's consider the data on verbal aggression described by De Boeck and Wilson in _Explanatory Item Response Models_ (Springer, 2004). The data set is described pp. 7-10. It consists in 

Of note, the data are now available in the `lme4` package.

### Classical IRT approaches

There are many ways of estimating parameters from a Rasch model based on this data, and we shall concentrate on the marginal and conditional likelihood appraoch. The `ltm` and `eRm` packages implement these two methods, respectively. Note that a mixed-effects model will yield comparable results in the former case. 

### The Bayesian way

Let's now turn our attention to JAGS. I already post some notes on [Bayesian analysis with R]({{< ref "/post/bayesian-analysis-with-r.md" >}}), and the following steps are not very different. Basically, we need to specify our model, that is our prior distributions and starting values. As there is already a BUGS example included in the on-line documentation, let's look at it first:

```
model {
# Rasch model
   for (j in 1:N) {
      for (k in 1:T) {
         logit(p[j,k]) <- beta*theta[j] - alpha[k];
         r[j,k] ~ dbern(p[j,k]);
      }
      theta[j] ~ dnorm(0,1);
   }
# Priors
   for (k in 1:T) {
      alpha[k] ~ dnorm(0,0.0001);
      a[k] <- alpha[k] - mean(alpha[]);
   }
   beta ~ dnorm(0,0.0001) T(0,);
```

Clearly, the parametrization adopted here is (θ<sub>j</sub> - β<sub>k</sub>) for individual j responding to item k.

## Apache Mahout and Hadoop
<small>(December 2010)</small>

Today, I start playing with [Hadoop](http://hadoop.apache.org/) and [Mahout](http://mahout.apache.org/) which is a "scalable machine learning library that supports large data sets." Distributed computing has gained a large interest from the scientific community in these recent years, especially because of the ever growing amount of data that one has to proceed, from neuorimaging or genetics data to the analysis of social networks or media products.


### Distributed computing

[Distributed computing](http://en.wikipedia.org/wiki/Distributed_computing) is now widely used for solving complex tasks with huge data set, e.g. data mining, forecasting. I am particularly interested in its application in large-scale studies like the one commonly found in genome-wide association or gene screening applications. But this is definitively not the purpose of this post.

Some time ago, I read an interesting article about Xgrid on [MacResearch](http://www.macresearch.org/). Specifically, the author presented a complete example of running a [fasta job](http://www.macresearch.org/the_xgrid_tutorials_part_iii_running_batch_jobs) that will scan across all 23 chromosomes. According to Apple [ACG](http://www.apple.com/acg/) <i class="fa fa-chain-broken fa-1x"></i>, Xgrid

> allows almost anyone to easily run a set of calculations on many machines using machine-dependent parameters. You can keep your focus on the science and mathematics and not distract yourself learning the details of setting up a network of computers. You don't have to become a system administrator and set up user accounts and manage the network topology.


### What is Hadoop?

The Hadoop framework comes with core utilities and a distributed file system management ([HDFS](http://hadoop.apache.org/hdfs/)) which allows to create "multiple replicas of data blocks and distributes them on compute nodes throughout a cluster to enable reliable, extremely rapid computations." The core Hadoop essentially consists in a set of libraries and services for running jobs. Assuming you have a dedicated file system to store data I/O, Hadoop take care of launching and distributing jobs. A [Single Node Setup](http://hadoop.apache.org/common/docs/current/single_node_setup.html) is described on Hadoop website. I personally put it in `/usr/local/share/hadoop-install/hadoop-0.21.0` and symlinked it to hadoop for short. Then, I follow the instructions step by step.

The [map/reduce](http://en.wikipedia.org/wiki/MapReduce) paradigm was introduced by Google some years ago as a framework for distributed computing on large data sets. Using a large number of computers, or nodes, which altogether belong to a cluste_, the idea is to break a problem into small pieces that are distributed to these nodes that in turn can also address sub-problems to their coworkers. Upon completion, solutions can be sent back to the master node. So, the basic idea is that of the [divide and conquer](http://en.wikipedia.org/wiki/Divide_and_conquer_algorithm) principle. The [MapReduce documentation](http://hadoop.apache.org/mapreduce/docs/current/index.html) has some good tutorials to get starting with.

There are several other projects that are actually hosted under the Apache foundation, e.g., [Hive](http://hive.apache.org/) and [Pig](http://pig.apache.org/) to name a few. As of September 2010, they become "top-level" Apache projects. I shall discuss them in another post.


### About Mahout

Mahout has been released not so recently I guess, but I just discovered it! The goal of Mahout is to build scalable machine learning libraries. Scalable should be understood as a general purpose framework, with efficient algorithm and data structures for moderate to large data sets. Actually, it seems that the four main topics of Mahout are:

- Recommendation mining (infer from users' choice the best set of item that they might like)
- Clustering (identify related documents)
- Classification (assign to an unlabelled document its correct category)
- Frequent itemset mining (uncover relationships between items based on their frequency of co-occurences)

Isabel Drost, one of the cofounder of Mahout, has some online material which I found quite useful to get a first feeling of what Mahout might be good at; see e.g., [Apache Mahout Making data analysis easy](http://isabel-drost.de/hadoop/slides/devoxx.pdf) <i class="fa fa-chain-broken fa-1x"></i>. Of note, she's also actively involved in the [NoSQL](http://en.wikipedia.org/wiki/NoSQL) paradigm. 

The original work was decribed at NIPS'06 in the following paper: [Map-Reduce for Machine Learning on Multicore](http://www.cs.stanford.edu/people/ang//papers/nips06-mapreducemulticore.pdf) <i class="fa fa-chain-broken fa-1x"></i>. Actually, several [algorithms](https://cwiki.apache.org/confluence/display/MAHOUT/Algorithms) are available, including the one I am interested in, namely [Clustering](https://cwiki.apache.org/confluence/display/MAHOUT/K-Means+Clustering) (at the time of this writing, hierarchical clustering doesn't seem to be available yet) and [Random Forests](https://cwiki.apache.org/confluence/display/MAHOUT/Random+Forests). Interestingly, Mahout also features [collaborative filtering](http://en.wikipedia.org/wiki/Collaborative_filtering).[^1] I still have to figure out what the links with preference-based models in psychometrics, if any. In R, two packages are devoted to frequent itemsets: `arules` and `recommenderlab`


[^1]: A good review is available in "A Survey of Collaborative Filtering Techniques":http://www.hindawi.com/journals/aai/2009/421425.html (Advances in Artificial Intelligence, Volume 2009 (2009).
