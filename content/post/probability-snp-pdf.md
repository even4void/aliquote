---
title: "Spatial distribution of SNPs"
date: 2026-11-05T19:55:04+01:00
draft: true
tags: ["bioinformatics", "statistics"]
categories: ["2026"]
---

This post is related to a preceding one on quickly analyzing the [distribution of SNPs][1] across genome reads. This time we are interested in the spatial distribution of SNPs under a simplified model which considers random mutations without selective pressure nor sequence bias.[^1] In that particular case, the distribution of SNPs is expected to follow a homogeneous Poisson process, according to which the probability of finding $k$ SNPs in a window of size $w$ on a genome is given by:

$$ P(K=k)=\frac{(\lambda w)^{k}e^{-\lambda w}}{k!}, $$

where $\lambda$ reflects the average density of SNP per bp. Henceforth, the distance between any two neighbor SNP follows an Exponential distribution, with parameter $\lambda$.

This simplified model does not hold for biological species I am interested in, and probably not at all except in textbooks.


{{% music %}}Machines of Loving Grace • _Animal Mass_{{% /music %}}

[^1]: We discussed a related issue, [Finding a DNA sequence in a genome][2], a while ago already.

[1]: /post/snp-distribution-analysis/
[2]: /post/dna-sequence-probability/