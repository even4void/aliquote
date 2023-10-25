---
title: "A minimalistic Lua-based Neovim config"
date: 2023-10-23T20:15:38+02:00
draft: false
tags: ["vim"]
categories: ["2023"]
---

It hasn't taking long before I decided to trash my new [Lua config](/post/lazy-nvim/). I originally wanted to give [lazy.nvim](https://github.com/folke/lazy.nvim) a try since packer has been discontinued. I was not able to reduce my startup time further, and this wasn't in par with my old packer-based config. Independent of this, I felt quite unhappy with the added layer of complexity provided by [mason.nvim](https://github.com/williamboman/mason.nvim) and satellite plugins. More to the point, some LSPs, linters (for [nvim-lint](https://github.com/mfussenegger/nvim-lint)) or formatters (for [conform.nvim](https://github.com/stevearc/conform.nvim)) were not available in Mason registry, meaning that I add to configure them outside of Mason handlers, in addition to installing them myself. That makes these plugins rather limited in their usefulness, IMHO. So, let's rewrite it from scratch!

First, I've stuck to the aim of working on a single configuration file, rather than splitting it up into different files in the dedicated `lua` directory. Also, I decided to stop using a plugin manager since Vim and Neovim both ship with a decent plugin system. What's more, it will help me not to update my plugins every two days or so. And I get the full Git log as well. In a few words, I ended up with the following set of plugins:

```shell
~/.config/nvim
» tree -L 3 pack
pack
└── plugins
    ├── opt
    │   ├── neogen
    │   ├── nvim-colorizer
    │   ├── vim-dasht
    │   └── vim-sexp
    └── start
        ├── Comment
        ├── fzf-lua
        ├── nvim-lspconfig
        ├── nvim-treesitter
        ├── nvim-treesitter-textobjects
        ├── orgmode
        └── vimtex

14 directories, 0 files
```

As can be seen, I put orgmode and vimtex in the "start" folder, which means they are loaded when Neovim is fired up. My own benchmarks suggest this has no noticeable effect on startup time. With only fzf-lua, I'm at 25 ms of startup time, while the full config increases it by about 20-25 ms. That's cheap. Note that I don't use a lot of plugins, I have a lot of custom settings living in my `after/ftplugin` directory, plus additional commands and autocommands.

I think about it this way: you really want a clever fuzzy picker, and I already Fzf to manage my shell history, browsing directory, or managing my bibliographic entries in the shell. By the way, I upgraded my very outdated version of Fzf that I got via the official apt repository. Now I'm running version 0.43.0 (d3311d9) and I can use `git_bcommits` and `git_commits` again (it stopped working in recent months, which I bissected to [this commit](https://github.com/ibhagwan/fzf-lua/commit/64c980d8aaaf493a768a4cf6158d7f2a384b0368)). Besides, the availability of default LSP settings as well as treesitter "text objects" is often an underrated value: you get both linting and formatting for free (Neovim builtins and Fzf can take care of the rest for you), as well as semantic and/or structural editing capabilities. When no fixer is available, yuo can always rely on [`formatprg`](https://phelipetls.github.io/posts/code-formatting-vim/) or [autocommands](https://gist.github.com/romainl/ce55ce6fdc1659c5fbc0f4224fd6ad29).

I use [vim-dasht](https://github.com/sunaku/vim-dasht/) to complement the LSP hover provider, or simply as a documentation handler when there's no LSP in use (e.g., Scheme, Lisp); it also proved to be useful with Python for which `pyright` provides nothing more than function signature in most cases. I use [neogen](https://github.com/danymat/neogen) to generate Python and C's docstrings. I'm too lazy to think about it (or even remember how to format Google and Numpy docstrings), so this comes handy in this particular case. As said above, I can manage [formatting and linting](/post/neovim-compiler/) myself, and Neovim has excellent support for completion via `C-x C-o`, `C-x C-n`, `C-x C-f`, and friends. The rest is already builtin, e.g., want a tree explorer, try `:15Lex`; need some Git info, FzfLua get you covered. Everything that is not related to text editing *per se* is probably better handled in your terminal by a dedicated application.

{{% music %}}Dead Can Dance • _Carnival of Light_{{% /music %}}
