---
title: "Ensemble Methods in Data Mining"
date: 2011-08-22T12:39:34+01:00
draft: false
tags: ["readings", "statistics"]
categories: ["2011"]
---

This is a short review of [Ensemble Methods in Data Mining](http://www.morganclaypool.com/doi/abs/10.2200/S00240ED1V01Y200912DMK002?journalCode=dmk), by G. Seni and J. Elder (Morgan & Claypool, 2010). I won't get over the whole textbook, but rather summarize the introductory chapter which provides a nice overview of how ensemble methods work and why they are interesting from a predictive perspective.

As it is well known, there is a large variety of DM algorithms whose predictive accuracy depends on the problem at hand. Choosing the right algorithm (we might even call this model selection, provided we were to test several of them one against the other) is then a matter of knowledge. However, "there is a way to improve model accuracy that is easier and more powerful than judicious algorithm selection: one can gather models into ensembles."

Useful references include:

- Michie, D., Spielgelhalter, D.J., and Taylor, C.C. (1994). [Machine Learning, Neural and Statistical Classification](http://www.amsta.leeds.ac.uk/~charles/statlog/). New York: Ellis Horwood.
- Elder, J.F. (1996). Heuristic search for model structure: The benefits of restraining greed. In D. Fisher & M. Lenz (Eds.), *Learning from Data: Artificial Intelligence and Statistics*, Chapter 13, New York: Springer-Verlag.
- Nisbet, R., Elder, J., and Miner, G. (2009). *Handbook of Statistical Analysis & Data Mining Applications*, Academic Press.<sup>(†)</sup>

and some papers by Leo Breiman that I listed in [another post]({{< ref "/post/visualizing-what-random-forests-really-do.md" >}}).

The essential steps in building ensemble models are (1) constructing varied models, and (2) combining their estimates. The first step can be seen as a way to introduce some kind of variety, or fluctuations, in model outputs, while the second step is a way to circumvent the decision of a single weak classifier by averaging over a collection of such decisions. Note that we do not need to use the same model, but different kind of classifiers might be combined. Here is another and more complete definition, by Nisbet et al.,<sup>(†)</sup> pp. 306-307:

> To build ensembles, you need to construct varied (and accurate enough) models and combine their estimates. There are five ways to generate variability, by modifying
> 
> 1. Case weights, as with boosting (real-valued weights) and bagging (integer weights);
> 2. Case values—adding noise to the input or output variable values;
> 3. Variable subsets (as with random forests, where each tree being built only considers for
> splitting a random subset—say, 10%—of the potential candidate inputs at any one node);
> 4. Guiding parameters (such as running an algorithm with different settings);
> 5. Modeling technique (e.g., tree, regression, MARS, neural network).
> 
> There are three ways to combine estimates, by using
> 
> 1. Estimator weights (perhaps based on estimated or training accuracy);
> 2. Voting (when the problem is predicting the best class);
> 3. Partitions of the design space (as with model gating, where different models take control
> depending on which input space region we are in).
> 
> In our estimate, the most common combination used is cross-validation and averaging,
> especially with decision trees. That is, building a model of one type on V different overlap- ping folds of the data and then averaging the resulting estimates. In our experience this (and other variations) are much more likely to help, rather than hurt, performance. 

The authors cite illustrative examples of ensemble methods: Bayesian model averaging which sums estimates of possible models, weighted by their posterior evidence; Bagging [1] where we bootstrap the training data set and the consider a majority vote or the average of model estimates; Random Forest [2,3] which adds a stochastic component to create more "diversity" among the trees being combined; AdaBoost [4] and ARCing [1] where models are built iteratively by varying case weights (up-weighting cases with large current errors and down-weighting those accurately estimated) and we use a weighted sum of the estimates of the sequence of models; Gradient Boosting [5,6] which extends the AdaBoost algorithm to a variety of error functions for regression and classification. Most of these algorithms are well explained in [The Elements of Statistical Learning](http://www-stat.stanford.edu/~tibs/ElemStatLearn/), by Hastie et al. Less well-known algorithms are the [Group Method of Data Handling](http://en.wikipedia.org/wiki/Group_method_of_data_handling) (GMDH) [7] and its successor, Polynomial Networks [8,9], where multiple layers of moderate-order polynomials fitted by linear regression are built by considering different variable sets to introduce variety. An early related method, [Stacking](http://machine-learning.martinsewell.com/ensembles/stacking/), was proposed by Wolpert [10].

Another important aspect in model inference is regularization. In effect, it is generally advisable to favor both accuracy (of predictions) and simplicity (of the model) although there is a tradeoff between the two: a flexible model will yield a higher accuracy but at the expense of possibly overfitting the data, hence have poor generalizability performance. Regularization offers a solution by penalizing model complexity through an error function that depends on the number of parameters in the model. Common examples of such regularization techniques are the [Lasso](http://www-stat.stanford.edu/~tibs/lasso.html) [11], which inherits from Breiman's work on the nonnegative Garotte estimator [12], or the [LARS](http://en.wikipedia.org/wiki/Least-angle_regression) algorithm [13]. Another one is the Path Seeker algorithm [14] which allows for a Lasso penalty with other loss functions. Likewise, the Generalized Path Seeker algorithm [15] extends the Elastic Net criterion [16] for producing sparse solution to non-convex problems.

The conclusion of all studies done in this field of research is that generally "bundling competing models into ensembles improves generalization." The use of Generalized Degrees of Freedom [17], which is an empirical measure of the flexibility of the models, allows to derive a measure of complexity showing that ensembles are simpler than the sum of their components. (More to read in Chapter 6.)

### References

1. Breiman, L. (1996). Bagging predictors. *Machine Learning*, 26(2): 123-140.
2. Ho, T.K. (1995). Random Decision Forests. 3rd Intl. *Conference on Document Analysis and Recognition*, 278-282.
3. Breiman, L. (2001). *Random Forests, random features*. Berkeley: University of California.
4. Freund, Y. and Shapire, R.E. (1996). Experiments with a new boosting algorithm. *Machine Learning: Proceedings of the 13th International Conference*, 148-156.
5. Friedman, J. (1999). *Stochastic Gradient Boosting*. Statistics, Stanford University.
6. Friedman, J. (2001). Greedy function approximation: the gradient boosting machine. *Annals of Statistics*, 29(2): 1189-1232.
7. Ivakhenko, A.G. (1968). The group method of data handling–A rival of the method of stochastic approximation. *Soviet Automatic Control*, 3: 43-71.
8. Barron, R.L., Mucciardi, A.N., Cook, A.N., Craig, J.N., and Barron, A.R. (1984). Adaptive learning networks: Development and application in the United States of algorithms related to GMDH. In *Self-Organizing Methods in Modeling: GMDH Type Algorithms*, S.J. Farlow (ed.), pp. 25-65. New York: Marcel Dekker.
9. Elder, J.F. and Brown, D.E. (2000). Induction and polynomial networks. In *Network Models for Control and Processing*. M.D. Fraser (ed.), pp. 143-198. Portland: Intellect.
10. Wolpert, D. (1992). Stacked Generalization. *Neural Networks*, 5: 241-259.
11. Tibshirani, R. (1996). Regression shrinkage and selection via the lasso. *Journal of the Royal Society B*, 58: 267-288.
12. Breiman, L., Friedman, J.H., Olshen, R., and Stone, C. (1993). *Classification and Regression Trees*. Chapman & Hall/CRC.
13. Efron, B., Hastie, T., Johnstone, I., and Tinshirani, R. (2004). Least Angle Regression. *Annals of Statistics*, 32(2): 407-499.
14. Friedman, J. and Popescu, B.E. (2004). *Gradient directed regularization for linear regression and classification*. Statistics, Stanford University.
15. Friedman, J.H. (2008). *Fast sparse regression and classification*. Statistics, Stanford University.
16. Zou, H. and Hastie, T. (2005). Regularization and Variable Selection via the Elastic Net. *SIAM workshop on Variable Selection*. Newport Beach, CA.
17. Ye, J. (1998). On measuring and correcting the effects of data maining and model selection. *Journal of the American Statistical Association*, 93(441): 120-131.
