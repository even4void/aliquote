---
title: "Formative vs Reflective Measurement"
date: 2011-12-11T19:49:57+01:00
draft: false
tags: ["psychometrics"]
categories: ["2011"]
---

Lastly, I attended a talk by Hervé Guyon about PLS path modeling and the debate about formative *vs.* reflective measurement. The discussion was motivated by applications in business and management, but there were also meaningful contributions in psychological research and psychometrics. 

Some key papers are listed below:

1. Howell, R.D., Breivik, E., and Wilcox, J.B. (2007). [Reconsidering formative measurement](http://www.ncbi.nlm.nih.gov/pubmed/17563173). *Psychological Methods*, 12(2), 205-218.
2. Bagozzi, R.P. (2007). [On the meaning of formative measurement and how it differs from reflective measurement: Comment on Howell, Breivik, and Wilcox (2007)](http://www.ncbi.nlm.nih.gov/pubmed/17563175). *Psychological Methods*, 12(2), 229-237.
3. Diamantopoulos, A., Riefler, P., and Roth, K.P. (2008). [Advancing formative measurement models](http://homepage.univie.ac.at/katharina.roth/research/Formative_Measurement_JBR.pdf). *Journal of Business Research*, 61, 1203-1218.
4. Edwards, J.R. (2011). [The fallacy of formative measurement](http://orm.sagepub.com/content/14/2/370.abstract). *Organizational Research Methods*, 14(2), 370-388.
5. Borsboom, D., Mellenbergh, G.J., and van Heerden, J. (2003). [The theoretical status of latent variables](https://sites.google.com/site/borsboomdenny/BorsboomLatentvars2003.pdf). *Psychological Review*, 110, 203–219.
6. Borsboom, D. (2006). [The attack of the psychometricians](https://sites.google.com/site/borsboomdenny/BorsboomPM2006.pdf). *Psychometrika*, 71(3), 425-440.

The general idea is as follows. With formative measures, the construct appeared as a manifestation of the items, such that variations at the level of the items induce variations in the construct (the reverse does not hold); items are not exchangeable and do not covary. With reflective measures, items are seen as manifestations of the hypothesized construct whose variations are directly reflected in items responses; items are exchangeable and any one can be safely removed without altering the construct.

The former obviously subsumes an idea of causality while the latter more or less resembles what we find in most unidimensional measurement scale in medical science. How we treat items will have consequence on the choice of an appropriate model (formative items are assumed to be measured without error, which is not the case for reflective items) but also on the interpretation of the results.

An example of formative and reflexive constructs is shown in the following picture.

![path](/img/20111211213531.png)

However, I should note that the above controversy has also been discussed in older papers dealing with the assessment of health-related quality of life. I am thinking of two papers by Peter Fayers which are:

- Fayers, P.M. and Hand, D.J. (2002). Causal variables, indicator variables and measurement scales: an example from quality of life. *Journal of the Royal Society A*, 165(2), 233-261.
- Fayers, P.M. (2004). [Quality-of-Life Measurement in Clinical Trials--The Impact of Causal Variables](http://www.ncbi.nlm.nih.gov/pubmed/15027506). *Journal of Biopharmaceutical Statistics*, 14(1), 155-176.

In the second paper, it is said that:

> some items are essentially "causal variables," and this explains the seemingly strange results that have been observed by those who have previously compared the psychometric and clinimetric approach. (p. 157)

Indicator variables do not alter or influence the underlying concept but rather appear to be aspects of the construct, or indicator of its magnitude. Causal variables can cause the outcome to vary and need to be present for the construct to manifest itself. The author illustrates this view with the example of symptoms. Many HRQL scales include symptoms because they are part of what constitutes HRQL (good HRQL means the absence of pain or other severe symptoms) but symptoms do not reflect a patient's HRQL: "there is no indication that patients with a poor HRQOL are likely to suffer all symptoms", although "if they are present (score highly, say), then the patient’s HRQOL is reduced". Furthermore, "the more disease-specific a questionnaire is, the more likely it is to contain such questions as important items". So, clearly the relationship between the construct being measured and the manifest variables does not go in the same direction in both cases. About inter-item correlation, it is noted that "correlations arise from symptom clusters associated with the disease or treatment process and are indicators of the status of disease but not of HRQOL." More importantly, causal variables cannot be conditionally independent of each other with respect to the construct under investigation.

As a "thought test", Peter Fayers summarizes the following conditions:

- Does increase in item X (e.g., pain) indicate reduction in HRQL? For reflective and formative items, the answer is Yes. 
- Does reduction in HRQL imply increase in X? The answer might be Yes, but only for reflective items.

But let's note that "in practice many clinical variables will be of intermediate type." That means that psychometric methods should be used with caution which reminds of Borsboom (2006) who rightly said that:

> This is a psychometric embarrassment of riches. Even within this concise set of questions to be answered we encounter no less than four radically different conceptualizations of the relation between conscientiousness and conscientious behaviors: a universe-sampling relation (generalizability theory), a formative causal relation (formative model), a reflective causal relation with the latent variable categorical (latent class model), and a reflective causal relation with the latent variable continuous (IRT). Moreover, as the IRT example shows, within each of these conceptualizations there are many more fine-grained choices to be made before we truly have a candidate model. Literally none of these choices are dictated by substantive theory. (p. 435)


### Sidenote

At a more general level, the concept of causality in HRQL outcome studies has been discussed by Wilson and Clearly in the following paper: Wilson, I.B. and Cleary, P.D. (1995). Linking clinical variables with health-related quality of life. A conceptual model of patient outcomes, *JAMA*, 273, 59-65. This has led to this well-known outline of HRQL key constructs and their relationships:

![hrql](/img/20111212104356.png)

But see Mathisen, L. et al. (2007). [Quality of life can both influence and be an outcome of general health perceptions after heart surgery](http://www.hqlo.com/content/5/1/27). *Health and Quality of Life Outcomes*, 5, 27, for interesting dynamic models of the relationships between HRQL and health perception.

On a related perspective, there was an interesting paper by Atkinson and Lennox who considered five types of measurement models, depending on whether the measure is based on a (1) Multiple Effect Indicator model, (2) Multiple Cause Indicator model, (3) Single Item Effect Indicator model, (4) Single Item Cause Indicator model, or (5) Mixed Multiple Indicator model. Those models are depicted in the figure below:

![atkinson](/img/20111212111507.png)

Atkinson, M.J. and Lennox, R.D. (2006). [Extending basic principles of measurement models to the design and validation of Patient Reported Outcomes](http://www.zevep.com/dokumente/biomed/1477-7525-4-65.pdf). *Health and Quality of Life Outcomes*, 4, 65.
