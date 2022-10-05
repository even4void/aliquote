---
title: "Speeding up Neovim"
date: 2022-10-05T11:21:43+02:00
draft: false
tags: ["vim"]
categories: ["2022"]
---

This probably is the last and heaviest iteration of my Neovim setup cleansing days. Starting with a 36-40 ms startup time and 10-12 plugins, I ended up with a 26-30 ms startup time and a total of 9 plugins, with half of them not loaded most of the time. I could possible optimize this startup time by converting my color scheme to pure Lua, but I prefer to keep it as plain old VimL since I may reuse it with Vim instead of Neovim.

There are a lot of useful (and less useful) advices on the web, which mostly amounts to relying on pure Lua-based plugins or general settings (except for autocommand), disabling unused built-in stuff, eventually disabling Shada (I didn't), etc. Unlike others, I don't use much plugins, so I am not concerned with plugins that can be properly lazy loaded or not. I like to have a bunch of settings in my `after/ftplugin` directory, since I find it easier to manage language-specific options there. It's all written in VimL but I may consider using `ftplugin` directly with Lua code at some point.

Here are the latest benchmarks using medium performance of my CPUs:

```shell
» hyperfine "nvim --headless +qa" --warmup 5
Benchmark 1: nvim --headless +qa
  Time (mean ± σ):      27.6 ms ±   0.2 ms    [User: 22.7 ms, System: 5.1 ms]
  Range (min … max):    27.3 ms …  28.3 ms    105 runs
```

I uninstalled Telescope and got my way back to Fzf. Navigating my buffers or filesystem now works like a charm, unlike Telescope which I found less responsive and reliable (oftentimes the caret was not on the right spot). I also removed null-ls to get rid of plenary dependency. That's a bit silly, because I really like this plugin and the author/maintainer does a really great job to keep up to date with Neovim upstream deprecations or changes. Yet I don't want to rely on extra dependencies. I have to figure out how to replace null-ls linter/fixer facilities. At the moment, I delegated fixers to `formatprg` option, but I though I will maybe configure the [efm] language server to simplify the task and get linting facilities. Finally, I moved all other plugins as opt plugins, either using filetype-based filters (vimtex, nvim-lspconfig, nvim-parinfer) or key or command-base triggers (Comment, nvim-colorizer). As for treesitter, I simply added a `event = 'BufRead'` conditional, which allows to gain a little when firing up Neovim in a directory or without any file as I often do to define a proper working directory. Besides, I removed unused stuff in my `autoload` directory, as well as useless autocommands.

Here's the list of plugins I'm currently using (in addition to packer), as of this writing: `junegunn/fzf`, `junegunn/fzf.vim`, `lervag/vimtex`, `gpanders/nvim-parinfer`, `norcalli/nvim-colorizer.lua`, `numToStr/Comment.nvim`, `nvim-treesitter/nvim-treesitter`, `neovim/nvim-lspconfig`. I could probably get ride of nvim-lspconfig since the built-in LSP can now be configured more easily starting with Neovim v0.8. See [New LSP features in Neovim 0.8].

I also reorganized my Lua files using a cleaner structure:

```shell
» tree
.
├── config
│   ├── diagnostics.lua
│   ├── lsp.lua
│   └── treesitter.lua
├── plugins.lua
├── settings
│   ├── abbrev.lua
│   ├── autocmd.lua
│   ├── command.lua
│   ├── init.lua
│   └── mappings.lua
└── utils
    ├── completion.lua
    ├── jump.lua
    ├── statusline.lua
    └── surround.lua

3 directories, 13 files
```

It's also been a week that I reconfigured my whole desktop using a light color theme and a mix of tiled and floating windows, thanks to the [Tactile] extension and Ubuntu built-in shortcuts to move or resize windows (<code>Alt-F7</code> and <code>Alt-F8</code>). Since I don't move terminal window a lot, this works for me and I don't feel like I need to install Sway.

Here is a screenshot of the two workspaces I generally use all day:

{{< fluid_imgs
"pure-u-1-2|/img/2022-10-05-11-43-42.png"
"pure-u-1-2|/img/2022-10-05-11-44-15.png" >}}

{{% music %}}New Order • _Bizarre Love Triangle_{{% /music %}}

[New LSP features in Neovim 0.8]: https://zignar.net/2022/10/01/new-lsp-features-in-neovim-08/
[efm]: https://github.com/mattn/efm-langserver
[Tactile]: https://extensions.gnome.org/extension/4548/tactile/
