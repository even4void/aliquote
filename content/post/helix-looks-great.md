---
title: "Helix looks great indeed"
date: 2023-09-18T20:22:20+02:00
draft: false
tags: ["app"]
categories: ["2023"]
---

I already talked about the [Helix editor](/post/helix-editor). I try to use it on a daily basis from time to time. It works perfectly on virtual consoles in Ubuntu or via ssh if you don't need an X server. I now have some consequent muscle memory anchored in my Neovim key bindings, and I often make some mistake when working with Helix. I believe I don't use it often enough to really enjoy its capabilities and the editing model underlying this Kakoune/Vim hydra. I know there are some support for [Vim keymapping](https://github.com/helix-editor/helix/wiki/FAQ#is-a-vivim-keymap-planned), but I try to work with builtins.

*What I really like:*

- It works out of the box. Just install the binary (from a tarball or Flathub), any additional LSP stuff you need (e.g., lldb-vscode, pyright, black), and check that it has been detected with `hx --health`. Then you're probably good to go. There's barely anything to configure (unless you use pyright LSP for Python).
- There are a few fuzzy pickers builtin, and they are great: LSP finder and gotos, file picker, etc. Everything comes with a popup menu "à la which-key" which helps finding the right binding in case you forgot it. Otherwise, the popup menu is rather unintrusive if you are quick enough for any two key mapping.
- Since it is a single app with everything bundled, it will work across different machines the same way. Even with no configuration (see above), you'll get a very capable text editor.
- Git support is acceptable, at least there's a Git gutter and goto next/prev change. Bonus, you get a visual selection for free in the later cases.
- Tree sitter support is excellent, and unlike Neovim you don't need to install extra plugins (which [don't exist](https://github.com/helix-editor/helix/discussions/3806) anyway, at the time of this writing).
- Native DAP support is nice, especially when you see how picky it is to configure everything in Neovim with [nvim-dap](https://github.com/mfussenegger/nvim-dap) (the plugin is great, it's just that it is a lot of extra configuration for lldb-vscode, debugpy, etc.). I'm eagerly awaiting full support for Python.
- So many good defaults, e.g., start in a directory with `hx .` and you get a file picker.
- I don't use builtin colorschemes but they look gorgeous as advertised. Here is my boring colorless theme, by the way:

{{< figure src="/img/2023-09-18-20-56-05.png" >}}

*What I miss:*

- No built-in terminal. I use it a lot, be it for simply launching a program alongside or for running REPL or test suites.
- Muscle memory, as I said. I wish there were a better way to add support for, e.g., `$`, `0` or `_`. Switching from Neovim to Helix too often means wandering through the vagaries of keyboard shortcuts to navigate text.
- `cw` and `yiw`. Argh, you need to make a selection first. Muscle memory again...
- Filetype-based text soft/hard wraping, reflowing, and things like that, although I am aware of the hard-wraping (`:reflow`) capabilities. I would really like soft-wraping and I miss Vim's `gqip` for hard-wraping.
- I miss Vim's visual blocks which I find especially useful to add comment at the start of several lines or remove extra whitespace, etc. I know we can do the same with multiple selections, but it's, well, different.
- No spell checke, but [this may change soon](https://github.com/helix-editor/helix/discussions/3637#discussioncomment-6868540).
- I still need to find my way through the use of pipes instead of Vim's `r!` although it is a minor issue.

{{% music %}}Patricia Brennan • _Improvisation VI_{{% /music %}}
