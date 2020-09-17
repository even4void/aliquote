---
title: "Minimalist Emacs"
date: 2020-09-16T19:44:09+02:00
draft: true
tags: ["emacs"]
categories: ["2020"]
---

I've spent the last two years tweaking my Emacs config, especially the tools I find useful for my daily work and the UI in general. As I already said in the past, when you spend several hours in front of your text editor, it shall be to your liking.

During the last weeks, I spent a fair amount of time reducing the unnecessary glitter around the GUI, then the TUI, and finally the number of packages I depend on. I'm now well under 300 packages and less than 1.5s of startup. I could surely do a little bit more, but I'm overall happy with the job done. I'm not the [only one](https://www.manueluberti.eu/emacs/2020/09/08/end-of-era/) apparently, and I'm glad to know that [others](https://github.com/rougier/elegant-emacs) are also cultivating the idea of minimalist interfaces.

Here are the packages/modules I removed along time, or those I never used anyway. The following mostly refers to Doom Emacs [naming conventions](https://github.com/hlissner/doom-emacs/blob/develop/init.example.el) (wrt. modules and packages):

- `doom-modeline` is too bloated, I very much prefer the light version than Henrik Lissner developed alongside.
- `treemacs`, it's fine but how often do you use a project sidebar when the project is very large, and for what purpose? Compared to `dired`, it comes with very few options to manipulate the file system. Note that if you're using LSP, there's `lsp-treemacs`, which might be interesting for those who need an overview of symbols, class hierarchy or errors, but I usually don't need this for Python, C or Rust (which are the only mode in which `lsp-mode` is insinuated).
- `vi-tilde-fringe`, not visually appealing and useless once you let Emacs manage whitespace cleaning on save.
- `minimap`, why needs this seriously?
- `tabs`, no thanks. I've come to appreciate the idea of windows (workspaces in Doom Emacs) and buffers, and I know how to navigate efficiently in this space.
- `window-select`, which is mostly about adding more options to navigate between opened buffers in the same window adds nothing to my current workflow, where I tend to use few splits, and a workspace-based approach to buffer arrangement.
- `dashboard`, I never used so it hasn't to be uninstalled, but I wonder what purpose it really serves.
- `doom-fancy-priorities` no longer appeared interesting to me, especially since I rarely flag todo items with priority levels.
- `fill-column` and `indent-guides` were quite good actually, but they don't play nicely when Emacs run in a terminal. In any case, Emacs auto-indent features are the best on Earth, so why do I need to bother.
- ligature support: this has been a well-thought-out idea before complete removal, but now that I use JetBrains Mono and Kitty, with built-in support for ligatures, I no longer have to worry about using ligatures in a GUI --- with the added benefit that I no longer encounter any problem with alignment of block continuation (e.g., in R, if you add a new line to separate a long list of arguments, it gets correctly aligned with the opening parenthesis except that ligatures as implemented using `prettify-symbols-mode` and the like usually account for two characters instead of one, which makes things ugly when you're viewing the text in another text editor or on GitHub). I know Emacs 28 offers a better option to manage ligatures, but I'm happy with my current settings so I won't upgrade for the moment.

I finally learnt to manage my Org files in such a way that I can now get an overview of my daily activities in Org agenda, while keeping track of what I've done in the past using simple todo lists. I'm not an GTD guy. I understand the idea, but I only manage a few files: a todo list, a collection of meeting notes, and a daily log book. There are additional files in my Org directory, but these are mostly auxiliary files that I don't need to consult as often as the above working files. I don't have much use of functionalities like archiving, refiling, clocking, or acting on whole subtrees. This may change in the future, as I slowly learn all the benefit of archiving everything in plain text.

I'm now fully into [mu4e](https://www.djcbsoftware.nl/code/mu/mu4e.html) for processing my emails. This is not too surprising since I have been using it for almost 8 years now, but I never used it exclusively.

I'm also becoming more proficient when using Vim modal editing (either using Evil mode or in Neovim). There's no other choice in fact since I cannot really use the mouse in Kitty, except for selecting (and mouse-pasting). This probably is the biggest change in my writing workflow for the past 20 years! I like it, though. First, I like changing my mind if I happen to see any benefit in the alternative, and using modal editing helps me reconsider the way I can process test and code using a keyboard and my mind.
