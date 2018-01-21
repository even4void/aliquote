+++
title = "Welcome to the Macbook Air"
date = 2010-11-20T11:38:03+01:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["apple", "misc"]
categories = []

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
# Use `caption` to display an image caption.
#   Markdown linking is allowed, e.g. `caption = "[Image credit](http://example.org)"`.
# Set `preview` to `false` to disable the thumbnail in listings.
[header]
image = ""
caption = ""
preview = true

+++

I just got a [Macbook Air](http://www.apple.com/macbookair/). Whaouh, it's impressive! My preceding one was an 15” Macbook pro, but as I don't have to do intensive computational work anymore, I thought going to a smaller computer would not be so bad. However, I ordered it from the App Store to customize it with the latest handy features (2.13 GHz core duo and 4 Go RAM). I won't describe the specs of Airbook, but just summarize what I've installed so far. 

## The bare essentials

I just grabbed the latest version of [Aquamacs](http://aquamacs.org/), [TexLive](http://www.tug.org/mactex/), [Git](http://git-scm.com/), and [R](http://cran.r-project.org) (2.12). These are the very basic tools I used most of the day. 

I updated the software shipped with the Mac. This took me a night. I finally add [Dropbox](http://www.dropbox.com/) (the Dev version).

## Some additional CLI and GUI tools

I then downloaded and installed [GitX](http://gitx.frim.nl/), [Versions](http://versionsapp.com/), [asciidoc](http://www.methods.co.nz/asciidoc/), [latex2html](http://www.latex2html.org/), [Papers](http://mekentosj.com/papers/), [Graphviz](http://www.graphviz.org/), [gnuplot](http://www.gnuplot.info/) with [Aquaterm](http://sourceforge.net/projects/aquaterm/) support, [octave](http://octave.sourceforge.net/), [Cyberduck](http://cyberduck.ch/), and [Omnigraffle](http://www.omnigroup.com/products/omnigraffle/).

About computing stuff, I considered a lot of Lisp-related software ([CMUCL](http://www.cons.org/cmucl/), [sbcl](http://www.sbcl.org/), [CCL](http://www.clozure.com/clozurecl.html), [clojure](http://clojure.org/), [mit-scheme](http://groups.csail.mit.edu/mac/projects/scheme/)) but also [Incanter](http://incanter.org/) and [weka](http://www.cs.waikato.ac.nz/ml/weka/). Also, I compiled [sitecopy](http://www.manyfish.co.uk/sitecopy/), [wget](http://www.gnu.org/software/wget/), [ncftp](http://www.ncftpd.com/).

## Installing Python stuff

As I want to use the Python that is installed with the Mac (I know there are newer versions, but the 2.6.1 version is a decent one, and I don't want to add too much software this time), I need to compile [numpy](http://numpy.scipy.org/) and [scipy](http://www.scipy.org/). There are some dependencies to install first:

```
$ sudo easy_install nose
$ curl -O http://www.fftw.org/fftw-3.2.2.tar.gz
$ tar xf fftw-3.2.2.tar.gz
$ cd fftw-3.2.2
$ ./configure CC="gcc -arch i386 -arch x86_64" CXX="g++ -arch i386 -arch x86_64" \
  CPP="gcc -E" CXXCPP="g++ -E"
$ make
$ sudo make install
```

Actually, I didn't install the [UFMPACK](http://www.cise.ufl.edu/research/sparse/umfpack/) (if it happens I need to do sparse algebra, I will reinstall `scipy`, but for the moment that's fine).

For `numpy`, I just ran

```
$ python setup.py build --fcompiler=gnu95
$ sudo python setup.py install
```

Everything went fine, except that now I have two versions of `numpy`, at two different places! The original one (very old) is in `/System/Library/Frameworks/Python.framework/Versions/2.6/Extras/lib/python/numpy`, while the one I just compiled is in `/Library/Python/2.6/site-packages/numpy`. This would cause problem as `scipy` needs `numpy >= 1.4` (as it happens to me, obviously). Again, I don't want to modify the built-in distribution, so I just add the updated `site-package` to the `PYTHONPATH`, like this (in my `.profile`):

```
export PYTHONPATH=/Library/Python/2.6/site-packages:${PYTHONPATH}
```

The problem is that it will only works for me, not as root. So I also need to add `Defaults env_keep += "PYTHONPATH"` to the `sudoers` file (`sudo visudo` at the bash prompt).

Then, I proceed with `scipy` the usual way

```
$ python setup.py build
$ sudo python setup.py install
```

The compilation lasted about 15-20 min. And this is the first time I heard the Airbook. Ok, that seems to be ok now:

```
~ $ python
Python 2.6.1 (r261:67515, Jun 24 2010, 21:47:49) 
[GCC 4.2.1 (Apple Inc. build 5646)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> import numpy
>>> import scipy
>>> print numpy.__version__
1.5.1
>>> print scipy.__version__
0.8.0
```

Then , I need to install [Matplotlib](http://matplotlib.sourceforge.net/). I just correct a typo in `make.osx`, and then

```
$ sudo make -f make.osx fetch deps mpl_build mpl_install
```

which download and install [zlib](http://www.zlib.net/) (1.2.3), [libpng](http://www.libpng.org/pub/png/libpng.html) (1.2.39), [freetype2](http://www.freetype.org/freetype2/index.html) (2.3.11), then [pytz](http://pytz.sourceforge.net/). Maybe I need to come back to this install if I want to use the Qt or Cairo backends. Just a little test to check that it works:

```
>>> import pylab as pl
>>> x = pl.randn(10000)
>>> pl.hist(x, 100)
```

Ok, that sounds good.

Finally, to work more conveniently, I need [ipython](http://ipython.scipy.org/moin/), and the installation did go like a charm (`build` and `install` from the `setup.py` file). So the preceding example can be reproduced with little effort, thanks to `ipython -pylab`.

That's it (for the moment...)
