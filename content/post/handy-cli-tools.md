---
title: "Handy command-line utilities"
date: 2020-05-15T08:55:35+02:00
draft: true
tags: ["misc"]
categories: ["2020"]
---

I'm an old hand at the command line and have a hard time adopting new tools. Most of the time, a shell and Emacs is all what I need in my daily job. This was true when I worked as a medical statistician, and it is still the case for bioinformatics stuff. I believe it follows from a form of respect for digital minimalism, hardware constraints (I always worked on small laptops with less than 16 Mb RAM), and daily tasks that are primarily text-based and that can be chained together, which is at the heart of the [Unix philospohy](https://en.wikipedia.org/wiki/Unix_philosophy). I learned Bash (and later Zsh) and Emacs twenty years ago now, and I suppose habit explains the rest. The only thing that really changed along the way in my daily workflow is the use checkers and linters for all "prog-mode" languages in Emacs.

Most of the time, I'm happy with GNU [core utilities](https://www.gnu.org/software/coreutils/coreutils.html), sed and awk, make, and shell scripts. There are many tutorials or lists of handy tools for your preferred terminal, but for the record here is what I've settled on in the last few years:

- [fd](https://github.com/sharkdp/fd) and [rg](https://github.com/BurntSushi/ripgrep) (ripgrep) are handy replacement for find and grep, in my view. Of course, I know grep quite a bit and it is hard to switch entirely to rg, but for casual search I found it better than grep with default settings. Before ripgrep I was using ack, but I try to stay on rg now, if not because it is also what I use in Emacs.
- [exa](https://github.com/ogham/exa) and [bat](https://github.com/sharkdp/bat)
- git-quick-stats and delta

Regarding Emacs, there are a few packages that could live without. This includes ivy-bibtex (I prefer Ivy to Helm)
