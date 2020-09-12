---
title: "Using LSP from Neovim"
date: 2020-09-11T18:06:22+02:00
draft: false
tags: ["vim"]
categories: ["2020"]
---

I already mentioned in several posts related to [Emacs](/tags/emacs/) that I'm using Neovim more and more since a few months. Here are a few thoughts about using LSP clients in Neovim, almost for free.

I like writing in Vim actually. Now that I begin to be more comfortable with modal editing and Vim motions, I think I probably missed a lot of good stuff by not trying Emacs Evil mode earlier. The only things I really added is `C-a` and `C-e`, because I'm so used to using these shortcuts in Emacs and the terminal.

Of course, it all started with everyone's nice configuration I found on Github, starting with the very lightweight ones written by [Suz Hinton](https://github.com/noopkat/dotfiles) or [Tom MacWright](https://macwright.com/2018/06/17/how-and-why-vim.html) (unfortunately, these config are very oriented toward JavaScript development). Lately, I've tried a bunch of different plugins for coding, especially those relying on the language server protocol, namely [Coc](https://github.com/neoclide/coc.nvim) and Neovim builtin [LSP client](https://neovim.io/doc/user/lsp.html) (for version ≥ 0.5). In my opinion, Coc is more complete and everything works smoothly compared to Neovim builtin package, but things may change in the future.

Lately, I removed almost all the coding stuff I added in my config files to keep only things I consider essential to boosting my productivity when using Vim: [ale](https://github.com/dense-analysis/ale), [vim-commentary](https://github.com/tpope/vim-commentary), [vim-surround](https://github.com/tpope/vim-surround), [vim-polyglot](https://github.com/sheerun/vim-polyglot), [vim-fugitive](https://github.com/tpope/vim-fugitive), [git-messenger.vim](https://github.com/rhysd/git-messenger.vim), [vim-gitgutter](https://github.com/airblade/vim-gitgutter), [fzf](https://github.com/junegunn/fzf.vim), [vim-airline](https://github.com/vim-airline/vim-airline) (there are some additional plugins that go along the ones mentioned, like `airline-themes` or `fzf.vim`). Anyway, 18 packages is enough for most of my editing tasks, while I need 10x more packages in Emacs to get a TUI experience close to this one. I miss Coc when editing R or Python files, however. Anyway, 18 packages is enough for most of my editing tasks, while I need 10x more packages in Emacs to get the TUI experience.

Then I realized that ale has almost everything I needed, namely "go to definition", "find references", "rename", "display information", in addition to its linter and fixer capabilities. Indeed, I learned recently that it can be configured to use any LSP available locally, which means that I can ask ale to use pyls for linting, instead of flake8 or pylint. The following settings are all we need to make Ale behave like Emacs lsp-mode with its default configuration for Python (pyls + black):

```vim
let g:ale_linters = {'python': ['pyls']}
let g:ale_fixers = {'python': ['black']}
```

Of course, more [complex](https://dev.to/drmason13/configure-neovim-for-rust-development-1fjn) or [fancy](https://phaazon.net/blog/editors-in-2020) [setups](https://www.vimfromscratch.com/articles/vim-for-python/) do exist, but I just want something light which relies on as few packages as possible. Ale does the job, even if it seems slower than Coc or Emacs lsp-mode, at least for the actions I use regularly. The fact that Ale comes as a standalone plugin and relies on external tools when available but has no strong dependencies, like Node in the case of Coc, is really a great asset. Not only does this mean that, from a Vim point of view, we only need to update Ale, but aalso that there's less risk of collision between dependencies, like in Emacs or when using Coc or nvim-lsp with other plugins.

Regarding C/C++, here's what I use: (still work in progress!)

```vim
let g:ale_c_clang_executable = '/usr/local/opt/llvm/bin/clang'
let g:ale_c_clangd_executable = '/usr/local/opt/llvm/bin/clangd'
let g:ale_c_clangd_options="--background-index -j=4 -log=error"
```

I still have to find how to configure `cmake` and [clang-format](https://duckduckgo.com/?t=ffab&q=clang-format&atb=v235-7&ia=web) properly, as well as add [rust-analyzer](https://github.com/rust-analyzer/rust-analyzer).

The documentation is also gorgeous (even if I find navigating into the help pages a bit tricky compared to Info page). Take a look at the screenshot below to see what I mean:

![ale](/img/2020-09-12-08-07-46.png)
