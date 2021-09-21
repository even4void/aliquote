---
title: "Neovim wrap up (6/n)"
date: 2021-09-21T20:53:35+02:00
draft: false
tags: ["vim"]
categories: ["2021"]
---

« [Previous post](/post/vim-fuzzy-finder/) in this series

This is the last post in this series on my Neovim setup. I didn't cover as much as I wished initially. However, as my current configuration has remained relatively stable for the last two months, I deduce that I have done what I really need in terms of plugins and additional features. I must confess I also rewrote from scratch a minimal Emacs config to deal with Lisp languages from times to times. I installed VS Code long ago, but I barely use it. I guess I'll remain stuck in a terminal for quite some time to come.

Here's the list of plugins I have in my `init.lua`:

```
require('packer').startup(function()
  use "wbthomason/packer.nvim"

  use {'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}
  }
  use 'hoob3rt/lualine.nvim'

  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp_extensions.nvim'
  use 'hrsh7th/nvim-compe'

  use {'vlime/vlime', rtp = 'vim/', ft = 'lisp'}

  use 'mhartington/formatter.nvim'
  use {'itspriddle/vim-shellcheck', ft = 'sh'}
  use 'mfussenegger/nvim-dap'
  use {
    'b3nj5m1n/kommentary',
    ft = {
      'rust', 'python', 'haskell', 'c', 'cpp',
      'racket', 'julia', 'javascript', 'r', 'sh',
      'html', 'css'
    }
  }
  use {
    'theHamsta/nvim-dap-virtual-text',
    ft = {'rust', 'python', 'haskell', 'c', 'cpp'}
  }
end)
```

Well, that's it. I don't really need `lualine` (previously, I was using my own status line), but it's fast enough that I don't care. I know [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) superseded `nvim-compe` some time ago, but I don't really care as the later works for me. I really like `gitsigns` since it comes with built-in blame and hunk preview. Surely `treesitter` is a thing, but I'm waiting to see if [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) could be useable for Lisp/Scheme languages at some point. The `kommentary` plugin is not really necessary for my day-to-day scripting tasks in Bash or Python, but I keep it in case I need to work on biggish Python or Rust projects. I know the Debug Adapter Protocol is used in VS Code and Emacs. I tested it in my Python projects, and it works great. Let's see how it goes with C and Rust toy programs in the future. I know there are other alternatives to `formatter`, especially those who are closer to ALE than others, but actually my config is okay.

Here is my whole config in case you are interested (this includes Zsh and Tmux settings): [vim+zsh_2021-09-21.tar.gz](/pub/vim+zsh_2021-09-21.tar.gz).
