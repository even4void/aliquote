---
title: "Mono color scheme for tty"
date: 2023-03-01T09:20:22+01:00
draft: false
tags: ["unix"]
categories: ["2023"]
---

I already discussed the use of [monochrome color scheme](post/monochrome-color-scheme/) in the past. The main benefit for me has been to avoid the "christmas tree" effect[^1] in my text editor (Neovim), but see [On choosing your colorscheme](/post/on-color-scheme/). Such minimalist settings helps me focus on the task at hand, while while maintaining high portability depending on the capabilities of the machines I work on (macOS and OpenBSD sometimes, ssh access to computing servers most of the time).

I use Zsh as my main shell, but sometimes I also use Bash. I keep a minimal `bashrc` config file in case I need to use my default settings on a remote server, and I have the following settings in my `.bashrc`, which I mostly use on virtual consoles or when connected via ssh:

```shell
if [ "$XDG_SESSION_TYPE" = "tty" ]; then
	unset LS_COLORS
	export TERM=xterm-mono
	export NO_COLOR=1
	alias ll="ls -alF"
	alias vim='nvim -c ":set notermguicolors" -c ":colorscheme mono"'
	PS1="\W \$ "
else
	eval "$(starship init bash)"
fi
```

As can be seen, if we are connected via ssh or a simple tty, we'll be disabling most of the fuzz defined elsewhere to prettify the prompt, using [exa](https://the.exa.website/) for nice listing, etc. I also use these settings for running a terminal inside Neovim, for example.

Regarding other TUIs, I have chosen color schemes that can accommodate black & white screen either by using few colors (Tmux or Irssi) or by defining mono color (Neomutt). The "mono" colorscheme for Vim is inspired by Joshua Stein [own color scheme](https://github.com/jcs/dotfiles/blob/master/.vim/colors/jcs.vim),[^2] who also authored the [NO_COLOR](https://no-color.org/) site. Here is my default theme (left) and the mono theme (middle) when editing this post:

{{< fluid_imgs
"pure-u-1-3|/img/2023-02-28-20-42-10.png"
"pure-u-1-3|/img/2023-02-28-20-43-57.png"
"pure-u-1-3|/img/tty3.png" >}}

Overall I quite like working on a virtual console, especially since I can still listen to music running on Cmus in a regular X session, and the right panel above shows how it looks like.

{{% music %}}Dave Gahan & Soulsavers • _Metal Heart_{{% /music %}}

[^1]: Nicolas P. Rougier. [On the design of text editors](https://arxiv.org/abs/2008.06030). arXiv:2008.06030 [cs.HC], 2020.
[^2]: Basically, I just removed the underline attribute for most text elements.
