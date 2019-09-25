---
title: "Hierarchical Omega in factor analysis"
date: 2013-02-10T15:10:17+01:00
draft: false
tags: ["readings", "psychometrics"]
categories: ["2013"]
---

While browsing questions related to psychometrics posted late in 2012 on Cross Validated, I noticed two questions dealing with hierarchical ω<sub>h</sub>.

These questions come from the use of [William Revelle](http://www.personality-project.org/revelle.html)'s [psych](http://cran.r-project.org/web/packages/psych/) package, which offers a very nice toolkit for serious psychometrics, especially work related to factor analysis. Just take a look at some of his [Psychology 454](http://personality-project.org/revelle/syllabi/454.syllabus.pdf) syllabus (PDF) to get an idea of what's available in `psych`.

The ω<sub>h</sub> measure was popularized by Zinbarg, Revelle and coll few years ago. In my answer to this question on Cross Validated, [Omega vs. alpha reliability](http://stats.stackexchange.com/q/39182/930), I neglected to mention that Cronbach's alpha originated in the work of Guttman (as λ<sub>3</sub>), as pointed out by McDonald (p. 92), although this is something I mentioned in an [earlier answer](http://stats.stackexchange.com/a/11846) of mine. Again, William Revelle offer some nice readings on [Psychometric Theory](http://personality-project.org/revelle/syllabi/405.syllabus.html), including [Reliability Theory](http://bit.ly/XvL7ke) (starting p. 44 ff). I haven't use ω<sub>h</sub> myself but it is clear that classical measures of internal consistency suffer from many drawbacks (especially in relation to unidimensionality and equal loadings assumption, as found in my [other posts](/tags/psychometrics) or in several articles<sup>(4,5)</sup>) which are largely ignored in several papers dealing with the validation of health questionnaires that I happen to read.

A quick literature review suggests that some applied papers<sup>(6)</sup> relied on ω<sub>h</sub> to assess the amount of general factor saturation. On a related point, Graham<sup>(7)</sup> discussed the use of SEM and congeneric estimate of reliability when tau-equivalence assumption of Cronbach’s alpha fails. Cronbach's alpha and coefficient ω use to be compared as discrepancy between their values reflect the extent to which the reliability estimate is influenced by allowing group factors to figure into true score variation.<sup>(8)</sup>

### References

1. Zinbarg, R.E., Revelle, W., and Yovel, I. (2007). Estimating ω<sub>h</sub> for structures containing two group factors: Perils and prospects. *Applied Psychological Measurement*, *31(2)*, 135–157.
2. Zinbarg, R.E., Yovel, I., Revelle, W., and McDonald, R.P (2006). [Estimating Generalizability to a Latent Variable Common to All of a Scale’s Indicators: A Comparison of Estimators for ω<sub>h</sub>](http://bit.ly/WkCU5F). *Applied Psychological Measurement*, *30(2)*, 121–144.
3. McDonald, R.P. (1999). *Test theory: A unified treatment*. Mahwah, NJ: Lawrence Erlbaum.
4. Falissard, B. (1999). The unidimensionality of a psychiatric scale: a statistical point of view. *International Journal of Methods in Psychiatric Research*, *8(3)*, 162-167.
5. Tavakol, M. and Dennick, R. (2011). [Making sense of Cronbach’s alpha](http://bit.ly/XvLStu). *International Journal of Medical Education*, *2*, 53-55.
6. Steer, R.A. (2009). Amount of General Factor Saturation in the Beck Anxiety Inventory Responses of Outpatients with Anxiety Disorders. *Journal of Psychopathology and Behavioral Assessment*, *31*, 112–118.
7. Graham, J.M. (2006). [Congeneric and (Essentially) Tau-Equivalent Estimates of Score Reliability](http://bit.ly/XvLGKR). *Educational and Psychological Measurement*, *66(6)*, 930-944.
8. Reise, S.P., Moore, T.M., and Haviland, M.G. (2010). [Bifactor Models and Rotations: Exploring the Extent to which Multidimensional Data Yield Univocal Scale Scores](http://1.usa.gov/XvM9gi). *Journal of Personality Assessment*, *92(6)*, 544-559.
