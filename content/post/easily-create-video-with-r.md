+++
title = "Easy creation of videos with R"
date = 2012-04-15T21:15:12+01:00
draft = false

tags = ["rstats", "dataviz"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

While preparing a talk due in three days or so, I thought it would be good to show some live demonstration of regularization techniques in regression with [ggplot2](http://had.co.nz/ggplot2/).

It sounds like a lot of people start with splines or polynomial regression to demonstrate overfitting. I believe this has something to do with Bishop's book on [*Pattern Recognition and Machine Learning*](http://research.microsoft.com/en-us/um/people/cmbishop/prml/), see e.g. Shane Conway's recap' on [Stanford ML 5.2: Regularization](http://www.statalgo.com/2011/11/16/stanford-ml-5-2-regularization/) <i class="fa fa-chain-broken fa-1x"></i>. However, it is interesting to start with simple example like this, e.g., to highlight how difficult it is to choose optimal model parameters, how we define 'optimal' or equivalently how we select the best model, etc. The problem of model selection can then easily be transposed to variable selection in multiple regression.

The synthetic dataset is taken from Li and Xu, *High-dimensional data analysis in cancer research*, Springer 2009 (Chap. 3, p. 45), but see this [older post]({{< ref "/post/high-dimensional-data-analysis-in-cancer-research.md" >}}). Incidentally, my talk will focus on variable selection and regularization, rather than multivariate techniques for high-dimensional data. I found myself working more and more with clinical dataset that are comprised of a low number of cases and large number of variables, but not large enough to talk about high-dimensional data. 

Rather than an animated GIF, I tried to create a MOVie file with the [animation](http://animation.yihui.name/) package. That was quick because `saveMovie()` just works out of the box (provided you have a working `ffmpeg` install)!

```r
set.seed(101)
f <- function(x) sin(sqrt(2*pi*x))
n <- 1000
x <- runif(n, 0, 2*pi)
sigma <- rnorm(n, 0, 0.25)
y <- f(x) + sigma
dfrm <- data.frame(x, y)

library(animation)
opt.ani <- ani.options(interval = 0.1, nmax = 300)
do.it <- function(dfrm, k=25) {
  require(penalized)
  require(ggplot2)
  lam <- c(seq(0, 2, by=.01), seq(2, 30, by=2))
  X <- poly(dfrm$x, k)
  for (l in lam) {
    mod <- penalized(response=dfrm$y, penalized=X, lambda1=0, lambda2=l)
    dfrm$pp <- predict(mod, X)[,"mu"]
    p <- ggplot(dfrm, aes(x, y)) + geom_point(colour="lightgoldenrod3")
    p <- p + labs(x="", y="") + xlim(0, 6.5) +
      scale_y_continuous(limits=c(-2, 2), breaks=seq(-2, 2, by=.5))
    p <- p + geom_point(aes(x, pp), colour="steelblue") + theme_bw2()
    p <- p + geom_text(data= data.frame(x=0, y=-2,
                         label=paste("lambda",as.character(l), sep="==")),
                       aes(x, y, label=label), parse=TRUE, hjust=0, vjust=0, size=8)
    print(p)
  }
}
dat <- dfrm[sample(1:nrow(dfrm), 80),]
saveVideo(do.it(dat), video.name="ridge.mov") 
ani.options(opt.ani)
```

Videos will be written in a `tmp/` folder and can be copied back to the current directory. Here is how it looks for the example shown above.

<video class="tab" controls>Your browser does not support the &lt;video&gt; tag.
  <source src="/img/ridge.mov"/>
</video>
