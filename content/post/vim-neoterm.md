---
title: "Vim and neoterm"
date: 2021-03-31T10:09:49+02:00
draft: false
tags: ["vim"]
categories: ["2021"]
---

When I switched to Neovim last year, I knew the only thing I would really miss from Emacs was the ability to fire an REPL right inside Vim when editing Python, R, Racket code, or whatever. Of course, I can work with a terminal inside Neovim (usually, in a split or an other tab) and use Vim's copy/paste. It works great for R if we let the terminal stay in Normal mode, and Python because of ̀`%paste` magic. However, it soon becomes a little cumbersome to have to switch over and over between the REPL and the main script.

Enters [Neoterm](https://github.com/kassio/neoterm). It's kinda like `C-c C-c` in Emacs: whether you are editing a Python, R, Clojure, Racket, Javascript, Julia script (and many more), it's usually just a matter of calling `:TREPLSendLine` or `:TREPLSendSelection` to send the current line or a visual selection to a terminal running the right REPL. If no window is present, the REPL is created on the go, and then all other commands are sent to this REPL. It is even possible to work with multiple REPL at the same time, or to manage all instances of Neovim terminal using neoterm's shortcuts directly. I have this mappings in my Vim config, and it works great.

```vim
nnoremap <silent> <localleader>cc :TREPLSendLine<CR>
vnoremap <silent> <localleader>cc :TREPLSendSelection<CR>
```

Maybe I should be using ̀`<Plug>(neoterm-repl-send)` instead, I don't know.

Why neoterm when there are so many other options, including very specialized plugins? Just considering Clojure, I know there are at least [conjure](https://github.com/Olical/conjure), [acid](https://github.com/clojure-vim/acid.nvim), [vim-iced](https://github.com/liquidz/vim-iced), or [vim-fireplace](https://github.com/tpope/vim-fireplace). Likewise, Lisp hackers can rely on [vlime](https://github.com/vlime/vlime) or [slimv](https://github.com/kovisoft/slimv). Right, you get better tooling stuff (debugger, profiling, dependencies injection, etc.) using those plugins, but what if I told you I just want to send lines of code to a living REPL, check the result or debug right into the terminal? Other than that, I know tend to rely almost exclusively on test suites and Makefile, and I don't spend so much time in a true REPL (read SLIME or CIDER).

{{% alert note %}}
<small>[2020-06-15]</small><br>
A nice related project that I forgot to talk about is [vim-slime](https://github.com/jpalardy/vim-slime). Like neoterm, it supports multiple targets (Vim or Neovim builtin terminal, tmux, etc.). However, it appears to be limited to launching REPLs, not interacting with proper pseudo-terminals in Neovim directly.
{{% /alert %}}

I guess it's just a matter of *simplicity*. Like I don't want to use [Coc](https://github.com/neoclide/coc.nvim), and I rather rely on [Ale](https://github.com/dense-analysis/ale) for all things related to linting and fixing source code, and [vim-polyglot](https://github.com/sheerun/vim-polyglot) for syntax highlighting. I know LSP is available in nightly builds of Neovim, but Ale is lighter and probably a lot easier to configure. Let's hope the project will stay active for a long time. Having fewer packages to manage is a plus for me, especially when they don't conflict with each other because there's almost zero dependencies between them. It was not true for the packages I used to use under Doom Emacs, and the continuous update of the "defaults" was driving me crazy at some point. Now, I have a limited set of packages, and there's no friction during weekly updates. My config is almost 100% compatible with Vim 8, i.e. I do not use Neovim-only features that I would miss otherwise. I know many folks are moving to Lua-only plugins and built-in LSP, but that's ok, as long as my current setup let me write code and prose instead of tweaking the editor settings everyday.
