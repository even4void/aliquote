---
title: "Murmurhash"
date: 2020-03-12T12:07:48+01:00
draft: true
tags: ["racket"]
categories: ["2020"]
---

The [MurmurHash](https://en.wikipedia.org/wiki/MurmurHash) algorithm belongs to non-cryptographic hash function and it is used for hash-based lookup, e.g. to convert a word $w$ to an integer $s \in [0, H)$, where $H$ is the table size. I came across this hash function by reading a recent publication on a new read mapper.[^1] It has been shown to have [good properties](https://softwareengineering.stackexchange.com/a/145633) in terms of speed and number of collisions compared to other hashing algoritms; see also [Hash functions: An empirical comparison](https://www.strchr.com/hash_functions). Although various implementations of Murmurhash3 are cited on the Wikipedia page (see also the `mmh3`/`digest` packages for Python/R), I couldn't find one in Scheme. So here is a quick and dirty one possibility to apply 32-bits murmurhash in Chicken scheme, using its solid FFI facilities and the [C++ code](https://github.com/rurban/smhasher/blob/master/MurmurHash3.cpp) available on [smhasher](https://github.com/aappleby/smhasher) on Github.

I should note that general-purpose hash tables are readily available in [Racket](https://docs.racket-lang.org/reference/hashtables.html) (or as C code on [Github](https://github.com/racket/racket/blob/master/racket/src/racket/src/hash.c)), or in Scheme [SRFI 69](https://srfi.schemers.org/srfi-69/srfi-69.html) (or even the R6RS [standard libraries](http://www.r6rs.org/final/html/r6rs-lib/r6rs-lib-Z-H-14.html#node_chap_13)).

[^1]: Edgar, R. C. (2020). [URMAP, an ultra-fast read mapper](https://www.biorxiv.org/content/10.1101/2020.01.12.903351v1). bioRxiv
