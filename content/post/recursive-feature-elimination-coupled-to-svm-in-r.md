+++
title = "Recursive feature elimination coupled to SVM in R"
date = 2011-05-22T12:42:15+01:00
draft = false
tags = ["rstats", "statistics","bioinformatics"]
categories = ["2011"]
+++

I recently wondered whether it is possible to apply Recursive Feature Selection with SVM in R.

<!--more-->

RFE+SVM is well described in the litterature. It has originally been proposed by Guyon and coworkers for gene selection, in [Gene Selection for Cancer Classification using Support Vector Machines](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.70.9598&rep=rep1&type=pdf) (*Machine Learning* (2002) 46(1)3), 389-422). Here are two more recent papers that show application of RFE+SVM in a similar context and discuss its performance as a wrapper method for feature selection:

1. Niijima, S. and Kuhara, S. (2006). [Recursive gene selection based on maximum margin criterion: a comparison with SVM-RFE](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC1790716/). *Bioinformatics*, 7: 543.
2. Ding, Y. and Wilkins, D. (2006). [Improving the Performance of SVM-RFE to Select Genes in Microarray Data](http://www.biomedcentral.com/1471-2105/7/S2/S12). *BMC Bioinformatics*, 7(Supp. 2): S12.

I discovered the [pathClass](http://cran.r-project.org/web/packages/pathClass/) package, that implements standard RFE+SVM and reweighted RFE described in 
Johannes, M., Brase, J.C. Fröhlich, H., Gade, S., Gehrmann, M., Fälth, M., Sültmann, H., and Beißbarth, T. (2010). [Integration of pathway knowledge into a reweighted recursive feature elimination approach for risk stratification of cancer patients](http://bioinformatics.oxfordjournals.org/content/26/17/2136.abstract). *Bioinformatics*, 26(17): 2136–2144.

It relies on [kernlab](http://cran.r-project.org/web/packages/kernlab/), which is pretty good because it supports a larger set of kernel functions and is well maintained. Also, [Alex Smola](http://alex.smola.org/), who co-authored the package, has written with B. Schölkopf an awesome reference textbook[^1] on *Learning with Kernels* (MIT Press, 2002, see [Chapter 1](http://www-connex.lip6.fr/~amini/RelatedWorks/svm_intro.pdf) for an overview).

From the vignette, here is an example of use on a 72 x 7129 dataset where the outcome is AML (n=25) or ALL (n=47) in the Golub study [1].

```r
library(pathClass)
library(golubEsets)
data(Golub_Merge)
y <- pData(Golub_Merge)$ALL
x <- exprs(Golub_Merge)
x <- t(x)

res.rfe <- crossval(x, y, DEBUG=TRUE, theta.fit=fit.rfe, folds=10,
                    repeats=5, parallel=TRUE, Cs=10^(-3:3))
extractFeatures(res.rfe, toFile=FALSE)
plot(res.rfe, toFile=FALSE)
```

The `crossval()` function above performs 10-fold cross-validation (repeated 5 times) using RFE for feature selection. Be careful: It is rather long! Also, please note that we didn't use the graph structure for features connectivity (protein-protein interactions), nor did we take advantage of annotation facilities in R (i.e., for mapping probe set ID to protein ID). 

The ROC curve of the AUC for each repeat is shown below:

![rfe](/img/20110522202556.png)

And here are the top 15 genes retained by the feature selection procedure:

![rfe2](/img/20110522202544.png)

More information can be found in the vignette, [pathClass: SVM-based classification with prior knowledge on feature connectivity](http://cran.r-project.org/web/packages/pathClass/vignettes/pathClass.pdf).

By the way, I just discovered that HarlanH provided very [nice code](https://gist.github.com/937821) for displaying classification results.

### References

1. Golub, T.R., Slonim, D.K., Tamayo, P., Huard, C., Gaasenbeek, M., Mesirov, J.P., Coller, H., Loh, M.L., Downing, J.R., Caligiuri, M.A., Bloomfield, C.D., and Lander, E.S. (1999). [Molecular Classification of Cancer: Class Discovery and Class Prediction by Gene Expression Monitoring](http://www.sciencemag.org/content/286/5439/531.abstract), *Science*, 531-537.

[^1]: Another textbook I like is Bakir, G.H., Hofmann, T., Schölkopf, B., Smola, A.J., Taskar, B., and Vishwanathan, S.V.N. (2006). [Predicting Structured Data](http://mitpress.mit.edu/catalog/item/default.asp?ttype=2&tid=11332&mode=toc). MIT Press.
