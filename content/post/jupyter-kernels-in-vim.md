---
title: "Jupyter kernels in Neovim"
date: 2022-02-22T21:28:53+01:00
draft: true
tags: ["vim"]
categories: ["2022"]
---

I spend a certain amount of time writing Python, Racket or Lisp scripts for my daily jobs or musings around PLs. I'm using Neovim since last year and I tested a number of plugins that bring REPL-like experience to (NEo)Vim. Lately, this was mostly [neoterm] and [iron]. Both plugins are great, at least they do the job which is take a visual selection or whatever line is under the cursor and send it to live shell subprocess running IPython, Racket or SBCL. I even contributed a PR to neoterm for adding Stata support. Now, what if we could use an unified API to provide REPL-like experience in (neo)vim, without relyingon the built-in terminal?

Enter Jupyter! It's the next iteration of IPython, with support for multiple languages. You can think of it as the LSP of all REPLs. In fact there's a kernel available for every language I use to use. The advantage are clear: you have the same UI for any PL, and you can dispatch your IO operations in a console or in a web browser. Most people I know generally using the "notebook" version, which means working in your default web browser. I don't like it, and I prefer to work from a console, maybe an enriched Qt console. I've tried it with pleasure in the past in the case of Stata, for example. You can also call Jupyter kernel directly from your plain text editor, which is what I did for a long time when I was working with Emacs, especially for [Mathematica] and [Stata] in addition to R and Python.

I've been looking for a similar solution in Neovim. This would alleviate the need for and additional terminal window, especially if it could benefit from virtual text features, or things like that. And I discovered [Magma], which is a Neovim plugin that provides exactly what I need:

[neoterm]: https://github.com/kassio/neoterm
[iron]: https://github.com/hkupty/iron.nvim
[Mathematica]: /post/wolfram-engine/
[Stata]: /post/stata-jupyter/
[Magma]: https://github.com/dccsillag/magma-nvim

{{% music %}}Tkay Maidza • _Onto Me_{{% /music %}}
