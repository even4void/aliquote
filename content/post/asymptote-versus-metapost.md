---
title: "Asymptote and Metapost"
date: 2011-01-18T09:26:51+01:00
draft: false
tags: ["tex"]
categories: ["2011"]
---

I am planning to make a lot of illustrations for basic mathematical and statistical concepts, but I am still hesitating about the drawing program to choose. I know a bit of [Metapost](http://www.tug.org/metapost.html) and [Asymptote](http://asymptote.sourceforge.net/), but I am not clear about the pros and cons of each of the vector drawing language. Especially, I've heard that Asymptote is somewhat "superior" to Metapost.

MetaPost is based on Knuth's METAFONT, but it is intended for figures in technical documents according to its primary author, [John Hobby](http://ect.bell-labs.com/who/hobby/MetaPost.html). I had a hard time understanding its syntax when I discovered it. Asymptote was developed more recently.

So, what are the main differences between Metapost and Asymptote?
 
## Metapost

I like Metapost because it nicely fits within Context. It is also possible to typeset directly Metapost code into a document, see [MPlib: MetaPost as a reusable component](http://www.tug.org/TUGboat/Articles/tb28-3/tb90hoekwater-mplib.pdf), TUGboat, Volume 28 (2007), No. 3), and the [luamplib](http://www.ctan.org/tex-archive/macros/luatex/generic/luamplib/luamplib.pdf) package for Lua$\LaTeX$. My preferred textbook is still _Metafun_, from Hans Hagen:

{{< figure src="/img/20110120081849.png" >}}

A simple [previewer](http://www.tlhiv.org/mppreview/) was made available online by Troy Henderson.

Other useful references are:

- [http://zoonek.free.fr/LaTeX/Metapost/metapost.html](http://zoonek.free.fr/LaTeX/Metapost/metapost.html) (French)
- [http://melusine.eu.org/syracuse/metapost/](http://melusine.eu.org/syracuse/metapost/) (French)
- [http://www.tlhiv.org/MetaPost/tutorial/](http://www.tlhiv.org/MetaPost/tutorial/)

I should also cite the splendid work of Alan Kennington who offers [more than 300 illustrations](http://www.geometry.org/tex/conc/mp/README.html) on his dedicated website [http://geometry.org](http://geometry.org).

The current maintainer of MetaPost, Taco Hoekwater, recently announced the release of an [alpha version of Metapost 1.5](http://www.bittext.nl/node/5), but I didn't switch. The MP version that comes with TeXLive is actually

```
$ mpost --version

MetaPost 1.211
Copyright 2009 AT&T Bell Laboratories.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the MetaPost copyright and
the Lesser GNU Lesser General Public License.
For more information about these matters, see the files
named COPYING, COPYING.LESSER and the MetaPost source.
Primary author of MetaPost: John Hobby.
Current maintainer of MetaPost: Taco Hoekwater.
```

## Asymptote

Asymptote is arguably more recent and it allows to work in 3D. It also plays nicely with animated PDFs. It is supposed to have a cleaner syntax --- I suspect this is also a way to say that some people were quite reluctant to MP syntax, and to correct drawing imprecision of Metapost (I should look into more details). There's no internal solver, though; but there is a [Metapost](http://asymptote.sourceforge.net/doc/MetaPost.html) compatibility module.

Asymptote can also be used in interactive mode, which is very handy. Here is what I added in my `.profile` file so that EPS file are directly previewed using `Apercu.app`:

```
export ASYMPTOTE_PSVIEWER="/usr/bin/open"
``` 

Other useful references are:

- [http://www.piprime.fr/asymptote/](http://www.piprime.fr/asymptote/)
- [http://marris.org/asymptote/](http://marris.org/asymptote/) (French)
- [http://asymptote.sourceforge.net/FAQ/](http://asymptote.sourceforge.net/FAQ/)

## So what?

The [Asymptote FAQ - Section 8](http://asymptote.sourceforge.net/FAQ/section8.html) comes in mind first since it is dedicated to the differences between Asymptote and MetaPost. However, it appears that it merely concentrates on which Asy commands correspond to which MP instructions.

The most interesting thread I found on the web was [MP vs. Asymptote](http://www.tug.org/pipermail/metapost/2006-April/000587.html) (Laurence Finston, 2006). Unfortunately, it doesn't provide an in-depth comparison of both languages, although I remain sensible to Finston's arguments.

At risk of being old-fashioned, I like those kind of programs because we don't have to bother with complex or useless GUIs. I must admit I never get used to [xfig](http://www.xfig.org), and I didn't reinstall it on my Mac. Maybe I should give a try to [jfig](http://tams-www.informatik.uni-hamburg.de/applets/jfig/). I know [OmniGraffle](http://www.omnigroup.com/products/omnigraffle/) is available on OS X. I used it from time to time, but I didn't get used to all of its features, to be honest. Anyway, the [Graphics](http://tex.loria.fr/english/prod-graph.html) page from the _Context Navigator_ includes a lot of useful pointers for those interested in managing graphics and vector drawings with Context.