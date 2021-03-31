---
title: "Python and string concatenation"
date: 2021-03-23T21:06:54+01:00
draft: true
tags: ["python", "bioinformatics"]
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

I know at least three ways to concatenate strings in Python: + (or `__add__`), `.join()` for specific cases, and the [io.StringIO module](https://bollu.github.io/fast-string-concatenation-in-python3.html).[^1] Note that we discarded F-strings on purpose. The last option is supposed to be 0(1), while string concatenation generally is an O(n<sup>2</sup>) operation, which makes sense since you need to create a copy of the original string and run to all other letters from the second string to append them. The second string is not necessarily of the same length n, but [it doesn't really matter](https://stackoverflow.com/a/58310567/420055)

[^1]: For lists, it is even possible to use `.extend()`.


https://stackoverflow.com/questions/10043636/any-reason-not-to-use-to-concatenate-two-strings/10043677#10043677
https://stackoverflow.com/questions/12169839/which-is-the-preferred-way-to-concatenate-a-string-in-python#12171382
https://bollu.github.io/fast-string-concatenation-in-python3.html
https://stackoverflow.com/questions/3055477/how-slow-is-pythons-string-concatenation-vs-str-join
https://stackoverflow.com/questions/58309852/why-is-the-complexity-of-simple-string-concatenation-on2
