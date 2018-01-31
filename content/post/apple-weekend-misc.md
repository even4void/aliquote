+++
title = "Apple weekend miscellanies"
date = 2011-08-29T00:00:21+01:00
draft = false

tags = ["apple"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

Some weekend miscellanies on my Airbook.

## Upgrading Haskell

A coupe of weeks ago, I installed the binary distribution (1.8.2) of [Pandoc](http://code.google.com/p/pandoc/). The binaries are installed in `/usr/bin`, while the older ones were in `~/.cabal/bin/`. To test my installation, I used a fairly basic document with some $\LaTeX$ expressions, references, and code chunk with or without syntax highlighting (because the latest version of Pandoc added support for the R programming language). Here is the [test document](http://www.aliquote.org/pub/pandoc_text.md).

For unknown reason, the citation mechanism via `citeproc-hs` (0.3.3) was broken because of an hard-coded path, as described in [this issue](https://github.com/jgm/pandoc/issues/288). So, I decided to reinstall Pandoc with `cabal` as I did [before]({{< ref "/post/cabal-upgrade.md" >}}). (This time I had no problem with `cabal`, though.) So basically,

```
$ cabal update
$ cabal install cabal-install
$ cabal install highlighting-kate --disable-library-for-ghci
$ cabal install citeproc-hs
$ cabal install pandoc -fhighlighting
```

And voilà! I should note that a lot of warnings were issued when building the packages, like

```
ld: warning: text reloc in
```

This has been referenced on [Ticket #5128](http://hackage.haskell.org/trac/ghc/ticket/5128), and it led me to suspect that I rather need to update my entire Haskell system. Well, that was quick and easy with the Frameworkized version available on <http://hackage.haskell.org/platform//mac.html>. 

![haskell2011](/img/20110828212438.png)

Next to that, even if I didn't get any problem compiling a sample demo program, it throws out some warnings (see partial output below):

```
$ echo "main = return ()" > Main.hs
$ ghc --make Main
[1 of 1] Compiling Main             ( Main.hs, Main.o )
Linking Main ...
ld: warning: could not create compact unwind for _ffi_call_unix64
```

As discussed on [Ticket #5019](http://hackage.haskell.org/trac/ghc/ticket/5019), I upgraded to the latest [GMP](http://gmplib.org/) (but not [MPFR](http://www.mpfr.org/)), and this warning disappeared.

Here is a preview of the HTML version of the test document, with working references, syntax highlight and $\LaTeX$ support. (The commands I used were: `pandoc pandoc_text.md -s -m --bibliography="ml_dysp.bib" -o 1.html`.)

![test](/img/20110829115737.png)

## OpenCV

Ah, remember to never install so-called "superpack", you know the `pkg` that is supposed to do everything for you (like the [scipy-superpack](http://stronginference.com/scipy-superpack/)) <i class="fa fa-chain-broken fa-1x"></i> . Note that I don't want to denigrate all the efforts made by the maintainers (and for what is worth, maintaining working package on a Mac is a challenging task!), but the problem I have with that approach is that you never know what is installed or whether it will break what you already installed by hand. In my case, I decided to give a try to [SimpleCV](http://simplecv.org/). I dont't know why but instead of a simple `easy_install simplecv`, I choose the packaged binary. As can be seen, a lot of stuff is installed directly in /usr/local`.

![install1](/img/20110829121723.png)

![install2](/img/20110829121716.png)

There were so many problems with that install (notwithstanding the fact that it targeted Python 2.6, while Python 2.7 is now the default under OS X Lion) that I decided to reinstall everything, that means:

- [OpenCV](http://opencv.willowgarage.com/wiki/) 2.3.1[^1]: I used `ccmake` to remove `libpng` and `cuda` support (I had problems when compiling and wanted to get it the easiest way, i.e. not reintalling too much things).
- [SimpleCV](http://simplecv.org/, with `easy_install`.

At present, most of the demos scripts are working, including face tracking with Airbook built-in camera. I will probably have to tweak the install a little bit in the future. But that's another story...

[^1]: I noticed there's a [cocoa-based version](http://code.google.com/p/opencv-cocoa/) but I didn't try it.
