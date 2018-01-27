+++
title = "Notes on the ECM 2012 Conference"
date = 2012-07-22T11:41:36+01:00
draft = false

tags = ["travels", "review"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

I'm just returning from the [ECM 2012 conference](http://www.ecm2012.com/) <i class="fa fa-chain-broken fa-1x"></i> that was held in Santiago de Compostela.

As was the case for to the [preceding one]({{< ref "/post/back-from-the-iv-eam-conference.md" >}}), and in contrast to the annual conference from the Psychometric Society, this conference is generally more heavily oriented toward psychological applications, and less place is devoted to psychometric 'hard' methods, except for Friday's morning sessions. There was a workshop on applied IRT modeling with R, but I completely missed it.

Niels Smits talked about the use of ordinal regression in place of traditional IRT models in computerized adaptive testing from the perspective of automatic classification. The general idea was to generalize the techniques proposed to handle binary decision (e.g., at risk *vs.* not at risk) to multiple categories. This in turn calls for finding method to obtain scale score probabilities with Likert-type items. Usually, the proportional odds model works quite well in this situation, and it is less demanding in terms of assumptions (unidimensionality, indicator variables, etc.). Basically, a simple way to understand the approach is to reverse the standard view point: instead of working with $\Pr(Y\le j)$, we work with $\Pr(Y=j\mid x=x_i)$, where $x_i$ stands for the location of a given individual on the latent trait. An illustration with real data collected on the CES-D scale (20 0-3 items) was also given. It should be noted that the author also use this instrument to develop a computerized adaptive version (see references at the end).

José Muñiz provided two nice presentations on computerized adaptive testing for the assessment of schizotypy and the estimation of reliability in personality tests with missing values. What was interesting during the first talk is the fact that assessing such clinical sample invariably lead to assymmetrical distribution in response scores. In other words, almost everybody is going well, and this is a big challenge for psychometric models. I do not know if much research has been done in this filed, but I suspect this would be good to write something about best practices to handle such extreme cases. More generally, this study relies on the "psychometric high-risk paradigm" (see, e.g., [Psychometric high-risk paradigm, perceptual aberrations, and schizotypy: an update](http://1.usa.gov/NEWHIa)) and considers there is a 'psychosis continuum' (whereby an individual might evolve from personality traits disorder to psychosis). The authors use the CAT algorithm from Walker (2010), considering an estimation error < 0.32. In this particular study, however, CAT didn't prove very convincing with respect to the number of items retained in final version (40% reduction with binary items[^1], less than 40% reduction with Likert-type items). Relying on a [shadow-tests strategy](http://bit.ly/Qn1Qrx) may be an alternative to the simple CAT algorithm. 
A good overview of CAT is available in one of the PARE publications: [A Framework for the Development of Computerized Adaptive Tests](http://bit.ly/NEXngr).[^2]

The second talk was oriented toward practitioners, hence the focus on SPSS imputation methods. The idea is that most of the times biostatisticians do not focus on the quality of the instrument(s) on which data are collected. However, there are almost always some missing data (that we can just ignore or replace with "invented" ones). So the idea is to study the influence of missingness on estimated psychometric parameters, like reliability, validity, differential item functioning, or item functions. This work was concerned with the effect of missing values on reliability measures. For large sample (about 3,000 individuals), SPSS imputation based on ML covariance matrix appears to give the best results.

A key paper on missing data is Schafer, JL, Graham, JW. Missing data: Our view of the state of the art. *Psychological Methods*. 2002; 7(2):144-177.
See also Wayman's paper on multiple imputation with an application on a national reading assessment, [Multiple Imputation For Missing Data: What Is It And How Can I Use It?](http://bit.ly/Pufzv3).

There were also several talks on the assessment of response bias, acquiescence and faking on personality inventories. A reference that was often cited was
Ferrando, PJ, Lorenzo-Seva, U, Chico, E. A general factor-analytic procedure for assessing response bias in questionnaire measures. *Structural Equation Modeling*. 2009; 16(2):364-381.

				
I have some other papers to check, of course:

- Finkelman M, He Y, Hooker G, Kim W, Gandek B. Stochastic Curtailment of Health Questionnaires: A Method to Reduce Respondent Burden. *Statistics in Medicine*. 2011; 30:1989-2004.
- Hankins, M. [The reliability of the twelve-item general health questionnaire (GHQ-12) under realistic assumptions](http://1.usa.gov/Pudmjf). *BMC Public Health*. 2008; 8.
- Smits, N, Zitman, FG, Cuijpers, P, den Hollander-Gijsman, ME, Carlier, IVE. [A proof of principle for using adaptive testing in routine Outcome Monitoring: the efficiency of the Mood and Anxiety Symptoms Questionnaire-Anhedonic Depression CAT](http://1.usa.gov/QmXyAr). *BMC Medical Research Methodology*. 2012; 12:4.
- Waller, NG, Reise, SP. Measuring psychopathology with non-standard IRT models: Fitting the four-parameter model to the MMPI. 2010; In S. E. Embretson (Ed.). Measuring psychological constructs with model-based approaches, 147-173.
- Reise, SP, Waller, NG. Item Response Theory and Clinical Measurement. *Annual Review of Clinical Psychology*. 2009; 5:27-48.
- Tomarken, A, Waller, NG. Structural Equation Modeling as a Data-Analytic Framework for Clinical Science: Strengths, Limitations, and Misconceptions. ¨*Annual Review of Clinical Psychology*. 2005; 1:31-65.
- Smits, N, Straten, A, Cuijpers, P. Applying computerized adaptive testing to the CES-D scale: A simulation study. *Psychiatry Research*. 2011; 188(1):147-155.
- Smits, N. [A note on Youden's J and its cost ratio](http://bit.ly/NEYBIz). *BMC Medical Research Methodology*. 2010; 10:89. 


[^1]: In this study, polytomous items were dichotomized for the purpose of the study. However, it is known that reducing the number of categories amounts to loose information, even if considering dichotomized version of the original item might be a remedy to solve distribution asymmetry. (I have to check the literature about that!)

[^2]: For a more complete literature review on CAT, please refer to David J. Weiss [Bibliography on Computerized Adaptive Testing](http://bit.ly/Qn0Pzu).
