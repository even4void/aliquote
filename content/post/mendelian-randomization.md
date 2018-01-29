+++
title = "Mendelian randomization"
date = 2012-06-15T21:05:47+01:00
draft = false

tags = []
categories = []

[header]
image = ""
caption = ""
preview = true

+++

Some time ago, I proposed a paper on Mendelian randomisation for the Journal Club on [Cross Validated](http://stats.stackexchange.com/). Apparently, it fell to the water, but here are the main ideas from that paper.

The paper in question is freely available on *PLoS Medicine*:
Sheehan NA, Didelez V, Burton PR, Tobin MD (2008). [Mendelian Randomisation and Causal Inference in Observational Epidemiology](http://www.plosmedicine.org/article/info%3adoi/10.1371/journal.pmed.0050177). PLoS Med 5(8): e177. doi:10.1371/journal.pmed.0050177

An older paper can also be found in the *International Journal of Epidemiology*, ['Mendelian randomization': can genetic epidemiology contribute to understanding environmental determinants of disease?](http://www.ncbi.nlm.nih.gov/pubmed/12689998). [Mendelian randomization in family data](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2795944/) (BMC Proc. 2009; 3(Suppl 7): S45) is another paper on Mendelian randomization with aggregation at the family level.

In few words, the idea behind Mendelian randomisation--which, from a genetic perspective, is all about the random assortment of genes from parents to offspring that occurs during gamete formation and conception[^1]--is to use a known genetic variant as a proxy to assess potential confounding between an intermediate phenotype and the disease of interest, something akin to the use of [instrumental variable](http://en.wikipedia.org/wiki/Instrumental_variable) in <i class="fa fa-file-pdf-o fa-1x"></i> [econometrics](http://www.economics.harvard.edu/faculty/stock/files/isb201049.pdf). Most importantly, this genetic variant is unrelated to the confounding factor(s), but it is predictive of the exposure factor. The effect of the genetic variant is not direct, and conditional on exposure and confounders the genetic variant is independent of the outcome. Testing the association between this genetic variant and the outcome amounts to test for the causal effect exposure → outcome.

Several limitations of Mendelian randomization are discussed, including the presence of [linkage disequilibrium](http://en.wikipedia.org/wiki/Linkage_disequilibrium), genetic heterogeneity (when a phenotype is influencedby several alleles, generally at different loci), pleiotropy (when a genetic variant has more than one phenotypic effect), or population stratification (when the relation between allele frequencies and disease or exposure vary across subgroups), to name a few. Figures 2-5 provide nice depictions of what happens in those cases.


### References

1. Chen, L, Smith, GD, Harbord, RM, and Lewis, SJ (2008). [Alcohol intake and blood pressure: A systematic review implementing a Mendelian randomization approach](http://www.plosmedicine.org/article/info:doi/10.1371/journal.pmed.0050052). *PLoS Med* 5: e52.
2. Hernán MA, Robins JM (2006). <i class="fa fa-file-pdf-o fa-1x"></i> [Instruments for causal inference. An epidemiologist's dream](http://www.harvardschoolofpublichealth.org/faculty/miguel-hernan/files/hernan_epidemiology06.pdf). *Epidemiology* 17: 360–372.
3. Smith, GD, Ebrahim, S, Lewis S, Hansell AL, Palmer LJ, and Burton, PR (2005). <i class="fa fa-file-pdf-o fa-1x"></i> [Genetic epidemiology and public health: Hope, hype, and future prospects](http://www.montefiore.ulg.ac.be/~kvansteen/GeneticEpi-PublicHealth/ac0910/Chapter1/InClassReading_CH1b_Smith2005.pdf). *Lancet* 366: 1484–1498.
4. Smith, GD and Ebrahim, S (2003). ['Mendelian randomization': Can genetic epidemiology contribute to understanding environmental determinants of disease](http://ije.oxfordjournals.org/content/32/1/1.short). *International Journal of Epidemiology* 32(1): 1–22.
5. Katan, MB (1986). [Apolipoprotein E isoforms, serum cholesterol, and cancer](http://www.jameslindlibrary.org/system/attachments/14/original/katan-1986.pdf?1299076010) <i class="fa fa-chain-broken fa-1x"></i> . *Lancet* i: 507–508. (See also this [IJE paper](http://www.epidemiology.ch/history/PDF%20bg/Katan%20MB%202004%20apolipoprotein%20E%20isoforms,%20serum%20cholest.pdf))
6. Cambien, F (2003). [On Mendelian Randomisation](http://genecanvas.ecgene.net/readarticle.php?article_id=197). GeneCanvas.
7. Didelez, V and Sheehan, NA (2007). <i class="fa fa-file-pdf-o fa-1x"></i> [Mendelian randomisation as an instrumental variable approach to causal inference](http://www.maths.bris.ac.uk/~maxvd/smmr_mendel_print.pdf). *Statistical Methods in Medical Research* 16: 309–330.
8. Lawlor, DA, Harbord, RM, Sterne, JAC, Timpson, N, and Smith, GD (2008). <i class="fa fa-file-pdf-o fa-1x"></i> [Mendelian randomization: Using genes as instruments for making causal inferences in epidemiology](http://www.people.vcu.edu/~bsmaher/MendRand1.pdf). *Statistics in Medicine* 27: 1133-1163.

[^1]: In the context of [genetic association study](http://en.wikipedia.org/wiki/Genetic_association), Mendelian laws ensure that the comparison of groups of individuals defined by genotype is equivalent to a [randomized comparison](http://ecgene.net/genecanvas/readarticle.php?article_id=197), such that genetic or non-genetic traits are expected to be distributed randomly across genotypes, except those that are affected by the polymorphism under study. Whence the bias-free comparison of phenotypes across genotypes and the idea that such results might bring insight into causal pathways.
