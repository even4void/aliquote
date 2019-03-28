---
title: "Zoo of data formats"
date: 2019-03-27T20:58:50+01:00
draft: false
tags: ["statistics"]
categories: []
---
The more I read on data formats, the more I think it is getting difficult to arrive at a common data format. Each data analyst does his or her own thing, with his/her preferred statistical package

<!--more-->

Nobody seems to use the [SDMX](https://sdmx.org) data format, except people from the EC, the OCDE or other big tenants of official statistics. Likewise, the CDISC and [STDM](https://www.cdisc.org/standards/foundational/sdtm) standards are limited to clinical trials.

What's more striking is that some data files come with their own header, like [`sam`](https://www.samformat.info/sam-format-flag) files or Weka [`arff`](https://www.cs.waikato.ac.nz/ml/weka/arff.html) files, while other data files remain divided into several pieces and do not necessarily include much information other than the data itself. This is often the case when there's only one type of mesurement (e.g., read sequence or activity level) but we need to convey different kind of information (e.g., subject's level information and target measurement), like in [`bed+bam+fam`](http://zzz.bwh.harvard.edu/plink/binary.shtml) files or `hdr+img` ([NIFTI](https://nifti.nimh.nih.gov/nifti-1/)) files. This is mostly a way to avoid using a database given that dedicated software will handle inner joins for us. Moreover, there may exist plain text version (e.g., `sam` or `ped` files) and binary version (`bam` or `bed` fiels, repsectively) of the same data file, for obvious reasons of disk space saving. I'm fine with all that. 

However, I've always been a bit bothered by the fact that it is quite difficult to handle a dictionary file, also called a codebook, with a raw data file in R or Python. It looks to me that this is a fundamental piece of information when you're working on a new dataset. What I noticed over the years I was working in medical statistics is that data managers tend to record their codebook in Excel, while the raw data are stored in a statistical database (SAS or Stata)--even if Stata allows to define a [dictionary](https://www.stata.com/support/faqs/data-management/infile-dictionary-options/) that contains the type and label of each variable. There's nothing close in R, except perhaps the [csvy](http://csvy.org) package which tries to append metadata as a YAML header in CSV files. There is an R [package](https://cran.r-project.org/web/packages/csvy/index.html) that handles CSVY file format quite nicely. To the best of my knowledge, such files cannot be used by Python unless you skip the header lines like you would do with comments in a CSV file.

Note that I am not talking about handling categorical variables. There are many solutions avaialble in R (again, not as nice as in Stata, even if I'm quite impressed by the [work](https://strengejacke.github.io/sjlabelled/) [done](https://strengejacke.github.io/sjmisc/) by Daniel Lüdecke). Personally, I stand by the [Hmisc](https://aliquote.org/post/hmisc-and-rms/) package (it also handles variable labels, by the way), since it integrates quote nicely with the [rms](http://biostat.mc.vanderbilt.edu/wiki/Main/RmS) package which I have been using for years. I keep hoping some day we will see full integration of `Hmisc` into RStudio data browser or the [tibble](https://tibble.tidyverse.org) package. I must confess I don't know enough about the state of the art in Python since I do not use Python for managing statistical data, but I doubt there are that many solutions available in that ecosystem.

In short, the beauty of data analysis can be summed up in the diversity of data formats. The more we learn about their value and possible limitations, the more we learn new techniques for investigating raw data.

