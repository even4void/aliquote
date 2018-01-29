+++
title = "Happy TeXying"
date = 2012-03-28T08:35:03+01:00
draft = false

tags = ["tex"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

As I do not really like default [Beamer](http://tug.ctan.org/pkg/beamer) themes[^1], I tend to rely on [Context](http://wiki.contextgarden.net/Main_Page) to build my slides. I've built a set of custom themes for use with Hans Hagen's `pre` [styles](http://wiki.contextgarden.net/Presentation_Styles) as well as Thomas Schmitz and [Aditya Mahajan](http://randomdeterminism.wordpress.com/)'s [simpleslides](http://modules.contextgarden.net/simpleslides). The latter caused me problem when I tried to recompile older slides.

The `simpleslides` "third-party" module has been updated recently (January, 2012) but I didn't notice that until I got the following error message 

```
! Undefined control sequence. l.223 \definenamespace
```

when trying to rebuild a series of lectures for an upcoming course and a short talk. I then found [this thread](http://www.ntg.nl/pipermail/ntg-context/2012/064315.html) which basically says there might have been a problem well before `simpleslides` was updated on CTAN; but I haven't noticed that problem anyway. I don't really know what the problem is with the current version of `simpleslides`. What I know is that I don't have time to update all my themes and go deep inside MkIV arcane. So I was looking for a quick way to get my earlier versions work as they did in December.

Here is my very hacky solution to solve this annoying problem: Fetch previous versions of `simpleslides-s-default.tex` and `t-simpleslides.tex` from [TexLive svn](http://www.tug.org/svn/texlive/trunk/Master/texmf-dist/tex/context/third/simpleslides/), and put this your `texmf` local directory. In my case, on OS X 10.7.3, it happens to be

```
~/Library/texmf/tex/context/third/simpleslides
```

As I'm using Metapost to create colored background and the like, I also have to remember to [enable system commands](http://tug.org/texinfohtml/web2c.html) in TeX's texmf.cnf (`/usr/local/texlive/2011/texmf/web2c/texmf.cnf`) so that around line 499 I have

```
shell_escape = t
```

I know there are better ways to enable system commands, but I always forget about them (like for `openin_any`/`openout_any`).

It looks like `simpleslides` may be replaced by a new MkIV module, [complexslides](https://bitbucket.org/adityam/complexslides/src). I've tested it and it works quite well with the dev version of ConText, although I got some strange errors due to the `visualcounter` module which was apparently missing from my system (I installed it once, so I don't know why I wasn't able to find it again). Grab the [latest version](https://github.com/adityam/visualcounter) from Github, and put it where ConText can find it. My experimental version of Context sits in `~/context`, so for me it is 

```
tex/texmf-modules/tex/context/third/
```

then just update TeX's database:

```
$ mktexlsr
$ context --generate
```

Well, everything works now, but I am waiting for some more themes.

[^1]: In fact, I created my own theme, which is largely inspired from Ross Ihaka's Beamer slides, which can be found by looking at, e.g. [Topic in Computational Data Analysis and Graphics](http://www.stat.auckland.ac.nz/~ihaka/787/).
