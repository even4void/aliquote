+++
title = "Some caveat in clinical trial risk assessment"
date = 2011-03-21T17:35:13+01:00
draft = false
tags = ["readings", "statistics"]
categories = ["2011"]
+++

I recently came across the following article from *Applied Clinical Trials*: [Clinical Trials and Statistical Tribulations](http://www.psyma-usa.com/themes/psyma/Clinical%20Trials%20&%20Statistical%20Tribulations_Attig%20and%20Clabaugh.pdf), R. Brian Attig and Alison Clabaugh (Feb. 2008). It is about common measures of risk assessment in RCTs and how their inappropriate use might lead to unfortunate interpretation and decision.

<!--more-->

The take-away message is that "Confusion about clinical trial results creates a negative feedback loop that affects all players in the health care system" and follows from a critical assessment of a paper published in *The New England Journal of Medicine* about the adverse effect (increased risk of myocardial infarction) of [Avandia](http://www.gsk.fr/gsk/medicament/avandia.htm). However, the conclusions were drawn from the analysis of relative risk measurs, and did not incorporate an estimate of absolute risk levels. The 43% increase in risk comes from an observed odds-ratio of 1.43, but if absolute levels of risks are compared between the treatment and control groups, "the absolute level of increased MI risk for Avandia patients in these groups ranged from 7/100th of 1% to slightly more than 4/10th of 1%‚ very small effects by any measure." (See Table 2) Disconnecting RR measures (which otherwise sound much more attractive to unexpert reviewers) from their baseline level might thus strongly distord the interpretation of anyone findings.

In sum, the authors recommended not using RR or OR in isolation but rather to report two measures of effect size:

- Absolute risk reduction, which "reflects a baseline event rate for treatment and control groups, thus providing a framework for understanding the overall magnitude of risk (or benefit) as well as impact from the intervention."
- Relative risk reduction, which "provides an easily understandable and direct means to compare the effect of an intervention on treatment and control groups."

An alternative way of thinking of the effect of a new drug compared to a standard treatment is to talk of Number Needed To Treat (NNT), which represents the number of individuals who will need to be treated in order that one of them receives benefit from this new drug. In that sense, it is simply the reciprocal of Absolute Risk Reduction (defined as the difference in event rates between the control and active arms; when this quantity is normalized by the proportion of events in the control group, it is known as the Relative Risk Reduction).

And here's a picture that summarizes the above concept and that I found very interesting:

![](/img/20110320220541.png)
