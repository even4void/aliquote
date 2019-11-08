---
title: "De Bruijn graph and genome assembly"
date: 2019-11-08T09:56:56+01:00
draft: true
tags: ["bioinformatics"]
categories: ["2019"]
---

De Bruijn graph are common data structures in bioinformatics, especially when it comes to perform genome assembly. John D. Cook discussed application of De Buijn sequences in two of his [latest](https://www.johndcook.com/blog/2019/11/05/combination-locks/) [posts](https://www.johndcook.com/blog/2019/10/22/hacking-with-de-bruijn/). Briefly, a De Bruijn sequence represents the shortest sequence of symbols from an alphabet of size *k* that contains every possible subsequence of length *n*. Things get confusing if we think of *k*-mer, since in this case *k* refers to the length of the substring, and not the 4-character alphabet for DNA or the total length of the DNA sequence. Anyway, assuming *k*=4 and *n*=3, John Cook shows that `AAACAAGAATACCACGACTAGCAGGAGTATCATGATTCCCGCCTCGGCGTCTGCTTGGGTGTTT` is a De Bruijn sequence for all triples of DNA base pairs, provided you allow wrapping around (e.g., TAA would start in position 64). How many triples are there?