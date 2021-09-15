---
title: "Nyxt browser and other handy TUI apps"
date: 2021-09-10T09:14:41+02:00
draft: false
tags: ["unix", "app"]
categories: ["2021"]
---

When switching to i3, as discussed in my [previous post](/post/i3wm/), I was particularly interested in getting a more comfortable keyboard-centric user experience. This led me to drop or look for alternatives to the few Gnome applications I used to use (Evince, Nautilus, Firefox). Below is a quick summary of what I've found. (And yes I know that everything is already available under Emacs with eww, pdf-tools, dired and native image support in GUI version of Emacs.)


### Nyxt browser

I really like the design philosophy of [Nyxt](https://nyxt.atlas.engineer/), and you will certainly acknowledge, especially if you have some experience with keyboard-driven or TUI web browser, that the UI is beautiful. Moreover, it is designed with Emacs and Vim users in mind, since you can select the keybindings set you like best. I recommend reading the manual before using Nyxt for longer web sessions; it's even [available in Lisp](https://github.com/atlas-engineer/nyxt/blob/master/source/manual.lisp).

Several keyboard-driven web browsers, like [Qutebrowser](https://qutebrowser.org/), [vimb](https://fanglingsu.github.io/vimb/), or [Conkeror](http://conkeror.org/) (which I heard about a few years ago via Technomancy), notwithstanding Firefox plugins that can be used to emulate Vim motions like [Vimperator](http://vimperator.org/vimperator.html) or [Tridactyl](https://github.com/tridactyl/tridactyl). I tried Tridactyl a few weeks but I was overall not very satisfied with the way it works. Above all, the only features I really want is that infamous easy motion selector (which usually goes by the shortcut F or f) and a quick search bar using /. Firefox native search tools are not really helpful: `Ctrl+F` open a small dialog box at the bottom of the page, and it is hard to close without using the mouse once you start navigating around matched words in the HTML page. And there's a quick lookup function available via `/` but I never understood how it really works.

Nyxt gives me all what I need : `gg` and `G` to go to the bottom or the top of the page, `F` to emulate easy motion, and `d` to delete buffer(s). The history tree is great, although I didn't check how usable it is for longer web crawling sessions. I didn't really customize the UI, but it seems to be pretty easy, especially if you're versed into Emacs config file.

{{% alert note %}}
<small>[2021-09-13]</small><br>
See also: [visurf, a web browser based on NetSurf](https://drewdevault.com/2021/09/11/visurf-announcement.html).
{{% /alert %}}

### Zathura viewer

I was looking for a quick PDF viewer, and I came across [Zathura](https://pwmt.org/projects/zathura/) on [Big Pile of Vim-like](https://vim.reversed.top/). I installed it right away, along with associated plugin to read PDF, DJVU and PS documents. It's rare to see an application allowing to read both PDF and DJVU format. Some textbooks are still available in that old format, and I will no longer have to convert them to PDF beforehand. The UI is really minimalist, and this is mostly Vim-centric: `J` and `K` are used to go to the next or previous page, `gg` and `G` jump to the first or last page, `C-o` and `C-i` to navigate the jump list, etc. More keyboard shortcuts are documented [here](https://defkey.com/zathura-shortcuts). If you don't like the dark background, you can use the color you want by editing the config file `$HOME/.config/zathura/zathurarc`. I have these settings, for example:

```
set default-bg "#fffff8"
set statusbar-bg "#4c566a"
set statusbar-fg "#e5e9f0"
```

I particularly like the dual view (`d`) and the index (`<tab>`), as well as the easy zooming facilities (`+` and `-`).

### Feh image viewer

As suggested on the [i3](https://i3wm.org/) website, [feh](https://feh.finalrewind.org/) can be used to set a wallpaper for your desktop. You may not enjoy it much in tiling mode, but at least you can choose a picture to your liking. Besides, feh can be used as a simple image viewer, for those who don't like ImageMagick display application. It works smoothly, and again hitting the `q` key simply close the app, like Zathura. Above all, you can simply browse a whole directory, and the arrow keys help to switch to the previous/next (`left`/`right`) picture or to zoom in (`up`) and out (`down`). More information is available in the man page.

### Ranger file manager

I don't use a file manager in Neovim other than the builtin Netrw. I mapped the `-` key to browse the current directory, and that's fine. However, sometimes I need more: a directory browser, with preview available on demand. That's all what we get when we install [ranger](https://ranger.github.io/). It is powerful, really. You use the arrow keys (yes, I like the arrow keys!) to navigate your directories, and you use some magic combo like `zi` or `zp` to display images or files online (image previewing doesn't work in Tmux, though). And you can `:rename` or `:move` files using the command mode.


