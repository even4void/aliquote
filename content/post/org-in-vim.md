---
title: "Org in Vim"
date: 2022-01-06T19:55:45+01:00
draft: true
tags: ["vim"]
categories: ["2022"]
---
It's been a few years since I last discussed the benefits of using Org rather than, say, Markdown. In short, the syntax is cleaner, it add further structural editing elements (like example, verse, etc.), it adds Babel code block (which works quite well under Emacs), Org tables are easier to manage than Markdown or Pandoc ones, and it is well interfaced with Pandoc. And for those who like GTD and stuff like that it has its own agenda and appointment management tool chain.

I wrote my [last post](/post/standalone-org-babel/) about it when I stopped using Emacs full time.[^1] At this time, there were two competitors to Emacs org-mode in Vim: [vim-orgmode](https://github.com/jceb/vim-orgmode) and [vimwiki](https://github.com/vimwiki/vimwiki). These plugins were surely not as powerful as org-mode, and neither provided agenda-like or code block facilities. I ended up writing Org mode as I do write Markdown, as plain text. Now, things have changed a little as far as Markdown is concerned since a [Treesitter parser](https://github.com/MDeiml/tree-sitter-markdown) has been made available. And today I just came across [orgmode](https://github.com/nvim-orgmode/orgmode), which is specifically designed for Neovim users and relies on Treesitter for the most part.

[^1]: See also [Emacs Org and Tufte handout](/post/emacs-org-tufte-handout/), [Org custom CSS](/post/org-css-design/), or [Org exports](/post/org-workflow/).
