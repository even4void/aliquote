+++
title = "Design of experiment in R"
description = ""
date = 2011-05-28T12:41:42+01:00
draft = false
tags = ["rstats", "statistics"]
categories = []
+++

When I started writing my companion textbook for Montgomery's *Design and Analysis of Experiments*, there was not so much dedicated package available on CRAN.


Now, I realize that there are a lot of very handy packages on CRAN. Most of them were released in 2010 and are listed in the correspoding Task View, [ExperimentalDesign](http://cran.r-project.org/web/views/ExperimentalDesign.html).

In the White Book (*Statistical Models in S*, Chambers & Hastie, 1992), section 5.2.3 pp. 169-175 is dedicated to full- and fractional factorial designs, with `fac.design` and `oa.design`. However, those two functions are not available in R, and we only have `expand.grid` (see Venables & Ripley, MASS 4th ed., pp. 167-169) which is not very useful for the purpose of generating fractional designs.


Let's consider a 2<sup>5-2</sup> design, with the following generator: D=±AB and E=±AC. The corresponding design matrix can be easily found using the [BHH2](http://cran.r-project.org/web/packages/BHH2/index.html) package, which provides R functions and datasets from Box, Hunter and Hunter's book, *Statistics for Experimenters II* (Wiley, 2005):

```r
library(BHH2)
d52 <- ffDesMatrix(5, gen=list(c(4,1,2), c(5,1,3)))
```

Or we can use 

```r
library(FrF2)
FrF2(8,5)
```

Note that the [FrF2](http://cran.r-project.org/web/packages/FrF2/index.html) package has an [Rcmdr plugin](http://cran.r-project.org/web/packages/RcmdrPlugin.DoE/index.html) that facilitates its use.

In both cases, we get

```
   A  B  C  D  E
1 -1  1 -1 -1  1
2 -1 -1 -1  1  1
3 -1 -1  1  1 -1
4  1  1 -1  1 -1
5 -1  1  1 -1 -1
6  1 -1  1 -1  1
7  1 -1 -1 -1 -1
8  1  1  1  1  1
```

Now, we want to find the aliases that this structure defines. We already know that for this kind of 2<sup>5-2</sup> design, every main effect is aliased with at least one first order interaction. Let's check it:

```r
> design.info(FrF2(8,5))$aliased
$legend
[1] "A=A" "B=B" "C=C" "D=D" "E=E"

$main
[1] "A=BD=CE" "B=AD"    "C=AE"    "D=AB"    "E=AC"   

$fi2
[1] "BC=DE" "BE=CD"
```

There's lot [more to see](http://rgm2.lab.nig.ac.jp/RGM2/func.php?rd_id=FrF2:FrF2-package) in this package, including plot of main effects in 2<sup>k</sup> designs, Daniel's plot, "cube plot", alias structure for standard `lm` object, or construction of split-plot designs.
