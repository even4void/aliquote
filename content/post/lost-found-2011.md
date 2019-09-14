+++
title = "lost+found 2011"
date = 2012-01-01T21:17:32+01:00
draft = false
tags = ["misc"]
categories = ["2012"]
+++

Unfinished and very drafts posts from 2011.

<!--more-->

## Switching font in $\LaTeX$
<small>(January 2011)</small>

The default fonts that are used when writing a $\LaTeX$ document are known as Computer Modern (CM) or Extended Computer Modern (EC). The `lmodern` package allows to handle vector font (Type 1), so that you can use diacritical signs (e.g., when typesetting in French). For this to be possible, you just have to add

```latex
\usepackage[T1]{fontenc}
\usepackage{lmodern}
```

in the preamble of your $\LaTeX$ file. There is also the `cm-super` package whose description on CTAN should be self sufficient:

> The CM-Super package contains Type 1 fonts converted from METAFONT fonts and covers entire EC/TC, EC Concrete, EC Bright and LH fonts (Computer Modern font families). All European and Cyrillic writings are covered. Each Type 1 font program contains ALL glyphs from the following standard LaTeX font encodings: T1, TS1, T2A, T2B, T2C, X2, and also Adobe StandardEncoding (585 glyphs per non-SC font and 468 glyphs per SC font), and could be reencoded to any of these encodings using standard dvips or pdftex facilities (the corresponding support files are also included).

