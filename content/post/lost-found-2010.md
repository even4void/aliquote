+++
title = "lost+found 2010"
description = ""
date = 2011-01-01T20:20:45+01:00
draft = false
tags = ["misc"]
categories = []
+++

Mostly draft versions of never ending blog posts...

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
