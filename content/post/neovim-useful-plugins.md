---
title: "Neovim useful plugins"
date: 2021-07-29T20:30:45+02:00
draft: true
tags: ["vim"]
categories: ["2021"]
---

« [Previous post](/post/vim-lsp/) in this series

Since I decided to keep my setup as lightweight as possible, and to rely on (Neo)[vim builtins](https://www.moolenaar.net/habits.html) as much as I can, I have no other packages than those listed in the very first post of this series. However, I keep looking at new Neovim-related plugins, written in Lua since I expect them to be faster and easier to integrate than their Vim-only counterparts. For a full list of awesome (or not) plugins, you can check out this [list hosted on Github](https://github.com/rockerBOO/awesome-neovim).

Here is a list of plugins that I am particularly interested in:

- [nvim-autopairs](https://github.com/windwp/nvim-autopairs): I've been using [delimitMate](https://github.com/Raimondi/delimitMate) for a long time, then [auto-pairs](https://github.com/jiangmiao/auto-pairs). Each time I had to write custom exceptions because I write a lot of text files and sometimes Lisp. I ended up with this poor man version, which has the benefit of not providing systematic but most of the time useless completion for single and double quotes, though:

  ```vim
  inoremap ` ``<left>
  inoremap ( ()<left>
  inoremap { {}<left>
  inoremap {<CR> {<CR>}<ESC>O
  ```

  This plugin, however, looks like the new kid on the block for Neovim users apparently. At present, I prefer to type parenthesis, brackets and the like myself, but I may change my mind.

- [surround.nvim](https://github.com/blackCauldron7/surround.nvim): Again, I used to use a handmade simplified version of Tim Pope's awesome plugin:

  ```vim
  vnoremap _" :call chl#text#surround('"', '"')<CR>
  vnoremap _' :call chl#text#surround("'", "'")<CR>
  vnoremap _( :call chl#text#surround('(', ')')<CR>
  vnoremap _= :call chl#text#surround('`', '`')<CR>
  vnoremap _[ :call chl#text#surround('[', ']')<CR>
  vnoremap _{ :call chl#text#surround('{', '}')<CR>
  ```

  It does more or less what I generally need to do: surround one or two words using specific delimiters. This new plugin looks interesting, though, as it provides two modes (sandwich and surround) in normal mode, but also special keybinding in insert mode.

- [neorg](https://github.com/vhyrro/neorg): As a long time Org user, I was intrigued by this new plugin, which is not completely a rewrite of Emacs Org mode for (Neo)vim but introduces some new features, like simplified key mapping, improved code blocks with Treesitter integration, and builtin completion. It looks amazing, although I'm not sure I will switch to the new ".norg" filetype for the time being. In fact, I barely write any Org document these days, except those I drafted last year taht I hope to complete one day or the other, this year.

- [nord.nvim](https://github.com/shaunsingh/nord.nvim): I no longer use the wonderful Nord theme since I switched back to a light theme (every app, not only CLI tools). I have a copy of the original Nord theme in my `colors/` directory, but I barely use it (only when my eyes are to tired at night). However, this theme adds support for a lot of plugins I currently use, and it seems to treesitter-aware.

- [vim-ultest](https://github.com/rcarriga/vim-ultest)
