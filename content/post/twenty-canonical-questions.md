---
title: "Twenty canonical questions in machine learning"
date: 2013-11-07T22:52:22+01:00
draft: false
tags: ["readings", "statistics"]
categories: ["2013"]
---

Here are twenty canonical questions when using "learning machines", according
to Malley and co-authors: Malley, JD, Malley, KG, and Pajevic, S, *Statistical Learning for Biomedical Data*, Cambridge University Press (2011).

1. Are there any over-arching insights as to why (or when) one learning
   machine or method might work, or when it might not?
2. How do we conduct robust selection of the most predictive features, and
   how do we compare different lists of important features?
3. How do we generate a simple, smaller, more interpretable model given a
   well fitting but much larger one that fits the data very well? That is,
   how do we move from an inscrutable, but highly predictive learning
   machine to a tiny, familiar kind of model? How do we move from an
   efficient black box to a simple open book?
4. Why does the use of a very large number of features, say 500K genetic
   expression values, or a million SNPs, very likely lead to massive
   overfitting? What exactly is overfitting and why is it a bad thing? How
   is it possible to do *any* data analysis when we are given 550,009
   features (or, 1.2 million features) and only 132 subjects?
5. Related to (4), how do we deal with the fact that a very large feature
   list (500K SNPs) may also nicely predict entirely random (permuted)
   outcomes of the original data; how can we evaluate any feature selection
   in this situation?
6. How do we interpret or define interactions in a model? What are the
   unforeseen, or the unwanted consequences of introducing interactions?
7. How should we do prediction error analysis, and get means or variances of
   those error estimates, for any single machine?
8. Related to (7), given that the predictions made by a pair of machines on
   each subject are correlated, how do we construct error estimate
   comparisons for the two machines?
9. Since unbalanced groups are a routine in biology, for example with 25
   patients and 250 controls
10. Can data consisting of a circle of red dots (one group) inside an outer
    circle of green dots (a second group) ever derive from a biologically
    relevant event? What does this say about simulated data?
11. How much data do we need in order to state that we have a good model and
    error estimates? Can classical
12. It is common that features are quite entangled, having high-order
    correlation structure among themselves. Dropping features that
    correlated with each other can be quite mistaken. Why is that? How can
    very weak predictors, acting jointly, still be highly predictive when
    acting together?
13. Given that several models can look very different but lead to nearly
    identical predictions, does it matter which model is chosen in the end,
    or, is it necessary to choose any single model?
14. Closely related to (13), distinct learning machines, and statistical
    models in general, can be combined into a single, larger and often
    better model, so what combining methods are mathematically known to be
    better than others?
15. How do we estimate the probability of any single subject being in one
    group or another, rather than making a pure (0,1) prediction: "Doctor,
    you say I will probably survive five years, but do I have a 58% chance
    of survival or an 85% chance?"
16. What to do with missing data occurring in 3% of 500K SNP dataset? In
    15.4% of the data? Must we always discard cases having missing bits here
    and there? Can we fill the missing bits and still get to sound inference
    about the underlying biology?
17. How can a learning machine be used to detect–-or define-–biologically
    or clinically important subsets?
18. Suppose we want to make predictions for continuous outcomes, like
    temperature. Can learning machines help here, too?
19. How is it that using parts of a good composite clinical score can be
    more predictive than the score itself?
20. What are the really clever methods that work really well on *all* data?


I must say I found these questions interesting, although the authors do not fully address some of them in this textbook (I mean they are merely put as guidelines to further study the field of ML for biomedical research, in my opinion). Anyway, I think starting an applied ML course with these questions might be very stimulating for people knowing nothing about large and imbalanced data set, overfitting, SVMs or Random Forests, etc.

I am currently reading *Applied Predictive Modeling* (hereafter, APM), by Max Kuhn and Kjell Johnson. This is a nice book, which serves as a good companion to their R package [caret](http://cran.r-project.org/web/packages/caret). I have been using this package for 4 years now, but I understand its architecture better now that I am progressing through APM chapters. Like *Statistical Learning for Biomedical Data*, the authors do not always provide an in-depth treatment of ML algorithms or statistical properties, but we feel confident that they really know what they are talking about, and the reader is gently explained why some methods are better suited than others, and what are the interest and limits of using specific predictive models to answer a specific research question.
