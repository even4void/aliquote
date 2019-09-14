+++
title = "Subgroup Analysis"
date = 2011-07-18T14:20:19+01:00
draft = false
tags = ["readings", "statistics"]
categories = ["2011"]
+++

Here are four papers dealing with the reporting of subgroup analysis and using baseline data (and their pitfalls).

<!--more-->

There might be plenty of other papers on this topic available through Google, but these ones focus on RCTs and biomedical research. Below is just a few recap' of the critical points raised in these papers.

## A brief overview

Wang et al.<sup>(1)</sup> provide general guidelines for reporting subgroup analysis. Based on their insert p. 2193, here are those recommendations for researchers intending to publish results from subgroup analysis (strict copy/paste):

* [Abstract] Present subgroup results in the Abstract only if the subgroup analyses were based on a primary study outcome, if they were prespecified, and if they were interpreted in light of the totality of prespecified subgroup analyses undertaken.

* [Methods]
  
  * Indicate the number of prespecified subgroup analyses that were performed and the number of prespecified subgroup analyses that are reported. Distinguish a specific subgroup analysis of special interest, such as that in the article by Sacks et al., from the multiple subgroup analyses typically done to assess the consistency of a treatment effect among various patient characteristics, such as those in the article by Jackson et al. For each reported analysis, indicate the end point that was assessed and the statistical method that was used to assess the heterogeneity of treatment differences.
  * Indicate the number of post hoc subgroup analyses that were performed and the number of post hoc subgroup analyses that are reported. For each reported analysis, indicate the end point that was assessed and the statistical method used to assess the heterogeneity of treatment differences. Detailed descriptions may require a supplementary appendix.
  
  * Indicate the potential effect on type I errors (false positives) due to multiple subgroup analyses and how this effect is addressed. If formal adjustments for multiplicity were used, describe them; if no formal adjustment was made, indicate the magnitude of the problem informally, as done by Jackson et al.

* [Results] When possible, base analyses of the heterogeneity of treatment effects on tests for interaction, and present them along with effect estimates (including confidence intervals) within each level of each baseline covariate analyzed. A forest plot is an effective method for presenting this information.

* [Discussion] Avoid overinterpretation of subgroup differences. Be properly cautious in appraising their credibility, acknowledge the limitations, and provide supporting or contradictory data from other studies, if any.

The papers that are referenced above are:

