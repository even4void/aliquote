+++
title = "Methods for handling treatment switches"
date = 2012-07-05T20:23:26+01:00
draft = false

tags = ["readings", "statistics"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

In a recent statistical seminar I attended, there was a discussion on statistical strategies to cope with treatment switching and the estimation of survival.

The presentation went around slides from [Ian White](http://www.mrc-bsu.cam.ac.uk/People/IWhite.html) <i class="fa fa-chain-broken fa-1x"></i>:[^1]
[Methods for handling treatment switching: rank-preserving structural nested failure time models, inverse- probability-of-censoring weighting, and marginal structural models](http://www.methodologyhubs.mrc.ac.uk/pdf/Ian%20White%20treatment%20switches%20workshop.pdf) <i class="fa fa-chain-broken fa-1x"></i>, which are taken from the [HTMR network workshop on Methods for adjusting for
treatment switches in late-stage cancer trials](http://www.methodologyhubs.mrc.ac.uk/workshop_summaries/treatment_switches.aspx).

In two words, the question is how to estimate overall survival (and treatment effect) when only [progression-free survival](http://en.wikipedia.org/wiki/Progression-free_survival) is available and there was a treatment switch. ITT is way too conservative while PPA implies loose of randomization; regarding censoring at the time treatment switch occurs, it is not better because this would lead to informative censoring. Alternative methods that are discussed and illustrated in the talk are

- Inverse-probability-of-censoring weighting (IPCW), which considers propensity scores, censoring at switch, and a Cox model with time dependent weights;
- Rank-preserving structural failure time model (RPSFTM), which ignores censoring and relaxes covariate requirements (no need to account for factors predicting switch or outcome), assumes a common treatment effect (unlike IPCW).

The second strategy has been implemented in Stata, see White, IR and Walker, S (2002). [strbee: Randomization–based efficacy estimator](http://bit.ly/Ot7lTs). *The Stata Journal*, 2(2), 140-150. It is also discussed in White, IR (2005). Uses and limitations of randomization-based efficacy estimators. *Statistical Methods in Medical Research*, 14(4), 327-347.

As discussed during the meeting, it is interesting to note that none of the proposed methods actually take into account or discussed interim analyses.

Be sure to check also the [Clinical Trials Methodology Conference 2011](http://www.methodologyhubs.mrc.ac.uk/methodology_conference_2011.aspx) (all slides are available on-line).[^2] [Evaluation of methods that adjust for treatment switching in clinical trials](http://www.methodologyhubs.mrc.ac.uk/pdf/Survival%20analysis-%20Richard%20Fox.pdf) is another talk on the same topic.

Here is another paper that looks interesting:
Morden, JP, Lambert, PC, Latimer, N, Abrams, KR, and Wailoo, AJ (2011). [Assessing methods for dealing with treatment switching in randomised controlled trials: a simulation study](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3024998/). *BMC Medical Research Methodology*, 11: 4.

Finally, here is a recent review on adapative designs:
Chow, S-C and Corey, R (2011). [Benefits, challenges and obstacles of adaptive clinical trial designs](http://www.ojrd.com/content/pdf/1750-1172-6-79.pdf). *Journal of Rare Diseases*, 6: 79.


[^1]: Ian White has written a lot of handy [Stata stuff](http://www.mrc-bsu.cam.ac.uk/Software/stata.html#Software_IW) for the analysis of RCTs with missing data or treatment switches.

[^2]: There are also a series of nice [workshops](http://www.methodologyhubs.mrc.ac.uk/news__events/workshop_summaries.aspx) with full access to lectures notes, handouts or code.
