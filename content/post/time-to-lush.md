---
title: "Time to lush"
date: 2011-02-22T20:03:10+01:00
draft: false
tags: ["lisp"]
categories: ["2011"]
---

As part of my investigation on Lisp-based solutions for statistical computing (see also this [related post](/post/diving-into-lisp-for-statistical-computing)), I am now trying to get a working installation of [Lush](http://lush.sourceforge.net/).

I discovered Lush some time ago (two years at least) but only think of trying it more seriously after having reread Ross Ihaka's famous papers on the need of developing a new statistical programming language (after R). In [Back to the Future: Lisp as a Base for a Statistical Computing System](http://www.stat.auckland.ac.nz/%7Eihaka/downloads/Compstat-2008.pdf) (PDF), and the accompanying [slides](http://www.stat.auckland.ac.nz/%7Eihaka/downloads/Compstat-2008-Slides.pdf) (PDF), he argued that he obtained better performance in Lisp with real and artificial datasets, compared to R or Python.[^1] I don't know what software they use, but I guess it is based on some derivative of Common Lisp (CL).

I spent some time figuring out how to get a fully working Lush system, including compiled C code. For the moment, it failed for the Function Compilation part, that is everything related to `dhc-make`. I was initially thinking this was a problem related to "architecture" management under OS X, but it appears this is more serious than this. According to this thread, [Problems with Lush in OS X Snow Leopard](http://sourceforge.net/projects/lush/forums/forum/106861/topic/3535253):

> the Lush dynamic loader is built around `libbfd`, which doesn't support `Mach-O`. So the Lush dynamic loader doesn't work, and the compiler is rendered useless. Library files that don't have a "dhc-make" (no compiled code) will load fine, but those that do will crash.

Indeed, libraries typically have a `.dylib` extension rather than `.so` (OS X uses its proprietary [Mach-O](http://en.wikipedia.org/wiki/Mach-O) object file format and not [ELF](http://en.wikipedia.org/wiki/Executable_and_Linkable_Format) as in any un*x-based OS).

It is pretty silly as I initially wanted to benchmark pure vs. compiled Lisp code against other CL implementations, R, and Python. Anyway, here is how to get the Lisp-only version of Lush on OS X (32 or 64 bits).

We first need to full [readline](http://www.gnu.org/software/readline/) support (Apple ships `libedit` which lacks many of `readline` feature).

```
$ curl -O ftp://ftp.cwru.edu/pub/bash/readline-6.0.tar.gz
$ tar xvf readline-6.0.tar
$ ./configure & make
$ sudo make install 
```

Creating a 32 or 64 bits only library is not very convenient and we can create a Mach-O universal binary (with 2 or 3 architectures) instead:

```
$ make CC="gcc -arch x86_64 -arch i386"
```

We can check that the generated library has the expected format:

```
$ file /usr/local/lib/libreadline.dylib
/usr/local/lib/libreadline.dylib: Mach-O universal binary with 2 architectures
```

To compile Lush, we need to set a lot of parameters during the
`configure` step. Here is what I used:

```
$ ./configure --with-x --x-includes=/usr/include/X11 --x-libraries=/usr/X11/lib/\
   --with-extra-includes=/usr/local/include/readline\
   --with-extra-libraries=/usr/local/lib
```

Then `make` should work. You can test Lush directly from the installation directory:

```
$ bin/lush
LUSH Lisp Universal Shell (compiled on Feb 22 2011)
   Copyright (C) 2002 Leon Bottou, Yann LeCun, AT&T, NECI.
 Includes parts of TL3:
   Copyright (C) 1987-1999 Leon Bottou and Neuristique.
 Includes selected parts of SN3.2:
   Copyright (C) 1991-2001 AT&T Corp.
This program is free software distributed under the terms
of the GNU Public Licence (GPL) with ABSOLUTELY NO WARRANTY.
Type `(helptool)' for details.
+[/Users/chl/Downloads/lush/sys/stdenv.lsh]
 [compat.lsh]
 [graphenv.lsh]
 [brace.lsh]
 [dh-compile.lsh]
 [dh-util.lsh]
 [dh-macro.lsh]
 [ogre.lsh]
 [help.lsh]
 [ldoc.lsh]
 [ltree.lsh]
 [shell.lsh]
 [lushrc.lsh]
? (+ (* 3 2) 1)
= 7
```

To see if it support the X11 interface, let's try to launch the help panel:

```
? (helptool)
 [helptool.lsh] (autoload)
 [treebrowser.lsh]
 [ldocpane.lsh]
= ::help-book:100424e80
```

A window like the one shown below should pop up on the screen.

![](/img/20110222132507.png)

To build a 32-bits version, we need to adjust `CFLAGS` and `CXXFLAGS` (`-arch i386`) or directly pass the `m32` flag to gcc. In my case, I generated both versions but then only installed the 64-bits executable in `/usr/local` with `make install` (with root privileges).

I'm afraid I won't be able to test the OpenGL and GSL binding, and most of other things that were very exciting from the documentation. Likewise, the Machine Learning package doesn't work. Trying something like the example below results in a GASP error (`dyld: dyld std::terminate()`):

```lisp
(libload "svm/libsvm")
```

Not all packages use `dhc-make`, though. For example, I successfully reproduced the on-line example with the built-in plotting facilities:

```lisp
? (libload "libplot/plotter")
? (setq p (new Plotter))
? (==> p PlotFunc "log" log 0 10 0.1 (alloccolor 0 0 1))
? (==> p redisplay)
? (==> p SetGrid 1)
? (==> p redisplay)
```

![](/img/20110222134253.png)

[^1]: See also [R: Lessons Learned, Directions for the Future](http://www.stat.auckland.ac.nz/%7Eihaka/downloads/JSM-2010.pdf) (JSM, 2010, and these [slides](http://www.stat.auckland.ac.nz/%7Eihaka/downloads/JSM-Talk.pdf)).

