---
title: "Micro review from September"
date: 2019-09-06T09:47:59+02:00
draft: false
tags: ["readings"]
categories: ["2019"]
---

Here is the monthly micro review of (not so) random links I found while browsing the interweb lately.

- [Announcing the optics library](https://www.well-typed.com/blog/2019/09/announcing-the-optics-library/). I must say I'm no expert at Haskell or category theory, yet I keep reading [articles and books](/post/category-theory/) on those topics. This Haskell package is all about defining and using [lenses](https://en.wikibooks.org/wiki/Haskell/Lenses_and_functional_references) (also known as [functional references](https://www.schoolofhaskell.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial)), traversals, prisms and other [optic kinds](https://medium.com/@gcanti/introduction-to-optics-lenses-and-prisms-3230e73bfcfe).

- [The Emacs Lisp Style Guide](https://github.com/bbatsov/emacs-lisp-style-guide/blob/master/README.md). At least, there's now a short and concise cheatsheet for Elisp!

- [Typed Lisp, A Primer](https://alhassy.github.io/TypedLisp/) provides an interesting discussion of the pros and cons of Haskell and Common Lisp with respect to static typing. Give it a read if you're interested in both languages; the post is quite dense, so plan accordingly.

- [Notes on Interactive Computing Environments](http://blog.fogus.me/2019/04/03/notes-on-interactive-computing-environments/), by Fogus, is a short review of the book written by Barstow, Shrobe, and Sandewall in 1984. You will learn (or be reminded) about quite old software and PLs, and Fogus personal experience with them.

      > Your programming environments should be an active partner in the act of creating systems.

- [The history of Tetris randomizers](https://simon.lc/the-history-of-tetris-randomizers). Oh my, I was just remembered that tetris is more than 30 years old now. This post exposes a curated list of Tetris randomizers that were reverse engineered and documented over the years, emphasizing how they improved in terms of puzzle factor, flood prevention, and drought prevention. Apparently, most efforts have focused on the latter two points lately.

- [pingouin](https://pingouin-stats.org) looks like a nice library to perform common statistical tests in Python. I didn't try it, TBH. But I will! It is a bit different from from scikit-stats, where the focus is more on building statistical models, apparently, but there are interesting features like reliability and circular statistics that are not so common in other Python statistical packages. Quoting the authors:

      > Pingouin is designed for users who want simple yet exhaustive stats functions.

- [OpenBSD Is C Documentation](https://dev.to/apotheon/openbsd-is-c-documentation-3gd1): As I'm working as a bioinformatician now, I am sometimes tired of checking all related publications to understand the meaning of default parameters here and there in the tools I am supposed to use. Good documentation is the _clé du succès_ of a good software. You can learn a lot by studying the code available for free in your preferred \*nix system (think of `cat`, `shuffle`, `jot`, etc.). And if you're still versed into C, this post will explain why you should take a close look into the OpenBSD documntation.

- [Programming Algorithms: Key-Values](http://lisp-univ-etc.blogspot.com/2019/08/programming-algorithms-key-values.html?m=1): I have been following this blog for the last few months and it's always nice to see new posts showing up. This post is on data structures, like the preceding ones, and this time the author disusses the broad application of key-values, also called map or dictionnaries in other dynamic PLs. Hash tables, but also trees--which don't require hashing--should sound familiar to functional programmers. This post also features a nice overview of memoization and cache invalidation.

- [bambi](https://github.com/bambinos/bambi/blob/master/README.md): Yet another Python package for those interested in Bayesian modeling. I haven't tested nor installed the beast--I tend to be very minimalist these days--but I would love to see a benchmark of bambi against popular packages available in the Python ecosystem, like PyMC3 or PyStan.

- [Robust Arithmetic in Computational Geometry](https://observablehq.com/@mourner/non-robust-arithmetic-as-art) is a playground about numeric robustness issues in computational geometry, dealing almost exclusively with orientation tests (how to decide whether a point lie lies to the left or to the right of a line). This is based on an older project in JS which is available on Github: [Robust arithmetic in JavaScript](https://github.com/mikolalysenko/robust-arithmetic-notes), but I really enjoy browsing Observable notebooks from time to time.

*Interesting posts* that I've read lately:

- [Recently](https://macwright.org/2019/09/02/recently.html) by Tom MacWright, especially his thoughts on the [Enigma machine](https://observablehq.com/@tmcw/enigma-machine) that he published on Observable.
- [The path of least resilience: Using Vim templates](http://brendandawes.com/blog/vim-templates), I use Vim occasionally, which means for quick editing tasks (i.e., when I know I will only have to type some text, like my micro posts or some shell scripts, or even some Python code), but I'm definitely an Emacs user; that being said, I always like to see how folks manage to get things done with their preferred text editor.
- [I test in prod](https://increment.com/testing/i-test-in-production/): Yeah, what else? More seriously I agree with the author that results gathered from tests when a software is running in real conditions are more interesting, and certainly more trustful, than anything else.
- [Clever functional design](http://ferd.ca/clever-functional-design.html): It's always a joy to read one of Fred Hébert's post.
