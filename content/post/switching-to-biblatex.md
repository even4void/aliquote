---
title: "Switching to Biblatex"
date: 2010-04-04T17:34:41+01:00
draft: false
tags: ["tex", "perl"]
categories: ["2010"]
---

I usually rely on the facilities offered in the *natbib* package to format my bibliography entries in a LaTeX document. I was aware of *biblatex* alternative, but I never gave it a try. Now, it's partly done. Although the user's manual is about 200 pages long, it was tricky to produce a good-standing document with xelatex.

In the meantime, I happen to install [Biber][Biber], which is a bibtex replacement written entirely in Perl (and the btparse C library). The installation is easy, provided you first install `Readonly::XS`, `List::AllUtils`, `Log::Log4perl`, `XML::LibXML::Simple`, `File::Slurp`, `Text::BibTeX` (needs `Module::Build` and several `ExtUtils` modules). I replaced the latter by the alternative (`Parse::RecDescent` and `Regexp::Common`) proposed in the biber `README` file since I was not able to get a working verion of `Text::BibTeX`. I also installed `Data::Dump`. After cpan finished its stuff, I install `biber` and all went fine, except for tests that depend on `Text::BibTeX`:

```
$ perl Build.PL
$ ./Build
$ ./Build test
[...]
Failed 5/21 test programs. 11/272 subtests failed.
$ sudo ./Build install
$ biber --version
biber version: 0.5.3
```

It is worth to note that its XML-aware little brother, [BibTeXML][BibTeXML], should provide useful facilities when working with Docbook.

[Biber]: http://biblatex-biber.sourceforge.net/ "Biber"
[BibTeXML]: http://sourceforge.net/projects/bibtexml/ "BibTeXML"