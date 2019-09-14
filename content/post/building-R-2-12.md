+++
title = "Building R 2.12 and Python 3.1 (development snapshot)"
date = 2010-04-05T08:59:31+01:00
draft = false
tags = ["rstats", "python"]
categories = ["2010"]
+++

Although I already installed the upcoming R 2.11, I decided to build the daily snapshot from scratch, this time not as a Framework version. It suffices to have a look at the configure option to see that... there are many ones! I installed many programs in my `/usr/local` (in line with ideas coming from Jan de Leeuw), but I never take any note of what I was doing. As a consequence, if I was to reinstall all the 18 Go of programming stuff I put in my `/usr/local`, it will take me one week again... Hence, I decided to now log on the main install on my Mac. Here, I used the following:

```
$ ./configure --with-aqua --with-blas='-framework vecLib' --with-lapack \
--prefix=/usr/local/R --disable-R-framework --with-readline --with-cairo \ 
--enable-memory-profiling --enable-R-shlib --x-includes=/usr/X11R6/include \
--x-libraries=/usr/X11R6/lib --build=x86_64-apple-darwin10 \
--host=x86_64-apple-darwin10 --target=x86_64-apple-darwin10
```

and the output reproduced below shows that this seems reasonable:

```
R is now configured for x86_64-apple-darwin10

Source directory:          .
Installation directory:    /usr/local/R

Interfaces supported:      X11, aqua, tcltk
External libraries:        readline, BLAS(vecLib), LAPACK(in blas), ICU
Additional capabilities:   PNG, JPEG, TIFF, NLS, cairo
Options enabled:           shared R library, R profiling, memory profiling, Java

Recommended packages:      yes
```
	
When compilation finished, I just checked that everything is ok before installing it:

```
$ make check
$ make info
$ sudo make install
$ sudo make install-info
```

Gotcha! I now have a working R 2.12.

```
$ Rexp

R version 2.12.0 Under development (unstable) (2010-04-04 r51591)
Copyright (C) 2010 The R Foundation for Statistical Computing
ISBN 3-900051-07-0
```
	
I realized that yesterday I also compiled Python 3.1, this time as a Framework version. The main steps are quite simple. Download the latest build from <http://www.python.org/download> (Select a source tarball), then

```
$ ./configure --enable-framework --with-universal-archs="64-bit"
$ make
$ make test
```

I ended up with some errors, like:

```
309 tests OK.
3 tests failed:
    test_ctypes test_io test_osx_env
```

which I didn't investigate further. Finally,

```
$ sudo make frameworkinstall
```

The newly compiled Python 3 now sits under `/Library/Frameworks/Python.framework/Versions/3.1/`, and the executable is located in /usr/local/bin. I just symlink it to get a convenient distinction between older releases (actually versions 2.5 and 2.6 which were shipped with Snow Leopard)---with default `python` as Python 2.6---and this one as python3:

```
$ sudo ln -s /usr/local/bin/python3.1 /usr/local/bin/python3
$ python3
Python 3.1.2 (r312:79147, Apr  3 2010, 19:07:49) 
[GCC 4.2.1 (Based on Apple Inc. build 5646) (LLVM build 2206)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
$ python3 Demo/scripts/pi.py 
314159265358979323846264338327950288419716939937510582097494...
```