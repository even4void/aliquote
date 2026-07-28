---
title: "Ctags for Scheme"
date: 2026-07-28T15:39:30+02:00
draft: false
tags: ["scheme", "vim"]
categories: ["2026"]
---

It's 2026 and I'm still using ctags. Who else? I mainly use (universal) ctags to
browse definitions of symbol at point for Scheme and Lisp filetypes in Neovim
since there're no feature-complete LSP available for those languages.

I was browsing Ivan Raikov's project [array-morphisms][1] and came across a call
to a procedure that I wanted to inspect. After generating a tag file as usual
(`ctags -R .`) and calling fzf-lua to grep the tag associated to the word under
the cursor, I realized that it gave no result at all. I checked the tag file,
and indeed the corresponding `define` statement did not meet any of my
expectations (it was found at random places as a function call, not a top-level
definition). I suspect this has to do with how Universal Ctags tries to match
the `define` keyword at the start of the line, which means that procedures
defined inside a [module][2] statement are not tagged properly.

I tried [any-jump.vim][3] which kinda works as expected (I only want go to
definitions, not references, and I had to use ag instead of rg for whatever
reasons), but that's not satisfactory. I already have everything I need with
fzf-lua as a picker.

This led me to try BBEdit regex playground to validate a regex for this use
case, and it's just kind of magic. You feed it up with some text, build your
regex incrementally and see matches appear on the screen; you even get capture
groups if any:

![img](/img/2026-07-28-15-39-15.png)

As can be seen in the above screenshot, my original idea was to capture the
procedure's name right after the `define` keyword. Unfortunately, the capture
group includes the opening parenthesis. Add a non-capturing group and voilà:

```regex
\(define[ \t]+(?:\()([^[:space:]]+)
              ^^^^^^
```

This works in BBEdit, but not when calling ctags with this additional regex
pattern (defined in `$HOME/.config/ctags/scheme.ctags`), which left me puzzled
for a while until I realized that my original idea was indeed correct: I just
forgot to properly escape the opening parenthesis:

```regex
\(define[ \t]+\(([^[:space:]]+)
              ^^
```

What a silly mistake... However, this leaves me with some garbage, like globbing
things like `(define branch-0 (morph-slice x '(0) '(16) 4))`, which I would
qualify as false positives. I'm not sure why this happens since my regex looks
right, in particular there's no greedy pattern after `define` that would explain
some non-whitespace garbage is captured along the way before the opening
parenthesis. That's not a big deal since I can post-process the tag query with
fzf-lua filter, but I may have to check how ctags works for Scheme filetype.

At the moment, my `scheme.ctags` file reads:[^1]

```
--regex-Scheme=/[ \t]*\(define[ \t]+\(([^[:space:]]+)/\1/f,function/
```

Besides, this led me to define the following keybindings in my
`after/ftplugin/scheme.vim` file:

```vim
nnoremap <buffer> <silent> gO :lua require("fzf-lua").tags()<cr>
nnoremap <buffer> <silent> gd :lua require("fzf-lua").tags_grep_cword()<cr>
nnoremap <buffer> <silent> grr :lua require("fzf-lua").grep_cword()<cr>
```

This mimics (more or less) what I already use for LSP stuff:

```lua
vim.keymap.set("n", "gd",
  "<cmd>lua require('fzf-lua').lsp_definitions({ jump1 = true, ignore_current_line=true })<cr>")
vim.keymap.set("n", "grr",
  "<cmd>lua require('fzf-lua').lsp_references({ ignore_current_line = true, includeDeclaration = false })<cr>")
if client and client.server_capabilities.documentSymbolProvider then
  vim.keymap.set("n", "gO", "<cmd>lua require('fzf-lua').lsp_document_symbols()<cr>")
elseif client and client.server_capabilities.workspaceSymbolProvider then
  vim.keymap.set("n", "gO", "<cmd>lua require('fzf-lua').lsp_workspace_symbols()<cr>")
end
```

Bonus reading for Ctags users: [Surprising Ctags Behavior][4].

[1]: https://github.com/iraikov/array-morphisms/tree/main
[2]: https://wiki.call-cc.org/man/5/Modules
[3]: https://github.com/pechorin/any-jump.vim/
[4]: https://joshleeb.com/posts/ctags.html

[^1]: I could probably use `\h+` instead of the character class `[ \t]+`, and
    `\S+` instead of `[^[:space:]]+`.

{{% music %}}Soul Asylum • *Oxygen*{{% /music %}}
