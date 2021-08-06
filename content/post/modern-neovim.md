---
title: "Let's go modern with Neovim (1/n)"
date: 2021-07-22T10:23:31+02:00
draft: false
tags: ["vim"]
categories: ["2021"]
---

» [Next post](/post/vim-shortcuts/) in this series

This is kind of a follow-up post to [Neovim and Lua](/post/neovim-and-lua/). Recently, I decided to update my Neovim configuration files to take advantage of the built-in LSP client and the new completion framework offered by [nvim-compe](https://github.com/hrsh7th/nvim-compe). My old config files are still fine, and I may eventually use them for classic Vim 8. However, for Neovim I don't think they will stand the test of time given how fast Neovim is evolving these days. The most difficult part for moving in the right direction was to adopt Lua as the core language for setting up the whole configuration. I'm still using Vimscript here and there, mostly because I have some nifty commands and functions that I wrote or adopted long ago.

Here are the core components of my new settings, and yes, it really is just 12 packages in total:

```lua
require('packer').startup(function()
  use "wbthomason/packer.nvim"

  use 'b3nj5m1n/kommentary'
  use 'mhartington/formatter.nvim'

  use {'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'folke/lsp-trouble.nvim'

  use 'simrat39/rust-tools.nvim'

  use {'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  use 'hoob3rt/lualine.nvim'
end)
```

I miss [polyglot](https://github.com/sheerun/vim-polyglot), but I'm happy with [formatter](https://github.com/mhartington/formatter.nvim) and [lsp-trouble](https://github.com/folke/trouble.nvim) as a replacement for [ALE](https://github.com/dense-analysis/ale). I could install language-specific packages, e.g. for Markdown or Racket, separately, but I decided to keep the core functionalities to the bare minimum. As always, I prefer to add custom settings by hand, without relying on too many extra dependencies. If [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) is going to take the lead on syntax highlighting and language grammar support, let's see how it goes. Also, I replaced fzf with [Telescope](https://github.com/nvim-telescope/telescope.nvim) as my fuzzy finder. Overall, it works great after we remove all the preview windows that we don't really need when switching between buffer or finding a file in a project -- I keep a preview window for live grep'ing only.

My startup time remains decent (about 90 ms), despite previous benchmarks which suggested larger startup time for Neovim 0.5+ compared to the stable version available in Ubuntu 20.04. Using [vim-profiler](https://github.com/bchretien/vim-profiler), I got the following summary:

```shell
% vim-profiler.py nvim
Running nvim to generate startup logs... done.
Loading and processing logs... done.
Plugin directory: /home/chl/.local/share/nvim/site/pack/packer/start
=====================================
Top 10 plugins slowing nvim's startup
=====================================
1	  2.597   nvim-compe
2	  1.376   kommentary
3	  0.788   nvim-treesitter
4	  0.275   telescope.nvim
5	  0.124   lsp-trouble.nvim
6	  0.072   nvim-lspconfig
7	  0.037   plenary.nvim
8	  0.035   formatter.nvim
=====================================
```

Finally, I switched to yet another statusline manager, [lualine](https://github.com/hoob3rt/lualine.nvim), which is lighter and apparently faster than airline. As for the theme, I use a modified version of [vim-colors-plain](https://github.com/andreypopp/vim-colors-plain), so that my text editor now looks like this (using gnome-shell instead of Kitty):

{{< fluid_imgs
  "pure-u-1-2|/img/2021-07-22-10-54-08.png"
  "pure-u-1-2|/img/2021-07-22-10-57-32.png" >}}

<br>

{{% alert note %}}
<small>[2021-07-24]</small><br>
It's been a few days since I upgraded my whole Neovim config and I must say it was a good move: Everything's working fine. Telescope work just as well as [vim-fzf](https://github.com/junegunn/fzf.vim), and [git-signs](https://github.com/lewis6991/gitsigns.nvim) can afford to compete with [gitgutter](https://github.com/airblade/vim-gitgutter). Setting up LSP servers is just magic thanks to [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), and the completion framework is a piece of art, IMO.
{{% /alert %}}
