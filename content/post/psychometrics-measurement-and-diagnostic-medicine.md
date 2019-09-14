+++
title = "Psychometrics, measurement, and diagnostic medicine"
date = 2010-11-26T21:43:38+01:00
draft = false
tags = ["readings", "psychometrics"]
categories = ["2010"]
+++

I just finished reading some recent articles from [Denny Borsboom](http://sites.google.com/site/borsboomdenny/dennyborsboom). Two of them deal with diagnostic and the international classification of diseases from a measurement and conceptual perspectives. These are actually really excellent papers as they bring psychometrics in the field of health measurement and diagnostic.

<!--more-->

- [Psychometric Perspectives on Diagnostic Systems](http://sites.google.com/site/borsboomdenny/PsychometricPerspectivesandDiagnosti.pdf), J. Clin. Psy. (2008) 64(9): 1089--1108.
- [Comorbidity: A network perspective](http://sites.google.com/site/borsboomdenny/CramerEtAl2010.pdf), BBS (2010) 33: 137--193.

The first paper gives a nice overview of the core idea of the second one. It is organized along two main ideas. The first deals with three approaches--constructivist, dimensional, and diagnostic--to study (and more generally, to conceptualize) the relation between symptoms and underlying constructs. This is nicely summarized (p. 1098) as:

> Whereas the contructivist view accepts empirical relations between symptoms as a fact, but makes no assumptions on the origin of these relations, the diagnostic and dimensional views share the idea that the symptoms hang together empirically because they measure the same latent structure. This structure is categorical in the diagnostic view and continuous in the dimensional view, but in both cases it plays the same role; namely it enters in the model as a representative for "that which the symptoms measure"--whatever it may turn out to be.

What about measurement theory? In fact, the diagnostic view can be well represented by Latent Class models, while the diagnostic view, which conceptualize disorders as continuous attributes rather than discrete classes, calls for Latent Trait models (or so called liability-threshold model).

The second main idea of that paper is that relations between symptoms can be envisioned as a causal system instead of a latent variable model where, in this case, their correlations would be a spurious side-effect of the model (conditional on a value of their common cause, here an hypothesized latent trait, there is no correlation between manifest variables, here symptoms--this is basically the hypothesis of local independence). Indeed, under this model relations between symptoms merely reflects causal effects of some of them onto the others. This has obviously strong implications for current 

I fetched quite all the papers references in the bibliography section, and additional papers on IRT models and formative measurement. Here is the <i class="fa fa-file-code-o fa-1x"></i> [BibTeX](http://www.aliquote.org/pub/dsm_irt.bib) file.

In the second paper, the author and his coworkers develop along these ideas a network approach to comorbidity which is "hypothesized to arise from direct relations between symptoms of multiple disorders.", contrary to the more classical view where these are comorbid disorders themselves that causes their associated symptoms to correlate (as reflected in a latent variable model, like factor or item response models, where a given symptom would allow to measure a particular disorder). In fact, symptoms are part of disorder, but they don't measure it: This a mereological relationship. In other words, 

> The central idea is that disorders are networks that consist of symptoms and causal relations between them. In a nutshell, what binds, say, the set of depression symp- toms, is that they are thus connected through a dense set of strong causal relations. With regard to comorbidity, such a network approach presents a radically different conceptualization of comorbidity, in terms of direct relations between the symptoms of multiple disorders.

Of course, there would be much to say about empirical evidence provided by these authors on major depression and generalized anxiety (pp. 141-143). Interestingly, they used a software for [network visualization](http://aliquote.org/memos/2008/05/19/networks-graphs-and-visualization) that I had nevener heard about before: [Cytoscape](http://www.cytoscape.org/). On a related point, I found on [Angélique Cramer](http://www.aojcramer.com/) homepage another promising software, the [Q-graph software](http://sites.google.com/site/qgraphproject/home) <i class="fa fa-chain-broken fa-1x"></i> package for R, whose "original purpose was to find how data from a questionnaire (the q in qgraph) could be represented as a causal graph."
