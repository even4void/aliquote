---
title: "Web scraping with Perl"
date: 2010-04-04T08:49:55+01:00
draft: false
tags: ["misc"]
categories: ["2010"]
---


Since I needed the list of all ICD9 codes for my work, I decided to implement a lightweight web crawler in Perl, with the aims of parsing all codes found at [ICD9Data.com][ICD9Data.com].

It seems that the [WWW-Mechanize][WWW-Mechanize] module provides all what I needed. In fact, I also realized that this technique may be extended to catch up anything on a website, which is called web scraping.


> Web scraping is the process of automatically collecting Web information. Web scraping is a field with active developments sharing a common goal with the semantic Web vision, an ambitious initiative that still requires breakthroughs in text processing, semantic understanding, artificial intelligence and human-computer interactions. Web scraping, instead, favors practical solutions based on existing technologies even though some solutions are entirely ad hoc. --- <http://en.wikipedia.org/wiki/Web_scraping>


The final result will be available on my website soon. While reading the on-line Perl receipes, I took the occasion to adapt one example script to download all ConTeXt manuals from the [PRAGMA][PRAGMA] website. However, I just realized that almost all manuals are available in $\TeX$ format at http://context.aanhet.net/svn/.

### Update

I found in Berman's *Perl Programming for Medicine and Biology* (2007, Jones and Bartlett Publishers) another Perl script that the author suggested for collecting the ICD codes from the UMLS metathesaurus (Chapter 5). The [UMLS][UMLS] metathesaurus is actually the largest medical nomenclature, and it includes more than 100 different biomedical vocabularies with about 6 million term records. These term records are in a file named MRCONSO which is available at no cost, provided you first register on UML website. Here is an example of what it looks like:

```
C0000005|ENG|X|L0000005|PF|S0007492|Y|A7755565||M0019694|D012711|MSH|PEN|
D012711|(131)I-Macroaggregated Albumin|0|N||
```

The example proposed in the book consists in extracting all vocabulary terms from MRCONSO, with their unique ID (i.e., Concept Unique Identifier Code). This reads as follows:

```perl
$line = " ";
$start = time();
open(TEXT, "MRCONSO");
open(OUT, ">icd.txt");
while ($line ne "") {
  $line = <TEXT>;
  @linearray = split(/\|/,$line);
  $icdnumber = $linearray[13];
  $language = $linearray[1];
  $term = $linearray[14];
  $vocabulary = $linearray[11];
  next if ("ENG" ne $language);
  next unless ($vocabulary =~ /ICD10AM/);
  print OUT "$icdnumber $term\n";
}
$end = time();
$total = $end-$start;
print "\nTotal time was $total seconds\n";
```

[ICD9Data.com]: http://www.icd9data.com/2009/Volume1/ "ICD9Data.com"
[WWW-Mechanize]: http://search.cpan.org/dist/WWW-Mechanize/ "WWW-Mechanize"
[PRAGMA]: http://www.pragma-ade.com/show-man-1.htm "PRAGMA ADE"
[UMLS]: http://www.nlm.nih.gov/research/umls/
