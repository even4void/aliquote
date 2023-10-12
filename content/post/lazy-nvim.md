---
title: "Neovim revamp"
date: 2023-10-12T11:34:11+02:00
draft: false
tags: ["vim"]
categories: ["2023"]
---

Recently, I switched to [lazy.nvim](https://github.com/folke/lazy.nvim) to manage my Neovim plugins. I'm thus writing yet another post on Vim with a fresh new configuration. Reasons are multiple but quite simple: I wanted a more minimalistic set of config files (ideally one or two Lua files) allowing me to keep my `after/ftplugin` directory as optional in case I need to transfer my config to other machines; [packer](https://github.com/wbthomason/packer.nvim) looks like it will no longer be in use (it is already archived), like is the case for [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1621); I still want blazing fast startup time (before moving to that new config, I was well under 30 ms, as measured by hyperfine or vim-startuptime).

TL;DR I got a twofold increase in startup time, but I only need to manage a single lua file now.

```shell
~/.config/nvim                                                                                                                                                                                               16m18» hyperfine "nvim --headless +qa" --warmup 5
Benchmark 1: nvim --headless +qa
  Time (mean ± σ):      67.4 ms ±   1.0 ms    [User: 52.3 ms, System: 15.0 ms]
  Range (min … max):    65.9 ms …  70.4 ms    44 runs
```

![img](/img/2023-10-06-21-40-30.png)

Yes, I'm back to the good old era of the 500+ LOC vimrc. In my case, I now have a single `init.lua` file to manage my plugins and general settings, nicely organized and presented thanks to native (and efficient) Vim folding. I still have various directories lying around, though. Here is the big picture:

```shell
~/.config/nvim
» tree -L 1
.
├── after
├── compiler
├── ftdetect
├── init.lua
├── lazy-lock.json
├── spell
└── templates

5 directories, 2 files
```

I discarded part of a forked version of mini.nvim that I was using for completion, as well as several hand-made helper functions. Meanwhile I also cleanup stuff dispatched in several Lua files and put stuff in either my `after` directory, or directly into my `init.lua` file. Overall, nothing really changed, except that I'm now relying on dedicated packages to manage the colorscheme and statusline of Neovim stable release (v0.9.2 at the time of this writing). Breaking changes are inevitable with "over-the-beta" software, which is why I stopped using the dev version of Neovim in recent months. And since I don't have the time nor inclination to read the changelog every two weeks, or after every new stable release, I let package maintainers do the right stuff for me. I've been using a bare bone custom monochromatic theme for three years now, but as I said in a [previous post](/post/unified-colors-of-tuis/), the [zenbones](https://github.com/mcchrish/zenbones.nvim) plugin is quite good and I very much like the zenbones and zenwritten themes on light background. They also render nice on a dark background by the way. [Lualine](https://github.com/nvim-lualine/lualine.nvim) is okay for most part and it fulfills all my requirements.

The biggest issue for me was to replace `null-ls`[^1] since it provided me with a bunch of useful linters and fixers but it came out it was not too difficult to get rid of it since [conform.nvim](https://github.com/stevearc/conform.nvim) and [nvim-lint](https://github.com/mfussenegger/nvim-lint) came to the rescue shortly. I am aware it can be done with autocommands as [explained on SO](https://stackoverflow.com/a/77153991) or simple mappings (which is what I already have in some of my `after/ftplugin` files, but these two packages allow to manage linters and formatters in a more comfortable way.

Startup time is a bit longer (70-80 ms instead of 30 ms with my previous config), but I use a different set of plugins so it's hard to compare. The most notable changes are the addition of auto-installers, like [mason.nvim](https://github.com/williamboman/mason.nvim) (with [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) and [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim), which works alongside [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), and linting/formatting packages cited above). I already installed all LSPs, linters and formatters I need using pip, npm, curl or whatever, but the big advantage of this approach is that everything is self-contained so that I can transfer my config files to any other computer and get everything installed right away. Mason-based tools will install everything (using a [registry list](https://mason-registry.dev/registry/list) in the case of Mason itself) within a single click or config line.[^2] It also means you end up with a huge `$HOME/local/share/nvim` directory (3.3 Go with 9 LSPs, compared to less than 180 Mo with my previous config). This is not a big deal if you have a large HD, but if you make regular backup using Kopia, you may want to exclude that directory from your hourly or daily backups. As an example, consider the following listing, in the middle of my configuration: some LSPs, formatters and linters take up some space, really:[^3]

```shell
$ .local/share/nvim/mason/packages
» du -sh ./* | sort -h
2,8M    ./shfmt
4,0M    ./purescript-language-server
14M     ./stylua
15M     ./shellcheck
19M     ./texlab
20M     ./docformatter
20M     ./isort
27M     ./black
28M     ./pyright
28M     ./sqlfmt
29M     ./clojure-lsp
41M     ./typescript-language-server
44M     ./rust-analyzer
105M    ./r-languageserver
124M    ./clangd
2,8G    ./haskell-language-server
```

I tried [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) as a replacement of my personal fork of [mini.nvim](https://github.com/echasnovski/mini.nvim) completion module (this was before the `mini.nvim` project introduced submodules), but I removed it after a few days. I never really like autocomplete and popup windows after every two keystrokes, and I'm probably fine with Vim's omni complete (`C-x C-o`), when I need it.

And then comes [nvim-orgmode](https://github.com/nvim-orgmode/orgmode), which is so great compared to my previous half hand-made configuration. But I will talk a bit more bout this in a separate post.

{{% music %}}Bauhaus • _Exquisite Corpse_{{% /music %}}

[^1]: By the end of writing this post, I learned it has been forked as [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim).
[^2]: Compared to nvimlsp-config, Mason uses a different naming convention, so be careful.
[^3]: Of note, the R language server took a lot of time to install, compared to other LSPs. At this point, I'm thinking of removing it since I don't really need it except for the `keywordprg` (on-line help), which I can manage by my side.
