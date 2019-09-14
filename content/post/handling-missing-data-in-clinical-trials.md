+++
title = "Handling missing data in clinical trials"
date = 2008-02-23T21:23:28+01:00
draft = false
tags = ["readings"]
categories = ["2008"]
+++

After co-authoring two very complete books on the use of mixed models for continuous and discrete outcomes<sup>(1,2)</sup>, G. Molenberghs offers the reader another great set of techniques for handling missing data in clinical study (RCT and observational data). Indeed, some of the datasets were already analysed in the preceding references. This really is a reference for every practician interested in the treatment of missing value. Extending the well-known book of Little and Rubin<sup>(3)</sup>, Missing Data in Clinical Studies puts a special emphasis on real-life case studies. Chapters 5, 6, 13, 25 and 26, among other, are dedicated to such practical case analysis.

Overall, this book provides an interesting discussion about potential design considerations that should be considered in order to mitigate patients from dropping out of a clinical study. Though some influential information might be missing in the pattern of individual responses, it is always better to take time to consider the imputation solution. In addition, the concept of missing-data mechanism is discussed along several chapters. Five general strategies of handling missing data are presented:

- Complete-case analysis
- Weighting methods
- Imputation methods
- Analysing data as incomplete- 
- Other" methods

Special mechanisms to handle missingness (MNAR, MAR) as well as the kind of data (continuous and/or discrete, latent class, etc.) at hand are all treated with the same systematic approach. Analyses are carried out using the SAS Software, through some incursion into other statistical package can also be found in the book.

I have hacked the complete [Table of Contents][Table of Contents], using shell scripts and emacs, as I cannot found it in a PDF decent format on the web, nor on Wiley's website. So, don't pay attention to TOC page numbers which do not reflect actual content of the book. However, Wiley offers [pdf excerpts](http://eu.wiley.com/WileyCDA/WileyTitle/productCd-0470849819.html) for Chapter 1 and Index.

### References

1. Verbeke, G. and Molenberghs, G. (2001). <em>Linear Mixed Models for Longitudinal Data</em>. Springer Verlag.
2. Molenbergs, G. and Verbeke, G. (2005). <em>Models for Discrete Longitudinal Data</em>. Springer Verlag.
3. Little, R.J.A. and Rubin, D.B. (2002). <em>Statistical Analysis with Missing Data</em> (2nd Ed.). Wiley.

[Table of Contents]: http://www.aliquote.org/articles/tech/MDCS/MDCS_toc.pdf "TOC"