---
title: "One Week With Ubuntu"
date: 2020-12-20T12:22:15+01:00
draft: false
tags: ["unix", "vim", "emacs"]
categories: ["2020"]
---

It's been one week now that I'm back on a Linux laptop. Overall, this was a pleasant experience, and I barely miss anything from my previous Macbook setup. The machine itself is comfortable, and I am happy to see that running a full-featured OS does not require much more than 1 Go, compared to the 3.5 Go already eaten up by macOS after a fresh reboot.

Besides, I settled up on a few text-based applications that I like for my personal and work-related workflow, namely [Neovim](https://neovim.io/),[^1] [Neomutt](https://neomutt.org/), [irssi](https://irssi.org/), [newsboat](https://newsboat.org/). They are running on top of a Zsh shell in [Kitty](https://sw.kovidgoyal.net/kitty/), using dark on light minimalistic theme, with additional goodies like `fzf` or `ripgrep`. I feel like this allows me to do almost anything I want without using the mouse, since the default Ubuntu window manager provides me with handy shortcuts to resize and move window all around the virtual desktops. In some sense, I believe I'm done with configuring those tools to suit my needs: I spend the last 7 months to make zsh, kitty, nvim, git, rg, fzf and irssi behave the way I like. Now I am happy with using a few key bindings to achieve what I want in either one of those TUIs, and that's it!

> After years on a constant tinkering diet, my configuration has reached a point where everything I need from it is covered. The key word in the previous statement is everything. What is this everything I use Emacs for? --- [The end of an era?](https://www.manueluberti.eu/emacs/2020/09/08/end-of-era/)

I feel the same, except that I'm not tied to Emacs anymore. As I said, I can use Neomutt or newsboat as a replacement for mu4e and elfeed. Org files are just plain text files that are easily manageable with any text editor (I even used to use TextEdit sometimes under macOS for that purpose), and I will write my own shell scripts to manage my BibTeX records. This should not be a big deal, and probably less overkill than installing Go and binaries all around to use [bibtex-ls](https://github.com/msprev/fzf-bibtex).

Of course, this doesn't mean I won't be using Emacs anymore. I just need to rewrite my own init file from scratch. I'm tired of frameworks and starter kits that mean nothing to me anymore.

And, for the record, here's the triumvirate for checking news on the internet.

{{< fluid_imgs
"pure-u-1-3|/img/2020-12-20-12-21-50.png"
"pure-u-1-3|/img/2020-12-20-12-46-54.png"
"pure-u-1-3|/img/2020-12-20-12-47-54.png" >}}


[^1]: I should note that my config is almost entirely compatible with Vim 8.
