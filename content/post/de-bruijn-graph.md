---
title: "De Bruijn graph and genome assembly"
date: 2019-11-08T09:56:56+01:00
draft: false
tags: ["bioinformatics", "python"]
categories: ["2019"]
---

De Bruijn graph are common data structures in bioinformatics, especially when it comes to perform genome assembly. John D. Cook discussed application of De Buijn sequences in two of his [latest](https://www.johndcook.com/blog/2019/11/05/combination-locks/) [posts](https://www.johndcook.com/blog/2019/10/22/hacking-with-de-bruijn/). Briefly, a De Bruijn sequence represents the shortest sequence of symbols from an alphabet of size _k_ that contains every possible subsequence of length _n_. Things get confusing if we think of _k_-mer, since in this case _k_ refers to the length of the substring, and not the 4-character alphabet for DNA or the total length of the DNA sequence. Anyway, assuming _k_ = 4 and _n_ = 3, John Cook shows that `AAACAAGAATACCACGACTAGCAGGAGTATCATGATTCCCGCCTCGGCGTCTGCTTGGGTGTTT` is a De Bruijn sequence for all 4<sup>3</sup> triples of DNA base pairs, provided you allow wrapping around (e.g., TAA would start in position 64).

[De Bruijn Graph assembly](https://www.cs.jhu.edu/~langmea/resources/lecture_notes/assembly_dbg.pdf) (PDF), by Ben Langmead, provides a very detailed account of how De Bruijn graphs work in practice in the case of genome assembly. Assuming perfect sequencing where each length-_k_ substring is sequenced exactly once with no errors, let's pick a substring length, say _k_ = 30 to 50 (i.e., ≤ shortest read length), take each _k_-mer and split them into left and right _k_-1 mers. Then, add those _k_-1 mers as nodes to De Bruijn graph (if not already there), with edge from left _k_-1 mer to right _k_-1 mer.

Here is a short Python snippet to construct a De Bruijn graph, directly inspired from one of [Rosalind problems](http://rosalind.info/problems/dbru/), assuming `seq` is a list of reads:

```python
def dbg(seq):
    """De Bruijn graph"""
    g = {}
    for s in seq:
        l, r = s[:-1], s[1:]
        if l not in g:
            g[l] = set()
        if r not in g:
            g[r] = set()
        g[l].add(r)
    return g
```

As you can see, the idea is simply to store the graph as a `dict`, which is a pretty standard way to represent a graph in Python, and to use `set`s to extract left (all but the last) and right (all but the first) _k_ mer. In Scheme, we would write `(cdr s)` and `(cdr (reverse s))`.

Consider the following example data, and recall that we need both the original reads (_S_) and their reverse complements, since we are interested in the De Bruijn graph of _S_ ⋃ _S<sup>r</sup>_:

```python
def rev_c(s):
    """Reverse complement"""
    sub = str.maketrans("ATGC", "TACG")
    return s[::-1].translate(sub)

reads = ["TGAT", "CATG", "TCAT", "ATGC", "CATC", "CATC"]

grph = dbg(reads + list(map(rev_c, reads)))
```

Let's see it in action:

```python
In [49]: [print("%s => %s" % (k, " ".join(list(v)))) for k, v in grph.items() if len(v) > 0]
TGA => GAT
GAT => ATG
CAT => ATC ATG
ATG => TGA TGC
TCA => CAT
ATC => TCA
GCA => CAT
```

In the case of genome assembly, if sequencing was performed without any error this procedure yields an [Eulerian graph](https://en.wikipedia.org/wiki/Eulerian_path), and an Eulerian walk can be found in $O(|E|)$ time, where $|E|$ is the number of edges (which equals the number of _k_-mers). The number of nodes is at most $2 \cdot |E|$, but it will typically be much smaller due to repeated _k_-1-mers. However, there can be more than one Eulerian walk, and uneven coverage, sequencing errors, or even sequence repeats may lead to disconnected graphs, which implies that only connected components will be Eulerian, not the overall graph.[^1] Ben Langmead has some additional benchmark data, especially regarding how the size of the De Bruijn graph grows sublinearly when average coverage is high (i.e., genome length ≪ total number of reads).

[^1]: Kingsford, Carl, Michael C. Schatz, and Mihai Pop. "Assembly complexity of prokaryotic genomes using short reads." _BMC bioinformatics_ 11.1 (2010): 21.
