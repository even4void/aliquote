---
title: "Python and string concatenation"
date: 2021-03-23T21:06:54+01:00
draft: true
tags: ["python"]
categories: ["2021"]
---

I regularly use Biopython for everything related to bioinformatics and, in particular, processing sequence data. It is a nice package, with submodules like `SeqIO` or `Phylo`. The Seq or SeqRecord classes are really useful when it comes to storing and manipulating DNA sequences. Sequence are available as immutable (default) or mutable objects, and it is as easier to work with them as it would be with pure strings. In fact, you can even use their string representation if you like:

```python
from Bio.Seq import Seq, MutableSeq

s1 = Seq("ACGT")
s2 = MutableSeq("ACGT")
s2[2] = "A"
s = s1 + s2
str(s)[:3]
```

There's nothing special in [Biopython](https://github.com/biopython/biopython/blob/master/Bio/Seq.py) on how "Seq" data are handled, but this led me to wonder whether the `+` operator is really the best method to concatenate strings, or DNA sequences, except perhaps the use of bytes in place of raw strings.

I know at least three ways to concatenate strings in Python: + (or `__add__`), `.join()` for specific cases, and the [io.StringIO module](https://bollu.github.io/fast-string-concatenation-in-python3.html).[^1] Note that we discarded F-strings on purpose. The last option is supposed to be [O(1)](https://bollu.github.io/fast-string-concatenation-in-python3.html), while string concatenation generally is an O(n<sup>2</sup>) operation, which makes sense since you need to create a copy of the original string and run to all other letters from the second string to append them. The second string is not necessarily of the same length n, but [it doesn't really matter](https://stackoverflow.com/a/58310567/420055). There are many other relevant threads on SO, e.g., [1](https://stackoverflow.com/questions/10043636/any-reason-not-to-use-to-concatenate-two-strings/10043677#10043677), [2](https://stackoverflow.com/questions/12169839/which-is-the-preferred-way-to-concatenate-a-string-in-python#12171382), [3](https://stackoverflow.com/questions/3055477/how-slow-is-pythons-string-concatenation-vs-str-join), [4](https://stackoverflow.com/questions/58309852/why-is-the-complexity-of-simple-string-concatenation-on2), or [5](https://stackoverflow.com/questions/1316887/what-is-the-most-efficient-string-concatenation-method-in-python). The `+` operator is handy since it is used in other languages as well, e.g. Javascript, or [Rust](https://doc.rust-lang.org/std/ops/trait.Add.html). Those languages also offer alternative ways to concatenate strings ()`join`, `append`, etc.).

On the Python side, various benchmarks regarding which method is best (in terms of time or space complexity) are discussed here and there (including the links provided above). Apparently, F-strings are not so bad in terms of performance, especially since Python 3.6 but it looks to me like using "formating" stuff (much like `println!` in Rust or `format` in Lisp) amounts to divert the original purpose of this type of functions, which mostly exist for their side-effects. I may be wrong of course.

In any case, the recommendation appears to be: [Use `.join()`](https://waymoot.org/home/python_string/), especially if you like to conform to [PEP 8](https://www.python.org/dev/peps/pep-0008/) recommendation:

> For example, do not rely on CPython's efficient implementation of in-place string concatenation for statements in the form a += b or a = a + b. This optimization is fragile even in CPython (it only works for some types) and isn't present at all in implementations that don't use refcounting. In performance sensitive parts of the library, the ''.join() form should be used instead. This will ensure that concatenation occurs in linear time across various implementations.


[^1]: For lists, it is even possible to use `.extend()`.
[^2]: In Haskell, we even have a join-like feature, thanks to ̀`Control.Monad.join`.
