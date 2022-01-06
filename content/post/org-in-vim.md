---
title: "Org in Vim"
date: 2022-01-06T19:55:45+01:00
draft: false
tags: ["vim"]
categories: ["2022"]
---
It's been a few years since I last discussed the benefits of using Org rather than, say, Markdown. In short, the syntax is cleaner, it add further structural editing elements (like example, verse, etc.), it adds Babel code block (which works quite well under Emacs), Org tables are easier to manage than Markdown or Pandoc ones, and it is well interfaced with Pandoc. And for those who like GTD and stuff like that it has its own agenda and appointment management tool chain.

I wrote my [last post](/post/standalone-org-babel/) about it when I stopped using Emacs full time.[^1] At this time, there were two competitors to Emacs org-mode in Vim: [vim-orgmode](https://github.com/jceb/vim-orgmode) and [vimwiki](https://github.com/vimwiki/vimwiki). These plugins were surely not as powerful as org-mode, and neither provided agenda-like or code block facilities. I ended up writing Org mode as I do write Markdown, as plain text. Now, things have changed a little as far as Markdown is concerned since a [Treesitter parser](https://github.com/MDeiml/tree-sitter-markdown) has been made available. And today I just came across [orgmode](https://github.com/nvim-orgmode/orgmode), which is specifically designed for Neovim users and relies on Treesitter for the most part.

I installed this plugin alongside [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode), and everything works as advertised. I didn't tested the agenda facilities since I no longer rely on it in my daily workflow.[^2] In particular, I like the fact that I get automatic folding as one would expect when working with Emacs. I do not use the concealing feature for links and other emphasized pieces of text, but they look to work too, provided you `set conceallevel=2` in your config or from the command line when editing your file. For editing purpose at least, it is enough for me. Below is a screenshot of my [Vim 101 tutorial](/pub/vim-101.pdf), which I wrote in Emacs [two years ago](/post/emacs-org-tufte-handout/).

![orgmode](/img/2022-01-06-20-56-25.png)

If you take a look at the online help for `orgmode`, you will soon notice that it focus on agenda functionalities. I hope that automatic evaluation of code blocks will be integrated soon. I tried [sniprun](https://github.com/michaelb/sniprun) breifly in the afternoon, and although it is very approachable and it provides a concise way to evaluate code block and displaying results using modern features like virtual text, it does not support Lisp-like PLs (Common Lisp, Scheme or Clojure). We'll see how it goes then. In the meantime, the vim-table-mode is a killer feature since it even works for any filetype in Vim.

This is my first post of the year, by the way. Happy new year to all of you!

{{% music %}}Camille Berthollet & Julie Berthollet • _The Leftovers, Suite_{{% /music %}}

[^1]: See also [Emacs Org and Tufte handout](/post/emacs-org-tufte-handout/), [Org custom CSS](/post/org-css-design/), or [Org exports](/post/org-workflow/).
[^2]: I've been using Org agenda for two years, and I used to manage everything (meeting notes, projects tasks and TODO lists, appointments) in Emacs using org-mode. Then I realized once again that GTD and workflow like that are definitely not for me. A simple TODO list in plain text and Changelog are enough for me, together with Git history.