* Sacks FM, Pfeffer MA, Moye LA, et al. [The effect of pravastatin on coronary events after myocardial infarction in patients with average cholesterol levels](http://courses.ahc.umn.edu/pharmacy/5822/Lectures/CARETrial.pdf). N Engl J Med 1996;335:1001-9.
 
* Jackson RD, LaCroix AZ, Gass M, et al. [Calcium plus vitamin D supplementation and the risk of fractures](http://www.nejm.org/doi/full/10.1056/NEJMoa055218). N Engl J Med 2006; 354:669-83. [Erratum, N Engl J Med 2006;354:1102.]

Lagakos's article<sup>(2)</sup> is a short note providing good reminders about the problem of data dredging (carrying out further analyses after having seen the data) and multiple unprotected comparisons in subgroup analyses, especially when testing interaction effects, which might be circumvented using simple (but overly conservative) Bonferroni correction. His conclusions are (p. 1668):

> Ignorance of the total number of subgroup analyses, which ones were prespecified and which were post hoc, and whether any were suggested by the data makes it very difficult to interpret the reported results. When an interaction test for a baseline variable fails to reach the appropriate threshold for significance, conclusions about a differential treatment benefit related to this variable should be avoided or presented with caution.

Assmann's paper<sup>(3)</sup> is all about the same than the next paper, so I'll skip it. Reader interested in a shorter version of the next paper might, however, be interested in reading this one.

Pocock et al.<sup>(4)</sup> focused on the inclusion of baseline data obtained during the random allocation to treatment group and did sort of a meta-analytical review of 50 trial reports published in four major journals in 1997: *British Medical Journal* (15 RCTs), *Journal of the American Medical Association* (6), *Lancet* (15), and *New England Journal of Medicine* (24). Overall, 70% reported results from subgroup analyses, with up to four baseline factors in 56% of the cases. 

According to these authors, baseline data might be used for subgroup analyses, covariate adjustment, or baseline comparisons. Statistical tests for interaction are probably the most useful approach, as they allow to "directly examine the strength of evidence for the treatment difference varying between subgroups" (p. 2919), but are not used as much as they should (authors are reluctant to use them because of the lack of statistical power). This is because they "recognize the limited extent of data available for subgroup analysis, and are the most effective statistical tool in inhibiting false or premature claims of subgroup findings." (p. 2920).

Let us concentrate on the last two issues.

*Covariate adjustment* aims (1) to achieve the most appropriate p-value for the treatment difference, (2) to achieve an unbiased estimate and confidence interval for the magnitude of treatment difference in outcome, or (3) to improve the precision of the estimated treatment difference, thus increasing the statistical power of the trial.
Most importantly, what really matters is to adjust for the appropraite covariates (p. 2927).

On the other hand, *baseline comparability* aims (1) to describe the baseline characteristics of the sample of patients included, (2) to demonstrate that the randomization has worked well by achieving well balanced treatment groups at baseline, (3) to add credibility to the trial results, specifically encouraging confidence in unadjusted outcome analyses as being without any serious bias, or (4) to identify any unlucky imbalances between treatment groups that may have arisen by chance.

The paper also considered some case studies to illustrate the above points, which make it worth to read as compared to standard textbook.
The final conclusions of the authors are (p. 2928):

> Subgroup analyses are often given too great a prominence and fail to use appropriate methods of statistical inference such as interaction tests. There also appears a lack of consistency regarding the use of covariate-adjusted analyses, perhaps largely because their rationale and statistical properties are poorly understood. Though less serious, there are also improvements to be made in the reporting of baseline comparisons.


## Further thoughts

On a related note, the use of pre-post data is discussed in *Statistical Issues in Drug Development*, by Senn, and I gave some further links in response to a question on [stats.stackexchange.com](http://stats.stackexchange.com): [Best practice when analysing pre-post treatment-control designs](http://stats.stackexchange.com/questions/3466/best-practice-when-analysing-pre-post-treatment-control-designs). I recently came across a nice discussion on the [MedStats](http://groups.google.com/group/medstats/browse_thread/thread/165dd9cf7a6608c0) mailing (Credit to Martin Holt) referencing Streiner and Norman's excellent textbook on *Health Measurement Scales* (Oxford University Press 2008, 4th ed.). As for the original question, it was about assessing the effect of interventionin hypogonadal male patients as measured by a change observed on an histology index score (0 to 4). The use of *residualized gain scores* was not new to me, but as always it seems I totally forgot about that approach when replying on [stats.stackexchange.com](http://stats.stackexchange.com). The idea, which originated from Cronbach and Furby<sup>(5)</sup> and is an extension of Lord<sup>(6)</sup> and McNemar<sup>(7)</sup> proposals, consists in 

1. Fitting a regression model to the pre/post data.
2. Estimating the post score from the regression equation.
3. Computing the difference between the observed and predicted post score.

The take-home message from Cronbach's paper is essentially that using chnage scores obeys a precise research question (this was originally framed into problems like learning or growth, which are in essence multidimensional aspects of individual developement). Gains or differences scores were primarily used (pp. 77-78):

1. To provide a dependent variable in an experiment on instruction, persuasion, or some other attempt to change behavior or beliefs.
2. To provide a measure of growth rate or learning rate that is to be predicted, as a wayof answering the question, What kinds of persons grow (learn) fastest? Here, the change measure is a criterion variable in a correlational study.
3. To provide an indicator of deviant development, as a basis for identifying individuals to be given special treatment or to be studied clinically.
4. To provide an indicator of a construct that is thought to have significancein a certain theoretical network. The indicator may be used as an independent variable, covariate, dependent variable, etc. 

Cronbach sum up the above as follows (p. 78):

> There appears to be no need to use measures of change as dependent variables and no virtue in using them. If one is testing the null hypothesis that two treatments have the same effect, the essential question is whether posttest Y∞	scores[^1] vary from group to group. Assuming that errors of measurement of F are random, F is an entirely suitable dependent variable.

Last unrelated note, Kim-Kang and Weiss<sup>(8)</sup> provides a nice overview of the measurement of individual change in light of IRT models. Another discussion might be found on [rasch.org](http://www.rasch.org/rmt) Transactions, [Raw Score Nonlinearity Obscures Growth](http://www.rasch.org/rmt/rmt182a.htm).



## References

1. Wang, R, Lagakos, SW, Ware, JH, Hunter, DJ, and Drazen JM (2007). [Statistics in Medicine — Reporting of Subgroup Analyses in Clinical Trials](http://rds.epi-ucsf.org/ticr/syllabus/courses/7/2009/02/03/Lecture/readings/WangThe%20new%20england%20journal%20of%20medicine2007.pdf). *The New England Journal of Medicine*, 357(21): 2189-2194.
2. Lagakos, SW (2006). [The Challenge of Subgroup Analyses — Reporting without Distorting](http://www.kfshrcj.org/NR/rdonlyres/446B3BB6-6942-4E8C-AABF-6BE43D28E192/1135/StatisticsandMedicineSubgroupAnalyses.pdf). *The New England Journal of Medicine*, 354(16): 1667-1669.
3. Assmann, SF, Pocock, SJ, Enos, LE, and Kasten, LE (2000). [Subgroup analysis and other (mis)uses of baseline data in clinical trials](http://sisla06.samsi.info/multi/sa/subgroups.lancet2000.pdf). *The Lancet*, 355: 1064-1069.
4. Pocock, SJ, Assmann, SE, Enos, LE, and Kasten, LE (2002). [Subgroup analysis, covariate adjustment and baseline comparisons in clinical trial reporting: current practice and problems](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.79.3064&rep=rep1&type=pdf). *Statistics in Medicine*, 21: 2917-2930.
5. Cronbach, LJ and Furby, L (1970). How should we measure "change" - or should we? *Psychological Bulletin*, 74: 68-80.
6. Lord, FM (1958). Further problems in the measurement of growth. *Educational and Psychological Measurement*, 18: 437-454.
7. McNemar, Q (1958). On growth measurement. *Educational and Psychological Measurement*, 18: 47-55.
8. Kim-Kang, G and Weiss, DJ (2008). [Adaptive Measurement of Individual Change](http://www.assess.com/docs/Kim-Kang_and_Weiss_2008.pdf). *Journal of Psychology*, 216(1): 49–58.


[^1]: Y∞ scores represent the person's "true" score (and its estimate might be obtained from the aforementioned regression model).
