---
title: "Unified colors of TUIs"
date: 2022-09-28T20:02:45+02:00
draft: false
tags: ["unix", "vim"]
categories: ["2022"]
---

The other day I got tired of my terminal color scheme ([Nord]) which makes no distinction between dark and light colors, except for white and black variants, and I was looking for a prettier color scheme that could be used in a light or dark theme as well. Indeed, I used to use a light theme for all my command-line tools, including Vim (see, e.g., the screenshot at the end of [this post]) until I switched to the Nord palette. However, when I'm tired, or at night, I prefer a dark theme. And, well, sometimes I happened to miss my good old light theme. So I devised yet another theme for my terminal, and then for Neovim.

Here is what I finally decided to stand by for the next few weeks:

{{< figure src="/img/2022-09-28-21-00-45.png" >}}

This palette was grabbed from the homepage of <https://terminal.sexy>, and the white/dark variants are based on the Nord palette and personal taste. I don't know its name, though.

The other reason I designed a new color theme for the terminal is that I wanted it to be useful for Neovim too. As I said, I have two main colorscheme, which are automatically set up based on the value of `background`. This is done with an autocommand that looks like this:

```vim
function! misc#set_theme() abort
  if &background ==# 'dark'
    colorscheme nord
  else
    colorscheme light
  endif
endfunction

--8<--------

augroup colortheme
  autocmd!
  autocmd OptionSet background call misc#set_theme()
augroup END
```

The advantage is that this is all managed by Vim itself, as discussed in a [related post]. I have an extra apocryptic command in my `init.lua` file to handle possible Tmux glitches:

```lua
-- HACK: work around bad detection of background in Tmux (no OSC11 support)
-- https://github.com/neovim/neovim/issues/17070
vim.api.nvim_exec(
  [[
if $TERM ==# "tmux-256color"
  lua vim.loop.fs_write(2, "\27Ptmux;\27\27]11;?\7\27\\", -1, nil)
endif
]],
  true
)
```

Later, I wrote a shell script that allows me to switch my color theme on the go. Since I now use Alacritty which has a hot reload capabilitites this works quite well. Alacritty is really great, but I am better talking about Alacritty in a another post. That's how I manage to use two colorschemes in my terminal and Neovim.

Those two colorschemes, which are based on [modified] versions of Nord and Vimbones from the zenbones plugin, are great for daily use, but they are not consistent one each other. And I'm too lazy to find a good fit for a common color palettes. Less is better, most of the time, so I rewrote from a scratch a single colortheme, as I did three years ago for Vim. It tooks me less than an hour to get a working theme for both color themes (light and dark): no color, except for constant and stuff I want to be aware of (warning or error message, bad spelling, etc.). Again, I take advantage of Alacritty's handling multiple fonts to highlight keywords or comments with medium or semi-bolded typefaces. It's all good!

{{< figure src="/img/2022-09-29-09-47-18.png" >}}

{{% music %}}Morcheeba • _Trigger Hippie_{{% /music %}}

[Nord]: https://www.nordtheme.com/docs/colors-and-palettes
[this post]: /post/getting-into-neovim/
[related post]: /post/neovim-and-tmux/
[modified]: /post/on-color-scheme/
