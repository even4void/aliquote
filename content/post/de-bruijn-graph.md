---
title: "De Bruijn graph and genome assembly"
date: 2019-11-08T09:56:56+01:00
draft: true
tags: ["bioinformatics"]
categories: ["2019"]
---

De Bruijn graph are common data structures in bioinformatics, especially when it comes to perform genome assembly. John D. Cook discussed application of De Buijn sequences in two of his [latest](https://www.johndcook.com/blog/2019/11/05/combination-locks/) [posts](https://www.johndcook.com/blog/2019/10/22/hacking-with-de-bruijn/). Briefly, a De Bruijn sequence represents the shortest sequence of symbols from an alphabet of size _k_ that contains every possible subsequence of length _n_. Things get confusing if we think of _k_-mer, since in this case _k_ refers to the length of the substring, and not the 4-character alphabet for DNA or the total length of the DNA sequence. Anyway, assuming _k_=4 and _n_=3, John Cook shows that `AAACAAGAATACCACGACTAGCAGGAGTATCATGATTCCCGCCTCGGCGTCTGCTTGGGTGTTT` is a De Bruijn sequence for all triples of DNA base pairs, provided you allow wrapping around (e.g., TAA would start in position 64). How many triples are there?

Here is a short Python snippet to construct a De Bruijn graph, directly inspired from one of [Rosalind problems](http://rosalind.info/problems/dbru/):

```python
def dbg(seq):
    g = {}
    for s in seq:
        a, b = s[:-1], s[1:]
        if a not in g:
            g[a] = set()
        if b not in g:
            g[b] = set()
        g[a].add(b)
    return graph
```

As you can see, the idea is simply to store the graph in a `dict`, which is a pretty standard way to represent a graph in Python,
