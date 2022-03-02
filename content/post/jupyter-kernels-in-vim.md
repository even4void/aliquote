---
title: "Jupyter kernels in Neovim"
date: 2022-02-22T21:28:53+01:00
draft: false
tags: ["vim"]
categories: ["2022"]
---

I spend a certain amount of time writing Python, Racket or Lisp scripts for my daily jobs or musings around PLs. I'm using Neovim since last year and I tested a number of plugins that bring REPL-like experience to (Neo)Vim. Lately, this was mostly [neoterm] and [iron]. Both plugins are great, at least they do the job which amounts to taking a visual selection or whatever line is under the cursor and sending it to a live shell subprocess running IPython, Racket or SBCL. I even contributed a PR to [neoterm] for adding Stata support since I wanted to use this workflow with Stata code. Now, what if we could use an unified API to provide REPL-like experience in (Neo)vim, without relyingon the built-in terminal?

Enter Jupyter! It's the next iteration of IPython, with support for multiple languages. You can think of it as the [LSP] of all REPLs. In fact there's a kernel available for every language I use to use. The advantage are clear: you have the same UI for any PL, and you can dispatch your IO operations in a console or in a web browser. Most people I know generally using the "notebook" version, which means working in your default web browser. I don't like it, and I prefer to work from a console, maybe an enriched Qt console. I've tried it with pleasure in the past in the case of Stata, for example.[^1] You can also call Jupyter kernel directly from your plain text editor, which is what I did for a long time when I was working with Emacs, especially for [Mathematica] and [Stata] in addition to R and Python.

I've been looking for a similar solution in Neovim. This would alleviate the need for and additional terminal window, especially if it could benefit from virtual text features, or things like that. And I discovered [Magma], which is a Neovim plugin that provides exactly what I need: a simple way to start a given kernel (`MagmaInit`, then select the language), no interference with a running LSP server, the possibility to evaluate the current line, a region or a motion.

Like for [iron] I settled upon the following mappings, which I find convenient for most use cases:

```lua
vim.cmd[[nnoremap <silent><expr> gz :MagmaEvaluateOperator<CR>]]
vim.cmd[[xnoremap <silent>       gz :<C-u>MagmaEvaluateVisual<CR>]]
vim.cmd[[nnoremap <silent>       gz :MagmaEvaluateLine<CR>]]
```

I know there are other actions available, e.g. for reevaluating a certain code chunk or clearing current output, but I don't need them often. Combined with LSP, however, this plugin provides decent IDE-like features, with the comfort of Vim editing.

{{< fluid_imgs
"pure-u-1-3|/img/2022-02-26-20-26-38.png"
"pure-u-1-3|/img/2022-02-28-20-30-13.png"
"pure-u-1-3|/img/2022-02-26-20-27-10.png" >}}

Following the suggestions available on the Jupyter [project wiki], I installed the following kernels: common-lisp, haskell,	iclojure, ipurescript, ir, javascript, python3, racket, rust, stata, wolframlanguage13. The hardest part was to get CL kernel working since I kept getting an error with ironclad when using quicklisp alone. Finally, everything went fine with [Roswell].

Note that you can still send the whole buffer to a terminal and run the appropriate program, thanks to `ftplugin` directives. For instance, I have the following settings for Python, defined in `after/ftplugin/python.vim`:

```vim
setlocal makeprg=python3\ %
setlocal errorformat=

nmap gZ :13 split term://python3 %<cr>
nmap <buffer><localleader>k :!pydoc3 <cword><cr>

ia pp print("")<Left>
```

I use more or less similar mappings for Haskell, C, Rust and Racket.

[neoterm]: https://github.com/kassio/neoterm
[iron]: https://github.com/hkupty/iron.nvim
[LSP]: https://langserver.org/
[Mathematica]: /post/wolfram-engine/
[Stata]: /post/stata-jupyter/
[Magma]: https://github.com/dccsillag/magma-nvim
[Roswell]: https://github.com/roswell/roswell
[project wiki]: https://github.com/jupyter/jupyter/wiki/Jupyter-kernels

{{% music %}}Tkay Maidza • _Onto Me_{{% /music %}}

[^1]: Unfortunately, the Stata kernel requires Stata 14 or higher for image display, and I only have Stata 13 MP.
