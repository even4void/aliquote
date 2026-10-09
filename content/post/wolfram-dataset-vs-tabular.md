---
title: "Wolfram Dataset vs. Tabular"
date: 2026-10-05T21:00:38+02:00
draft: true
tags: ["mathematica"]
categories: ["2026"]
---

With Mathematica 14.1, Wolfram delivered a new data container, [Tabular][1],
that complements the Dataset container. If you are familiar with nested lists,
it is not hard to switch to Dataset without paying too much attention to
associations. However, the concept of association is already a familiar thing
(think of options you pass through a graphical function, for example).

Below is an example of what nested lists of standard values or associations look
like:

```wolfram
{{1, 2, 3}, {4, 5, 6}}
{{a -> 1, b -> 2, c -> 3}, {a -> 4, b -> 5, c -> 6}}
{<|a -> 1, b -> 2, c -> 3|>, <|a -> 4, b -> 5, c -> 6|>}
```

A more natural way to think of such a nested list as a statistical dataset is to
add a "row id" and separate it from the other variables. This way we can use
`First` to select rows using id, or `Rest` to access all values for a given row.
At least, this is how I represent such data myself.

```wolfram
data = {{1, <|a -> 1, b -> 2, c -> 3|>}, {2, <|a -> 4, b -> 5, c -> 6|>}}
```

In the example above, `data[[1, 1]]` returns the first id while `data[[2,2,2]]`
will return `5` ("level 2" element) as expected. Ids might be whatever work best
for you, they do not have to be integers, especially since we can extract
sublists with their own 1-based index and/or using so-called "part" (e.g.,
`1;;3`). By the way, this work with simply nested lists too. But we can do more
with associations. Let's replace the above example with:

```wolfram
data = {{1 -> <|a -> 1, b -> 2, c -> 3|>}, {2 -> <|a -> 4, b -> 5, c -> 6|>}}
```

Now, `data[[1, 1]]` returns an association, and not simply an id.

If you're familiar with key-value data models (e.g., JSON, Redis), you will be
at home here. Sometimes you may prefer addressing your dataset by columns rather
than by key-value pair (Dataset) or value index (List), while keeping the nice
properties and methods of tuples. This is where Tabular shines, IMHO. Just type
`Tabular[data[[All, 2]]]` and you are almost done, with proper row ids and
columns names. To get the values of the first column as a list, you can use
`Normal[dt[All, 1]]` but `ConstructColumns[dt, "a"]` won't work since this
tabular object has no keys

Sometimes the syntax is a bit more convoluted than when using nested list,
though. For instance, be careful with the slot symbol (`#`) which is often use
to select rows using pure function like in `[#age ≥ Median[#age]]&` or to
address named columns, e.g. `#age`. Likewise,

GroupBy or GatherBy vs. AggregateRows

split-apply-combine

rownames in Tabular even for list of associations, contrary to Dataset

[1]: https://reference.wolfram.com/language/ref/Tabular.html

{{% music %}}Massive Attack • *Butterfly Caught*{{% /music %}}
