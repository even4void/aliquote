+++
title = "Notes on the ISOQOL 2012 conference"
date = 2012-10-27T14:28:27+01:00
draft = false

tags = ["psychometrics", "travels"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

Here some are notes I took during the 19th annual conference of the [International Society for Quality of Life Research](http://www.isoqol.org) which was held in Budapest, Hungary.


![Budapest](/img/20121026133045.jpg)

## On the use of mixed methods to assess content validity of patient reported outcomes
   
Mixed methods consist in an iterative, cyclical, and hypothesis-driven decision approach that alternate between qualitative and quantitative methods. With application in prospective, observational data, or in-trial evaluation. Now becoming a recommended step by FDA for developing PRO measures before psychometric validation of a new instrument.

Past events include: COA workshop (Oct, 2011); PRO Consortium workshop presentation (Apr, 2012); FDA/SEALD Panel Meeting (June, 2012).

Use of the Rasch Model for assessing content validity on data collected during cognitive debriefing and a standalone pilot study. As few samples are available, this should be used for descriptive purpose only (assessing distribution characteristics, identifying gap in construct coverage). With such low sample size, it is diffuclt to provide a clear picture of reliability, dimensionality, content saturation (using item-person map) and validity. However, the idea is that gaps along the continuum at the level of item and response scale interval could be assessed, qualitative data revised, and new item or response categories generated.

One application of the RM with a "very" small sample can be found in Wright and Stone's *Best Test Design* (1979). The study aims at assessing "non-verbal intellectual capacity" on 35 children with the help of 18 items from the Know Cubes test. <http://www.winsteps.com/facetman/index.htm?knoxcubetext.htm>

Regarding sample size in IRT: With binary items, for a precision of ± 0.5 logit and 95% confidence, sample size is int he order of 64-144; with 99% confidence, it raises to 108-243. With polytomous items, we need at least 10 observations per category for the Rating Scale Model, and 100 reponses per item may be too small in some applications for the Partial Credit Model.

Sample size for cognitive debriefing (n=10); see [Patrick et al.](http://www.ncbi.nlm.nih.gov/pubmed/22152166) *Value in Health* 2011 Dec 14(8): 978-988.

I must admit I have hard time imagining how we can use 30 individuals to fit a Rasch model (beside unreliable parameters estimates, we would just not have enough coverage of the latent trait with such a small sample size), so the last talk by Kathleen Wyrwuch was somehow wholesome.

## Utility measures

Beside deriving utility index for use in cost-effectiveness studies, utility measures are also frequently encountered in studies where researchers want to map two instruments scores. This often is a more difficult task when dealing with condition specific measure or clinical measures of severity vs. a generic instrument. In her talk "Appropriate mapping functions in HRQL: a series of models mapping from FACT-G to EQ-5D" Tracey A. Young provided a gentle overview of several competing models that could be used to map a disease-specific instrument (27 items covering 4 dimensions) onto the EQ-5D 3-level utility scores. The following approaches were discussed: OLS, Tobit, two-part models, splining, response mapping, censored absolute deviance, generalised linear model. Model performance can be assessed using several criteria: MAE, AIC, BIC, shrinkage, adjusted or pseudo R squared. It appears that OLS predictions overestimate scores for people in low health state but were quite good around average health states. A Tobit model appears to provide the best estimate across all criteria, while response mapping gave poorest estimate due to the nature of the data (530 patients in stage 3/4 in the USA with few responders in poor health).

The next talk was about comparing 3- vs. 5-level response options for the EQ-5D questionnaire in sample of spanish urological cancer patients. It is well-known that the EQ-5D exhibits strong ceiling effect in the general population (47-65% depending on studies), as well as in specific pathologies (cancer 27%, CVD 20%, chronic bronchitis 23%). The authors added two intermediate levels so that response categories were: no / slight / moderate / severe / extreme problems. Patients (N=840) were surveyed at baseline and 6 months after, and version administration was counter-balanced. Performance was assed by analyzing redistribution of the response categories between the two versions using Shannon indexes. Item response curves computed from an IRT model (2 factors) were also used. The results suggest that adding two response options increased informativity except for the "self-care" dimension, while ceiling effects keep relevant for the pathology under study.

Last talk I attended was about the use of "discrete choice model in quantifying health-states for the new EQ-5D-5L", by Paul F.M. Krabbe. It was an enlightening talk because the author discussed the valuation or index approach (as opposed to the classical test or item response theory), which is frequently used in economics or psychometrics, and shed light on the connection between psychophysics and psychometrics: Indeed, the basic element of measurement is a comparison between two or more entities or stimuli. References were made to Gustav Fechner and Thurstone's law of comparative judgement. Discrete choice analysis goes back to the work of Luce, Manski and Lerman, McFadden, and Louviere et al. Part of this original work was published as:
Stolk EA, Oppe M, Scalone L, Krabbe PF. [Discrete choice modeling for the quantification of health states: the case of the EQ-5D](http://www.ncbi.nlm.nih.gov/pubmed/20825618). *Value Health*. 2010, 13(8):1005-13.

## SIG Psychometrics

The SIG session concentrated on what the team achieved in terms of defining minimum standards. For whatever reasons, I haven't been in touch with the progress on this. (I suspect this is because ISOQOL forgot I registered two years ago to the psychometrics SIG.) Anyway, I was a little bit disappointed by what seems to emerge as minimum standards for PRO measurement: the overwhelming reliance on Cronbach's alpha above 0.7 (in most settings) and correlational approaches to convergent and divergent validity suggests no one will move toward more refined structural approaches (factor analysis, structural equation modeling, IRT modeling). Moreover, to my great surprise there was no mention of measurement invariance which in my view greatly limit inference drawn on scale scores. Finally, it was not very clear to me what minimum standards would be for PRO studies with children as a target population. Indeed, the proposed age limit (12 years) and grade level (for litteracy) leave pediatric studies in the dark regarding what minimum standards could be. Yet, it is a good idea to define a common framework with well-acknowledged landmarks for analysing PRO data.

## Analysis and interpretation of outcomes

HRQL values from a background population may be used as a proxy for true baseline HRQL, which allows to obtain matched HRQL mean reference scores (MRS). This study used the Swedish esophageal and cardia cancer database. I believe [these slides](http://bit.ly/SgaUPC) <i class="fa fa-chain-broken fa-1x"></i> refer to the same target population. The reference population was composed of a random sample of persons aged between 40 and 79. Matching (97:1) was done on age, gender and co-morbidities (CVD, diabetes, KD, asthma, and others). Linear mixed models were used to analyse the effects of co-morbidities on longitudinal recovery of HRQL functional and symptoms scales. Results showed that patients with co-morbidities had worse baseline scores and lower MRS scores.

The next talk was on Differential Item Functioning analysis of the Spanish item bank of the [PROMIS Pain Behavior](http://www.ncbi.nlm.nih.gov/pubmed/19683873). (See [here](http://bit.ly/VuC5DF) for the complete list of items.) Translation of item bank followed the [FACIT protocol](http://bit.ly/VuC96m) (2 forward + 1 backward translations, expert reviews, and 5 cognitive interviews per item). A total of 527 spanish-speaking and 678 english-speaking (USA) patients were enrolled. A graded response model was used to, with assessment of dimensionality and local dependence. Confirmatory factor analysis was done with Mplus, and the authors considered a scree plot as well as the maximum absolute residual correlation (no local dependence was present, except for two items) with the [IRTFIT Macro](http://outcomes.cancer.gov/areas/measurement/irtfit_eula.html). Finally, the [LORDIF](http://www.jstatsoft.org/v39/i08/paper) R package was used for DIF analysis; 7 items were collapsed from 6 to 5 categories and 1 item from 6 to 4 categories, due to response distribution imbalance. The results highlighted 6 items which were found to exibit significant DIF effect between the two groups of respondents.

Following on [earlier work](http://www.ncbi.nlm.nih.gov/pubmed/22069169) on power analysis for Rasch modeling, published in *Statistics in Medicine*, Hardouin and coll. presented a new simulation studies on power determination with varying distribution shape of abilities and an expected difference in mean trait scores. There exist both a Stata module, [raschpower](http://ideas.repec.org/c/boc/bocode/s457106.html), and an [online platform](http://rasch-online.univ-nantes.fr). I'm not sure to understand why the authors considered a U-shaped Beta distribution for trait levels in this new simulation study since this amounts to consider that there may be high ceiling and floor effects and that items in the middle range of the scale could not be reliably estimated (unless the instrument is already calibrated).

Last talk I attended on Friday 26 was about the use of propensity score matching to deal with possible selection bias (any between-group imbalance in pre-treatment patient characteristics which affects the probability of being treated) in PRO studies. As always, this seems magical. Unfortunately, my attention started to decrease slightly so I should review the literature myself.

## Advances in eHealth

One of the plenary session was about innovative solutions for electronic assessment of health state. This includes a general overview of [PatientsLikeMe](http://www.patientslikeme.com), with the following nice opening:

> Given my status, what is the best outcome I can hope to achieve, and how do
> I get there?

As opposed to [23andMe](https://www.23andme.com), PatientsLikeMe aims to focus on phenotypic variations.

Other projects of interest: [Parkinson' Voice Initiative](http://www.parkinsonsvoice.org), and [klik](https://www.hetklikt.nu) for children with chronic disease, but see
Haverman et al. [Monitoring health-related quality of life in paediatric practice: development of an innovative web-based application](http://bit.ly/RV0dzl), *BMC Pediatrics* 2011, 11:3.
