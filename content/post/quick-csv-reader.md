---
title: "Parsing CSV files in Racket"
date: 2023-04-21T12:21:08+02:00
draft: false
tags: ["racket"]
categories: ["2023"]
---

This ought to be a place to post some code about reading/writing CSV files in Racket, then I realized I had a draft in my inbox regarding Racket packages to import rectangular datasets. In fine, I will simply review what I expect from such a package, and how it could be interconnected with a package for data preprocessing. I'm currently writing one for Newlisp, so maybe I can factor in the ideas and code a bit.

First off, Racket offers excellent support for reading CSV files. Since I often need to import data in CVS format, this is kind of great. As in one of my [previous post](/post/ols-and-svd/), I usually rely on `make-csv-reader-maker` from the [csv-reading](https://docs.racket-lang.org/csv-reading/index.html) package. Reader specs are generally easy to define, at least for the kind of rectangular dataset I used to process. However, I don't use the built-in iterator to process each row one at a time (same as a `yield` statement in Python's generators), and just call `csv->list`. This has the advantage (and inconvenient, because then we'll need a lot of lambda's to process the elements of the sublists) of returning a list of sublists.

Even if I tend to use a combination of `apply` and `map` a lot, as can be seen in my related posts, I should mention that most Scheme implementations come with `append-map` (same as [CL](http://www.lispworks.com/documentation/HyperSpec/Body/f_mapc_.htm)'s `mapcan`), which is often used to "flatten" a list of sublists, or to apply a procedure to a list and return a new transformed list. Sometimes it may simplify our workflow. All three following expressions return the same results (a list of squared integers):[^1]

```racket
(map (lambda (x) (expt x x)) '(1 2 3 4 5))
(append-map (lambda (x) (list (expt x x))) '(1 2 3 4 5))
(apply append (map (lambda (x) (list (expt x x))) '(1 2 3 4 5)))
```

Regarding the `csv-reading` package itself, I discovered that there are some builtins, namely `csv-for-each` and `csv-map`, to apply some stuff on each row or records from the CSV file. As convenient as these utilities are, we also often want to work by column (think variable in statistical computing), or to select a subset of data (row by column) or to filter rows and return some specific comumns. You can think of the `subset` function in R, or the `egen` (or `bysort` for simple queries) procedure in Stata.

Of course, it would be great to have some additional procedures to support the use of `csv-reading`, keeping in mind that they should apply to other flat files as well (e.g., JSON): `select` (select one or more columns), `subset` (select one or more rows), `group` (create a view using row x column), `aggregate` (compute some statistics on a view, which is mostly the [split-apply-combine](/post/plyr-in-scheme/) strategy). Also, we would want to get rownames and colnames, like in R, such that we can refer to row or column using proper labels and see what's left in a view or subset when printing it in the REPL. Finally, we need to handle categorical data and missing values nicely. In the latter case, we could simply use a pair of (value . weight), instead of relying on bit masking or a shadow table. This means we will need to use weighted statistics,[^2] but it is already implemented in math/statistics for the most import ones. Additionally, it would be interesting if we could exploit an SQL backend like SQLite or DuckDB instead of working with arrays, lists or sequences.

While I would prefer to roll my own version, my previous review of the available Racket packages led me to the following candidates:

- [data-frame](https://docs.racket-lang.org/data-frame/index.html), which is the package I used for some time.
- [data-table](https://github.com/jadudm/data-table), "a library for manipulating tabular data in Racket." It has interesting features like working with remote data structures but it seems pretty limited in terms data manipulation, and the project hasn't received any update in several years.
- [rebellion](), "a suite of libraries for defining new struct-based types including record types and enum types, and much more." It features a [tabular data structure](https://docs.racket-lang.org/rebellion/Tables.html), where column names are stored as keywords.
- [sawzall](), "A grammar of data manipulation for Racket, inspired by dplyr." It is probably the closer in spirit to R's (new) way of data munging. However, the project hasn't received any update in several years.

There may be other packages I am missing, of course. The `data-frame` package is really great except it doesn't quite suppot categorical data. However, I'm working on adding that in a PR. It means we can write things like that:

```racket
(require data-frame)
(require "utils.rkt")

(define d (df-read/csv "../data/fev.csv"))
(df-describe d)
(recode (vector->list (df-select d "sex")))
```

I'm interested in Jack Firth's package, though, for it provides handy data structures, including tables iterations and comprehensions. It's just that I'm not familiar with this package, and I would need to benchamrk the record (with constant-time lookup of field values by name) and table objects. It is well documented, like the `data-table` package.

{{% music %}}Bentley • _Been a While_{{% /music %}}

[^1]: There's also `filter-map`, at least in Racket, which is probably a better fit in this case: `(filter-map (lambda (x) (expt x x)) '(1 2 3 4 5))` (no need to construct a list explicitely). Note that `filter-map` may be more interesting when one wants to filter items in a row depending on a certain predicate.
[^2]: This was suggested a long time ago by Evan Miller. See 3rd paragraph in this [technical review](/post/micro-review-006).
