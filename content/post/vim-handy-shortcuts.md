---
title: "Some handy shortcuts for Vim"
date: 2022-03-23T14:07:02+01:00
draft: false
tags: ["vim"]
categories: ["2022"]
---

Over the past two years where I've been using Neovim exclusively, I settled upon a few keybindings that I found on the internet and that I came to appreciate. I should note that I am now using [Telescope] instead of vim-fzf, and so many mappings are provided by this Neovim plugin:

- `<C-s>` in insert mode, this is used to correct the last typo (using the first suggestion) while in normal mode it allows to replace the word under the cursor.[^1]
- `<C-p>` to navigate files (`Telescope find_files`).
- `<C-q>` calls a little function to close or open the quickfix (if there're some items to show).
- `<C-n>` to open a quick tree viewer (this is just the built-in `:15Lexplore<CR>`); I use this less often than `-` for `:Ex<CR>`.
- `<leader>g` and `<leader>G` to quickly check git status (for the whole directory or the current buffer).
- `<C-f>` as a shortcut for `Telescope live_grep`; using the Ivy theme and a 20% window at the bottom, it really shines. See the screenshot at the end of the post.
- `<C-x>` is actually a shortcut for `"_dP`, and it is pretty cool since it allows to visually select a region and paste it over and over again on visual blocks selected afterwards.
- `<C-h>`, `<C-j>`, `<C-k>` and `<C-l>` to increase/decrease split width or height (e.g., `<C-h>` stands for `:vertical resize -4<CR>`).
- `<C-Left>` and `<C-Right>` to navigate between tabs, since I can use w/b and W/B for horizontal word-wise motion.
- `<leader><leader>` to switch between opened buffers (`Telescope buffers`). Note that `<C-b>` would be better, but it's already the primary key for Tmux and I became used to the space-space combo after 3 years of Doom Emacs.
- `<leader>e` which is basically `:e <C-R>=expand("%:p:h") . "/" <CR>`; I used it most of the day, since it allows to quickly open a file in the current working directory, with tab completion.
- `<leader>r` as a shortcut for `Telescope oldfiles`.
- `<leader><tab>` and `<localleader><tab>` to create new tab and switch to the next tab, respectively.
- `<leader>$` and `<leader>!` to open a terminal in a new tab or in a split, respectively.
- `<localleader>s` or `<localleader>S` to sort a region in lexicographic order (increasing or decreasing).[^2]
- `<localleader>"` for [Neogen]

See also this related post: [Custom Vim shortcuts (2/n)](/post/vim-shortcuts/).

In addition to the above, I also have handy shortcuts for [Magma], `vim-surround`-like stuff,[^3] etc.

![](/img/2022-03-23-15-20-21.png)

Finally, I don't really like or need snippet engines, so I just defined some handy abbreviations, like this:

```vim
iabbrev +w []()
iabbrev +@ chl@aliquote.org
iabbrev +% --8<--------<CR>-------->8--<Up>
iabbrev +' ``
iabbrev +" ```<CR><CR>```<Esc>2k
iabbrev +:: ¯\_(ツ)_/¯
iabbrev +:( ಠ_ಠ
iabbrev +:) ಠ‿ಠ
```

{{% music %}}Charlie Haden • _Conception_{{% /music %}}

[^1]: ``<c-g>u<Esc>[s1z=`]a<c-g>u`` (Credit: [Gilles Castel], see also [Francis Tseng] or [SO]), and `:let @s='\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//<Left>` and `sy:%s/<C-r>s//<Left>` (Credit: [bluz71])
[^2]: `vip:sort u<CR>` in visual mode and `:sort u<CR>` in normal mode (Credit: [strager])
[^3]: E.g., `vnoremap _( :call text#surround('(', ')')<CR>`

[Telescope]: https://github.com/nvim-telescope/telescope.nvim
[Gilles Castel]: https://castel.dev/post/lecture-notes-1/
[Francis Tseng]: https://spaceandtim.es/etc/vim_notetaking/
[SO]: https://stackoverflow.com/q/5312235/420055
[bluz71]: https://bluz71.github.io/2019/03/11/find-replace-helpers-for-vim.html
[strager]: https://github.com/strager/dotfiles
[Neogen]: https://github.com/danymat/neogen
[Magma]: /post/jupyter-kernels-in-vim/
