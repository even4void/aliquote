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
