---
title: "New Pandoc Template"
date: 2022-01-10T21:17:41+01:00
draft: true
tags: ["tex"]
categories: ["2022"]
---

While browsing GitHub, I noticed that the nvim-lua organization offers a "starter kit" init.lua file for Neovim users. It is a single Lua file, which is quite handy when you want to quickly bootstrap a sane config on external servers. I tested it in my own environment and it's pretty good actually. I like the idea of having a single file for the whole config, although I can understand why we may want to split our whole config in separate files, which is actually what I do, see below.

```shell
~/.config/nvim % tre
      1 .
      2 ├── after
      3 │   └── syntax
      4 │       ├── racket.vim
      7 ├── autoload
      8 │   ├── spelling.vim
      9 │   └── text.vim
     10 ├── colors
     11 │   ├── nord.vim
     12 │   └── plain.vim
     13 ├── ftplugin
     14 │   ├── css.vim
     15 │   ├── gitcommit.vim
     16 │   ├── haskell.vim
     17 │   ├── help.vim
     18 │   ├── html.vim
     19 │   ├── markdown.vim
     21 │   ├── racket.vim
     22 │   ├── rust.vim
     24 │   ├── text.vim
     25 │   └── vim.vim
     26 ├── lua
     27 │   ├── format.lua
     28 │   ├── lsp.lua
     29 │   ├── mappings.lua
     30 │   ├── settings.lua
     31 │   └── utils.lua
     32 ├── plugin
     33 │   └── packer_compiled.lua
     34 ├── spell
     35 │   ├── en.utf-8.add
     36 │   ├── en.utf-8.add.spl
     37 │   ├── fr.utf-8.add
     38 │   └── fr.utf-8.add.spl
     39 └── init.lua
     40
     41 8 directories, 30 files
```
<small>`tre` is just an alias for `tree -NC -aC -I '.git|node_modules' --dirsfirst "$@" | less -FRNX`</small>

In my previous post, I talked about writing Org file in Vim. While I much prefer the Org format, I often fall back on Markdown as the default markup for plain text files. I devised several Pandoc templates over the years, especially for RMarkdown documents. As discussed in an [older post of mine](/post/latex-beamer-21-century/), I use a Makefile and a YAML header to process my text MArkdown or RMarkdown documents. Having a separate YAML header as well as plain $\LaTeX$ file to add custom macros make it easy to define a common template for a series of handouts.

Lately, I've used the Eisvogel template for some handout. It works great, its design favors simple (sans) defaults, but I don't really like the default settings for code chunks, for example. In the meantime, I wrote my own custom template to export Org file to Latex Tufte handout via Pandoc. I also have a similar workflow for Md -> Tex export, without using the Tufte handout Latex class.
