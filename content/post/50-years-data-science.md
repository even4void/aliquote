---
title: "50 years of Data Science and a teaching program for future years"
date: 2018-06-02T17:05:01+02:00
draft: true
description: ""
tags: ["statistics"]
categories: []
---
I recently reread Kaplan's proposal to teach statistics to future statisticians, and if we trust the following two papers published in 2017, we should have a solid plan for teaching Data Science, or what it will be called in some years. I am no longer teaching, but I find this inspiring in any case.

<!--more-->

1. Donoho, D. (2017). [50 years of data science](https://www.tandfonline.com/doi/abs/10.1080/10618600.2017.1384734). *Journal of Computational and Graphical Statistics*, 26(4), 745–766.

    I am a bit late at reviewing this article, and it has been largely debated on Twitter in the past months. However, I feel like it is interesting to discuss this article first as it brings some context and appetizer for understanding Kaplan's plan.

    I like the fact that Donoho references former publications by John Tukey, who is often forgotten from beyond exploratory data analysis, but I was surprised to learn that the term "data science" was originally coined by William S. Cleveland no later than 2001 and by Jeff Wu in 1997. According to Jeff Wu in his 1997 [presentation on Data Science](http://www.isye.gatech.edu/∼jeffwu/Presentations/datascience.pdf) (PDF), statistical education should be more thoughly balanced between theoretical and applied statistics and other scientific fields, with a particular emphasis on large data (it is not yet called the big data era), bayesian priors, and computational algorithms. That all sounds good to me, but see how the second article below emphasizes those latter points.

    As a sidenote, Norman Matloff in [his own review](https://matloff.wordpress.com/2016/01/23/some-comments-on-donahos-50-years-of-data-science/) made an interesting point:

    > One topic I was surprised to see the essay omit was the fact that so much data today is not in the nice "rectangular" — observations in rows, variables in equal numbers of columns — form that most methodology assumes. 

    Indeed, it is time to realize that we can't think of large data, or even data at large, as well structured tabular entities like is the case of data frame. Paul Murrell discussed with particular care the variety of data sources, including XML and text input, in his book [Introduction to Data Technologies](https://www.stat.auckland.ac.nz/~paul/ItDT/).

2. Kaplan, D. T. (2017). [Teaching stats for data science](https://peerj.com/preprints/3205/). *PeerJ Preprints*, 5: e3205v1.

    So, what's the plan? Here are the ten building blocks that Kaplan believes are important to master

    1. Data tables
    2. Data graphics
    3. Model functions
    4. Model training
    5. Effect size and covariates 
    6. Displays of distributions 
    7. Bootstrap replication
    8. Prediction error
    9. Comparing models
   10. Generalization and causality


Then the question arises as to which software to use to teach statistics, or data science or whatever. R seems like a natural candidate, or the *de factor* language as it has been called for a long time.

There is also Python and its stack of data-oriented packages (Pandas, statmodels, scikit-learn, PyMC, etc.). 

In my view, Scala or Haskell are great for parallel computing or stream processing, and there are already reliable data structures built-in. However, I feel like they lack dedicated libraries for statistical computing and a motivated and vibrant community to develop such libraries. This is not to say that no one care about Scala or Haskell for data science. There are dozens of books that were already published on this topic and Darren Wilkinson wrote [great posts](https://darrenjw.wordpress.com) and evene organized [workshops](https://github.com/darrenjw/scala-course) on Scala specifically.

What about Clojure or some variant of Scheme like Racket? Wait, but what?

Clojure MXnet
Clojure neanderthal
