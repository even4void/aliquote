---
title: "Browsing documentation with Dash again"
date: 2026-07-27T10:19:48+02:00
draft: false
tags: ["vim", "apple"]
categories: ["2026"]
---

Some years ago I talked about [Dash][1], which I've been using on and off since
then. When I switched to a Linux distro I relied on [dasht][2] instead. It was a
great replacement for the native macOS app -- I didn't bother trying Zeal at
that time, and there was a handy [Vim plugin][3] as well.

Actually many LSPs are quite good at displaying documentation in the form of
hover action. Below (left) is an example of Racket language server for the
`define` form in Neovim:

{{< fluid_imgs "pure-u-1-2|/img/2026-07-27-11-53-45.png" "pure-u-1-2|/img/2026-07-27-11-53-58.png" >}}

It's clear, you can enter the hover window and see what's next. It's exactly
what's being displayed by Dash. The same happens for Rust or R. Try it with
Python or Haskell LSP, and you won't get much more than a poorly formatted
docstring or typing hint in many cases. I have a little snippet in my Neovim
config that allows me to launch Dash instead of hovering the word under the
cursor, which I mapped to `gK`:

```vim
command! Dash call Dash()
function! Dash() abort
  let filetypes = a:0 == 1 && a:1 == '!' ? [] : split(&filetype, '\.')
  execute "silent !" . 'open "dash://?query=' . join(filetypes) . ':' . expand('<cword>') . '"'
endfunction
```

Yes, I know, it's pure Vim script, not Lua.[^1] Should I prefer to read a plain
text version of the same docset, I can `<leader>K` to get the same information
via dasht. I'm okay with using mostly terminal-based utilities, but I find that
well-designed GUIs are equally good sometimes. Maybe I found myself at home with
macOS again, at least I’m more at ease with GUIs than I used to be on Linux or
[on Mojave][4].

I hate that I need to buy an annual license (I had a perpetual license for an
older version which is no longer available) because I don't like this pricing
business model, so I'll see how it goes for the year to come. If I don't want to
renew my license, I know I will be able to access my offline docs with dasht.

[1]: /post/dash-app
[2]: https://github.com/sunaku/dasht
[3]: https://github.com/sunaku/vim-dasht
[4]: /post/on-leaving-mac-apps

[^1]: My impression is that to get a sustainable and reliable Neovim config, you
    need to use few plugins, and mostly actively maintained or Vim-compatible
    ones. There're a lot of API breaking changes with each new minor release of
    Neovim, but for the past three years I only had to fix deprecated functions
    and updated function calls. The Vim 8 language doesn't change, though.

{{% music %}}10,000 Maniacs • *Noah's Dove*{{% /music %}}
