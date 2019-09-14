+++
title = "Apple development tools, An overview"
date = 2009-11-26T08:21:34+01:00
draft = false
tags = ["apple"]
categories = ["2009"]
+++

Snow Leopard (SL) comes with two versions of gcc (4.0 and 4.2) once you've installed the Xcode package. It is, however, possible to compile the latest gcc version (4.5) as shown by J. De Leeuw and others. Check the SVN repository at <http://gcc.gnu.org/svn.html>. In this case, the complete [gcc suite][gcc suite] would provide front ends for C, C++, Objective-C, Fortran, Java, and Ada. Actually, I was not able to succeed in using the gcj compiler because of missing dependencies, in particular the Eclipse native compiler (ecj). The gfortran compiler works fine, but I also have a version of Fortran 77, mostly to ensure compatibility with old software and to compare both versions. In addition, the Developer tools include the [llvm suite][llvm suite] which is based on version 4.2 of gcc.

Apple provides Python 2.3 (for compatibility reason), 2.5 (32 bits mode), and 2.6 (32 and 64 bits mode). They all are installed as system languages, that is in a Framework. Default system Python can be changed by setting in `.profile` or `.bashrc` something like:

``` 
export VERSIONER_PYTHON_PREFER_32_BIT=no 
export VERSIONER_PYTHON_VERSION=2.6 
```

but see the man page on `python`. There is also an alternative solution which is [Enthought Python][Enthought Python], that comes with a lot of scientific packages bundled together. It should be sufficient for most numerical applications although it may be necessary to add additional package. The proper way to do is to patch the easy_install utility and use it under EPD; the sad way (but it works!) is to compile the package under Python 2.5 (which is actually the same version that comes with EPD) and move the compiled package into the EPD site-packages directory. Personally, I recompile everything in 64 bits, with the exception of MayaVi. However, I may still be able to use the EPD distribution through emacs with the enhanced Python mode and iPython. Add to your `.emacs` something like:

```lisp 
(setq ipython-command 
	"/Library/Frameworks/Python.framework/Versions/Current/bin/ipython") 
(require 'ipython) 
(require 'python-mode) 
```

Be careful that compiling from scratch the scipy package takes some time (about 40 min.) when linked against LAPACK and/or BLAS (numpy is already included in system Python 2.5 and 2.6).

Ruby is available (version 1.8) but it is easy to update to version 1.9 in 64 bits, or to install [MacRuby][MacRuby] if one is interested in benefiting from Apple Objective-C technologies. Both can be installed in `/usr/local`. Ruby packages are easily managed using `gem` (like `cpan` for Perl). In particular, [Rails][Rails] can be installed with one line:

``` 
$ gem install rails 
```

but it is available as a standalone package if needed.

The R statistical software can be installed from [CRAN][CRAN] website with the binary installer, which includes the R core packages, the Mac GUI and gfortran. Most experienced users would be interested in the Mac OS X [Developer's R version][Developer's R version]. Actually, I recompile the experimental R 2.11, without GUI support, but I cannot get a working Gtk system (most probably due to conflict with Cairo libraries).

### Creating shared libraries using gcc 

For example, there is no getline function in the standard C files on Mac OS X. Although it could be replaced with `fgets` (less secure) or `fgetln`, which is defined in all BSD distributions. Suppose we are interested in using `getline`.

First you need to create the object file

```
$ cc -fno-common -c getline.c
$ file getline.o
getline.o: Mach-O 64-bit object x86_64
```

Next, we can create the corresponding shared library:

```
$ gcc -dynamiclib -o libgetline.dylib -dylib getline.o
$ file libgetline.dylib 
libgetline.dylib: Mach-O 64-bit dynamically linked shared library x86_64
```

We can now compile our toy example using something like,

```
$ cc -o mygetline mygetline.c -L/Users/chl/tmp -lgetline
```

where `mygetline.c` reads

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(void)
{
  char * line = NULL;
  size_t len = 0;
  ssize_t read;
  while ((read = getline(&line, &len, stdin)) != -1) {
    printf("Retrieved line of length %zu: \n", read);
    printf("%s", line);
  }
  if (line)
  free(line);
  return EXIT_SUCCESS;
}
```

This can be tested unsing command line, as
	
```
$ ./mygetline 
first line here
Retrieved line of length 16: 
first line here
and a second one	
Retrieved line of length 17: 
and a second one
```

If you're planning to use this library for other application, don't forget to put it in a place where it can be found, e.g., `/usr/local/lib` or update your Libraries table.

[gcc suite]: http://gcc.gnu.org/
[llvm suite]: http://llvm.org/
[Enthought Python]: http://www.enthought.com/
[MacRuby]: http://www.macruby.org/
[Rails]: http://rubyonrails.org/
[CRAN]: http://www.cran.r-project.org
[Developer's R version]: http://r.research.att.com/