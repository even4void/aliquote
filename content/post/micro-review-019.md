---
title: "June in review"
date: 2022-06-25T21:08:13+02:00
draft: false
tags: ["readings"]
categories: ["2022"]
---

Things from the internet that I heard about recently, a [year after].

- If I weren't so satisfied of my [current laptop], I would surely look for another one from System76: [this one], for example, looks gorgeous in terms of specs.
- [Start all of your commands with a comma](https://rhodesmill.org/brandon/2009/commands-with-comma/): I like the idea of distinguishing user commands from system commands, but I find it weird to prefix all of them with a comma. Perl or Emacs Lisp users are used to use the `my` prefix, I guess, and Zsh has underscore for builtin functions.
- <https://pyscript.net/> looks great. Wasm is the way to go IMHO, and it is surely as promising as the Electron framework some years ago. BTW, [atom is dead].
- [Effective Shell](https://effective-shell.com/). As they said: "This book is for anyone who is interested in computing, and wants to learn more about the exciting, but sometimes daunting world of The Shell."
- [One-liner for running queries against CSV files with SQLite](https://til.simonwillison.net/sqlite/one-line-csv-operations). Interesting tibbits. Together with [dsq], there's plenty of opportunity to run SQL queries on flat files from the command-line.
- If you feel nostalgic at times, you can always download the [mini vMac 36.04].
- [Using ftplugin to tidy my Vim configuration](https://www.jackfranklin.co.uk/blog/using-ftplugin-in-vim/). I used it a lot too:

  ```shell
  ~/.config/nvim % tree after
  after
  └── ftplugin
      ├── bib.vim
      ├── cmake.vim
      ├── css.vim
      ├── c.vim
      ├── gitcommit.vim
      ├── haskell.vim
      ├── help.vim
      ├── lisp.vim
      ├── lua.vim
      ├── markdown.vim
      ├── org.vim
      ├── python.vim
      ├── qf.vim
      ├── racket.vim
      ├── rmd.vim
      ├── rnoweb.vim
      ├── rust.vim
      ├── r.vim
      ├── scheme.vim
      ├── sql.vim
      ├── stata.vim
      ├── text.vim
      ├── tex.vim
      ├── vim.vim
      └── zsh.vim

  1 directory, 25 files
  ```

- [Inconsistent thoughts on database consistency](https://www.alexdebrie.com/posts/database-consistency/). I used to do a lot more SQL back in the days, so whenever I came across a post about SQL or NoSQL database I read it. This one is about consistency in ditributed DBs, which may be understodd differently depending on the point of view of the reader.

> Your language isn’t broken, it’s doing floating point math. Computers can only natively store integers, so they need some way of representing decimal numbers. This representation is not perfectly accurate. This is why, more often than not, 0.1 + 0.2 != 0.3. --- [Floating Point Math](https://0.30000000000000004.com/)

{{% music %}}The Clash • _Groovy Times_{{% /music %}}

[year after]: /post/micro-review-018/
[current laptop]: /post/welcome-ubuntu/
[this one]: https://system76.com/laptops/lemur
[atom is dead]: https://github.blog/2022-06-08-sunsetting-atom/
[dsq]: https://github.com/multiprocessio/dsq
[mini vmac 36.04]: https://www.gryphel.com/c/minivmac/download.html
