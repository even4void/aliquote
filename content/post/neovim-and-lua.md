---
title: "Neovim and Lua"
date: 2021-05-19T08:10:32+02:00
draft: false
tags: ["vim"]
categories: ["2021"]
---

Recently I came across several posts that discuss the [use of Lua](https://github.com/nanotee/nvim-lua-guide) for the Neovim init file, as well as the new trending packages that everyone will be using in a few months for LSP-related stuff. In fact, the very first hit was the [config](https://github.com/seth-brown/dotfiles/tree/main/nvim) written by Seth Brown, that whetted my curiosity. I decided to try it on my Mac since I have Node installed on it, and it was pretty nice, except for the startup time: my Neovim is up and running within 50 ms or so (with only 16 plugins, managed by Plug) while all those new plugins require more than 200 ms to be fully initialized. This should probably be less on my Linux machine since it is faster than my Macbook. Still, it is a bit higher than I would like. That being said, here are the essential plugins that Seth Brown requires in his setup:

- [packer](https://github.com/wbthomason/packer.nvim): a [use-package](https://github.com/jwiegley/use-package)-like plugin manager, to replace Plug, with better defaults (it uses native packages functionalities and does not manipulate rtp) --- there's also [vim-packager](https://github.com/kristijanhusak/vim-packager);

- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter): the definitive "non-regex"-based syntax highlighter, which relies on language parsers [when available](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages);

- [telescope](https://github.com/nvim-telescope/telescope.nvim): a fuzzy finder to replace [fzf.vim](https://github.com/junegunn/fzf.vim), or sort of; I don't know if it is as fast for large codebase, but form what I've seen it acts as a large pop out window from which you can look for files in project, regex in current files, etc. I find it annoying that a file preview is used together with fuzzy matches --- I disabled it for fzf and I found it more useable. After all, you only want filenames or matches, not a preview of every file in your project, isn't it?

  > Sure, but the names of things, their functionality, and how it all fits together should be things that exist in one’s mind, not just in a computer. --- [The return of fancy tools](https://macwright.com/2021/03/16/return-of-fancy-tools.html)

- the LSP family of tools: `nvim-lspconfig`, `nvim-compe`, `lspkind-nvim`, `lsp_signature.nvim`, `lspsaga.nvim`, `lsp-trouble.nvim`, `nvim-lspinstall`, to name a few. That's a lot!

We talked about LSP and Vim in a [recent post](/post/vim-and-lsp/), but this time this all about Neovim built-in LSP client. I haven't changed my mind since then, and I prefer to write like a zoombie, with good linters at hand (thanks to Ale) and a little help from omnicompletion from time to time. I learned (the hard way?) that it's better to type, erase and write again, rather than copy/paste blindly.

Finally, a special mention to [gitsigns](https://github.com/lewis6991/gitsigns.nvim), which could replace [vim-gitgutter](https://github.com/airblade/vim-gitgutter) (same functionalities, with additional blaming support), and [lualine.nvim](https://github.com/hoob3rt/lualine.nvim) as a lightweight replacement for airline.[^1] All of the above require Neovim 0.5+, of course. If you're curious, there's also this collection of awesome [Neovim plugins](https://github.com/rockerBOO/awesome-neovim). I'm still on Neovim 0.4.3 because this is the LTS version according to Ubuntu package manager. I don't mind, I used to use the nightly build for several months in the past, but I found it annoying to upgrade to new Git release after every `apt update`. I could even use Vim 8 only, but I like how Neovim makes using a terminal alongside opened buffers so smooth. I now stand by well curated packages, with few updates. Even my terminal emulator, [Kitty](/micro/2021-04-07-21-01-11/), is probably outdated. I've seen my Emacs broke so many times in the past, due to package upgrades (or simply Doom update), that I prefer to live a few updates behind rather than spend a whole day fixing my day-to-day configuration

[^1]: I wish I understand why plugins are sometimes prefixed with "vim" or "nvim", while other plugins use suffixes instead.
