---
title: "Vim on steroid (5/n)"
date: 2021-07-30T20:15:26+02:00
draft: false
tags: ["vim"]
categories: ["2021"]
---

« [Previous post](/post/neovim-useful-plugins/) in this series<br>
» [Next post](/post/neovim-wrapup/) in this series

I have been a happy user of [fzf.vim](https://github.com/junegunn/fzf.vim) for the past few months. I use [fzf](https://github.com/junegunn/fzf) in my Terminal as well, so it looked natural to me to use it as a fuzzy finder in Vim too. It is quite straightforward to configure, and it works perfectly well. Zero dependencies, other than `fzf` itself, and it provides a bunch of options to manage your buffers, files in project, recent files, git commits, and more. The natural replacement for `fzf.vim` appears to be [Telescope](https://github.com/nvim-telescope/telescope.nvim) in Neovim. It comes as full featured as `fzf.vim`, but also supports floating windows and additional extensions, which are installed either as separate plugins or as opt-in packages.

I don't really like floating windows, but I now find them useful when it comes to previewing results for live grepping in a project or fuzzy finding expressions in the current buffer. I like to think of fuzzy searches using Telescope as "natural extensions" of Vim's builtin facilities: `*`, `/`, and `:Grep`. I remapped each of these shortcuts to their telescope counterparts, as discussed in my previous post (I use `?` for `:Grep`).

What's really nice is that you can configure each tool to use a separate layout, for instead you could tell Telescope to use a "dropdown" menu for `find_files` while using a full "Preview+Result+Query" floating window for `live_grep`. After a week of using my new config, I decided that I still prefer a 10% high window at the bottom of Neovim to find files, recent items or buffers, while I use floating window for queries for which viewing results is really informative (e.g., context, exact match and surroundings). Here is how I do:

```lua
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    selection_caret = "» ",
    entry_prefix = "  ",
    initial_mode = "insert",
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    file_ignore_patterns = {},
    color_devicons = false,
    use_less = true,
    set_env = {['COLORTERM'] = 'truecolor'},
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      -- theme = "dropdown",
      theme = "ivy",
      layout_config = {height = 10},
      previewer = false,
      mappings = {
        i = {["<c-d>"] = require("telescope.actions").delete_buffer},
        n = {["<c-d>"] = require("telescope.actions").delete_buffer}
      }
    },
    find_files = {
      theme = "ivy",
      layout_config = {height = 10},
      previewer = false
    },
    oldfiles = {
      sort_lastused = true,
      theme = "ivy",
      layout_config = {height = 10},
      previewer = false
    },
    command_history = {
      sort_lastused = true,
      theme = "ivy",
      layout_config = {height = 10},
      previewer = false
    },
    current_buffer_fuzzy_find = {
      previewer = false
    }
  }
}
```

The key here is to ask for the "ivy" layout, which is as close as possible to what I was exposed to when using `fzf.vim`.

I also like the option of deleting buffers from the buffer list using `C-d`. What I especially like, though, is the fact that you can preview Grep hits in multiple buffers without having them opened and listed in the buffer list. This is pretty cool compared to my previous solution, which relied on a combination of Grep and the Quickfix window. Also, Telescope is able to display the Quickfix list in its own floating window. I use this functionality a lot in combination with [lsp-trouble](https://github.com/folke/trouble.nvim) or `nvim-lsp` for diagnostics.
