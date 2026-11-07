---
title: "Iterated differences using Fold"
date: 2026-11-06T19:31:09+01:00
draft: false
tags: ["mathematica"]
categories: ["2026"]
---

After writing my last post, I started thinking about how to implement iterated
differences as a fold. Christopher Olah once wrote a very nice blog post about
[recursion on lists][1] in Haskell, and in particular on Folds.

Then I was reminded that Mathematica offers some nice recursive facilities too.
Since in the case of iterated differences we need to keep a trace of pairs of
elements and returns a list of n-1 elements, where n is the length of the
initial list, `FoldList` and `NestList` are good candidates.

The base configuration is as follows:

```wolfram
xs = {4, 9, 5}
Differences[xs]
```

This should return `{5, -4}`.

How about using a Fold in this case? Applied to a list, the pure function
`Rest[#1] - Most[#1] &` is all what we need: as with all listable operations,
given the list `{1, 2, 3, 4, 5}`, it will pair up and subtract the elements
returned by `Rest`, `{2, 3, 4, 5}`, and `Most`, `{1, 2, 3, 4}`, namely
`{2-1, 3-2, 4-3, 5-4}`.[^1] Using 'Part' syntax (`#1[[2 ;;]] - #1[[1 ;; -2]] &`)
would be far less readable, IMHO.

So, `FoldList[Rest[#1] - Most[#1] &, xs, Range[1]]` is what we are after. We
provides `Range[•]` as the third argument since `FoldList` expect a listable
item at this place, and it will simply serve as a counter for the pure function.
As an alternative, we may consider using `NestList` which doesn't require an
auxiliary list:

```wolfram
FoldList[Rest[#1] - Most[#1] &, xs, Range[1]]
NestList[Rest[#1] - Most[#1] &, xs, 1]
```

> NestList just keeps on applying a function to whatever result it got before.
> FoldList does the same, except that it also "folds in" a new element each
> time. --- [More about Pure Functions][4]

In our application with `FoldList` we're just ignoring the second argument
(`#2`). There's an example of a cumulative sum in the manual cited above, which
does exactly the opposite: `FoldList[#1 + #2 &, 0, {1, 1, 1, 2, 0, 0}]` (which
can further be simplified to `FoldList[Plus, 0, {1, 1, 1, 2, 0, 0}]`).

Note that folding with `Plus` on the list of differences and starting with the
first element as the initial value simply reverts what `Differences` did:

```wolfram
FoldList[Plus, First[xs], Differences[xs]]
```

A few extra touches to enhance the presentation of the results:

```wolfram
xs = {1, 8, 27, 64, 125};
values = FoldList[Rest[#1] - Most[#1] &, xs, Range[1]];
Grid[values, Alignment -> Left, Frame -> All, Background -> {None, {Lighter[Gray, 0.9]}}]
```

{{< fluid_imgs "pure-u-1-3|" "pure-u-1-3|/img/2026-11-07-09-49-43.png" "pure-u-1-3" >}}

{{% music %}}My Life With The Thrill Kill Kult • *Sexplosion!*{{% /music %}}

[^1]: Besides [Part][2], the Wolfram language offers intuitive function to
    select member of a list: `First`, `Last` and `Rest` as in Racket, but also
    `Most` and `Drop`, `Take`; but see the tech note on [working with lists][3].

[1]: https://colah.github.io/posts/2015-02-DataList-Illustrated/
[2]: http://reference.wolfram.com/language/ref/Part.html
[3]: http://reference.wolfram.com/language/tutorial/Lists.html
[4]: https://www.wolfram.com/language/elementary-introduction/3rd-ed/29-more-about-pure-functions.html
