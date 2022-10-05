---
title: "Alacritty"
date: 2022-10-05T14:48:43+02:00
draft: true
tags: ["app", "unix"]
categories: ["2022"]
---

Three weeks ago, I managed to solve a recurring problem on my Ubuntu workstation: using reliable and portable settings for Bash, Zsh and Tmux. I don't use Bash as an interactive shell that often but I like having it configured anyway. Since most of my aliases and functions are written for Zsh, which is the shell I use all day, I needed to make them available for Bash, as well various environment variables and `PATH` settings. I ended up using a common `$HOME/.config/profile.d` directory, easy to stow or to version control, to store all my login settings, and keep using `$HOME/.config/zsh` for interactive shell stuff, with appropriate links from `$HOME/.bashrc`. Since I use [starship] to define my prompt, it applies equally well to Bash or Zsh. Problem solved.

Even if I find Gnome terminal really great, I wanted to get ride of window decorations to really benefit from the [Tactile] shell extension. To my knowledge, only Kitty and Alacritty allow to remove window decoration. I decided to give Alacritty a try since I already know KItty quite well but don't need an additional level of multiplexing.[^1]

{{% music %}}The Psychedelic Furs • _Love My Way_{{% /music %}}

[^1]: I stopped using Kitty on Ubuntu when I realized that it will probably never add support for terminal activity as what's available in Tmux. I had other problems I don't remember, but they may well be related to backward search in the scrollback buffer not available unless we had an extra Python plugin.

[starship]: https://starship.rs/
[Tactile]: https://extensions.gnome.org/extension/4548/tactile/
