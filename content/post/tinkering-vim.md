---
title: "Tinkering my Neovim setup"
date: 2022-04-14T22:16:31+02:00
draft: false
tags: ["vim"]
categories: ["2022"]
---

Yesterday, I spent a fair amount of time cleaning up my Neovim config files. This mostly consisted in removing non-essential plugins, and replacing old Vimscript with Lua code, thanks to the [mini.nvim] project. If you're using [vim-surround], [hop] or other jumper, or even [clever-f], please have a look at what mini.nvim has to offer. It even features a minimal completion engine that I adopted right away since the successor of [nvim-compe] is a no-brainer for me (why would we need to install 4 to 7 plugins instead of one?!).

At some point I was about to discard [packer] and just rely on the builtin `packadd` approach, together with a set of Git submodules, that Evgeni Chasnovski uses for his own [Neovim setup], but packer is great for it manages everything so gently, including filetype-specific plugins. Lazy loading is really great sometimes.

Finally, the number of packages I rely on is limited and I believe my startup time remains quite decent (< 100 ms):[^1]

```shell
~ % tree -L 2 .local/share/nvim/site/pack/packer
.local/share/nvim/site/pack/packer
├── opt
│   ├── magma-nvim
│   ├── neogen
│   ├── parinfer-rust
│   ├── vim-table-mode
│   ├── vim-test
│   └── vimtex
└── start
    ├── Comment.nvim
    ├── gitsigns.nvim
    ├── null-ls.nvim
    ├── nvim-dap
    ├── nvim-lightbulb
    ├── nvim-lspconfig
    ├── nvim-treesitter
    ├── packer.nvim
    ├── plenary.nvim
    ├── popup.nvim
    ├── telescope-bibtex.nvim
    ├── telescope-fzf-native.nvim
    ├── telescope-github.nvim
    ├── telescope.nvim
    ├── telescope-symbols.nvim
    └── telescope-ui-select.nvim

24 directories, 0 files
~ % vim-profiler.py nvim
Running nvim to generate startup logs... done.
Loading and processing logs... done.
Plugin directory: /home/chl/.local/share/nvim/site/pack/packer/start
=====================================
Top 10 plugins slowing nvim's startup
=====================================
1	  0.774   nvim-treesitter
2	  0.183   telescope.nvim
3	  0.093   nvim-lspconfig
4	  0.044   plenary.nvim
=====================================
times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines
```

Results from `vim --startuptime`:

```
000.020  000.020: --- NVIM STARTING ---
000.965  000.945: locale set
001.487  000.523: inits 1
001.499  000.012: window checked
--8<--------
-------->8--
076.311  001.266: loading rtp plugins
076.683  000.085  000.085: sourcing /home/chl/.local/share/nvim/site/pack/packer/start/nvim-lspconfig/plugin/lspconfig.vim
077.273  000.501  000.501: sourcing /home/chl/.local/share/nvim/site/pack/packer/start/nvim-treesitter/plugin/nvim-treesitter.vim
077.435  000.045  000.045: sourcing /home/chl/.local/share/nvim/site/pack/packer/start/plenary.nvim/plugin/plenary.vim
077.813  000.183  000.183: sourcing /home/chl/.local/share/nvim/site/pack/packer/start/telescope.nvim/plugin/telescope.vim
077.952  000.827: loading packages
077.986  000.034: loading after plugins
077.998  000.013: inits 3
081.488  003.489: reading ShaDa
081.647  000.159: opening buffers
081.673  000.027: BufEnter autocommands
081.676  000.003: editing files in windows
082.048  000.373: VimEnter autocommands
082.052  000.003: UIEnter autocommands
082.432  000.280  000.280: sourcing /usr/share/nvim/runtime/autoload/provider/clipboard.vim
082.440  000.108: before starting main loop
083.690  001.250: first screen update
083.692  000.003: --- NVIM STARTED ---
```

I rewrote 50% of my old pure Vim config. The remaining is just the `after/ftplugin/*`, `ftplugin/*`, and `autoload/*` stuff, which I keep as Vimscript for compatibility issues.

[^1]: [vim-profiler](https://github.com/bchretien/vim-profiler) is available from GitHub.

[mini.nvim]: https://github.com/echasnovski/mini.nvim
[vim-surround]: https://github.com/tpope/vim-surround
[hop]: https://github.com/phaazon/hop.nvim
[clever-f]: https://github.com/rhysd/clever-f.vim
[nvim-compe]: https://github.com/hrsh7th/nvim-compe
[packer]: https://github.com/wbthomason/packer.nvim
[neovim setup]: https://github.com/echasnovski/nvim

{{% music %}}Adam Wakeman • _Lean on Me_{{% /music %}}
