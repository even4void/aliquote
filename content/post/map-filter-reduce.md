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
of Hadoop or Spark belong to the same family. When it was introduced, Dean and
Ghemawat said:[^1]

> Our abstraction is inspired by the map and reduce primitives present in Lisp
> and many other functional languages. We realized that most of our computations
> involved applying a map operation to each logical record in our input in order
> to compute a set of intermediate key/value pairs, and then applying a reduce
> operation to all the values that shared the same key in order to combine the
> derived data appropriately.

We already talked about the split-apply-combine paradigm in Scheme [some years
ago][5]. By the way, the Tabular data container and associated functions in
Wolfram (introduced in 14.1 and enhanced in 14.2) offer similar facilities.
There is an illustration from one of the [Wolfram U][6] videos on Tabular
("Tabular Transformations"), which `AggregateRows` relies on.

I would have a lot to say about this way of processing data in Mathematica but
that probably deserves a post on its own. Enough digressions, let's talk about
the map-filter-reduce paradigm. If you use Common Lisp, Scheme or Clojure, you
probably already know about those features. [Reduce][7] is particular in that it
is no more than a wrapper around `foldl` (h/t [lispm][8]):[^2]

```lisp
(defun foldl (function value sequence)
  (reduce function sequence :initial-value value))
```

See also [Reduce vs fold in Common Lisp][9]. Since we discussed Wolfram's
`Apply` and Lisp's `apply` in our last post, it's interesting to note that
`reduce` may be seen as a competitor, although [Rainer Joswig][10] (the same
lispm) warned all of us a long time ago (remember StackOverflow?):

> Thus to really process large (larger than 50 elements) lists or vectors in
> portable Common Lisp code, it is necessary to use iteration constructs,
> reduce, map, and similar. Thus it is also necessary to not use (apply '+
> large-list) but use (reduce '+ large-list).

The map-reduce-filter paradigm seems to originate (at least) from John Backus in
his Turing Award paper on functional programming,[^3] who said, as an intro,
that "Combining forms are chosen not only for their programming power but also
for the power of their associated algebraic laws." Moreover, as Eric Normand
says:

> They do form a really nice way of doing pipelines, data transformation
> pipelines. You have data in one format coming into the pipeline, through a
> series of steps, it gets transformed one step at a time until it gets to the
> last step. Once it comes out the last step, it's the data you need.

If you are working with data all day long, you probably know what this means,
even if your statistical package does not strictly belong to the functional
family of PLs like Clojure or Scheme.

{{% music %}}Actors • *Cold Eyes*{{% /music %}}

[^1]: Dean, J. and Ghemawat, S. (2008). [MapReduce: simplified data processing
    on large clusters][13]. Communications of the ACM, 51(1): 107-113.

[^2]: In fact, many operations like sum or even map can be seen as a fold (see
    G. Hutton, [A tutorial on the universality and expressiveness of fold][11]).

[^3]: Backus, J. (1978). [Can Programming Be Liberated from the von Neumann
    Style? A Functional Style and Its Algebra of Programs][12]. Communications
    of the ACM, 21(8): 613-641.

[1]: /post/apply-or-map/
[2]: https://vita.had.co.nz/papers/plyr.pdf
[3]: https://book.pythontips.com/en/latest/map_filter.html
[4]: https://dataframes.juliadata.org/stable/man/split_apply_combine/
[5]: /post/plyr-in-scheme/
[6]: https://www.wolfram.com/wolfram-u/courses/data-science/tabular-efficient-data-processing-dat904/
[7]: http://clhs.lisp.se/Body/f_reduce.htm
[8]: https://www.reddit.com/r/lisp/comments/14157o6/comment/jmz9j3c
[9]: https://www.n16f.net/blog/reduce-vs-fold-in-common-lisp/
[10]: https://stackoverflow.com/a/5350027
[11]: https://people.cs.nott.ac.uk/pszgmh/fold.pdf
[12]: https://dl.acm.org/doi/10.1145/359576.359579
[13]: https://dl.acm.org/doi/10.1145/1327452.1327492
