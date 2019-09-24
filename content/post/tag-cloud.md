---
title: "Visualizing data using tag cloud"
date: 2010-04-17T18:04:50+01:00
draft: false
tags: ["dataviz", "rstats"]
categories: ["2010"]
---

Tag cloud consists in a layered plot of words where font size is proportional to word's frequency. The challenge is to arrange each element in a coherent and elegant layout. Nowadays, tag clouding is available in many SDKs, including [Google Viz. API][Google Viz. API], see [WordCloud][WordCloud]. However, few offer the quality that is found using on-line generator like [Many Eyes][Many Eyes] or [Wordle][Wordle].

Here are some examples I've built myself, although I've tried many layouts and fonts.

{{< fluid_imgs
  "pure-u-1-2|/img/20100201231620.png"
  "pure-u-1-2|/img/20100201231726.png" >}}
<br>
{{< fluid_imgs
  "pure-u-1-2|/img/20100201231754.png"
  "pure-u-1-2|/img/20100201231853.png" >}}

Recently, I came across the website of Yihui Xie (who creates the [R][R] `animation` package) and its wonderful [tag could in Flash](http://yihui.name/en/2009/06/creating-tag-cloud-using-r-and-flash-javascript-swfobject/).

Here are the solutions I tested within [R][R]. First, using the `cloud()` function in the `snippets` package (available on [R-Forge][R-Forge]).

```r
library(snippets)
txt <- tolower(scan("all_cut.txt", what="character"))
# filter some irrelevant tokens
txt <- gsub("([.]|[()/]|[0-9]*)","",txt)
# remove infrequent word or of length < 4
txt <- txt[nchar(txt)>3]
wt <- table(txt)
wt <- log(wt[wt > 8])
cloud(wt, col = col.br(wt, fit=TRUE))
```

![](/img/20100417113155.png)

Then I tried to arrange the (x,y) layout, by randomly assigning words to distinct spatial locations. I also tried a 3D layout, where words lie on a sphere:

```r
library(ggplot2)
xy <- as.data.frame(cbind(replicate(2, runif(length(wt))),as.numeric(wt)))
dimnames(xy) <- list(names(wt),c("x","y","freq"))
theme_set(theme_bw())
p <- ggplot(xy, aes(x=x, y=y, label=rownames(xy), col=exp(freq)))
p + geom_text(fontfamily='Fontin') + xlim(c(-.2,1.2)) + ylim(c(-.2,1.2)) +
    labs(x=NULL, y=NULL) + opts(panel.border=theme_blank(), 
    panel.grid.major=theme_blank(), axis.ticks=theme_segment(size=0), 
    axis.text.x=theme_text(size=0), axis.text.y=theme_text(size=0), 
    legend.position="none")
```

<br>
{{< fluid_imgs
  "pure-u-1-2|/img/20100429184529.png"
  "pure-u-1-2|/img/3Dwordle.gif" >}}

Graphics and animation rely on the `rgl` package. Color palette reflects actual word's frequency and the (x,y,z) coordinates are computed very crudely using this function:

```r
set.coord <- function(char) {
  n <- length(char)
  x <- y <- z <- numeric(n)
  for (i in 1:n) {
    alpha <- runif(1, 0, 2*pi)
    beta  <- runif(1, 0, 2*pi)
    x[i] <- radius*(-cos(alpha))*sin(beta)
    y[i] <- radius*cos(beta)
    z[i] <- radius*sin(alpha)*sin(beta)
  }
  return(list(x=x,y=y,z=z))
}
```

The algorithm originally used at <http://www.wordle.net/> is described by the author himself in a reply to a post on [stackoverflow][stackoverflow]. Basically, it is implemented using Java API as follows:

1. Count the words, throw away boring words, and sort by the count, descending. 
2. Keep the top N words for some N. Assign each word a font size proportional to its count. 
3. Generate a Java2D Shape for each word, using the Java2D API.
4. In decreasing order of frequency, do this for each word:
	
```
place the word where it wants to be
while it intersects any of the previously placed words
    move it one step along an ever-increasing spiral
```

Here is a short and lighter implementation using [Nodebox][Nodebox].

Finally, I realized that there is a huge amount of discussion on how to best represent tags, or more generally how tagging information can be used to display useful information about web traffic, text content, but see this [post][post]. In the same vein, such approach may be used to reproduce Ishihara's plates, but see [Ishihara color test][Ishihara color test].

![](/img/20090327171538.png)



[Wordle]: http://www.wordle.net/ "Wordle"
[R]: http://cran.r-project.org "R"
[R-Forge]: http://r-forge.r-project.org/ "R-Forge"
[post]: http://www.smashingmagazine.com/2007/08/02/data-visualization-modern-approaches/ "Data Visualization: Modern Approaches"
[Google Viz. API]: http://code.google.com/intl/fr-FR/apis/visualization/documentation/gallery.html
[WordCloud]: http://visapi-gadgets.googlecode.com/svn/trunk/wordcloud/doc.html
[stackoverflow]: http://stackoverflow.com/questions/342687/algorithm-to-implement-something-like-wordle
[Nodebox]: http://nodebox.net/
[Ishihara color test]: http://en.wikipedia.org/wiki/Ishihara_color_test "Ishihara color test"
[Many Eyes]: http://manyeyes.alphaworks.ibm.com/manyeyes/