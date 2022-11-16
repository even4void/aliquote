---
title: "Vim shortcuts"
date: 2022-08-15T00:00:00
url: "/articles/vim/"
---

Here are the current Neovim mappings I came to feel comfortable with over time. This is by no means a reference card, and yes I do use the arrow keys for navigating into my buffers. It depends on motion range, though. Another key idea is that I use Tmux everyday and I like to have an unified set of mappings, beside the leader/prefix key. See my [blog posts](/tags/vim/) for how I started to use Vim and Neovim.

Note that I only have a dozen of plugins in my `start` and `opt` directories, in addition to part of [mini.nvim](https://github.com/echasnovski/mini.nvim) that I adapted to suit my needs better: (This may change in the future but usually I tend to remove plugins rather than add new ones.[^1] )

- [opt] `nvim-treesitter`, `nvim-treesitter-textobjects`, `Comment.nvim`, `nvim-lspconfig`, `nvim-parinfer`, `vimtex`, `fzf-hoogle.vim`, `cmake4vim`, `nvim-colorizer`;
- [start]  `packer.nvim`, `fzf.vim`, `fzf`

{{% alert note %}}
<small>[2022-10-05]</small><br>
I changed it all again! Latest setup described [here](/post/speed-up-neovim/). This means that some keybindings no longer apply to my current config. It's all in the details but I feel like a minimalist setup and almost zero dependencies are the take away message.
{{% /alert %}}

I prefer a minimalist setup these days, and I tend to rely on hand-on solutions for tasks I carry over and over. Many of those custom settings come from briliant Vimers who are acknowledged in my config files. Note that some of those mappings may override existing ones, whether they are somewhat redundant (e.g. <kbd>s</kbd> and <kbd>c</kbd>) or because I don't use them at all (e.g., some of the <kbd>Ctrl</kbd>, <kbd>g</kbd> or <kbd>z</kbd> combinations).

My leader is ","[^2] and I do not define specific mappings for the localleader in my main config files. It looks like I always misunderstood the role of the [localleader](https://learnvimscriptthehardway.stevelosh.com/chapters/06.html), and I decided to book it for my `after/ftplugin` custom settings.

<small>
<table border="0">
<tbody>
<tr>
<td><em>Mapping</em></td>
<td><em>Mode</em></td>
<td><em>Command</td>
<td><em>Role</em></td>
</tr>
<tr><td><kbd>&lt;C-a></kbd></td><td>c</td><td><kbd>:&lt;Home></kbd></td><td>Go to start of line</td></tr>
<tr><td><kbd>&lt;C-e></kbd></td><td>c</td><td><kbd>:&lt;End></kbd></td><td>Go to end of line</td></tr>
<tr><td><kbd>-</kbd></td><td>n</td><td><kbd>:Ex</kbd></td><td>Show explorer</td></tr>
<tr><td><kbd>,!</kbd></td><td>n</td><td><kbd>:10sp +te</kbd></td><td>Popup terminal</td></tr>
<tr><td><kbd>,.</kbd></td><td>n</td><td><kbd>:lcd %:p:h</kbd></td><td>Set local current directory</td></tr>
<tr><td><kbd>,x</kbd></td><td>n</td><td><kbd>:bp &lt;Bar> bd! #</kbd></td><td>Kill current buffer</td></tr>
<tr><td><kbd>,X</kbd></td><td>n</td><td><kbd>Only()</kbd></td><td>Keep only current buffer (custom)</td></tr>
<tr><td><kbd>,e</kbd></td><td>n</td><td><kbd>:e &lt;C-R>=expand("%:p:h") . "/"</kbd></td><td>Open file from current directory</td></tr>
<tr><td><kbd>&lt;Tab></kbd></td><td>n</td><td><kbd>:tabnext</kbd></td><td>Next tab</td></tr>
<tr><td><kbd>,&lt;Tab></kbd></td><td>n</td><td><kbd>:$tabnew</kbd></td><td>New tab</td></tr>
<tr><td><kbd>,&lt;S-Tab></kbd></td><td>n</td><td><kbd>C-wT</kbd></td><td>Move split to new tab</td></tr>
<tr><td><kbd>J</kbd></td><td>n</td><td><kbd>mzJ`z</kbd></td><td>Join lines (cursor stationary)</td></tr>
<tr><td><kbd>&lt;C-q></kbd></td><td>n</td><td><kbd>quickfix_toggle()</kbd></td><td>Close quickfix window (custom)</td></tr>
<tr><td><kbd>[Q</kbd></td><td>n</td><td><kbd>:cfirst</kbd></td><td>Go to first quickfix item</td></tr>
<tr><td><kbd>]Q</kbd></td><td>n</td><td><kbd>:clast</kbd></td><td>Go to last quickfix item</td></tr>
<tr><td><kbd>W!!</kbd></td><td>c</td><td><kbd>:w !sudo tee % >/dev/null&lt;Cr>:e!&lt;Cr></kbd></td><td>Save as root</td></tr>
<tr><td><kbd>&lt;C-s></kbd></td><td>i</td><td><kbd>&lt;C-g>u&lt;Esc>[s1z=`]a&lt;C-g>u</kbd></td><td>Fix last spelling error (repeat.)</td></tr>
<tr><td><kbd>,S</kbd></td><td>n</td><td><kbd>vip:sort iu</kbd></td><td>Sort in reverse lexicographic order</td></tr>
<tr><td><kbd>,S</kbd></td><td>v</td><td><kbd>:sort u</kbd></td><td>Sort in reverse lexicographic order</td></tr>
<tr><td><kbd>,s</kbd></td><td>n</td><td><kbd>vip:sort u</kbd></td><td>Sort in lexicographic order</td></tr>
<tr><td><kbd>,s</kbd></td><td>v</td><td><kbd>:sort u</kbd></td><td>Sort in lexicographic order</td></tr>
<tr><td><kbd>N</kbd></td><td>n</td><td><kbd>Nzz</kbd></td><td>Keep cursor centered on screen when looking behind</td></tr>
<tr><td><kbd>n</kbd></td><td>n</td><td><kbd>nzz</kbd></td><td>Keep cursor centered on screen when looking ahead</td></tr>
<tr><td><kbd>U</kbd></td><td>n</td><td><kbd>&lt;C-r></kbd></td><td>Redo</td></tr>
<tr><td><kbd>zs</kbd></td><td>n</td><td><kbd>1z=</kbd></td><td>Fix spelling using first suggestion</td></tr>
<tr><td><kbd>&lt;Backspace></kbd></td><td>n</td><td><kbd>:nohl</kbd></td><td>Clear search highlights</td></tr>
<tr><td><kbd>,df</kbd></td><td>n</td><td><kbd>:setlocal spell!&lt;bar>setlocal spell?&lt;cr>:setlocal spelllang=fr&lt;cr></kbd></td><td>Toggle spelling on/off (French)</td></tr>
<tr><td><kbd>,de</kbd></td><td>n</td><td><kbd>:setlocal spell!&lt;bar>setlocal spell?&lt;cr>:setlocal spelllang=en&lt;cr></kbd></td><td>Toggle spelling on/off (English)</td></tr>
<tr><td><kbd>,p</kbd></td><td>n</td><td><kbd>:set invpaste&lt;Cr>:set paste?&lt;Cr></kbd></td><td>Toggle on/off paste mode</td></tr>
<tr><td><kbd>&lt;C-p></kbd></td><td>n</td><td><kbd>:Files</kbd></td><td>Fuzzy finder for files</td></tr>
<tr><td><kbd>&lt;C-s></kbd></td><td>n</td><td><kbd>:RgCw</kbd></td><td>Fzf Rg on current word or project</td></tr>
<tr><td><kbd>&lt;C-t></kbd></td><td>n</td><td><kbd>:TagsCw</kbd></td><td>Fzf Tags on current word or project</td></tr>
<tr><td><kbd>,,</kbd></td><td>n</td><td><kbd>:Buffers</kbd></td><td>Fuzzy finder for buffers</td></tr>
<tr><td><kbd>,gg</kbd></td><td>n</td><td><kbd>:GFiles?</kbd></td><td>Git status</td></tr>
<tr><td><kbd>,gb</kbd></td><td>n</td><td><kbd>:BCommits</kbd></td><td>Git buffer commit log</td></tr>
<tr><td><kbd>,gc</kbd></td><td>n</td><td><kbd>:Commits</kbd></td><td>Git commit log</td></tr>
<tr><td><kbd>,r</kbd></td><td>n</td><td><kbd>:History</kbd></td><td>Old files</td></tr>
<tr><td><kbd>,ww</kbd></td><td>n</td><td><kbd>vim.diagnostic.setqflist</kbd></td><td>Show diagnostics in quickfix (LSP)</td></tr>
<tr><td><kbd>[d</kbd></td><td>n</td><td><kbd>vim.diagnostic.goto_prev</kbd></td><td>Go to previous diagnostic (LSP)</td></tr>
<tr><td><kbd>]d</kbd></td><td>n</td><td><kbd>vim.diagnostic.goto_next</kbd></td><td>Go to next diagnostic (LSP)</td></tr>
<tr><td><kbd>,wd</kbd></td><td>n</td><td><kbd>vim.diagnostic.open_float</kbd></td><td>Show diagnostic in a floating window (LSP)</td></tr>
<tr><td><kbd>g=</kbd></td><td>x</td><td><kbd>vim.lsp.buf.range_formatting</kbd></td><td>Format selection (LSP)</td></tr>
<tr><td><kbd>g=</kbd></td><td>n</td><td><kbd>vim.lsp.buf.formatting</kbd></td><td>Format selection (LSP)</td></tr>
<tr><td><kbd>z=</kbd></td><td>n,x</td><td><kbd>vim.lsp.buf.code_action</kbd></td><td>Code action (LSP)</td></tr>
<tr><td><kbd>gO</kbd></td><td>n</td><td><kbd>vim.lsp.buf.document_symbol()</kbd></td><td>Show workspace or buffer symbols depending on filetype (LSP)</td></tr>
<tr><td><kbd>K</kbd></td><td>n</td><td><kbd>vim.lsp.buf.hover</kbd></td><td>Show help for current symbol (LSP)</td></tr>
<tr><td><kbd>&lt;C-h></kbd></td><td>i</td><td><kbd>vim.lsp.buf.signature_help</kbd></td><td>Show signature help (LSP)</td></tr>
<tr><td><kbd>gd</kbd></td><td>n</td><td><kbd>vim.lsp.buf.definition</kbd></td><td>Show definition (LSP)</td></tr>
<tr><td><kbd>gr</kbd></td><td>n</td><td><kbd>vim.lsp.buf.references</kbd></td><td>Show references (LSP)</td></tr>
<tr><td><kbd>gi</kbd></td><td>n</td><td><kbd>vim.lsp.buf.implementation</kbd></td><td>Show references (LSP)</td></tr>
<tr><td><kbd>zr</kbd></td><td>n</td><td><kbd>vim.lsp.buf.rename</kbd></td><td>Rename symbol (LSP)</td></tr>
</tbody>
</table>
</small>

I also have kind of an universal mapping, <kbd>gs</kbd>, which depending on filetype may compile a $\LaTeX$ document or a C file and show its output, run a Python/Haskell/Lisp/Scheme script and show its output, etc. It is defined in relevant `after/ftplugin/*.vim` files. Finally, since I never found a good or reliable plugin to send command to a terminal, and I've tried many of the exiting ones for Vim or Neovim, I wrote my own commands: (It assumes that you have a terminal opened next to your buffer in a split, which is how I work in any case.)

```vim
" poor man send-to-repl features (we need to fire a REPL in a split first)
noremap ss Vy<C-w>wpa<CR><C-\><C-n><C-w>pj
noremap s y<C-w>wpa<CR><C-\><C-n><C-w>p
xnoremap s y<C-w>wpa<CR><C-\><C-n><C-w>p
```

[^1]: When I first drafted this cheatsheet, I was still using 15 plugins or so. Some packages broke at some point and I was too lazy to investigate why, or some were of too little use to justify keeping them. I don't really miss anything with my current config, though.
[^2]: I recently switched to this leader key after having spent three years using the <kbd>Space</kbd> key as my leader, as a leftover of my Doom Emacs period.
