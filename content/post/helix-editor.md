---
title: "Helix editor"
date: 2022-04-23T20:28:05+02:00
draft: false
tags: ["misc"]
categories: ["2022"]
---

And here's a fresh new text editor: [Helix]. In fact, I heard about about Helix one year ago, when it was still in early alpha, but I didn't pay much attention to it. It is written in Rust, as many of the little apps (fdfind, exa, tig, etc.) I use all the day, much like one of the best-selling [UI for Neovim] (not tested).

Apparently, Helix got inspired by both Vim and Kakoune. It ships with LSP-ready configurations, as well as a default picker. How long will it stay on the "market", I don't know, but I like the idea. The best comment I found on [Hacker News] (HN) thus far was the one by [rodgerd]:

> If you're trying to get people to try your new editor, no matter how awesome the ideas that you're trying, you're going to lose a chunk of your audience if it doesn't support C syntax highlighting, a chunk if it doesn't support Python intellisense, and so on and so forth. You can have the best idea in the world, but people will play with it, and decide that they love it but can't use it for "real work" unless you slog through adding native support for a bunch of languages and runtimes/compiler suites.<br>
> That's a huge burden.<br>
> Now, if you implement LSP, you get "for free" support for C#, C, Python, Rust, etc etc. People can evaluate your editor on its merits as a text editor, not on whether you had the time and energy to add support for their favourite language.<br>

Soon after this comment, the whole comment thread starts to be a replay of the Vim vs. Emacs flame, and point-and-click vs. keyboard-driven approaches to text editing. I hope HN will still be alive after Twitter burned out of Hell.

{{% music %}}Ida Sand • _Burning_{{% /music %}}

[helix]: https://helix-editor.com/
[ui for neovim]: https://neovide.dev/
[hacker news]: https://news.ycombinator.com/item?id=27358479
[rodgerd]: https://news.ycombinator.com/user?id=rodgerd