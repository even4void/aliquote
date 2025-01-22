---
title: "Common Lisp tooling in 2025"
date: 2025-01-22T21:00:57+01:00
draft: false
tags: ["lisp", "vim"]
categories: ["2025"]
---

Transitioning to macOS after 4 years of Linux happened to be smoother than I anticipated. Most of the tools I relied on previously were already right there in the OS (e.g. Terminal or Safari), and the rest is easily available via Homebrew. That being said, I decided to keep the bare minimum of what I need to get my work done, and to focus on PLs I want to explore more practically this year: Common Lisp, Racket, Mathematica and Haskell.

Regarding Racket and Haskell, everything is already configured with appropriate linters and fixers in my Neovim config. The LSP do the job I expect from them, that is they provide hover information, go to definition and references, and warning/error appear as expected in the Quickfix. Code actions are available in the case of Haskell.

I used to use various strategies for dealing with Lisp in the past. The best solution is probably to rely on [slimv](https://github.com/kovisoft/slimv), but I wanted something simpler, especially given that I can fire a REPL myself and interact with it without relying on an external plugin.[^1]

> The idea is that all functionality available in any editor or plugin is also available in the "vanilla" REPL. --- [Developing Common Lisp using Vim with tmux or ConEMU](https://blog.djhaskin.com/blog/developing-common-lisp-using-vim-with-tmux-or-conemu)

I use msotly the same apparoach as Daniel Jay Haskin except that I have my own implementation of "send line or selection to the REPL", a custom `keywordprg` to query the Hyperspec online and display it in w3m, an omnicomplete function taken from [visper](https://github.com/jabbourb/visper), and a folding function grabbed from Steve Losh's [dot files](https://hg.stevelosh.com/dotfiles/file/e7642253ffde/vim/ftplugin/lisp/lispfolding.vim). In addition to Dan's [compiler](https://git.sr.ht/~skin/roswell-sbcl.vim), the following two keybindings take care of most of the rest:

```vim
nnoremap <buffer> gs :10 split term://ros -Q -- %<cr>:startinsert<cr>
nnoremap <buffer> <leader>! :sp term://ros run --eval '(ql:quickload :swank)'  --eval '(swank:create-server :dont-close t)' \| SendHere<cr><C-w><C-w>
```

As can be seen I use [Roswell](https://roswell.github.io) to launch SBCL and to manage Quicklisp packages. Ultimately, I would like to have an automated way of generating [binary executables](https://blog.djhaskin.com/blog/release-common-lisp-on-your-first-day) or [Docker images](https://github.com/dnaeon/cl-skeleton), but for the time being I'm mostly interested in scripting at large. I encountered some problems when installing the [GSLL](https://gsll.common-lisp.dev) and [common-lisp-jupyter](https://github.com/yitzchak/common-lisp-jupyter); there appears to be some issues with the current CFFI bindings, but [this patch](https://github.com/yitzchak/common-lisp-jupyter/issues/32) fixed the issue. I was able to install [magicl](https://github.com/quil-lang/magicl) without any issue, as well as various high-level utilities, like [serapeum](https://github.com/ruricolist/serapeum). No luck with cl-ana, or any other packages from Gary Hollis since they all depend on hdf5 and FFi which grovel skates endlessly. [This](https://github.com/ghollisjr/cl-ana/wiki/Installation) may solve the issue but I'm not willing to try all that (either downgrading hdf5 or using a staled branch of cl-ana and a CFII fork).

I mentioned [common-lisp-jupyter](https://github.com/yitzchak/common-lisp-jupyter) since I tried to use Quarto with CL Jupyter kernel, and it worked like a charm. Same for the Racket kernel, by the way.

{{% music %}}Broadcast • _Long Was the Year_{{% /music %}}

[^1]: I'm using a pretty slick Neovim config with only 5 plugins, including 2 opt plugins, all managed via the builtin plugin manager.
