---
title: "Editor war"
date: 2020-07-09T08:09:34+02:00
draft: false
tags: ["emacs"]
categories: ["2020"]
---

This post deals with Emacs and (Neo)vim, but the title is just a joke, of course: I use both editors, although most of my programming work is done in Emacs. I spent the past couple of weeks using Emacs, Safari and iTerm2 (mostly for ssh stuff) only. I started using Vim to get more familiar with modal editing (despite what I still [think of it](/post/emacs-15-years-later/)) and relevant mappings. As Doom defaults are mostly Evil-centric, I thought this would be a good opportunity to learn more about visual and normal modes. Vim offers a far better experience in a Terminal, compared to Emacs running in non-Gui mode, and it is still faster over ssh, IMO.

When I'm editing text in Emacs, I now came to appreciate a few idioms like `%` to move from one delimiter (parenthesis or square bracket) to the other, `*` and `#` to search forward and backward, `g;` (`goto-last-change`) to go back to where we were before moving, `gg` to go to top of file, or `)` and `]` to move forward quickly (as opposed to `w` and `b` for words), notwithstanding some specific Doom settings like `gr` (`eval-region`) or `gd` and `gD` (`+lookup/definition` and `+lookup/references`, which make use of LSP backend capabilities when available). I also learned to use a few combination of verb+motion, like `ciw` or `diw`, `5j`, etc. I'm still too much familiar with `shift-select` and the use of arrow keys to use proper visual motion in some cases, but that's okay. Likewise, `C-a` and `C-e` are still too much entranched in my muscle memory to think of Vimesque alternative like `0` and `$`, especially since I use them in my Terminal and other macOS app.

That's the advantage of Doom Emacs after all: we can use both keymappings at any time. If you wonder, I also use standard macOS keybindings like `⌘-R` (search and replace) and `⌘-F` (forward search only, using `rg` or `swiper`). I think this is what I use most of the time, so that's not a big deal for my poor memory. I know we can do a lot more, in either editors, but I usually don't need those extra superpowers. For instance, while replacing the word under cursor with a yanked one [can be done](https://unix.stackexchange.com/a/88719) nicely in Vim (the same applies for Emacs), I prefer to query and replace, especially if this has to be done multiple times. Maybe I'll change my mind later or when I become more fluent with yanking in Vim. For me, the most useful commands for yanking and pasting in Vim remains `yy`, `dd` and `p`, of course, and I only started to appreciate selection in visual mode using `V`, `S-V` or `C-V`.

Now comes the question of the color scheme, since I always advocated the idea that simple and light themes are often better. Some [nice themes](https://jblevins.org/projects/emacs-color-themes/) are described on Jason Blevins's site, and I tried a lot of colorless or minimalist themes in the past. I don't really like pink or purple, so Atom or VS Code default colorful schemes, and Emacs variations thereof, are not an option. In the end the buffer just looks like a rainbow. I use the wonderful [Nord (dark) theme](https://www.nordtheme.com) in both Vim and Emacs, as well as iTerm. In my view, it looks better in Vim compared to the corresponding implementation for Emacs in non-GUI mode, but since I generally use Emacs in a GUI I don't really care. I made some modification to the base color scheme, though. The idea was to have a lighter color scheme, after removing extraneous colorization for faces that are not that essential when writing prose or code. You can have a look below:

{{< figure src="/img/2020-07-10-08-11-10.png" >}}

The idea is simply to remove syntax highlighting for everything except keywords and related language-specific forms, which use the same <span style="background:#81a1c1; color:white; padding:1px 3px 1px 3px; border-radius: 5px">base color</span>, and to highlight <span style="background:#ebcb8b; color:white; padding:1px 3px 1px 3px; border-radius: 5px">strings</span> differently (with a dimmed variant for <span style="background:#bca26f; color:white; padding:1px 3px 1px 3px; border-radius: 5px">numbers</span>):

```lisp
(custom-set-faces!
  '(font-lock-doc-face :foreground "#9099ab")
  '(font-lock-string-face :foreground "#ebcb8b")
  '(font-lock-constant-face :foreground "#81a1c1")
  '(font-lock-warning-face :foreground "#d08770")
  '(font-lock-function-name-face :foreground nil :weight regular :slant italic)
  '(font-lock-variable-name-face :foreground nil :weight regular)
  '(font-lock-builtin-face :foreground "#81a1c1")
  '(font-lock-type-face :foreground "#81a1c1")
  '(font-lock-keyword-face :foreground "#81a1c1")

  `(highlight-numbers-number :foreground ,(doom-darken "#ebcb8b" 0.2))
  `(highlight-quoted-symbol :foreground ,(doom-darken "#81a1c1" 0.2)))
```

<small>The idea of using a slanted variant for functions is actually just a test. It works great for Lisp-like dialects and Python, though.</small>

I made further customization for "text-mode" (Markdown and Org), which amounts to using essentially white headers (level 1 and 2), dimmer highlight for inline code and URLs, etc. After all, when you are writing prose, you don't necessarily want to see color every 3 or 4 words. The fact that my TODO list or Org documents were just full of colors was driving me crazy at some point. <span style="background:#9099ab; color:white; padding:1px 3px 1px 3px; border-radius: 5px">Metadata</span> and Org drawers are all using dimmed colors as well. Finally, <span style="background:#c2c282; color:white; padding:1px 3px 1px 3px; border-radius: 5px">selections</span> and <span style="background:#81a1c1; color:white; padding:1px 3px 1px 3px; border-radius: 5px">jumps</span> are also highlighted using different background colors.

Well, that's all. I go back experimenting with Vim motions and maybe my next posts will all be about Neovim.

{{% music %}}Nick Cave & The Bad Seeds • _Ghosteen_{{% /music %}}
