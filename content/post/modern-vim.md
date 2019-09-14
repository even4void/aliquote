---
title: "Modern Vim"
date: 2019-05-03T20:38:43+02:00
draft: true
tags: ["review", "vim"]
categories: ["2019"]
---
Following my review of [Practical Vim](/post/practical-vim), here are some notes about *Modern Vim*, by xxx again.

<!--more-->

The book is also arranged as a list of recipes, coupled to some more in-depth discussion about, e.g., plugin management (the author is actually using the new Vim facilities to manage system-wide plugins), Vim vs. NeoVim (the latter is favored), and many other subtleties. Probably more than anything else, this book is about getting the right plugin to get the job done, effectively.

- `fzf`, for file management (aka opening files using a fuzzy finder). I've always been using `ctrl-p` because it looks so simple and it does the right job -- as expected, although it is assumed you only have a project-centric approach to file management. There's also `command-t`, `unite` (defunct) or `denite`, by the way. Note that if you remap the ex comand `:FZF` to `<C-p>`, as suggested by the author, you get back to your favorite shortcut, and everything is alright. There's another option that is discussed (Tip 8), which relies on semantically organized project files. I don't need this plugin (`vim-projectionist`), since it seems to be too much tied to how other people think project should be organized.
