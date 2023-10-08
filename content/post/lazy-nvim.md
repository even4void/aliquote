---
title: "Switching to lazy.nvim"
date: 2023-10-06T11:34:11+02:00
draft: true
tags: ["vim"]
categories: ["2023"]
---

Yesterday, I switched to [lazy.nvim](https://github.com/folke/lazy.nvim) to manage my Neovim plugins. I'm thus writing yet another post on Vim with a fresh new configuration. Reasons are multiple but quite simple: I wanted a more minimalistic set of config files (ideally one or two Lua files) allowing me to keep my `after/ftplugin` directory as optional in case I need to transfer my config to other machines; [packer]() looks like it will no longer be in use (it is already archived), like is the case for [null-ls.nvim](); I still want blazing fast startup time (before moving to that new config, I was well under 30 ms, as mesaured by hyperfine or vim-startuptime).

TL;DR I got a twofold increase in startup time, but I only need to manage four lua files now.

![img](/img/2023-10-06-21-40-30.png)

Meanwhile I cleanup unused stuff and now use a single init file and two helper files instead of a dozens of Lua files. Overall, nothing really changed, except that I'm now relying on dedicated packages to manage the colorscheme and statusline of Neovim stable release (v0.9.2 at the time of this writing). I've been using a barebone custom monochramtic theme for three years now, but as I said in a [previous post](/post/unified-colors-of-tuis/), the [zenbones](https://github.com/mcchrish/zenbones.nvim) plugin is quite good and I very much like the zenbones and zenwritten theme on light background. They also render nice on a dark background by the way.

Startup time is a bit longer (70-80 ms instead of 30 ms with my previous config), but I use a different set of plugin so it's hard to compare. Presently, I added [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) as replacement to a personal fork of [mini.nvim]() completion module (this was before the mini.nvim project introduced submodules), as well as [mason.nvim](https://github.com/williamboman/mason.nvim) in addition to [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).

Mason looks great as it installs everything (using a [registry list](https://mason-registry.dev/registry/list)) within a single click or config line,[^1] but it also means you end up with a huge local/Share/nvim directory (3.3 Go with 5 LSPs, compared to less than 180 Mo with my previous config) even when you already have local copies of the LSPs. This is not a big deal if you have a large HD, but if you make regular backup using Kopia, you may want to exclude that directory from your hourly or daily backups. As an example, consider the following listing, in the middle of my configuration: some LSPs, formatters and linters take up some space, really. The R language server took a lot of time to install, compared to other LSPs.

```shell
$ .local/share/nvim/mason/packages
» du -sh ./* | sort -h
2,8M    ./shfmt
4,0M    ./purescript-language-server
7,4M    ./bash-language-server
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

On the other hand, it means I can transfer my `init.lua` file over an other Neovim and everything will be installed automagically thanks to Lazy and [mason-tool-installer.nvim](). Moreover, everything is located in the same place, so it's easy to manage packages individually if needed. You can also install formatters, linters or DAP adapters via Mason, but you will need to configure them afterwards. In the case of formatters and linters, this is mostly done via autocommands as [explained on SO](https://stackoverflow.com/a/77153991). This is especially useful if you work with Python since pyright doesn't provide any formatting utilities.

And then comes [nvim-orgmode](https://github.com/nvim-orgmode/orgmode), which is so great compared to my previous half hand-made configuration. But I will talk a bit more bout this in a seperate post.

{{% music %}}Bauhaus • _Exquisite Corpse_{{% /music %}}

[^1]: Compared to nvimlsp-config, Mason uses a different naming convention, so be careful.
