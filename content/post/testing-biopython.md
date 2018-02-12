+++
title = "Testing BioPython"
description = ""
date = 2008-07-27T19:22:47+01:00
draft = false
tags = ["python"]
categories = []
+++

Following my previous posts on [Bioinformatics with Mac OS X]({{ ref "/post/bioinformatics-with-mac-osx.md" }}) and Installation of [Python scientific packages]({{ ref "/post/python-scientific-packages.md" }}), I just try the `BioPython` toolbox. BioPython is an open-source project, based on the same principle as the older [BioPerl][BioPerl] project.[^1] It aims at providing a unified interface to traditional methods for computational molecular biology. The question then arises as to whether it conflicts with the [Bioconductor][Bioconductor] or BioPerl initiative.

In fact, the Bioconductor project provides a set of about 260 packages (as of July 2008) that enhance the core [R][R] software. Most of them are supposed to integrate a growing collection of statistical tools. It is a popular library for microarray analysis since it supports most formats and comes with many graphical tools. On the contrary, BioPerl or BioPython are thought to be used to manipulate data file, organize the information and be interfaced with other programming languages. Thus, they fulfill their role of universal scripting language and appear very complementary of R biobase. Whether to use Perl or Python is then a matter of taste.

The installation of BioPython is quite easy, provided you have `easy_install` working properly.[^2] Thus, just type

```
$ sudo easy_install -f http://biopython.org/DIST/ biopython
```

at the command prompt, or follow the [install instructions][install instructions] on BioPython
website.

Next, obviously, you will have to read the [documentation][documentation]. There is also a general paper that describes most of the BioPython functionalities, though it's more oriented toward a wide audience: S. Bassi. [A Primer on Python for Life Science Researchers], *PLoS Comput Biol* **3(11)**: e199.

[^1]: There is also a <a href="http://biojava.org/">BioJava</a> project and a <a href="http://sciruby.codeforpeople.com/sr.cgi/BioRuby">BioRuby</a> project.<br />

[^2]: Installing BioPerl on a Mac, you may either use Fink (e.g. `$ sudo fink install bioperl-pm588` at the command prompt), use the `cpan` interface, or follow the <a href="http://www.bioperl.org/wiki/Installing_Bioperl_for_Unix">instructions</a> on the BioPerl website on how to do it the hard way. **Further Notes**: Bioperl needs a working version of <a href="http://www.boutell.com/gd/">GD</a>. Installing GD on Mac OS X is well-documented, but you may encounter some difficulties when compiling the source package because of lacking png and jpeg libraries. First, check that `libpng.a` and `libjpeg.a` are installed (usually in `/usr/local/lib/`). Then, update your table of archive using
`ranlib`, e.g. `$ sudo ranlib /usr/local/lib/libpng.a`. If you now try to compile the gd archive, it may produce the expected result and install `libgd.a` in the proper directory. However, if you see a message like `ranlib: file: /usr/local/lib/libgd.a(gdcache.o) has no
symbols` when issuing `$ sudo ranlib /usr/local/lib/libgd.a` at the command prompt, it means that you have a problem with `gdcache.o`. According to this <a href="http://osdir.com/ml/ntop.devel/2004-05/msg00034.html">post</a>, the problem lies in the fact that `gdcache.o` contains no symbols because neither libttf nor libfreetype were included in the build, and hence libgd thought the cache was unnecessary. Thus, you may safely remove the occurence of `gdcache.o` in the last part of the `Makefile` (line beginning with `libgd.a:`) and try to compile again the source package. Don't forget to clean the previous install with `$ sudo make clean` before doing a new installation.


[Bioinformatics with Mac OS X]: /2008/06/15/bioinformatics-with-mac-osx.html
[Python scientifical packages]: /2008/07/02/python-scientific-packages.html
[BioPerl]: http://www.bioperl.org/
[Bioconductor]: http://www.bioconductor.org
[R]: http://www.r-project.org
[install instructions]: http://biopython.org/wiki/Download
[documentation]: http://biopython.org/wiki/Documentation
[A Primer on Python for Life Science Researchers]: http://www.ploscompbiol.org/article/info:doi%2F10.1371%2Fjournal.pcbi.0030199