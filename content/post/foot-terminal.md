---
title: "Foot terminal for Wayland"
date: 2023-09-25T20:14:06+02:00
draft: false
tags: ["unix", "app"]
categories: ["2023"]
---

I've been playing out of the blue with the [foot](https://codeberg.org/dnkl/foot) terminal emulator after several months in Gnome terminal. It's incredibly fast compared to the latter, of course. You'll get noticeable improvement in terms of response and typing latency when listing directory using [exa](https://github.com/ogham/exa) or running `sudo apt update && apt list --upgradable`, for instance. Typing in Vim goes even smoothly. I know I can achieve the same results with [Kitty](https://sw.kovidgoyal.net/kitty/), but foot itself is advertised as a fast and minimalist terminal emulator for Wayland. I'm on Wayland, and I like trying things out, especially if this improves my workflow.

I've used Alacritty for one year and finally came back to Kitty. The latest additions (e.g., switching themes or update notifications) were life changing and made it close to the bare bone terminal emulator available system-wide on Ubuntu (aka, Gnome terminal). You'll get many additional capabilities, though: image support, pipes to external programs (also known as kitten), good URL support, multiplexing for free, and so on. Overall, with foot there's not much difference compared to Kitty except you'll get less additional capabilities. However, image support (via [sixel](https://en.wikipedia.org/wiki/Sixel)) and handling URL is quite good. Search capabilities in the scrollback are great too, and it even works under Tmux: Try typing `Ctrl+Shift+R` and you'll get a search box in the bottom-right of your terminal. Note that the version of foot available in Ubuntu 22.04 LTS stock apt packages is 1.11, and to align with recent development you'll need to add the following to your `$HOME/.config/foot/foot.ini` config file:

```shell
[key-bindings]
show-urls-launch=Control+Shift+o
```

![img](/img/2023-09-25-20-36-34.png)

You may also want to disable the extra space on the right of the terminal windwo by disabling the scrollback marker. Otherwise, you'll get strange looking horizontal menu/status bar (e.g., tmux, vim, newsboat). This is easily achieved as follows:

```shell
[scrollback]
indicator-position=none
```

If you miss the Ubuntu mono font from Gnome terminal, just add `font=Ubuntu Mono:size=8` in the `[main]` section.

Unfortunately, Neovim terminal does not support sixel for displaying image, only [chafa](https://github.com/hpjansson/chafa/) and [viu](https://github.com/atanunq/viu), which means you cannot benefit from foot's support when using [fzf-lua](https://github.com/ibhagwan/fzf-lua) for previewing images in the fuzzy file finder.

Quick post, but if you are looking for cheap alternative to Gnome terminal with better input latency give foot a shot.

{{% music %}}Portishead • _Mourning Air_{{% /music %}}
