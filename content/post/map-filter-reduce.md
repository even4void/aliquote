---
title: "Map, filter and reduce"
date: 2026-10-24T17:41:12+02:00
draft: true
tags: ["lisp", "statistics"]
categories: ["2026"]
---

In one of my [previous post][1], I mentioned the map-filter-reduce philosophy.
As an applied statistician I used to process a lot of data, whether it be for
the purpose of data wrangling or just to fit some statistical models and inspect
their goodness of fit. Most of the times, this involves transforming (or
reexpressing in the spirit of J.W. Tukey) numerical and categorical raw data,
filtering certain values (according to a grouping factor or simply extremal
observations), combining individual observations into some sort of aggregated
value (means, quantile, regression coefficient, and so on).

Another well known data triumvirate is the split-apply-combine strategy. It is
used all the times by [R][2], [Python][3] or [Julia][4] users, of course, but
also by SQL practitioners. Needless to say, the MapReduce paradigm at the heart
of Hadoop or Spark belong to the same family.

We already talked about the split-apply-combine paradigm in Scheme [some years
ago][5].

{{% music %}}Actors • *Cold Eyes*{{% /music %}}

[1]: /post/apply-or-map/
[2]: https://vita.had.co.nz/papers/plyr.pdf
[3]: https://book.pythontips.com/en/latest/map_filter.html
[4]: https://dataframes.juliadata.org/stable/man/split_apply_combine/
[5]: /post/plyr-in-scheme/
