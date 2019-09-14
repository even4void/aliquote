+++
title = "Cabal Upgrade"
date = 2010-12-19T00:22:24+01:00
draft = false
tags = ["apple", "haskell"]
categories = ["2010"]
+++

Just a few notes about the defected cabal-install program in the latest Haskell platform, although it seems to be older than the latest release. So why spending two hours trying to solve this infamous `cabal: Codec.Compression.Zlib: incorrect header check`? Because I just want to try [pandoc](http://johnmacfarlane.net/pandoc/) : smile :

Ok, I must admit it was not so hard to get things working, after googling a little bit and finding THE correct solution (among a lot of useless threads)--in fact, I spent two hours on that bug, more than two third of it being devoted to reading all those threads and tweaking my current install. Then, I found it: You just need to upgrade to the latest version of cabal (1.10) and cabal-install (which are probably patched). They can be found from the Darcs repository (yes, of course it needs a working darcs, that cannot compile from source unless you already have a working cabal-install program because of the many dependencies, so I choose an x86-64 binary from <http://darcs.net/>). The main problem stands from the package format which is not a tar.gz file as expected.

```
$ darcs get http://darcs.haskell.org/cabal-branches/cabal-1.10
$ darcs get  http://darcs.haskell.org/cabal-install
$ cd cabal-1.10/
$ ghc --make Setup
$ ./Setup configure --user
$ ./Setup build
$ ./Setup install
$ cd ../cabal-install/
$ chmod +x bootstrap.sh
$ ./bootstrap.sh
```

Note that for cabal-install the instructions resume to a single command! Once everything is finihed, you can just update your package list using `cabal update` at the command line.

So let's go now:

```
$ cabal install pandoc -fhighlighting
```

At the end, if everything is working properly, you shoud see something like:

```
$ pandoc --version
pandoc 1.6
Compiled with syntax highlighting support for:
Ada, Alert, Asp, Awk, Bash, Bibtex, C, Cmake, Coldfusion, Commonlisp, Cpp, Css,
D, Djangotemplate, Doxygen, Dtd, Eiffel, Erlang, Fortran, Haskell, Html, Java,
Javadoc, Javascript, Json, Latex, Lex, LiterateHaskell, Lua, Makefile, Matlab,
Mediawiki, Modula3, Nasm, Objectivec, Ocaml, Octave, Pascal, Perl, Php,
Postscript, Prolog, Python, Relaxngcompact, Rhtml, Ruby, Scala, Scheme, Sgml,
Sql, SqlMysql, SqlPostgresql, Tcl, Texinfo, Xml, Xslt, Yacc
Copyright (C) 2006-2010 John MacFarlane
Web:  http://johnmacfarlane.net/pandoc
This is free software; see the source for copying conditions.  There is no
warranty, not even for merchantability or fitness for a particular purpose.
```

Ok, well I already have [Asciidoc](http://www.methods.co.nz/asciidoc/), [Markdown](http://daringfireball.net/projects/markdown/), and [rst](http://docutils.sourceforge.net/rst.html) installed on my system. I just have to figure out what [pandoc](http://johnmacfarlane.net/pandoc/) will add to these already brillant strutured texting programs.
