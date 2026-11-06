---
title: "Analysis of SNP distribution"
date: 2026-11-01T10:37:32+01:00
draft: false
tags: ["mathematica", "bioinformatics"]
categories: ["2026"]
---

In this post I'm going to talk about my adventures with Mathematica as I tackle
a small bioinformatics project. The idea is simple: We want to compute the
distribution of the distances between SNPs in a VCF file. In fact there are many
variant files but once we have a script for one, it can be used for all other
files. I think that if you want to master a piece of analysis software, you need
to use it as often as possible -- and, above all, on real-world projects rather
than toy examples, provided it is suited to the task at hand, of course.

The variant file was generated using [bcftools][1] as follows:

```shell
bcftools query -I ’TYPE="snp""’ -f ‘%CHROM %POS %REF %ALT\n’ strain.allsites.vcf.gz > strain.dist
```

The `strain.allsites.vcf.gz` comes from a separate pipeline but suffice it to
say that it contains all variants detected for a strain mapped over a reference
strain.

Let's go with the filtered VCF file (`strain.dist`) which contains only SNPs:

```wolfram
data = Import["strain.dist", "Table"];
sdata = SortBy[data, First];
chrm = SplitBy[sdata, First];
```

The file is expected to be sorted by contig and by genomic coordinates but it
doesn't cost much to sort things out again before splitting the nested list by
contig ID. Indeed, genomic positions are indexed for each contig so the analysis
must be carried out for each contig separately. Let's look a the first contig to
see how it goes:

```wolfram
Histogram[Differences[chrm[[1]][[All, 2]]], {50}]
```

This provides the distribution of succesive differences between each SNP with a
bin size of 50 bp. Now, let's apply this to all contig:

```wolfram
xs = Flatten[Differences[#[[All, 2]]] & /@ chrm];
Histogram[xs, {50}, ImageSize -> Large]
```

{{< figure src="/img/2026-11-01-10-51-07.png" >}}

We can do a lot more with empirical distributions in Mathematica. Here for
example, we plot the CDF of the empirical distribution (we could also use a
`SmoothKernelDistribution` estimate):

```wolfram
xd = EmpiricalDistribution[xs]
Plot[CDF[xd, x], {x, 0, 1000}, PlotRange -> {All, {0, 1}}]
```

How does it compare to a Negative Binomial Distribution, with parameters
estimated by maximum likelihood from the observed data?

```wolfram
Plot[{CDF[xd, x], 
  CDF[NegativeBinomialDistribution[n, p] /. params, x]}, {x, 0, 500}, 
 Exclusions -> None, PlotStyle -> Thick, PlotRange -> {All, {0, 1}}, 
 PlotLegends -> Placed[{"Empirical", "Model"}, {Right, Bottom}], 
 ImageSize -> Large]
```

{{< figure src="/img/2026-11-06-15-08-38.png" >}}

Clearly, there's a clear departure from the NB distribution in this case, but I
hope the above example shows the flexibility of Mathematica when it comes to
manipulate empirical and probability distributions. I would have more to say
about finding a good-looking PDF for this kind of data, but that should deserve
another post.

{{% music %}}LCD Soundsystem • *All I Want*{{% /music %}}

[1]: https://samtools.github.io/bcftools/
