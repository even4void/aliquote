---
title: "Murmurhash"
date: 2020-03-12T12:07:48+01:00
draft: false
tags: ["scheme", "clang"]
categories: ["2020"]
---

The [MurmurHash](https://en.wikipedia.org/wiki/MurmurHash) algorithm belongs to non-cryptographic hash function and it is used for hash-based lookup, e.g. to convert a word $w$ to an integer $s \in [0, H)$, where $H$ is the table size. I came across this hash function by reading a recent publication on a new read mapper.[^1] It has been shown to have [good properties](https://softwareengineering.stackexchange.com/a/145633) in terms of speed and number of collisions compared to other hashing algoritms; see also [Hash functions: An empirical comparison](https://www.strchr.com/hash_functions).

Although different implementations of Murmurhash3 are cited on the Wikipedia page (see also the `mmh3`/`digest` packages for Python/R), I couldn't find one in Scheme. So here is a quick and dirty one in Chicken scheme, using its solid FFI facilities and some C code grabbed from the Wikipedia page. There's also the [digest](http://dirk.eddelbuettel.com/code/digest.html) R package (here's the [C code](https://github.com/cran/digest/blob/master/src/pmurhash.c) in question for the interested reader) and some [C++ code](https://github.com/rurban/smhasher/blob/master/MurmurHash3.cpp) available on [smhasher](https://github.com/aappleby/smhasher) on Github, but I haven't tried it yet.

Please note that things have a little bit changed with Chicken 5, compared to this excellent blog post: [A (mostly) comprehensive guide to calling C from Scheme and vice versa](https://www.more-magic.net/posts/scheme-c-integration.html). In particular, to import the `foreign` module, you now have to write `(import (chichen foreign))` instead of `(import foreign)`. Say you have this little snippet:

```scheme
(import (chicken foreign))

(foreign-declare "#include <math.h>")

(define sin-pi
  (foreign-lambda* double ((double x))
    "double val = x * M_PI;"
    "C_return(sin(val));"))

(display (sin-pi 0.5))
```

Then you can generate a binary for your platform using the Chicken compiler, `csc`. The interactive Chicken REPL (`csi`) won't work with the `foreign` import. First, I wanted to test the C code so I added a little header and print statement ([murmur32.c](/pub/murmur32.c)). Let us check that it works:

```shell
$ cc murmu32.c -o murmur32
$ ./murmur32
1498610893
```

Here is what I got using R, which also implements MurmurHash3 for 32/128 bit (x86/x64):

```r
> digest::digest("murmur", "murmur32", seed = 101, serialize = FALSE)
[1] "5952fccd"
```

This also happens to be 1,498,610,893 in decimal notation.

Now, let's write some Scheme wrapper to use this little C procedure, while trying to handle [C types](http://wiki.call-cc.org/man/4/Foreign%20type%20specifiers) correctly: an `uint_8` is an unsigned char, or a foreign `blob` in case it is just a pointer, while an `uint32_t` corresponds to an unsigned int (4 bytes). And so, we get the following piece of code:

```scheme
(import (chicken foreign)
        (chicken format))

#>
  extern uint32_t murmur3_32(const uint8_t* key, size_t len, uint32_t seed);
<#

(define m32 (foreign-lambda unsigned-int32 "murmur3_32" blob size_t unsigned-int32))

(printf "~A " (m32 "murmur" 6 101))
```

But first, we need to compile the core [C functions](/pub/lib-m32.c) (no need for a shared library, though):

```shell
$ cc -c lib-m32.c
$ csc -o m32 lib-m32.o m32.scm
```

And finally:

```shell
$ ./m32
1498610893
```

[^1]: Edgar, R. C. (2020). [URMAP, an ultra-fast read mapper](https://www.biorxiv.org/content/10.1101/2020.01.12.903351v1). bioRxiv
