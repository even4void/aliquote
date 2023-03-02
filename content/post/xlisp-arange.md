---
title: "Generating variable names in Lispstat"
date: 2023-03-02T10:04:01+01:00
draft: false
tags: ["lisp"]
categories: ["2023"]
---

For a side-project I went back into Lispstat, which was developed in the 90s, to perform basic biostatistical analysis. At that time, there was no such thing like a data frame, but only data arrays composed of numerical values thta could be imported from a space delimited text file. Usually, you "selected" the variables you were interested in one at a time. Assuming you have two series of values (i.e., two variables), you can split a response variable by a grouping factor like this:

```lisp
(def geno1 (select age (which (= 1 genotype))))
(def geno2 (select age (which (= 2 genotype))))
(def geno3 (select age (which (= 3 genotype))))
```

I often use a loop to generate variable name with a common prefix or suffix. In R it is easily done using a `for` loop and `assign` (see [this example](https://stackoverflow.com/a/9565095)), while in Stata it can be done in a `forvalues` or `foreach` construct. Here is an example from my [Stata Starter Kit](https://aliquote.org/articles/stata-sk/) (draft):

```stata
xtile weightc = weight, nq(4)
quietly tabulate weightc, gen(weightc)
drop weightc
local i = 0
foreach v of varlist weightc1-weightc4 {
  local i = `i' + 1
  rename `v' w`i'
}
list w* in 1/5
```

Lispstat was built on the XLISP dialect of Lisp, which means it is mostly the same as Common Lisp except that something are missing here and there, most notably the `loop` macro. There are several constructs available for iterating over a range or a list, like `do`, `dotimes` and `dolist`. Since we cannot use `dotimes` to iterate over a sequence starting at a value other than zero,[^1] let's try with `dolist`:

```lisp
(dolist (n (iseq 1 3))
    (set (intern (concatenate 'string "GENO"
                              (write-to-string n)))
         (select age (which (= n genotype)))))
```

<small>Dont' forget that variables are represented internally as uppercase symbol, so even if you call your variable `geno1` at the prompt or in an expression, it really is `GENO1` in the environment.</small>

It is a little more verbose than the previous expressions, but once converted to a macro, it can be reused many times.

{{% music %}}Arcade Fire • _Rebellion_{{% /music %}}

[^1]: In Common Lisp, we can write a [little macro](https://stackoverflow.com/a/72355135) for that purpose, but it requires using `loop`.
