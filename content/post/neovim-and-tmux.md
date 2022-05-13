---
title: "Neovim colorscheme switching and Tmux"
date: 2022-05-13T11:30:11+02:00
draft: false
tags: ["vim"]
categories: ["2022"]
---

At work I am sometimes bothered by the ambient light. This was not much of a problem until recently when I switched to a [dark theme]. The Nord theme is really great, but admittedly a light theme is more suitable in a bright room. Since I wanted to try out the vimbones theme from the [zenbones] plugin, I thought it would be a good idea to set up a dual theme for Neovim and Gnome terminal. Most of my other TUI settings depend on $TERM colors, so I only need the correct values for the terminal (16 colors). The zenbones plugin comes with extra configuration for various terminal emulators, including Kitty. I just grabbed the relevant settings for Gnome terminal, and copy the colorscheme Vim file. At this point, I do not want to rely on extra packages, like Lush, so I deleted part of the vim script file.[^1] And here we are:

{{< fluid_imgs
"pure-u-1-2|/img/2022-05-13-12-21-01.png"
"pure-u-1-2|/img/2022-05-13-12-21-53.png" >}}

The light theme is clean and elegant, and it matches almost all of my [own settings] for the Nord theme, which I modified heavily to discard fancy stuff that I am not interested in.

Regarding automatic colorscheme switching in (Neo)vim, I saw various topics on the internet, including settings global environment variable to define the colorscheme from within (Neo)vim config file, see [Set Vim background based on your terminal's background color]. I don't really like depending on environment variable, so I continued to explore a bit on the internet and I discovered that we can simply test for the `&background` value in Vim. Indeed, Vim and Neovim can detect the background color of the terminal where they are running, and `set background` accordingly. Here's the gist, as a vimL function:

```
function! misc#set_theme() abort
  if &background ==# 'dark'
    colorscheme nord
  else
    colorscheme bones
  endif
endfunction
```

This has to be used in an autocommand like this:

```
augroup colortheme
  autocmd!
  autocmd OptionSet background ++nested call misc#set_theme()
augroup END
```

At this point, I'm not sure we really need the `++nested` option. This works great when Neovim runs in Gnome terminal. However, it doesn't work in Tmux because it doesn't handle [OSC 11]!

There's a hacky solution, though. The gist comes from user [erw7] on [GitHub]:

```lua
vim.loop.fs_write(2, "\27Ptmux;\27\27]11;?\7\27\\", -1, nil)
```

I wrapped the above in a conditional statement that checks whether we are running Neovim inside Tmux or not. Since I set Tmux as "tmux-256color", this amounts to something like `if $TERM ==# "tmux-256color"`. And, well, that's it!

{{% music %}}Arctic Monkeys • _Fluorescent Adolescent_{{% /music %}}

[^1]: After two years using Neovim, I still use less than 20 plugins in my config set. No friction, no reverse dependencies to solve every two weeks.

[dark theme]: /post/regolith-desktop/
[zenbones]: https://github.com/mcchrish/zenbones.nvim
[osc 11]: https://github.com/tmux/tmux/issues/1919
[github]: https://github.com/neovim/neovim/issues/17070
[erw7]: https://github.com/neovim/neovim/issues/17070#issuecomment-1086775760
[own settings]: /post/on-color-scheme/
[set vim background based on your terminal's background color]: https://joshtronic.com/2018/06/04/set-vim-background-based-on-your-terminals-background-color/
