---
title: "Zoo of data formats"
date: 2019-03-21T20:58:50+01:00
draft: true
tags: ["statistics"]
categories: []
---
The more I read on data formats, the more I think it is getting difficult to arrive at a common data format.

<!--more-->

What's striking is that some data files come with their own header, like [sam](https://www.samformat.info/sam-format-flag) files or Weka [arff](https://www.cs.waikato.ac.nz/ml/weka/arff.html) files, while other data files remain divided into several pieces and do not necessarily include much information other than the data itself. This is often the case when there's only one type of mesurement (e.g., read sequence or activity level) but we need to convey different kind of information, like in [bed/bam/fam](http://zzz.bwh.harvard.edu/plink/binary.shtml) files or hdr/img ([NIFTI](https://nifti.nimh.nih.gov/nifti-1/)) files. Moreover, we may found plain text version (sam or ped) and binary version (bam or bed) of the same data file, for obvious reasons of disk space saving. I'm fine with all that. 

However, I've always been a bit bothered by the fact that it is quite difficult to handle a dictionary file with a raw data file in R or Python. Stata, for example, allows to define a dictionary that contains the type and label of each variable. There's nothing close in R, except perhaps the [csvy](http://csvy.org) package which tries to append metadata as a YAML header in CSV files. There is an R [package](https://cran.r-project.org/web/packages/csvy/index.html) that handles CSVY file format quite nicely. To the best of my knowledge, such files cannot be used by Python unless you skip the header lines like you would do with comments in a CSV file.

