+++
title = "Applications of Latent Trait and Latent Class Models in the Social Sciences"
description = ""
date = 2008-02-10T21:22:47+01:00
draft = false
tags = ["readings", "psychometrics"]
categories = []
+++

There is a printable on-line version of the book at the following address: <http://www.ipn.uni-kiel.de/aktuell/buecher/rostbuch/ltlc.htm>. This is really a great ressource for social scientists (which I am not) and those looking for practical applications of Item Response Theory and Latent Class Analysis.

I have no doubt that the open-source [R][R] statistical package will allow to fit almost all of the models used throughout the book. At first sight, the "Social Sciences and Psychometrics" task view on CRAN should provide link to several packages relevant to such analysis. In particular, for IRT models I recommend the use of ltm and eRm package. The package poLCA is indeed dedicated to LCA.

There is also an on-line handbook on [Multilevel Statistical Models][Multilevel Statistical Models] written by Harvey Goldstein in 1999. This a PDF version, without restriction of any kind (no print/save-disabled). Other useful on-line ressources (in French) include the [Quality of Life Workshop][Quality of Life Workshop] held by the groupe *Biopharmacie et Santé* of the SFdS (French Statistical Society). Finally, don't forget the great INSERM annual workshops, among which one can found *Méthodes statistiques pour la mesure d'indicateurs subjectifs en santé*.

### Chapter 2: Lenient or strict application of IRT with an eye on practical consequences (I.W. Molenaar).

This article compares different approaches for the analysis of subjects' scores gathered through calibrated scales composed of polytomous items. The different model that were used are: the nonparametric Mokken Model, the Partial Credit Model, which derives from the [Rasch][Rasch] Model, and the OPLM Model. The latter stands for One Parameter Logistic Model and allows to deriving the parameters of items layered onto an unidimensional scale (like the Rasch Model) after preseting discrimination indexes (usually, in the range 1--15). The author's conclusions are that the choice of the model, and thus the strict application of the Measurement hypotheses (unidimensionality, local independance, specific objectivity), does lead to quite the same pattern of results. However, scores (e.g. rank or latent scores) interpretation should take into account the kind of model used.

The R functions `mokken {mokken}`, `PCM {eRm}` allow to fit Mokken Model as well as PCM. I'm not aware of any open-source implementation of the OPLM package distributed by [Cito][Cito].


[R]: http://www.cran.r-project.org/ "R"
[Multilevel Statistical Models]: http://www.soziologie.uni-halle.de/langer/multilevel/books/goldstein.pdf "MSM"
[Quality of Life Workshop]: http://pagesperso-orange.fr/european-seminar-survival-qol/QoL-SFdS/ "Quality of Life Workshop"
[Rasch]: http://en.wikipedia.org/wiki/Rasch_model "Rasch"
[Cito]: http://www.cito.nl "Cito"