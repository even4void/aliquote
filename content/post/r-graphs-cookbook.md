---
title: "R graphs cookbook"
date: 2015-01-15T23:17:28+01:00
draft: false
tags: ["review", "rstats", "dataviz"]
categories: ["2015"]
---

I just finished reading the [*R Graphs Cookbook*](https://www.packtpub.com/big-data-and-business-intelligence/r-graphs-cookbook) (2nd ed.), by Jaynal Abedin and Hrishi V. Mittal, edited by [Packt Publishing](https://www.packtpub.com).

<small> Not to be confused with the [R Graphics Cookbook](http://shop.oreilly.com/product/0636920023135.do), or its companion website, [Cookbook for R](http://www.cookbook-r.com).</small>

This is a basic introductory text on R graphics. Beyond building basic graphics, such as scatterplot, bar chart, or histogram, the authors show how to customize various elements of a statistical graphic using R base graphics (axis limits, axis labels, legend, etc.) or how to arrange several plots in using custom layout. Special graphics for geostatistics and time series analysis are also discussed, even if the reader would have benefited from learning more from the use of dedicated packages, like `zoo`, `tseries`, `maps` or `rgdal`. Often times, this book looks much more like a list of recipes, organized by section, à la Mitchell’s [*Visual Guide to Stata Graphics*](http://www.stata.com/bookstore/visual-guide-to-stata-graphics/) (Stata Press, 2008), although I prefer how the latter is organized. Only two chapters are dedicated to the modern grid-based plotting libraries, namely [lattice](http://cran.r-project.org/package=lattice) and [ggplot2](http://ggplot2.org). However, there are excellent books that were written by Paul Murrell and Hadley Wickham for that purpose.

### Pros

Clearly, this book is written for beginners in R, and it will certainly help those who feel afraid to review the [Contributed documentation](http://cran.r-project.org/other-docs.html) available on CRAN or find the 'graphs' and 'advanced graphs' sections of [Quick-R](http://www.statmethods.net) too limited. The authors provide "How it works" and "There’s more" text boxes where they take time to explain how a given graphic was produced and where to look for further refinement or enhanced R functions. The book layout is concise and functional, and the text includes hyperlinks which greatly facilitate the reading. 

### Cons

Although the authors show how to export graph in PDF, for example, they say little about how to customize the final rendering even if we wait chapter 15 to get a more detailed version of what was already covered at the end of chapter 2. Since publishers are often very stringent regarding graphic pictures (dimensions, resolution, etc.), I would have expected more technical details on how to set up custom image format and how to select a font using modern packages, e.g., the `extrafont` package. Likewise, the RColorBrewer package is used to define custom color palettes, but colourblind palettes are not even mentioned. Finally, the authors do not cover graphical representation specific of categorical variables in great details, although the [vcd and vcdExtra packages](http://cran.r-project.org/web/packages/vcdExtra/vignettes/vcd-tutorial.pdf) offer lot of functionalities. There are few paragraphs that would benefit from being rearranged: Sometimes, base R functions are intermixed with calls to `ggplot2` or `lattice` functions, which is unnecessary as there are two chapters for `lattice` and `ggplot2`; likewise, 3D plots are covered in two different chapters, whereas we would expect to find them at the same place.
