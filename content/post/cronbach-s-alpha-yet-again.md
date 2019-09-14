+++
title = "Cronbach's alpha yet again"
date = 2011-06-25T12:41:07+01:00
draft = false
tags = ["readings", "psychometrics"]
categories = ["2011"]
+++

As a complement to the references I gave in an earlier post on [Cronbach's alpha]({{< ref "/post/revisiting-cronbach-s-alpha.md" >}}), here are some further thoughts.

I am rereading *Health Measurement Scales. A practical Guide to their development and use*, by D.L. Streiner and G.R. Norman (Oxford Univ. Press, 2008 4th. ed.). I thought it would be a good opportunity to put again some words about Cronbach's alpha. 

This is a very nice textbook on the developement and validation of measurement instruments, with a lot of examples in the field of health outcomes or clinical research. Notations are clear and well-explained, and there are some good illustrations. For example, we all know that Cronbach's alpha depends on the interitem correlations and the number of items. Their Figure 5.1 (p. 91), which is comparable to what I showed in my earlier post, makes it clear that we can arbitrarily increase α by increasing the number of items in the scale: no need for complex digressions!

Moreover, quoting the authors, who discuss (pp. 90-91) the problem of accepting high values of α during scale development, and interpreting them as reflecting "good" internal consistency: 

> If we have two scales which each measure a distinct construct and combine them to form one long scale, α will be high. Cortina (1993) concluded that, 'if a scale has more than 14 items, then it will have an alpha of 0.70 or better even if it consists of two orthogonal dimensions with modest (i.e. 0.30) item correlations. If the dimensions are correlated with each other, as they usually are, then alpha is even greater' (p. 102).

That's quite easy to check using R. Here, we simulate a two-factor structure, generate N=300 scores from it (we could use the correlation matrix directly, though), and compute the average α value observed for 100 replicates when increasing the number of items.

```r
library(nFactors)
sim.data <- function(k) {
  fl <- generateStructure(k, 2, k/2, 0.6, 0.2)
  out <- sim.structure(as.matrix(fl), n=200, raw=TRUE)
  return(out$observed)
}
# check that we get the expected factor structure
# fa(sim.data(14), 2)
nitems <- seq(6, 30, by=2)
res <- sds <- numeric(length(nitems))
for (j in seq_along(nitems)) {
  tmp <- replicate(100, alpha(sim.data(nitems[j]))$total$raw_alpha)
  res[j] <- mean(tmp)
  sds[j] <- sd(tmp)
}
```

![cronbach](/img/20110625205901.png)

Finally, 

> if α is too high, then it may suggest a high level of item redundancy; that is, a number of items asking the same question in slightly different ways (Boyle, 1991; Hattie, 1985). This may indicate that some of the items are unnecessary and that the scale as a whole may be too narrow in its scope to have much validity.

This raises the interesting question: What is an acceptable value for α?
Streiner and Norman conclude with the following:

> A number of authors say it should be at least 0.70 (e.g. Heppner et al., 1992; Kaplan and Saccuzzo, 1997). Nunnally (1978) states that this value should be obtained in the early stages of research, but should be at least 0.80 for basic research (a value also endorsed by Carmines and Zeller, 1979; Clark and Watson, 1995; and others) and 0.90 for a clinical instrument. A somewhat different approach is taken by Ponterotto and Ruckdeschel (2007). Because, as we have said, α is influenced by the the length of the scale and the sample size, they propose a range of values dependent on these factors. Therefore, for exmaple, they would call a value of 0.70 'good' for a scale with fewer than seven items, evaluated with fewer than 100 subjects. However, if the scale has more than 11 items, and the sample size was over 300, α would have to be 0.90 to be called 'good'.


### References

1. Cortina, J.M. (1993). [What Is Coefficient Alpha? An Examination of Theory and Applications](http://psychweb.psy.umt.edu/denis/datadecision/front/cortina_alpha.pdf). *Journal of Applied Psychology*, *78(1)*, 98-104.
2. Heppner, P.P., Kivlighan, D.M., and Wampold, B.E. (1992). *Research design in counseling*. Brooks/Cole, Pacific Grove, CA.
3. Kaplan, R.M. and Saccuzzo, D.P. (1997). *Psychological testing: Principles, applications, and issues (4th edn.)*. Brooks/Cole, Pacific Grove, CA.
4. Nunnally, J.C., Jr. (1978). *Introduction to psychological measurement*. McGraw-Hill, New York.
5. Carmines, E.G. and Zeller, R.A. (1979). *Reliability and validity assessment*. Sage, Thousand Oaks, CA.
6. Clark, L.A. and Watson, D. (1995). <i class="fa fa-file-pdf-o fa-1x"></i> [Constructing validity: Basic issues in objective scale development](http://www.personal.kent.edu/~dfresco/CRM_Readings/Clark_and_Watson_1995.pdf). *Psychological Assessment*, *7*, 309-319.
7. Ponterotto, J.G. and Ruckdeschel, D. (2007). An overview of coefficient alpha and a reliability matrix for estimating adequacy of internal consistency coefficients with psychological research measures. *Perceptual and Motor Skills*, *105*, 997-1014.
8. Brennan, R.L. (2001). An essay on the history and future of reliability from the perspective of replications. *Journal of Educational Measurement*, *38*, 295-317.
9. Graham, J.M. (2006). <i class="fa fa-file-pdf-o fa-1x"></i> [Congeneric and (essentially) tau-equivalent estimates of score reliability](http://myweb.facstaff.wwu.edu/~graham7/articles/EPMReliability.pdf). *Educational and Psychological Measurement*, *66*, 930-944.
10. Raykov, T. (1997). Scale reliability, Cronbach's coefficient alpha, and violations of essential tau-equivalence with fixed congeneric components. *Multivariate Behavioral Research*, *32*, 329-353.
11. Boyle, G.J. (1991). [Does item homogeneity indicate internal consistency or item redundancy in psychometric scales?](http://epublications.bond.edu.au/cgi/viewcontent.cgi?article=1001&context=greg_boyle&sei-redir=1#search=%22Does%20item%20homogeneity%20indicate%20internal%20consistency%20or%20item%20redundancy%20psychometric%20scales%3F%22) *Personality and Individual Differences*, *12*, 291-294.
12. Hattie, J. (1985). Methodology review: Assessing unidimensionality of tests and items. *Applied Psychological Measurement*, *9*, 139-164.

I also gave some further references in an answer on [stats.stackexchange.com](http://stats.stackexchange.com/questions/11628/assessing-reliability-of-a-questionnaire-dimensionality-problematic-items-and/11846#11846).
