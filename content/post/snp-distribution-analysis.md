---
title: "Analysis of SNP distribution"
date: 2026-11-01T10:37:32+01:00
draft: true
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
Histogram[Flatten[Differences[#[[All, 2]]] & /@ chrm], {50}, ImageSize -> Large]
```

{{< figure src="/img/2026-11-01-10-51-07.png" >}}

{{% music %}}LCD Soundsystem • *All I Want*{{% /music %}}

[1]: https://samtools.github.io/bcftools/
