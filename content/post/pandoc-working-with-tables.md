---
title: "Working with tables and Pandoc"
date: 2012-10-10T14:38:42+01:00
draft: false
tags: ["misc", "haskell", "rstats"]
categories: ["2012"]
---

A quick note on the latest development version of [Pandoc](http://johnmacfarlane.net/pandoc/) which remains by far one of the best software I've used.

Working with Tables in [MultiMarkdown](https://github.com/fletcher/MultiMarkdown/wiki/MultiMarkdown-Syntax-Guide) or [Pandoc](http://johnmacfarlane.net/pandoc/demo/example19/Tables.html) isn't fancy at all if you are to write them by hand. Hopefully, some editors like Emacs or Vim allow to simplify things a bit. For short statistical PDF reports which I now tend to write in Markdown since 4 months or so, I'm missing the ability to have Tables written in plain text, as produced with Emacs [Table mode](http://emacswiki.org/emacs/TableMode) or [orgtbl](http://orgmode.org/manual/Built_002din-table-editor.html), and converted automagically in a basic `tabular` ($\LaTeX$) or `table` (Context). That may just be because I was really working with an old version of Pandoc.

After googling a bit, I discovered that Pandoc now offers some support for `orgtbl` [tables with pipes](https://github.com/jgm/pandoc/issues/260). Of course that means I need to update my current version of Pandoc (1.9.3, it was in fact compiled from the latest [development snapshot]({{< ref "/post/work-distraction-free-os-x-desktop.md" >}}) available at that time), i.e. reinstalling everything. Why everything? Because it appears that the development version (yes, that's so good to live on the bleeding edge :-) now requires `cabal-dev` which is used to maintains sandboxed build environments (much like Python [virtualenv](http://www.virtualenv.org/en/latest/index.html)). So I started to `git pull` my old repository and followed instructions on [Pandoc wiki](http://bit.ly/SS1Prj). Guess what: that didn't work! When calling

```
$ make prep
```

which purports to install all dependencies, I got a weird error with `zip-archive-0.1.1.8` during the building phase. As I had no idea why this happened (and Google wasn't of any help this time), I thought that maybe my GHC install was also just too old.

```
$ ghc --version
The Glorious Glasgow Haskell Compilation System, version 7.0.4
[772] aliquote (0) ~
$ cabal --version
cabal-install version 1.16.0
using version 1.16.0.1 of the Cabal library 
```

I upgraded to the latest [Haskell Platform](http://www.haskell.org/platform/). Now I'm done with

```
$ ghc --version
The Glorious Glasgow Haskell Compilation System, version 7.4.1
```

Then, I fetched Pandoc from Github again. I got no complaints with `cabal install cabal-dev && make prep`, and `zip-archive-0.1.1.8` compiled without problem.

```
$ cabal-dev/bin/pandoc --version
pandoc 1.10
Compiled with citeproc-hs 0.3.5, texmath 0.6.1.1, highlighting-kate 0.5.3.2.
Syntax highlighting is supported for the following languages:
    Actionscript, Ada, Alert, Alert_indent, Apache, Asn1, Asp, Awk, Bash,
    Bibtex, Boo, C, Changelog, Clojure, Cmake, Coffee, Coldfusion, Commonlisp,
    Cpp, Cs, Css, D, Diff, Djangotemplate, Doxygen, Doxygenlua, Dtd, Eiffel,
    Email, Erlang, Fortran, Fsharp, Gnuassembler, Go, Haskell, Haxe, Html, Ini,
    Java, Javadoc, Javascript, Json, Jsp, Latex, Lex, LiterateHaskell, Lua,
    Makefile, Mandoc, Matlab, Maxima, Metafont, Mips, Modula2, Modula3,
    Monobasic, Nasm, Noweb, Objectivec, Objectivecpp, Ocaml, Octave, Pascal,
    Perl, Php, Pike, Postscript, Prolog, Python, R, Relaxngcompact, Rhtml, Ruby,
    Scala, Scheme, Sci, Sed, Sgml, Sql, SqlMysql, SqlPostgresql, Tcl, Texinfo,
    Verilog, Vhdl, Xml, Xorg, Xslt, Xul, Yacc, Yaml
Copyright (C) 2006-2012 John MacFarlane
Web:  http://johnmacfarlane.net/pandoc
This is free software; see the source for copying conditions.  There is no
warranty, not even for merchantability or fitness for a particular purpose.
```

Now, using `orgtbl` to make my table works like a charm. I just have to understand why Pandoc doesn't like my "grid tables".

[Pandoc table editing in vim](http://connermcd.wordpress.com/2012/05/20/pandoc-table-editing-in-vim/) has some good tips on managing ASCII Table with Pandoc. For online previewing, you can try [Format Text as a Table](http://www.sensefulsolutions.com/2010/10/format-text-as-table.html). And, of course, it is always a good idea to visit the [Extras](https://github.com/jgm/pandoc/wiki/Pandoc-Extras) wiki page from time to time.

### Sidenote

It should be noted that Emacs `Table` mode is fully compatible with ASCII tables returned by the [Hmisc](http://cran.r-project.org/web/packages/Hmisc/index.html) R package, like this:

```r
> f <- function(x, digits=1) {
    out <- round(c(min(x), max(x), median(x), mean(x), sd(x)), digits=digits)
    names(out) <- c("Min", "Max", "Median", "Mean", "SD")
    return(out)
}
> grp <- sample(gl(4, 10, 40, labels=LETTERS[1:4]))
> y <- rnorm(40, 12, 2)
> summary(y ~ grp, fun=f)

y    N=40

+-------|-|--|----|----|------|----|---+
|       | |N |Min |Max |Median|Mean|SD |
+-------|-|--|----|----|------|----|---+
|grp    |A|10| 9.3|13.9|11.6  |11.7|1.3|
|       |B|10| 7.4|14.9|12.2  |11.8|2.3|
|       |C|10| 8.4|14.1|13.0  |12.4|2.0|
|       |D|10|11.3|14.3|13.5  |13.3|0.9|
+-------|-|--|----|----|------|----|---+
|Overall| |40| 7.4|14.9|12.8  |12.3|1.8|
+-------|-|--|----|----|------|----|---+
```
