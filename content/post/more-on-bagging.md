+++
title = "More on bagging"
description = ""
date = 2011-03-20T17:39:19+01:00
draft = false
tags = ["readings", "statistics"]
categories = []
+++

Last day, I was reading some entries in the new *Encyclopedia of Machine Learning* (Springer, 2011), and I stumble upon the one on *bagging* (which is itself helded under the "ensemble learning" tag) which provides a very clean overview of bagging and ensemble learning methods.

If you don't know the principle of this handbook, it just basically aims at offering a thorough overview of ML and AI-related techniques. Curiously, I didn't found any single definition of Machine Learning *per se*. <i class="fa fa-file-pdf-o fa-1x"></i> [Ensemble learning](http://www.cs.man.ac.uk/~gbrown/research/brown10ensemblelearning.pdf) techniques (PDF) were nicely reviewed by [Gavin Brown](http://www.cs.man.ac.uk/~gbrown/). Another instructive paper from the author is: <i class="fa fa-file-pdf-o fa-1x"></i> [Managing Diversity in Regression Ensembles](http://jmlr.csail.mit.edu/papers/volume6/brown05a/brown05a.pdf), JMLR (2005) 6: 1621-1650.

Applied to a regression or classification context, the general idea of bagging, or more generally of ensemble methods, is rather simple:

> Ensemble learning refers to the procedures employed to train multiple learning machines and combine their outputs, treating them as a “committee” of decision makers. The principle is that the decision of the committee, with individual predictions combined appropriately, should have better overall accuracy, on average, than any individual committee member. 

At a more abstract level,

> The study of ensemble methods, with model outputs considered for their abstract properties rather than the specifics of the algorithm which produced them, allows for a wide impact across many fields of study. If we can understand precisely why, when, and how particular ensemble methods can be applied successfully, we would have made progress toward a powerful new tool for Machine Learning: the ability to automatically exploit the strengths and weaknesses of different learning systems.

Several algorithms are then described, including Adaboost, bagging, boosting, mixture of experts, before discussing some more theoretical perspectives, namely "ensemble diversity" where the central idea is quoted below:

> The optimal “diversity” is fundamentally a credit assign- ment problem. If the committee as a whole makes an erroneous prediction, how much of this error should be attributed to each member? More precisely, how much of the committee prediction is due to the accuracies of the individual models, and how much is due to their interactions when they were combined? We would ide- ally like to reexpress the ensemble error as two distinct components: a term for the accuracies of the individ- ual models, plus a term for their interactions, i.e., their diversity.

Finally, the following article offers a good review of eight supervised ML techniques (SVM, ANN, Logistic Regression, Naive Bayes, KNN, RF, Decision Trees, and Bagged Trees):
Caruana, R. and Niculescu-Mizil, A. (2006). <i class="fa fa-file-pdf-o fa-1x"></i> [An empirical comparison of supervised learning algorithms](http://www.cs.cornell.edu/~caruana/ctp/ct.papers/caruana.icml06.pdf). In Proceedings of the *23rd international conference on machine learning* (pp. 161-168). New York: ACM.


I was also lucky enough to find <i class="fa fa-file-pdf-o fa-1x"></i> [Combining Pattern Classifiers, Methods and Algorithms](http://goo.gl/whCku), by Kuncheva (2004). 

I then decided to fetch some papers from [citeseerx](http://citeseerx.ist.psu.edu/); this includes:

- Rodríguez, J.J., Kuncheva, L.I., and Alonso, C.J. (2006). [Rotation Forest: A New Classifier Ensemble Method](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.156.8277). *IEEE Transactions on Pattern Analysis and Machine Intelligence*, 28(10): 1619-1630.
- Meinshausen, N. (2006). [Quantile Regression Forests](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.61.6174). *Journal of Machine Learning Research*, 7, 983–999. But see the quantregForest R package
- Bauer, E. and Kohavi, R. (1999). [An empirical comparison of voting classification algorithms: Bagging, boosting, and variants](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.33.353). *Machine Learning*, 36(1/2): 105-139. 
- Cohen, I., Tian, Q., Zhou, X.S., and Huang, T.S. [Feature Selection Using Principal Feature Analysis](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.20.974).
