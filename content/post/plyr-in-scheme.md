---
title: "Split-apply-combine in Scheme"
date: 2022-08-19T15:57:09+02:00
draft: true
tags: ["scheme", "rstats"]
categories: ["2022"]
---

I've been a devotee of the "split-apply-combine" way, popularized in the [plyr] (and legacy) package, of performing data operations in R. In its simplest form, and using base functions only, it amounts to:

```r
data(crabs, package = "MASS")
spl = with(crabs, split(BD, sp))
apl = lapply(spl, mean)
cbn = rbind(x = apl)
cbn
```

Using plyr, this would simply be `ddply(data = crabs, .(sp), summarize, x = mean(BD))`. Related tools include `subset` and `transform`, and higher-order variations thereof (`Filter`, `Reduce`, and `Map`). I've seen few people using the later, but it really was not so common back in the days. Maybe [David Springate] talked about those functional recipes in one of his talks or tutorials, I don't remember quite well, although I'm sure he blogged about [functional programming in R]. [Thomas Mailund] did this too.

I found a close analogy to this approach in chapter8 (Higher-order functions) of _Simply Scheme_.

{{% music %}}XXX • _XXX_{{% /music %}}

[plyr]: https://cran.r-project.org/web/packages/plyr/index.html
[david springate]: http://www.datajujitsu.co.uk/about/
[functional programming in r]: http://www.datajujitsu.co.uk/blog/2013/05/16/functional-programming-in-r/
[thomas mailund]: https://mailund.dk/