Now, $\LaTeX$ has revolutionized the way we can chnage the default font for Serif, Sans Serif, and Monospace families. See [XeTeX on the Web](http://www.tug.org/xetex/).

It is Not only easy to switch defaut fonts in a $\LaTeX$ document, but also within a $\TeX$ or Context document. In what follows, I shall describe some simple commands to change fonts in each case.

### $\LaTeX$

The straightforward way to handle other font families in a $\LaTeX$ processed through $\XeLaTeX$ is by way of the `fontspec` package. The `fontspec` package allows users of either `xetex` or `luatex` to load OpenType fonts in a $\LaTeX$ document.

So, just put

```latex
\usepackage{fontspec, xltxtra} 
\setmainfont{Apple Garamond} 
\setsansfont[Scale=0.86]{Fontin Sans} 
\setmonofont[Scale=0.8]{Menlo} 
```

in your preamble, and you'll get a nice document with Garamond for Serif text. Note that `xltxtra` loads `fontspec` by default. Here is how it looks:

![ex1](/img/20110123110923.png)

Optional arguments can be passed to `\set*font`, or globally with `fontspec`: `Mapping=tex-text`, `Ligatures={Common, Historical}`, `Numbers={OldStyle, Lining}`.

More detailed explanations can be found in the documentation (`$ texdoc fontspec`) for the `fontspec`package.

Font size can also be changed anywhere in the document using 

```latex
\fontsize{12pt}{18pt}\selectfont
```

which result in There is also a `Scale=` parameter (i.e., `Scale=1.4` would result in the given font diplayed at 140%); usually we use it to ensure that all characters are well aligned between the different font families, like in:

```latex
\defaultfontfeatures{Scale=MatchLowercase}
```

So, for instance, 

A lot of fonts come with a TeXLive installation, as can be seen below

```
$ ls /usr/local/texlive/2010/texmf-dist/doc/fonts/ | wc -l
    161
```

Don't forget to cache all your fonts

```
$ fc-cache -fv
```

Here, I look if I have Garamond somewhere

```
$ fc-list | grep -i gara
```

### $\TeX$

For example, the following instructions contained in a file `tex_ttf.tex`

```latex
\font\1="Inconsolata"\1 
\input knuth.tex
\bye
```

will typeset a short fragment using the freely available Monospace font [Inconsolata](http://www.levien.com/type/myfonts/inconsolata.html). The `knuth.tex` file comes with Context. On my TeXLive installation, it is found in the sample directory which is `/usr/local/texlive/2010/texmf-dist/tex/context/sample/`. The compilation is done with

```
$ xetex tex_ttf.tex
```

and the result is shown below.

![knuth](/img/20110124124841.png)

### Context

The default font used when typesetting in Context is Latin-modern. However, it is possible to use OTF or Type 1 font (with mkii and mkiv).

Font handling usually proceeds from so-called [Typescripts](http://wiki.contextgarden.net/TypeScripts).

The font database can be generated using

```
$ mtxrun --script fonts --reload
```

[Fonts in ConTEXt](http://pragma-ade.com/general/manuals/showfont.pdf) Manual section on [Fonts](http://context.aanhet.net/svn/contextman/context-reference/en/co-fonts.pdf) available from the SVN repository. See also [Fonts in LuaTeX](http://wiki.contextgarden.net/Fonts_in_LuaTeX).
 
### What best combination of fonts to use?

Did you ever wonder what combination of Serif, Sans and Mono does give the best rendering (on screen, and for printing)? I'm going to ask this on [tex.stackexchange.com](tex.stackexchange.com) because I didn't find anything reliable on Google.

[Kieran Healy](http://www.kieranhealy.org/) uses a nice combination of Minion Pro, Myriad Pro, and Pragmata (template available at [kjh-vita](http://kjhealy.github.com/kjh-vita/)).

According to the American Association of University Presses, Minion, ITC New Baskerville and FF Scala & 4. FF Scala Sans are the top three best fonts, but see
[Top Typefaces Used by Book Design Winners](http://fontfeed.com/archives/top-ten-typefaces-used-by-book-design-winners/).

- <http://www.tug.dk/FontCatalogue/dayroms/>
- <http://www.ctan.org/tex-archive/help/Catalogue/entries/kpfonts.html>
- Daniel Rhatigan, [Three typefaces for Mathematics](vhttp://www.typeculture.com/academic_resource/articles_essays/pdfs/tc_article_47.pdf)



## Outlier detection
<small>(February 2011)</small>

This is a very small note on outlier detection with methods based on PCA, Random Forests and Malahanobis distances.

The motivation for this "benchmark" originates from a [question](http://stats.stackexchange.com/questions/213/what-is-the-best-way-to-identify-outliers-in-multivariate-data) at [stats.stackexchange.com](http://stats.stackexchange.com).

The dataset we will use is the `iris` data. It is composed of four measures collected on threes species (each with 50 individuals): sepal length and width, and petal length and width.

### Brushing the data

Before starting to look at the automatic detection of possible outliers, let's go though the data itself. A rough picture is provided below, with smooth estimates of the within-group tendencies superimposed onto the scatterplot matrix. The code that is used to generate this graphics is shown below:

```r
library(lattice)
trellis.par.set(list(fontsize = list(text=9, points=6)))
splom(iris[,1:4], groups=iris[,5], type=c("p","g","smooth"), 
      lwd=2, pch=19, alpha=.4, auto.key=list(space="top", columns=3))
```

![xyplot](/img/20110228142718.png)

A convenient way to look interactively at the data is to rely on some kind of brushing. Actually, without resorting to [GGobi](http://www.ggobi.org/), it is available through [iPlots](http://cran.r-project.org/web/packages/iplots/index.html), or its next-gen version [Acinonyx](http://RForge.net/Acinonyx/), or the `tkBrush()` function from the [TeachingDemos](http://cran.r-project.org/web/packages/TeachingDemos/index.html) package. (The latter makes use of `Tk` so make sure it is installed on your machine.)

```r
data(iris)
library(TeachingDemos)
tkBrush(iris)
```

Well, we spotted three individuals that seem to exhibit some extreme pattern of measures when considering sepal width x sepal or petal length. These are inviduals 42, 118, and 132, see `.Last.value$pch`. It should be emphasized that this way of doing is plenty wrong if we look for multivariate outliers: Here, we are just looking at bivariate relationships, so it is likely that we will fail to identify good candidates in the 4D space.

![brush](/img/20110228125757.png)


### PCA outlier detection

Let's plot individual scores on the last two components, which are supposed to account for the lowest amount of variance:

```r
iris.pca <- princomp(iris[,-5])
plot(iris.pca$scores[,3:4])
```

Then, we can highlight the most extreme points in this point cloud using, for example, convex hull. Here is how it would look

```r
chpts <- chull(iris.pca$scores[,3], iris.pca$scores[,4])
polygon(iris.pca$scores[chpts,3], iris.pca$scores[chpts,4], lty=3)
```

![xyplot](/img/20110228145501.png)

The most extreme points are 

```r
> chpts
  [1]  85 135 123  63  88  69  42 142 115 137 101
```


### RF outlier detection

The idea is to use the proximity measure that is derived from an RF model. It is readily available in the `outlier` function of the [randomForest](http://cran.r-project.org/web/packages/randomForest/index.html)
package.

```r
set.seed(1)
iris.rf <- randomForest(Species ~ ., data=iris, proximity=TRUE)
outl <- outlier(iris.rf)
head(sort(outl, decr=TRUE), n=10)
```

In the next figure, I have highlighted those 10 indivduals in red:

```r
pairs(iris[,-5], col=ifelse(outl>68.78, "red", "black"))
```

![rfoutlier](/img/20110228130451.png)


### Malahanobis outlier detection 

This time, we use the [mvoutlier](http://cran.r-project.org/web/packages/mvoutlier/index.html) and the `chisq.plot()` function that will plot the ordered robust mahalanobis distances of the data against the quantiles of the χ<sup>2</sup> distribution.

```r
library(mvoutlier)
chisq.plot(iris[,1:4])
```

## Distributed computing
<small>(February 2011)</small>

### Xgrid

- <http://macdevcenter.com/pub/a/mac/2005/08/23/xgrid.html?page=2>
- <http://www.macresearch.org/openmacgrid_is_easy_peasy>
- <http://www.macresearch.org/the_xgrid_tutorials_part_i_xgrid_basics>


### PVM

An alternative way to go with distributed computing or virtualization on OS X is to use pvm

There are detailed instructions in a README file but something went wrong for me (and I guess, it applies to everyone with a Mac). So, here is how to compile pvm3:

1. Set an environment variable for the place you want pvm to live in; I choose `export PVM_ROOT=/usr/local/share/pvm3`.
2. If you decide to put pvm3 in a non writable directory (as above), change permission accordingly (e.g., `sudo chown username /usr/local/share/pvm3`).
3. Edit the `Makefile` at the toplevel directory and change `AIMKSTR` to reflect the correct `def` file; in my case, `-here -f ./conf/MACOSX.def -f ./Makefile.aimk`.
4. Edit the file `src/pmsg.c` and comment out the static redefinition of the `xdr_float()` and `xdr_double()` functions (or find a way to alter the `-DFAKEXDRFLOAT` flag that is being passed to `cc` when compiling.


## A short implementation of the `shuf` program for Mac OS X.
<small>(August 2011)</small>

Based on a solution posted on Stack Overflow.

```perl
use List::Util 'shuffle';

@list = <STDIN>;
@shuffled = shuffle(@list);
$n = $#ARGV+1 == 1?$ARGV[0]-1:$#shuffled;
print @shuffled[0..$n];
```

## Testing Mahout
<small>(August 2011)</small>

```
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] 
[INFO] Apache Mahout ..................................... SUCCESS [18.464s]
[INFO] Mahout Build Tools ................................ SUCCESS [11.130s]
[INFO] Mahout Math ....................................... SUCCESS [34.161s]
[INFO] Mahout Core ....................................... SUCCESS [1:06:19.256s]
[INFO] Mahout Integration ................................ SUCCESS [2:45.826s]
[INFO] Mahout Examples ................................... SUCCESS [1:29.287s]
[INFO] Mahout Release Package ............................ SUCCESS [0.026s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 1:11:39.255s
[INFO] Finished at: Sat Aug 06 01:59:43 CEST 2011
[INFO] Final Memory: 25M/97M
[INFO] ------------------------------------------------------------------------
```
