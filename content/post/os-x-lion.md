---
title: "Welcome OS X Lion"
date: 2011-07-24T10:39:41+01:00
draft: false
tags: ["apple"]
categories: ["2011"]
---

As a lot of Apple users, I upgraded my OS when Lion became available through AppStore. A lot of UI improvements are noticeable, but also a lot of software upgrade behind the scene.

About UI changes specifically, one can take a look at, e.g. [OS X Lion Interface Tweaks](http://www.usabilitypost.com/2011/03/01/simpler-ui-in-lion/), for some pointers. It seems to me that the new windows design (rounded corner, resizable by corner and edge, etc.) now resemble the Fedora look-and-feel I was used to some years ago. I didn't check, though. Also, most applications can now sit in full-screen mode, together with other applications in standard mode.

Besides, there are some significant software updates.

## C coding

About C coding, `gcc` is now symlinked to `llvm-gcc-4.2`, as part of the Apple developpers' "effort" to fully integrate [LLVM](http://llvm.org/) and [clang](http://clang.llvm.org/) in the OS. That means that there's no more GNU `gcc`. The following post is interesting in this respect, [OS X Isn't for Developers](http://zachholman.com/2011/03/osx-isnt-for-developers/).

{{< figure src="/img/20110724103338.png" >}}

Hopefully, the R software is supposed to compile with `llvm`, but there's a lot more to read on the [r-sig-mac-request](https://stat.ethz.ch/pipermail/r-sig-mac/) mailing, where a discussion was initiated on March the 10th (and ended 11 days after). I've seen a reply by Jan de Leeuw saying R compiles fine with `llvm-gcc`:

```
Message: 2
Date: Sat, 16 Apr 2011 20:46:14 -0700
From: Jan de Leeuw <deleeuw@stat.ucla.edu>
To: R-SIG-Mac List <r-sig-mac@stat.math.ethz.ch>
Subject: [R-SIG-Mac] Lion/clang
Message-ID: <81705927-83A1-494B-A7AF-AA63F1E4A655@stat.ucla.edu>
Content-Type: text/plain; charset="us-ascii"

Just a little note that R-devel compiles/runs fine (and fast) using clang for
C, C++, Obj-C on OS X 10.7 Lion.
===============================================================
    Jan de Leeuw, 11667 Steinhoff Rd, Frazier Park, CA 93225
    home 661-245-1725 mobile 661-231-5416 work 310-825-9550
    .mac: jdeleeuw +++  aim: deleeuwjan +++ skype: j_deleeuw
===============================================================
            I am I because my little dog knows me.
                                        Gertrude Stein
```


## Python

Python has been upgraded to version 2.7.1. This is a good thing, I think, although now I have to update all my packages which installed with Python 2.6. I wasn't able to recompile [scipy](http://www.scipy.org/), and the default [numpy](http://numpy.scipy.org/) is just 1.5.1. Ok, I guess I have to download everything, including Matplotlib, to get a clean installation. I will do this latter; I still have Enthought Python that is working pretty well.

## Java

Most importantly, no more Java as was [expected before Lion](http://www.theregister.co.uk/2011/02/27/no_java_in_mac_os_x_lion/) release. What does it mean? Well, I have a lot of Java-based application, including [Weka](http://www.cs.waikato.ac.nz/ml/weka/) for data-mining, and here's what I got after I upgrade OS X:

```
$ weka
No Java runtime present, requesting install.
```

The following dialog window then popups

{{< figure src="/img/20110724110115.png" >}}

but nothing happens. In fact, it is supposed to trigger Software Update to download and install the required Java runtime, but it doesn't work for me.

I came across some sites providing alternative ways to get Java SDK and the JVM on Lion, e.g. [Java 1.5 in OS X Lion](http://www.s-seven.net/java_15_lion), but I'm very sorry to have to do this myself. I wish Apple thought about all Java developpers or users before such a change of course. They provide a link on Apple Support, [Java for OS X Lion](http://support.apple.com/kb/DL1421), to get `Java SE 6 version 1.6.0_26`. This should have been included among Lion packages, IMO.

Following a [thread on StackOverflow](http://stackoverflow.com/questions/6614380/jdk-on-osx-10-7-lion), the old path

```
/System/Library/Frameworks/JavaVM.framework/
```

is now deprecated, and everything now sit in 

```
/Library/Java/
/System/Library/Java/
```

## Misc.

I also had to manually update Dropbox to get a version [compatible with Lion](http://forums.dropbox.com/topic.php?id=41644&replies=21) (at least, for getting back the "Copy Public Link" functionality in the Finder). Well, I must admit my previous version was not very up to date.

For the remaining applications, some upgrade are available (e.g., [xtorrent](http://www.xtorrentp2p.com/), [Versions](http://versionsapp.com/), [iTerm2](http://www.iterm2.com/), among others). There are a couple of other minor issues that are easy to solve. For example, I generally resize my screenshots with [ImageMagick](http://www.imagemagick.org/), which is now broken (it seems to be due to a missing library, `libclparser.dylib`, in the OpenCL framework). However, [GraphicsMagick](http://www.graphicsmagick.org/) is still working. Let's go ahead with it.

Funny enough, Emacs now comes as

```
GNU Emacs 22.1.1
```

but my [AucTeX](http://www.gnu.org/software/auctex/) install (which was in `/usr/local`) has suddenly ceased to work. Why? I know that [Aquamacs](http://aquamacs.org/) comes with everything I ever needed, especially the [dev branch](http://aquamacs.org/nightlies.shtml) which includes the new package manager, but I also like using Emacs for the Terminal directly.

{{< figure src="/img/20110724185537.png" >}}

I updated to AucTeX 11.86. It's not that bad finally as I upgraded my TexLive distribution.
