---
title: "Python for statistical computing"
date: 2011-02-07T21:26:26+01:00
draft: false
tags: ["python", "statistics"]
categories: ["2011"]
---

Pursuant on my previous post on the use of Lisp for statistical computing, here are some links for statistics with Python. Most of the packages listed hereafter have been grabbed on [stats.stackexchange.com](http://stats.stackexchange.com) and [MetaOptimize](http://metaoptimize.com/qa/).

The two core packages obviously are [NumPy](http://numpy.scipy.org/) and [SciPy](http://scipy.org/), which provides infrastructure for handling N-dimensional array object, tools for doing numerical stuff à la Matlab. Combined to [Matplotlib](http://matplotlib.sourceforge.net/), we have a complete scientific numerical platform. The `SciPy` package already includes some common routines for statistical analysis, but see the [Cookbook](http://scipy.org/Cookbook) which collates some worked examples of commonly-done tasks.

The cool thing is that we can benefit from R built-in commands by just using [RPy](http://rpy.sourceforge.net/), but see, e.g., [Using Python (and R) to calculate Linear Regressions](http://www2.warwick.ac.uk/fac/sci/moac/students/peter_cock/python/lin_reg).

Other packages of interest:

- [pandas](http://code.google.com/p/pandas/) (Pythonic cross-section, time series, and statistical analysis), is a set of fast NumPy-based data structures optimized for panel, time series, and cross-sectional data analysis, with an emphasis on econometric applications.
- [larry](http://pypi.python.org/pypi/la/0.1.0), provides labelled arrays + additional functions, such as such as movingsum, ranking, merge, shuffle, zscore, demean, ...
- [python-statlib](http://code.google.com/p/python-statlib/), provides basic descriptive statistics for the python programming language.
- [scikits.statsmodels](http://statsmodels.sourceforge.net/), implements common statistical model (OLS/GLS, GLM, M-estimators, etc.). I really like this package, the syntax is clean and it feels like we didn't leave R.
- [scikits.learn](http://scikit-learn.sourceforge.net/), is a full-featured toolbox for machine learning (under active development), with a pretty nice documentation; it actually includes some common techniques for supervised learning with penalization/regularization methods (classification and regression).
- [PyMC](http://code.google.com/p/pymc/), is useful for bayesian estimation using MCMC methods and offers nice plotting utilities, in addition to its core set of algorithms for estimation of Bayesian models.
- [Theano](http://deeplearning.net/software/theano/), provides a library that allows you to define, optimize, and evaluate mathematical expressions involving multi-dimensional arrays efficiently.
- [mlpy](https://mlpy.fbk.eu/), another ML library for preprocessing, clustering, predictive classification, regression and feature selection.
- [Bolt](https://github.com/pprett/bolt) (Bolt Online Learning Toolbox), features discriminative learning of linear predictors (e.g. SVM or Logistic Regression) using fast online learning algorithms. Bolt is aimed at large-scale, high-dimensional and sparse machine-learning problems. In particular, problems encountered in information retrieval and natural language processing.
- [MDP](http://pypi.python.org/pypi/MDP/2.6) (Modular toolkit for Data Processing), provides a library of widely used data processing algorithms that can be combined according to a pipeline analogy to build more complex data processing software. Implemented algorithms include Principal Component Analysis (PCA), Independent Component Analysis (ICA), Slow Feature Analysis (SFA), and many more.
- [PyMVPA](http://www.pymvpa.org/), another package for ML and pattern classification analyses of large datasets, applied to neuroimaging studies.
- [PyML](http://pyml.sourceforge.net/), yet another ML library.
- [NLTK](http://www.nltk.org/), provides a set of utilities for dealing with linguistic data and documentation for research and development in natural language processing and text analytics.
  
Of course, there also are some full-featured application, like [Orange](http://orange.biolab.si/) that aims to provide a comparable interface to [Weka](http://www.cs.waikato.ac.nz/~ml) for machine learning and data mining. Another application that I discovered two years ago is [VisTrails](http://www.vistrails.org/index.php/Main_Page), which is

> an open-source scientific workflow and provenance management system developed at the University of Utah that provides support for data exploration and visualization. Whereas workflows have been traditionally used to automate repetitive tasks, for applications that are exploratory in nature, such as simulations, data analysis and visualization, very little is repeated---change is the norm. As an engineer or scientist generates and evaluates hypotheses about data under study, a series of different, albeit related, workflows are created while a workflow is adjusted in an interactive process. VisTrails was designed to manage these rapidly-evolving workflows.

Finally, [Mayavi](http://mayavi.sourceforge.net/) is great for data visualization, especially in 3D. It relies on [VTK](http://www.vtk.org/). It is included in the Enthought flavoured version of Python, together with [Chaco](http://code.enthought.com/chaco/) for 2D plotting. To get an idea, look at Travis Vaught's nice screencast in [Multidimensional Data Visualization in Python -- Mixing Chaco and Mayavi](http://travisvaught.blogspot.com/2009/08/multidimensional-data-visualization-in.html).

Useful enhanced shells for Python include [IPython](http://ipython.scipy.org/moin/), [IEP](http://code.google.com/p/iep/), [Spyder](http://packages.python.org/spyder/). And if you like syntax highlighting in your console, then [bpython](http://bpython-interpreter.org/) is just fine (and it works like a charm on OS X).
