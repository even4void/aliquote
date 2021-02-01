---
title: "Practical and Modern Vim"
date: 2021-01-29T21:08:07+01:00
draft: true
tags: ["review", "vim"]
categories: ["2021"]
---

Lately I read [Modern Vim]() and [Practical Vim](), by Drew Neil. I bought both books two years ago and I already read *Modern Vim* last Summer, but I forgot about *Practical Vim* for a long time. In fact, I started writing a review of Modern Vim, then let it go in my Drafts folder, and remove it a few weeks later. At that time, I was still using Emacs all day long, and I was just barely scratching the surface of Vim. Now that I'm using Neovim full time, I came to appreciate modal editing, but the most important thing, I believe, is that I discovered how to efficiently use the Insert and Visual mode, and why switching back to Normal mode is so important.

A few months ago I wrote a quick and dirty guide to Vim keybindings, for Doom Emacs users like me. Then I realized that I should embrace the Vim philosophy of text editing more closely. Hence the move, which also follows from the idea that I needed simpler tools, mostly oriented around the command-line, and which allow me to focus on one thing at a time.

## Modern Vim

Back to the subject's matter. While *Modern Vim* focuses on managing Vim 8 and Neovim, with an emphasis on cross-platform and cross-application compatibility (meaning, your very own config is likely to work on macOS and Linux, whether you use Vim 8 or Neovim). The author recommends a few packages to enhance Vim's core functionalities. I still use Vimplug, but Vim 8 and Neovim do have a native plugin manager. Among the recommended plugins are: [FZF](https://github.com/junegunn/fzf) (I  also recommend `fzf.vim`), `vim-projectionist` (I don't need this), `vim-dispatch` (not sure we really need this with the async features of Vim 8 and Neovim and a few custom settings for using `make`), `ale`, which is on my preferred plugin, together with `vim-polyglot` and `vim-fugitive`, for coding, `vim-grepper` (I don't use it since I rely on a hand-made Grep function, stolen from [strager](https://github.com/strager/dotfiles)'s Github repo), and `vim-test` (no need for this).

Chapter 5 is all about managing Neovim's internal terminal emulator, which is great compared to what used to exist in Vim. I already used vterm in Emacs, so I know it's a reliable choice (`shell`, `term`, `ansi-term` were always failing me at some point), and the author also discusses the use of ̀`neovim-remote` (aka `nvr`), which is mostly `emacsclient` for Neovim. Drew Neil also discussed the management of sessions, which I decided not to use deliberately. I now prefer to start from scratch every time I worked on an existing or a new project, and everything should be reproducible when restarting from scratch. The last chapter is about writing your own custom "autocommands" and defining specific settings that ought to apply globally, per project, or per buffer.

## Practical Vim

As noted by Tim pope in his preface to Practical Vim, this book is not a simple bag of tips and tricks.

> You can understand my skepticism, then, when I found out Practical Vim was using a tips format. How could a couple of hundred tips accomplish what took me thousands? A few pages in I realized my definition of “tip” was narrow- minded. In contrast to the problem/solution pattern I had expected, Practical Vim tips teach lessons in thinking like a proficient Vim user. In a sense, they are more like parables than recipes. The first few tips are lessons about the wide applicability of the . command. This is a staple of any proficient Vim user’s repertoire, yet without guidance it was years before I came to realize this on my own.

Rather it introduces core concepts for efficient editing in Vim and understanding why it is so. The later point is important because the reader get involved in the process of thinking about Vim in Vim terms, or rather using Vim vocabulary. I learned a lot of useful tips, indeed, but it also led me to rethink what a text editor really is, and how Vim can help me in my day to day tasks of text editing.

A striking feature of Vim is that you can organize your editing task much like you would do when using Git to manage your work in progress: You create some chunks of text, commit them, and then you can play around (move forward, revert, stash, etc.). Except that in the case of Vim, commiting is mostly switching back to Normal mode after you add some text in Insert mode. Much lower granularity, compared to Git, but this allows to operate on the latest chunk for, e.g., undoing things, copying or repeating, and things like that. The author insists on the idea of building repeatable actions inasmuch as possible, even for such a simple task like adding trailing period in an item list (`A;j.`).

> Our work is repetitive by nature. Whether we’re making the same small change in several places or moving around between similar regions of a document, we repeat many actions. Anything that can streamline a repetitive workflow will save our time multifold. Vim is optimized for repetition. Its efficiency stems from the way it tracks our most recent actions. We can always replay the last change with a single keystroke. Powerful as this sounds, it’s useless unless we learn to craft our actions so that they perform a useful unit of work when replayed. Mastering this concept is the key to becoming effective with Vim.

The author also discusses Ex commands. They may seem arcane, except for heavy Sed users, but they prove very useful in case you don't want to jump to the region or line of interest and just apply a command right from your insertion point.
