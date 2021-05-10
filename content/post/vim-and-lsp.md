---
title: "Vim and LSP"
date: 2021-05-09T08:17:37+02:00
draft: false
tags: ["vim"]
categories: ["2021"]
---

There is a [long list](https://bluz71.github.io/2019/10/16/lsp-in-vim-with-the-lsc-plugin.html) of Vim or Neovim plugin that implement Microsoft's LSP capabilities. I use [Ale](https://github.com/dense-analysis/ale), because it is a lightweight plugin which provides both asynchronous linting and fixing, and expose most of LSP functionalities (e.g., go to definition or references, hover on symbol, rename, code action). It is also well integrated into Vim's ecosystem like omnicompletion, quickfix list, etc. It is also in line with my expectations: It should not rely on Node with its bazillions of packages, as is the case for [Coc](https://github.com/neoclide/coc.nvim), and it should run on Neovim 0.4+ and Vim 8. Above all, if you are not that interested in LSP stuff (intellisense and the like), you can just deactivate and still enjoy external linters. This is mostly what I tend to use these days.

It only happens to me recently that some of the other LSP plugins can interact with ALE, especially to delegate the display of diagnostics to Ale while providing most of LSP under the hood. Indeed, Ale works pretty well for Python, Rust and Haskell, but there's no support for Clojure other than `clj-kondo` (or `joker`), despite the availability of [clojure-lsp](https://clojure-lsp.github.io/clojure-lsp/). I tried to configure Ale to use it, but I failed miserably and I haven't found much support using Google. According to the [docs](https://clojure-lsp.github.io/clojure-lsp/clients/), it should be as easy as adding the following setup:[^1]

```vim
call ale#linter#Define('clojure', {
  \   'name': 'clojure-lsp',
  \   'lsp': 'stdio',
  \   'executable': '/home/chl/.local/bin/clojure-lsp',
  \   'command': '/bin/zsh -c %e',
  \   'project_root': '~/.lsp/config.edn',
  \})
```

While Ale succeeded at initializing the server, I was left with zero functionality afterwards.

It looks like the recommended way of doing things is to install [vim-lsp](https://github.com/prabirshrestha/vim-lsp) (or [vim-lsc](https://github.com/natebosch/vim-lsc)), and maybe [vim-lsp-ale](https://github.com/rhysd/vim-lsp-ale). I got a working installation in a few minutes, at the price of adding an extra package to my configuration. Since vim-lsp is able to talk to Ale, that means it is able to delegate diagnostics to Ale's own display system -- this not the case of vim-lsc, [as far as I can tell](https://github.com/natebosch/vim-lsc/issues/337). This is quite convenient, especially since it allows to run only one instance of the server.

Of course, there are other fancy alternatives like [Conjure](https://github.com/Olical/conjure) or [Iced](https://github.com/liquidz/vim-iced), although for the later there are additional plugins to install. I gave Conjure a try a few months ago but didn't like the popup window always on. I mean, I like the idea of having a playground or a live REPL (à la LightTable) sometimes, but not when I only want to write or read code Your mileage may vary of course, but see this nice blog post on Conjure: [Conjuring Clojure in Vim: 2020 Edition](https://blog.djy.io/conjuring-clojure-in-vim-2020-edition/). I will stick to [fireplace](https://github.com/tpope/vim-fireplace) for the time being. Tim Pope's plugins are always excellent, and it remains by far the lightest package for Clojure in Vim, and also the closest to Vim's internals (as most of Tim Pope's plugins).

[^1]: See also [Vim and Language Server Protocol](https://www.vimfromscratch.com/articles/vim-and-language-server-protocol/) in _Vim from scratch_.
