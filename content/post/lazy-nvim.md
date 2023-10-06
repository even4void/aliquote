---
title: "Switching to lazy.nvim (also nvim-orgmode)"
date: 2023-10-06T11:34:11+02:00
draft: true
tags: ["vim"]
categories: ["2023"]
---

Yesterday, I switched to [lazy.nvim](https://github.com/folke/lazy.nvim) to manage my Neovim plugins. I'm thus writing yet another post on Vim with a fresh new configuration.

![img](/img/2023-10-06-21-40-30.png)

Meanwhile I cleanup unused stuff and now use a single init file and two helper files instead of a dozens of Lua files. Overall, nothing really changed, except that I'm now relying on dedicated packages to manage the colorscheme and statusline of Neovim stable release (v0.9.2 at the time of this writing). I've been using a barebone custom monochramtic theme for three years now, but as I said in a [previous post](/post/unified-colors-of-tuis/), the [zenbones](https://github.com/mcchrish/zenbones.nvim) plugin is quite good and I very much like the zenbones and zenwritten theme on light background. They also render nice on a dark background by the way.

Startup time is a bit longer (70-80 ms instead of 30 ms with my previous config), but I use a different set of plugin so it's hard to compare. Presently, I added [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) as replacement to a personal fork of [mini.nvim]() completion module (this was before the mini.nvim project introduced submodules), as well as [mason.nvim](https://github.com/williamboman/mason.nvim) in addition to [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).

And then comes [nvim-orgmode](https://github.com/nvim-orgmode/orgmode).

{{% music %}}Bauhaus • _Exquisite Corpse_{{% /music %}}
