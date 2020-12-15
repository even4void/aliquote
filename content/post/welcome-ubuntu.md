---
title: "Welcome Ubuntu"
date: 2020-12-15T15:45:06+01:00
draft: false
tags: ["unix"]
categories: ["2020"]
---
As I said in my [previous post](/post/bye-bye-apple), I recently switched to Ubuntu as my primary OS, as well as a new laptop (Latitude 7310, i7 8 cores, 16 Go RAM, 1To HD). It's a pretty sharp turn but was expected anyway.

Apart from a minor issue with Intel Rapid Storage Technology (which should be disabled if I understand correctly), I had no problem installing Ubuntu 20.06 LTS, and the installation was completed in less than 30 minutes. Of course I deleted the whole Windows partition, since I don't see what I could ever do with Windows. My last experience with Windows was before I started my PhD, and soon after I started using Linux.

The laptop is pretty good: sturdy and uncluttered shell, wide and comfortable screen, and a nice keyboard (those coming from the latest Macbook series shall understand what I mean here). Moreover, everything worked right out of the box once the installation finished. This means that I can use the mousepad, the front camera, bluetooth, and so on. This was to be expected from this [Dell laptop](https://certification.ubuntu.com/hardware/202003-27782) after all. I just have to get used to tne non-Mac keyboard.

The most striking things is that I'm now using Neovim for almost everything related to text-editing, rather than Emacs. I even installed and configured Neomutt as a replacement for `mu4e`. It's been hard work, though, compared to Emacs + `mu4e`. I keep using `mu` even if I don't really need it for Neomutt. I still installed Emacs, at least the version I found in the stable repositories (v 26.3). I gave up the idea of reinstalling the Doom framework. It works very well on my Mac after many customizations, but I haven't updated the packages or the framework itself since last summer and I can imagine that many things are now broken. That's what I like in (Neo)vim after all: with only a few packages and less than 100 LOC of custom settings I get a full-featured text editor. I'll keep using Emacs, of course, bbecause of Org, Lisp/Scheme and ESS, but I will certainly have to build my own init file again.

Beside, I didn't install any fancy window manager, and I am pretty happy with the default Gnome environment for the moment. The Gnome terminal is quite good, but I still prefer [Kitty](https://sw.kovidgoyal.net/kitty/). All of my previous config files for Kitty, zsh, Neovim, irssi, htop, git, ncftp are working fine, pending minor updates regarding path settings and the like. I guess I should be happy that at least TUI settings are working well across OSs.
