---
title: "Scheme Langserver"
date: 2024-06-03T14:32:17+02:00
draft: true
tags: ["scheme", "vim"]
categories: ["2024"]
---

So far, my [setup for Scheme](/post/scheme-in-vim/) was pretty simple, and it mostly targeted Chicken Scheme. Recently, I wanted to use Chez Scheme a bit more, and I was looking for a better UX in Neovim. I've tried to configure several REPL-like features for Scheme, including Jupyter kernels, swank server or language server. Only the later is really of importance to me since I already get REPL features from [slimv](https://github.com/kovisoft/slimv).

1. [chicken-lsp-server](https://codeberg.org/rgherdt/scheme-lsp-server): easy to install but doesn't quite work
2. [r7rs-swank](https://github.com/ecraven/r7rs-swank): I wasn't able to get the Chicken or Chez swank servers to run (moreover, for Chicken, you have to install additional libraries, which are not compatible with Thunderchez naming convention for, e.g., SRFIs)
3. [scheme-langserver](https://github.com/ufo5260987423/scheme-langserver): didn't work (I grabbed the run executable released on GitHub, but I also tried to compile all the stuff myself, which led me to try to install chez-exe, after which I gave up).
4. [swish-lint](https://github.com/becls/swish-lint): it works smoothly although there's no hover information

I had to compile and install Chez Scheme v10 in order to compile swish and get ride of minor error message in the log file for swish-lint. But it didn't help getting hover information to work with Chez.

I now use [molten-nvim](https://github.com/benlubas/molten-nvim) (without image support and other fancy settings) to evaluate code snippets for which I have associated Jupyter kernels. This mostly mimic my old [Magma setup](/post/jupyter-kernels-in-vim/) that I abandoned in the meantime. It remains quite non-obtrusive, and I can still fire up a terminal with corresponding shell (mostly R, Python and Stata) and get my poor-man REPL features (i.e., send current line or selection to the other split window) to work right away. Anyway, here's the list of kernels I have on my HD:

```shell
aliquote master?                                                                                              1h21m9s +
» jupyter kernelspec list
Available kernels:
  clojupyter-0.4.325    /home/chl/.local/share/jupyter/kernels/clojupyter-0.4.325
  common-lisp           /home/chl/.local/share/jupyter/kernels/common-lisp
  ir                    /home/chl/.local/share/jupyter/kernels/ir
  python3               /home/chl/.local/share/jupyter/kernels/python3
  racket                /home/chl/.local/share/jupyter/kernels/racket
  stata                 /home/chl/.local/share/jupyter/kernels/stata
  wolframlanguage14     /home/chl/.local/share/jupyter/kernels/wolframlanguage14
```

There's not much support for Scheme languages in the existing Jupyter kernels, but there's one for Common Lisp which actually works. However, I should say that in this case slim is way better. Slimv also supports Scheme and Clojure, although Racket support is pretty outdated. As for replacing MIT Scheme with Chez Scheme, no luck here.

By default Chez Scheme is installed as `scheme` under `/usr/bin`, and slimv expects MIT Scheme to be available under the same executable name. Using default settings work perfectly well since newer versions of MIT Scheme bundle a swank server. However I do not want to update alternatives for Scheme on Ubuntu once again, so I ended up overwriting the default Scheme implementation in my slimv copy. Ironically, there's also a [Jupyter kernel](https://github.com/joeltg/mit-scheme-kernel) for MIT Scheme.[^1]

The following screenshots show slimv and swish-lint working in combination on a Scheme file, providing a REPL and a handy shortcut to evaluate a defun, as well as auto-completion and linting.

{{< fluid_imgs "pure-u-1-2|/img/2024-06-03-14-47-31.png"
               "pure-u-1-2|/img/2024-06-03-15-15-16.png" >}}

{{% music %}}Grateful Dead • _Loser_{{% /music %}}

[^1]: I haven't tried [Calysto Scheme](https://github.com/Calysto/calysto_scheme), though.
