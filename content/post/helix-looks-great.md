---
title: "Helix Looks Great"
date: 2023-09-18T20:22:20+02:00
draft: true
tags: ["app"]
categories: ["2023"]
---

I already talked about the [Helix editor](/post/helix-editor). I try to use it on a daily basis from time to time. It works perfectly on virtual consoles in Ubuntu or via ssh if you don't need an X server.

What I really like:

- It works out of the box. Just install the binary (from a tarball or Flathub), any additional LSP stuff you need (e.g., lldb-vscode, pyright, black), and check that it has been detected with `hx --health`. Then you're probably good to go. There's barely anything to configure (unless you use pyright LSP for Python).
- There are a few fuzzy pickers builtin, and they are great: LSP finder and gotos, file picker, etc. Everything comes with a popup menu "à la which-key" which helps finding the right binding in case you forgot it. Otherwise, the popup menu is rather unintrusive if you are quick enough for any two key mapping.
- Since it is a single app with everything bundled, it will work across different machines the same way. Even with no configuration (see above), you'll get a very capable text editor.
- Git support is acceptable, at least there's a Git gutter
- Tree sitter support is excellent, and unlike Neovim you don't need to install extra plugins (which don't exist anyway, at the time of this writing).

What I miss:

- No built-in terminal
- No spell checke, but [this may change soon](https://github.com/helix-editor/helix/discussions/3637#discussioncomment-6868540).

{{% music %}}XXX • _XXX_{{% /music %}}
