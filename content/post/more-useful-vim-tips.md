---
title: "More useful Vim tips"
date: 2023-10-18T21:36:37+02:00
draft: false
tags: ["vim"]
categories: ["2023"]
---

It's been 3 years that I am using Neovim as my daily driver. I learned a lot of things in the mean time. The only things left are macros and registers, which I don't really use, except registers for basic stuff. Here is a list of things that come to my mind when I think about Vim (not the modal editor, rather the builtins):

- _Be lazy_ when you load plugins: I've been using [packer](https://github.com/wbthomason/packer.nvim) for two years and it was all good, I could get a startup time below 50 ms with a dozen of packages. Now that I use [lazy](https://github.com/folke/lazy.nvim), I got comparable improvements in startup time with even more packages.
- Don't forget _builtin commands_: There are a lot of useful commands already available in Vim, and many shortcuts that are worth learning, e.g., for manipulating windows and tabs or the `z` and `g` prefixed commands.
- _Search and replace using regex_ are powerful tools: Use capture groups eagerly, like in `:%s/\([0-9]*\).*/\1/`; also, don't forget you can save search results in a file, e.g. `g/pattern/.w! >> out.txt`, if you need to process them afterwards.
- Prefer a _low contrast monochromatic colorscheme_ to avoid Christmas tree-like effects; [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) should take care of highlighting the right stuff, and it will be helpful to perform [structural editing](https://github.com/nvim-treesitter/nvim-treesitter-textobjects).
- Use _templates for your one-liner_: You can define a set of autocommands or a simple mapping to insert a file right into your buffer; in the latter case, `:-1 read` allows to place a template file above the insertion point, in contrast to the default behavior of `:read`.
- `formatprg` and `equalprog` are invaluable if you don't use or don't have a relevant LSP at hand. Vim is quite good at indenting, so you're more likely to deal with `formatprg`. For instance, to format bibliographic entries in a Bibtex file, you could define `setlocal formatprg=bibclean\ -align-equals\ -brace-protect\ -delete-empty-values\ -fix-accents\ -quiet` in your `after/ftplugin/bib.vim`, and then `gqip` the current entry.
- You usually want to put your custom settings in `after/ftplugin` rather than `plugin`. If possible, keep it orthogonal to your init file so that you can use a minimal init file that is shareable across machines while your `after` folder get you load of enhancements to the core config.
- Read the documentation (and learn to navigate inside) rather than spending hours browsing the internet to learn about the latest cool plugins (which is only compatible with the next-to-last version of Neovim); that is, write small functions or commands that do 90% of what you expect, rather than plugging in yet another plugin. Most of what you will read from past [Vim wikis](https://vim.fandom.com/wiki/Vim_Tips_Wiki) still apply as of today in Neovim, so don't reinvent the wheel.
- We rarely need to `<C-z>` these days, thanks to the builtin terminal emulator.

{{% music %}}Yasmin Levy • _Mano Suave_{{% /music %}}
