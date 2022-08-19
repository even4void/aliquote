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

On a related point, Eli Bendersky cites Ben Vandgrift and Alex Miller (_Clojure Applied_) in one of his [Clojure-related blog post]. Look at the following piece of code:

```clojure
(defn revenue-by-department [carts]
  (->> (filter :settled? carts)
       (mapcat :line-items)
       (map line-summary)
       (group-by :dept)
       (reduce-kv dept-total)))
```

Doesn't it look like what we discussed above?[^1] The point of Eli Bendersky is that soon or later, when processing large amount of data, we need the power and expressiveness of SQL-inspired queries:

> Applications that process and extract useful bits of information from large datasets all look alike in many programming languages, at least to some extent. What we really want in many cases is SQL-like primitives built into our languages, but this is often challenging (.NET's LINQ is one example of a successful approach).

Of course, filtering rows or columns, or aggregating numerical quantities with or without grouping first are all builtins in DSLs for statistical computing (R, Stata, LispStat, to name a few). And there have been some attempt at producing reliable Lisp or Scheme packages for data munging. This will probably de dealt with in a future post, especially for Common Lisp and Racket.

In the mean time, since I'm reading a lot of Scheme books at the moment, I found a close analogy to this approach in [chapter 8] (Higher-order functions) of _Simply Scheme_.

{{% music %}}Keith Jarrett & Charlie Haden • _Goodbye_{{% /music %}}

[plyr]: https://cran.r-project.org/web/packages/plyr/index.html
[david springate]: http://www.datajujitsu.co.uk/about/
[functional programming in r]: http://www.datajujitsu.co.uk/blog/2013/05/16/functional-programming-in-r/
[thomas mailund]: https://mailund.dk/
[clojure-related blog post]: https://eli.thegreenplace.net/2017/clojure-the-perfect-language-to-expand-your-brain/
[chapter 8]: https://people.eecs.berkeley.edu/~bh/ssch8/higher.html

[^1]: Clojure has been on my radar for 8 years now. Long time ago, I bought dozens of books, from which I barely scratched the surface. I never got into it really, except for writing toy examples based on my knowledge of Common Lisp and Scheme, but in a few months I think it will become my Lisp of choice for more serious development.
