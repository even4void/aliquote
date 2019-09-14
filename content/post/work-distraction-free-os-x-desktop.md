+++
title = "Work distraction-free OS X desktop"
date = 2012-03-02T14:41:16+01:00
draft = false
tags = ["apple"]
categories = ["2012"]
+++

[What they say](http://www.iterm2.com/#/section/features/full_screen): "Work distraction-free with absolutely nothing on the screen but your terminal." That's true.

<!--more-->

I've been using [iTerm](http://iterm.sourceforge.net/) as a replacement of default Apple Terminal program some years ago, then switched back to Console.App with OS 10.6. I'm back to [iTerm2](http://www.iterm2.com) which has a lot of [interesting features](http://www.iterm2.com/#/section/features). I do no really like Apple's fullscreen mode, except for reading PDF papers, or in some occasions browsing with Safari.App. One annoying feature of this fullscreen mode is that there's no way to get non-modal window behavior, which is particularly sad with [Apple Mail](https://discussions.apple.com/thread/3195461?start=45&tstart=0) or when using a Terminal that need to interact with external programs (typically R for statistical computing, or simply Gnuplot). However, when you just need to type shell commands or edit text files (yes, what else?!), iTerm2.App fullscreen mode is just great.
 
![iTerm2](/img/20120301103347.png)
 
The above screenshot was taken while writing a tech note on using [SBCL]((http://www.sbcl.org/)) on OS X 10.7 and fixing some minor issues related to my [move to XCode 4.3]({{< ref "/post/the-random-joys-of-living-with-a-macbook.md" >}}).[^1] As can be seen, SBCL is currently being compiled (lower right panel) while I'm writing using `Pandoc-mode` on Emacs. Different profiles can be used with iTerm2.App; the one on the left is simply "Pastel (Dark background)", where I updated background color from the default black to a less aggressive dark grey.

[^1]: Apart from what I discussed in my previous post, I had to reinstall my [Haskell](http://www.haskell.org/haskellwiki/Haskell) system, [CMake](http://www.cmake.org/), etc. I also noticed that even after having reinstalled Haskell and GHC I still have issues with `ghc` which was systematically returning error messages when trying to recompile the [development version of Pandoc](https://github.com/jgm/pandoc/wiki/Installing-the-development-version-of-pandoc-1.9):

```
ghc: could not execute: /Developer/usr/bin/gcc
```

As `ghc` is a simple shell script, that was at least easy to fix: Just update `/usr/bin/ghc` to reflect the correct path for `gcc`:

```
pgmgcc="/usr/bin/gcc"
```

After that, everything went fine with compiling Pandoc.

![Pandoc](/img/20120302133801.png)
	
