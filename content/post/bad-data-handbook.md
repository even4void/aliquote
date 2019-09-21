---
title: "Bad data handbook"
date: 2014-11-02T13:38:13+01:00
draft: false
tags: ["review", "statistics"]
categories: ["2014"]
---

I just finished reading the *Bad Data Handbook*, edited by Q. Ethan McCallum (O'Reilly, 2013). This is a nice book with interesting chapters on data munging and data verification.

Among the authors, you will find a long list of well-known statisticians and data hackers: [Paul Murrell](https://www.stat.auckland.ac.nz/~paul/) (besides R extensions to the `grid` package, he authored [Introduction to Data Technologies](https://www.stat.auckland.ac.nz/~paul/ItDT/)), Richard Cotton ([4D Pie CHarts](http://4dpiecharts.com/about/)), or [Philipp K Janert](http://www.beyondcode.org), who wrote *Data Analysis with Open Source Tools* (O’Reilly, 2010), another great handbook on applied statistics using GNU software.

While Kevin Fink (Chapter 1, "Is It Just Me, or Does This Data Smell Funny?") provided Perl code exclusively, I had the pleasure to read beautiful Python snippets from Josh Levy's chapter ("Bad Data Lurking in Plain Text"), and a nice historical sketch of text encoding starting with 7-bit ASCII encoding to Unicode (UTF-8 and 16). This also reminded me of how dealing with various charsets (including [Windows CP 1252](http://en.wikipedia.org/wiki/Windows-1252)) really sucks in R, while Stata is not that good when it comes to UTF-8; so the solution to normalize data to UTF-8 is not necessarily the penultimate solution, but it will probably help. Please, everybody, use UTF-8 now! There's a small utility called [iconv](https://www.gnu.org/software/libiconv/) that is really great for that purpose.

When reading Paul Murrell's chapter, "Data Intended for Human Consumption, Not Machine Consumption", I discovered the [XLConnect](http://cran.r-project.org/web/packages/XLConnect/index.html) R package to read Excel spreadsheets directly in R instead of relying on intermediate CSV file.[^1] Now that I know that sometimes it is better to [read data directly from Excel](http://stats.stackexchange.com/a/113335/930), the technique described by the author to extract and process data formatted in several 'non-regular' Excel Tables (of course, this assumes that such custom layout applies to all Tables), I will probably consider working with Excel files directly for my next project (yeah, that seems to the year where all the databases I have to work on are provided to me as freak Excel spreadsheets).

[^1]: See also [A million ways to connect R and Excel](http://www.thertrader.com/2014/02/11/a-million-ways-to-connect-r-and-excel/) for an overview of other packages.
