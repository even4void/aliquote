---
title: "Managing Scheme libraries"
date: 2023-11-27T20:42:11+01:00
draft: true
tags: ["scheme"]
categories: ["2023"]
---

Recently I've been looking at Chez Scheme documentation and various places on the intertubes to learn how to create or manage Scheme libraries. I'm used to Racket and Chicken, which both ship with a great package manager, something that is currently lacking in some of Scheme distros, especially Chez Scheme.

With Chicken, we usually add repositories to the exported variable `CHICKEN_REPOSITORY_PATH`. We can also check where system-wide is installed with `chicken-install -repository`. User-compiled modules usually go under `$HOME/.cache/chicken-install`, but I always install modules as root. Be sure to check the man page for `chicken-install` in any case. Racket has its own conventions to [manage modules](https://docs.racket-lang.org/guide/module-basics.html) (see also [Beautiful Racket](https://beautifulracket.com/explainer/modules.html)); likewise, there are well-defined steps to create your [own package](https://docs.racket-lang.org/pkg/getting-started.html) and make it available from Racket REPL or programs.

As regards Chez Scheme, it seems that the best way to define a local repository for your package is via an exported variable:

```shell
[ -d "$HOME/.local/lib/scheme" ] && export CHEZSCHEMELIBDIRS="/home/chl/.local/lib/scheme:"
```

We can check that everything is all right as follows:

```scheme
» chezscheme
Chez Scheme Version 9.5.4
Copyright 1984-2020 Cisco Systems, Inc.

> (library-directories)
(("/home/chl/.local/lib/scheme"
   .
   "/home/chl/.local/lib/scheme")
  ("." . ".")
  ("/usr/share/r6rs" . "/usr/share/r6rs"))
>
```

I also heard of [Akku](https://akkuscm.org/), after reading one of [Travis Hinkelman](https://www.travishinkelman.com/getting-started-with-chez-scheme-and-emacs-ubuntu/)'s posts, I even installed on my HD but I never used it.


{{% music %}}Joy Divsion • _A Means to an End_{{% /music %}}
