---
title: "Apply or Map"
date: 2026-10-11T20:13:58+02:00
draft: false
tags: ["mathematica", "lisp"]
categories: ["2026"]
---

Did you ever wonder what's the difference between `Apply` and `Map` in Wolfram?
I mean we already have those procedures or functions in Lisp (`map`) and in R
(`apply`) -- there are also higher-order functions available in R, like
`Reduce`. In the case of Lisp, the [CLHS][1] tells us what `map` does:

> Applies function to successive sets of arguments in which one argument is
> obtained from each sequence. The function is called first on all the elements
> with index 0, then on all those with index 1, and so on. The result-type
> specifies the type of the resulting sequence.

A simple example of use using SBCL:

```lisp
* (map 'list #'+ '(1 2 3) '(4 5 6))
(5 7 9)
```

There's also `mapcar` which works on lists and returns a list,[^1] contrary to
`map` which applies a function to elements of one or more sequences, such as
lists or strings, and requires that the return type be specified. Other [mapping
functions][2] are available in CL (e.g., `mapcan`, `mapc`, `maplist`).

The equivalent of CL `(mapcar #'(lambda (x) (* x x)) '(1 2 3 4 5))` could
possibly read as follows in Wolfram:

```wolfram
In[1]:= Table[x*x, {x, 5}]                                                                                              
Out[1]= {1, 4, 9, 16, 25}
In[2]:= Map[#^2 &, Range[5]]                                                                                            
Out[2]= {1, 4, 9, 16, 25}
```

In R, the `apply` family of functions works in a similar spirit on a variety of
data structures, e.g. `sapply` for vectors or `lapply` for lists. The `apply`
function works on rectangular arrays, e.g. to compute column means of a matrix:

```r
> set.seed(101)
> xs = replicate(3, rnorm(100))
> apply(xs, 2, mean)
[1] -0.037191100 -0.042002372  0.002070399
```

However, Wolfram's `Apply` function behaves differently in this case:

> `Apply[f,expr,levelspec]` replaces heads in parts of expr specified by
> levelspec.

Which means the following doesn't perform the same operation as `Map`:

```wolfram
In[17]:= Apply[#^2 &, Range[5]]                                                                                            
Out[17]= 1
In[28]:= Apply[#^2 &, Rest[Range[5]]]                                                                                   
Out[28]= 4
```

As can be seen, the pure function is only applied to the first element of the
argument. On the contrary `Map[f,expr]` evaluates `f` *for each* element of
`expr` and returns the same list structure. When in doubt, use the fact that the
Wolfram language allow us to work with abstract expressions:

```wolfram
In[31]:= Map[f, {a, b, c}]                                                                                               
Out[31]= {f[a], f[b], f[c]}
In[32]:= Apply[f, {a, b, c}]                                                                                             
Out[32]= f[a, b, c]
```

This, however, is easy to understand: there's no reducer involved (like R `mean`
which returns a single value given a sequence of numeric quantities). Replace
the above pure function with a reducing function like `Plus` or `Times` and
you'll get a more interesting result. By the way, most Wolfram functions are
auto-vectorized, much like R ones. So you may be better using `Total` and
`colMeans` instead of the above illustrations.[^2] But see [this answer][3] on
Mathematica SE to get a better understanding of the inner working of `Map` and
`Apply`.

I believe the confusion with R's behavior for `apply` -- I mean, my own mental
representation of how R works; in the case of Lisp I tend to think in terms of
map-filter-reduce idioms -- is that `apply(xs, 2, f)` can be used either as
Wolfram `Apply` or `Map` depending on the function that is passed to it:

```r
f <- function(x) sum(x) 
f <- function(x) x*x 
```

In the later case, each element taken columnwise is squared, and the same 100x3
matrix of elements is returned. Since higher-order functions are available in R,
one may be better off using R's `Map` directly:

```r
> unlist(Map(f, xs[,2]))
```

If you read the documentation carefully, you will notice that the R core team
mentions Lisp `mapcar` as the most resembling procedure.

I rarely use `Apply` in Mathematica, but I did use `apply`, `sapply` and
`lapply` a lot when programming in R. That may be the source of my confusion and
I will recall that a better mental model is that of Lisp dialects:[^3] The
equivalent of `Apply[Plus, {1, 2, 3}]` is evidently `(apply #'+ '(1 2 3))` in
Lisp.

{{% music %}}Siouxsie and The Banshees • *Slowdive*{{% /music %}}

[^1]: It should be noted that `map` does not work on a single list while
    `mapcar` does, e.g. `(mapcar #'(lambda (x) (1+ x)) '(1 2 3))`.

[^2]: I apologize in advance for the following snippet I found while watching
    one of Wolfram U's videos, but I can't find the original author anymore.
    Most numerical function are Listable in Wolfram parlance (77% in Wolfram
    15).

    ```
    With[{all = Names["System`*"]},
      numeric = Pick[all, MemberQ[#, NumericFunction] & /@ Attributes /@ all];
      listable = Pick[all, MemberQ[#, Listable] & /@ Attributes /@ all];
    ]
    Length /@ {numeric, listable}
    ```

    Issuing `Complement[numeric, Intersection[numeric, listable]]` will show you
    which ones are not. There's often no need to `Map` Listable functions over
    list of, say, integers using `Table`.

[^3]: See also [this discussion][4] on HN.

[1]: http://clhs.lisp.se/Body/f_map.htm
[2]: https://www.lispworks.com/documentation/HyperSpec/Body/f_mapc_.htm
[3]: https://mathematica.stackexchange.com/a/46248
[4]: https://news.ycombinator.com/item?id=8321788
