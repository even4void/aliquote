---
title: "Bayesian analysis with Python"
date: 2010-06-27T12:00:12+01:00
draft: false
tags: ["python", "bayesian"]
categories: ["2010"]
---

Aside from my previous post on carrying out [Bayesian analysis with R](/post/bayesian-analysis-with-r), here is an illustration on a Hierarchical Poisson failure rates from Clark and Gelfand,[^1] using Python and the [PyMC][PyMC] package.

The Python code is as simple as the R code, although it is obviously more object-oriented. The main part are highlighted below. These are in fact where we specify the prior distributions

```python
alpha0 = Exponential('alpha0', 1.0, value=1.)
beta0 = Gamma('beta0', alpha=0.1, beta=1.0, value=1.)
theta = Gamma('theta', alpha=alpha0, beta=beta0, value=ones(k))
```

Running the model amounts to:

```python
var_list = [alpha0, beta0, theta, y]
M = MCMC(var_list)
M.use_step_method(AdaptiveMetropolis, [alpha0, beta0])
M.isample(100000,burn=20000,thin=1,verbose=2)
Matplot.plot(M)
```

{{< fluid_imgs
  "pure-u-1-2|/img/20100627215508.png"
  "pure-u-1-2|/img/20100627215522.png" >}}


### Sidenote

As of June, the 27th, there are problem with the `gp` package (`gp_submodel.py` isn't in the source distribution, nor does it comes from the Universal installer through [pipy][pipy]). This is discussed on one [Google group][Google group] thread. I happened to setup a working version of PyMC by downloading the source from the [Github repository][Github repository] and compiling from scratch, with the following commands:

```
$ export LDFLAGS="-Wall -lgfortran -undefined dynamic_lookup -bundle -arch x86_64"
$ python setup.py config_fc --fcompiler gnu95 build
$ sudo python setup.py install
```


[^1]: Clark, J.S. and Gelfand, A. (2006). *Hierarchical modelling for the environmental sciences: statistical methods*. Oxford university Press.

[Bayesian analysis with R]: bayesian-analysis-with-R.html
[PyMC]: http://code.google.com/p/pymc/
[pipy]: http://pypi.python.org/
[Google group]: http://groups.google.com/group/pymc/browse_thread/thread/1585b7f9f33cf6d?pli=1
[Github repository]: http://github.com/pymc-devs/pymc
