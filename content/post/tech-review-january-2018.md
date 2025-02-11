+++
title = "Tech Review / January 2018"
date = 2018-01-19T01:18:24+01:00
draft = false
tags = ["readings", "review"]
categories = ["2018"]
+++

What's up on the internet in January?

<!--more-->

[Learning with Privacy at Scale](https://machinelearning.apple.com/2017/12/06/learning-with-privacy-at-scale.html)
This one is taken from the Apple ML Journal. Basically, the article deals with local differential privacy which refers to the anonymization of personal data on the local computer directly, and not on the server (i.e., after the data have been uploaded). I was pleased to learn that everything is done in order to ensure that this does not impact the device bandwidth (I already know that we can opt in or not). In fact, Apple uses anonymized targeted events (e.g., user typing an emoji or listening to an audio file) that are transferred daily; IP information is removed once data reach the Apple restricted-access server, where aggregated statistics are computed and random samples of individual records are post-processed using dedicated algorithms.

[The challenge of verification and testing of machine learning](http://www.cleverhans.io/security/privacy/ml/2017/06/14/verification.html)

Google chat is dead, Google hangouts are not that fun, so let's get back to good old IRC! In the meantime, I discovered the [matrix](https://matrix.org) project.

Machine learners, beware: You probably need a [much larger sample size](http://www.fharrell.com/post/ml-sample-size/) than you think (see also this [BMC article](https://bmcmedresmethodol.biomedcentral.com/articles/10.1186/1471-2288-14-137), by Steyerberg and coll.), and we may find "seven tasks which are beyond reach of current machine learning systems and which have been accomplished using the tools of causal modeling", according to Judea Pearl in his [latest arXived paper](https://arxiv.org/abs/1801.04016).

The authors of the great "[Mining of Massive Datasets](http://www.mmds.org/)" are working on the third edition of their book. So far, they added a discussion on Spark and TensorFlow, as well as decision trees in their chapter on large scale machine learning (neural networks, support vector machines, k-nearest neighbors and kernel regression).

[Fossil](https://www.fossil-scm.org/index.html/doc/trunk/www/index.wiki) is like Git or Mercurial but it also incorporate bug tracking (which is managed _via_ tickets) and event-level technical note that can appear anywhere in time. In [comparison to Git](https://www.fossil-scm.org/index.html/doc/trunk/www/fossil-v-git.wiki), all these features are contained in a single standalone executable with an SQLite backend to store all data and revision history. It is possible to use a [free hosting system](http://chiselapp.com) or to set up a [standalone server](https://www.fossil-scm.org/index.html/doc/trunk/www/server.wiki).

[TablePlus](https://tableplus.io) is a [modern, native tool for relational database](https://tableplus.io/blog/2017/12/modern-native-tool-for-relational-database.html). It is compatible with major SQL system (MySQL, PostgreSQL, SQLite) and it features a query editor and a table viewer. Also note that a new version is released every week. It looks like a great alternative to existing solutions on a Mac (which are often limited to one backend if they are not paid app).

For bayesian modeling, in addition to the existing packages [RStan](http://mc-stan.org/users/interfaces/rstan) and [rjags](https://cran.r-project.org/web/packages/rjags/), there is now [brms](https://cran.r-project.org/web/packages/brms/) and [greta](https://cran.r-project.org/web/packages/greta/). The brms package relies on Stan and its approach is nicely summarized in the Journal of Statistical Software [vol 80 2017](https://www.jstatsoft.org/article/view/v080i01) while [greta](https://goldingn.github.io/greta/) uses Google [TensorFlow](https://www.tensorflow.org) and uses "more conventional" R syntax.

[A Course in Machine Learning](http://ciml.info) is a nicely illustrated textbook on ML where the author discusses various techniques (nearest neighbors, naive Bayes, linear and logistic regression, neural networks) and the underlying algorithms. Of note, this book was written in LaTeX using a highly customized [Tufte class](https://tufte-latex.github.io/tufte-latex/). It's a pity that the margin illustrations were not done the XKCD way :-)

[Client-Side Web Development](https://info343.github.io)
An online course that looks really nice.
{{< x user="mf_viz" id="953352029778280449" >}}

[Programming Design Systems](https://programmingdesignsystems.com)
A free digital book that teaches a practical introduction to the new foundations of graphic design. By Rune Madsen. The chapter on [geometric composition](https://programmingdesignsystems.com/layout/a-short-history-of-geometric-composition/index.html#a-short-history-of-geometric-composition-DvkJs3o) is really interesting for those who are versed in data visualization and [Trellis displays](http://ect.bell-labs.com/sl/project/trellis/display.examples.html).

After Meltdown and Spectre, it is probably time to revisit gold standards. Here is the story of [qmail](http://www.qmail.org/top.html): [Some thoughts on security after ten years of qmail 1.0](https://blog.acolyer.org/2018/01/17/some-thoughts-on-security-after-ten-years-of-qmail-1-0/amp/?__twitter_impression=true). And for the interested readers, go check [Dan Bernstein](http://cr.yp.to/djb.html)'s website directly; there really is serious work in computer science there, e.g. [Fast multiplication and its applications](http://cr.yp.to/lineartime/multapps-20080515.pdf).

[Luna](http://www.luna-lang.org) is a WYSIWYG data processing engine. It looks like an interesting app and I should probably take a more serious look at some point. There is a [book](https://luna-lang.gitbooks.io/docs/content/) (work in progress, [source](https://github.com/luna/luna-book) on GitHub), a [programming language](https://github.com/luna/luna) based on Haskell, and the [user app](https://github.com/luna/luna-studio).

**Interesting websites**: [Len Kiefer](http://lenkiefer.com) • [Thomas Mailund](https://www.mailund.dk) • [John D Cook](https://www.johndcook.com/blog/)
