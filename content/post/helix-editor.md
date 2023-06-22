---
title: "Helix editor"
date: 2022-04-23T20:28:05+02:00
draft: false
tags: ["app"]
categories: ["2022"]
---

And here's a fresh new text editor: [Helix]. In fact, I heard about about Helix one year ago, when it was still in early alpha, but I didn't pay much attention to it. It is written in Rust, as many of the little apps (fdfind, exa, tig, etc.) I use all the day, much like one of the best-selling [UI for Neovim](not tested).

Apparently, Helix got inspired by both Vim and Kakoune. It ships with LSP-ready configurations, as well as a default picker. How long will it stay on the "market", I don't know, but I like the idea. The best comment I found on [Hacker News](HN) thus far was the one by [rodgerd]:

> If you're trying to get people to try your new editor, no matter how awesome the ideas that you're trying, you're going to lose a chunk of your audience if it doesn't support C syntax highlighting, a chunk if it doesn't support Python intellisense, and so on and so forth. You can have the best idea in the world, but people will play with it, and decide that they love it but can't use it for "real work" unless you slog through adding native support for a bunch of languages and runtimes/compiler suites.<br>
> That's a huge burden.<br>
> Now, if you implement LSP, you get "for free" support for C#, C, Python, Rust, etc etc. People can evaluate your editor on its merits as a text editor, not on whether you had the time and energy to add support for their favourite language.<br>

Soon after this comment, the whole comment thread starts to be a replay of the Vim vs. Emacs flame, and point-and-click vs. keyboard-driven approaches to text editing. I hope HN will still be alive after Twitter burned out of Hell.

I spent a few hours playing with Helix today. I compiled it from scratch using `cargo` and followed the instructions to set up its runtime (865 Mo!) and so on. It works really great, I mean for a text editor written from scratch in Rust. I really like the experience, even if some keybindings are not that intuitive when coming from (Neo)vim. This is easily [configurable](https://raw.githubusercontent.com/LGUG2Z/helix-vim/master/config.toml), though. Modal editing is great in any case, and I suspect it would look even more natural for people coming from [Kakoune](https://kakoune.org/) which I never tried. For those coming from Neovim, I would say it feels the same, with sane defaults. The built-in LSP and Treesitter integrations work as advertised, and you also get some DAP debugging for Rust and C/C++. The configuration is easy to manage (this is a simple toml file), and there are plenty of gorgeous color themes to choose from. I do not really like the popup window that presents available combination of keypresses (much like which-key in Emacs or Vim), but I guess some like it. I am more comfortable with my own config for Neovim, but I would surely recommend Helix for anyone interested in a zero-config powerful text editor for coding. Fron what I've read over GitHub, the authors do not plan to add support for [third-party plugins](https://github.com/helix-editor/helix/discussions/3806). Maybe it's a good idea after all. Eventually, there may be a [GUI](https://github.com/helix-editor/helix/issues/39) at some point (one [screenshot](https://github.com/helix-editor/helix/issues/39#issuecomment-868931992) comes from this webiste, btw).

![img](/img/2022-11-09-21-24-33.png)

{{% alert note %}}
<small>[2023-06-22]</small><br>
Here is an [excellent review](https://phaazon.net/blog/more-hindsight-vim-helix-kakoune) of Helix, from an experimented (Neo)vim user, and how it compares to Neovim or Kakoune when it comes to performing simple or more complex editing tasks.
{{% /alert %}}

{{% music %}}Ida Sand • _Burning_{{% /music %}}

[helix]: https://helix-editor.com/
[ui for neovim]: https://neovide.dev/
[hacker news]: https://news.ycombinator.com/item?id=27358479
[rodgerd]: https://news.ycombinator.com/user?id=rodgerd
