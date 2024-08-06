---
title: "GIS on a Mac"
date: 2011-01-23T09:01:07+01:00
draft: false
tags: ["apple", "dataviz"]
categories: ["2011"]
---

I decided to install a GIS software, just to be able to explore some spatial clustering models, play with the visualization of geographical information, and also because of the limited resources available in R.

My first idea was to look at the [Quantuum GIS](http://www.qgis.org/) project. It looks pretty nice and is available for OS X 10.6. I also decided to reinstall [GRASS](http://grass.fbk.eu) 6.4 (I've tried to compile an old version by hand in the past, it was really a pain...). From what I read, there's a consistent [community of users](http://grass.fbk.eu/) around those software as shown on the next picture

{{< figure src="/img/20110123193107.png" >}}

## A step by step installation guide

It should not have surprised me, but the install requirements are really a mess: I found myself downloading a lot of frameworkized App, including GDAL framework, GSL, FreeType, cairo.[^1]

I already have the GNU GSL:

```
$ gsl-config --version
1.14
```

Here, I got version 1-14.1. About the Unix FreeType font rendering system, I already compiled a source tarball:[^2]

```
$ freetype-config --ftversion
2.4.3
```

Anyway, let's go on with the next installation steps. First we need to install the GDAL and GSL frameworks. The GDAL framework is available as a bundle package, see [GDAL complete](http://www.kyngchaos.com/software/frameworks). In addition to GDAL, GRASS requires FreeType and Cairo. I also noticed that GDAL requires Numpy but there's no indication about the Numpy version in use. It's pretty unpleasant because I compile the latest one and I prefer to keep this one:

```
$ python
Python 2.6.1 (r261:67515, Jun 24 2010, 21:47:49) 
[GCC 4.2.1 (Apple Inc. build 5646)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> import numpy
>>> print numpy.__version__
1.5.1
```

From the on-line install instructions, the GDAL framework features a lot of stuff:

> Includes Python GDAL library and tools. Extra plugins and R package are available as separate downloads above. The GDAL Python libraries and scripts use the system Python, but Python support will also install and work for the python.org Python (2.5 on Leopard, 2.6 on Snow). The GDAL framework includes a copy of the Numpy installer. R support requires the R framework and application.

The frameworkized version of Freetype and GSL should not conflict with the already installed one. They bot sit in `/Library/Framework` and can be used with XCode as follows: just put `<GSL/gsl_*.h>` for accessing the header files in a C source, and link with `-framework GSL`. When using a `./configure` command, you just have to specify `--with-gsl=/Library/Frameworks/GSL.framework/unix`. That's it.[^3]

Well, the whole installation only took 10 min or so. I now have to look at the various R plugins that are available on CRAN.

## Testing the installation

To test that Qgis is working, we need data. There are some map available on the GRASS website (e.g., the spearfish data) or on the [FreeGIS Database](http://www.freegis.org/geo-data.en.html).

Geographical databases are assumed to be installed locally. An example is to put all things in your home directory, under a specific root. I use `~/db/` and put the `spearfish60` data in here.

Here are some screenshots I took during this session. I follow the steps from this excellent [visual guide](http://grass.bologna.enea.it/tutorial/01-tutorial/).

{{< fluid_imgs
  "pure-u-1-2|/img/20110124090727.png"
  "pure-u-1-2|/img/20110124105052.png" >}}
<br>
{{< fluid_imgs
  "pure-u-1-2|/img/20110124104659.png"
  "pure-u-1-2|/img/20110124090441.png" >}}

[^1]: From what I seem to remember, I probably installed a standalone version of Qgis when I was playing with geographical map some time ago.

[^2]: By the way, this led me to realize that `freetype-config` got installed under `/bin` (don't know how).

[^3]: Just a reminder for myself. To uninstall the Frameworkized version of GSL, move the folder to trash and then `sudo pkgutil --forget org.gnu.gsl-framework-snow`.
