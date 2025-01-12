---
title: "lost+found 2024"
date: 2025-01-01T20:51:15+01:00
draft: false
tags: ["this"]
categories: ["2025"]
---

## Customizing Mpv (2024-08-21)

Random links to elaborate on how I built my own Mpv config.

- <https://github.com/mpv-player/mpv/wiki/User-Scripts>
- <https://github.com/mpv-player/mpv/wiki/FAQ>
- <https://wiki.archlinux.org/title/Mpv>
- <https://kokomins.wordpress.com/2019/10/14/mpv-config-guide/>
- <https://github.com/iwalton3/default-shader-pack>

## On trend tests (2024-01-25)

A few weeks ago I discussed the [Cochran-Mantel-Haenszel test](/post/cochran-mantel-haenszel/). Another widely used test to assess linear trend in two-way tables is the Mantel-Haenszel trend test. There's a very interesting discussion about [trend tests](https://www.stata.com/support/faqs/statistics/test-for-trend/) on Stata FAQs, by William Sribney from StataCorp.

- <https://arxiv.org/pdf/2401.13010.pdf>
- <https://arxiv.org/pdf/2011.13758v1.pdf>

## Approximating sine (2024-01-25)

A few weeks ago I came across this blog post: [Approximating sin(x)](https://nes.is-a.dev/out/2022/approximating-sin.html).

> It functions very similarly to the taylor polynomial, except the constants have been replaced to achieve greather accuracy, (...)

Except this is not based on a Taylor expansion, but it rather relies on Chebyshev polynomials.

In [Polynomial Approximations to Elementary Functions](https://www.ams.org/journals/mcom/1954-08-047/S0025-5718-1954-0063487-2/S0025-5718-1954-0063487-2.pdf)

[Elementary Functions and Approximate Computing](https://hal.science/hal-02517784v2/document), see also [Computing Machine-Efficient Polynomial Approximations](https://perso.ens-lyon.fr/jean-michel.muller/TruncToms.pdf)

Remez algorithm, see [Dandelion: Certified Approximations of Elementary Functions](https://arxiv.org/abs/2202.05472)

## Generating all or next permutation (2024-01-12)

In a [previous post](/post/permutation-test-in-lisp/), I mention a way to suffle labels of a two-group dataset in order to carry out a permutation test. Usually, it's more efficient to randomize the highest level unit of an experimental design, i.e. rather than shuffling observations use the group level.

A recursive solution to the problem of generating all permutation of a given list or array is as follows:

```
If the length of Permutation equals the length of Array
    Permutation Found.
Else
    For each position ‘p’ from 0 till the length of Array
        If element at position ‘p’ has been taken
            Continue to check for next position.
        Mark position ‘p’ as Taken.
        Append the element at position ‘p’ to the Permutation.
        Generate_Permutation ( Permutation, Array, Positions )
        Remove the element at position ‘p’ from the Permutation.
        Mark position ‘p’ as Available.
```

- other algorithms
- heap

- domain-specific applications <https://rdrr.io/cran/permute/>
- Sedgewick and Wayne's algorithm <https://introcs.cs.princeton.edu/java/23recursion/Permutations.java.html>
- <https://en.wikipedia.org/wiki/Steinhaus%E2%80%93Johnson%E2%80%93Trotter_algorithm>

- base case
- Racket
- cl-permutation
- Rosetta code

- numpy and `itertools.permutations()`, <https://numpy.org/doc/stable/reference/random/generated/numpy.random.Generator.permutation.html#numpy.random.Generator.permutation>
- next permutation <https://www.nayuki.io/page/next-lexicographical-permutation-algorithm>
- stream, generator

Phillip Good (2004) _Permutation, Parametric, and Bootstrap Tests of Hypotheses_, New York: Springer-Verlag

{{% music %}}Sixth June • _Night Before_{{% /music %}}
