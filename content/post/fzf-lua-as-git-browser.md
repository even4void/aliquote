---
title: "Fzf Lua as Git Browser"
date: 2026-07-16T20:47:50+02:00
draft: true
tags: []
categories: ["2026"]
---

As you may know, I tend to stick to a few tools that allow me to do 80% of my
job quickly in Neovim. This means that I barely use more than 5 plugins, and most of
them offer some bindings to [fzf-lua][1].

```shell
~/.config/nvim ^Z
» tree -L 3 pack
pack
└── plugins
    ├── opt
    │   ├── neogen
    │   └── vim-table-mode
    └── start
        ├── diffview.nvim
        ├── fzf-lua
        ├── nvim-dap
        └── vimtex

10 directories, 0 files
```


git_status, show preview (F4), possibly in fullscreen mode (F2)

git_bcommits, select commit then C-g

Alternatively, I can call git difftool -d master from the command line, and it
will open Neovim in two-way diff mode with the quickfix list populated with
modified files. Or I can use the following Bash function to quickly inspect
modified file using fzf:

```shell
function gdv() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}
```

[1]:

{{% music %}}XXX • _XXX_{{% /music %}}
