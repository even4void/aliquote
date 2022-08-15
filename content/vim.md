---
title: "Vim shortcuts"
date: 2022-08-15T00:00:00
url: "/articles/vim/"
---

Here are the current Neovim mappings I came to feel comfortable with over time. This is by no means a reference card, and yes I do use the arrow keys for navigating into my buffers. It depends on motion range, though. Another key idea is that I use Tmux everyday and I like to have an unified set of mappings, beside the leader/prefix key.

Note that I only have 15 plugins in my `start` and `opt` directories, in addition to part of [mini.nvim](https://github.com/echasnovski/mini.nvim) that I adapted to suit my needs better: (This may change in the future but usually I tend to remove plugins rather than add new ones.)

- [opt] `iron.nvim`, `neogen`, `neogit`, `nvim-parinfer`, `vim-test`, `vimtex`;
- [start] `Comment.nvim`, `null-ls.nvim`, `nvim-lspconfig`, `nvim-treesitter`, ̀`packer.nvim`, `plenary.nvim`, `telescope-bibtex.nvim`, `telescope-fzf-native.nvim`, `telescope.nvim`

I could easily get rid of telescope-bibtex, Comment, packer, vim-test, iron, and neogen.

I prefer a minimalist setup these days, and I tend to rely on hand-on solutions for tasks I carry over and over. Many of those custom settings come from briliant Vimers who are acknowledged in my config files. Note that some of those mappings may override existing ones, whether they are somewhat redundant (e.g. <kbd>s</kbd> and <kbd>c</kbd>) or because I don't use them at all (e.g., some of the <kbd>Ctrl</kbd>, <kbd>g</kbd> or <kbd>z</kbd> combinations).

My leader is ","[^1] and I do not define specific mappings for the localleader in my main config files. It looks like I always misunderstoof the role of [localleader](https://learnvimscriptthehardway.stevelosh.com/chapters/06.html), and I decided to book it for my `after/ftplugin` custom settings.

<small>
<table border="0">
<tbody>
<tr>
<td><em>Mapping</em></td>
<td><em>Mode</em></td>
<td><em>Command</td>
<td><em>Role</em></td>
</tr>
<tr><td><kbd>&lt;C-a></kbd></td><td>i</td><td><kbd>&lt;C-o>0</kbd></td><td>Go to start of line</td></tr>
<tr><td><kbd>&lt;C-e></kbd></td><td>i</td><td><kbd>&lt;C-o>$</kbd></td><td>Go to end of line</td></tr>
<tr><td><kbd>&lt;C-a></kbd></td><td>c</td><td><kbd>:&lt;Home></kbd></td><td>Go to start of line</td></tr>
<tr><td><kbd>&lt;C-e></kbd></td><td>c</td><td><kbd>:&lt;End></kbd></td><td>Go to end of line</td></tr>
<tr><td><kbd>-</kbd></td><td>n</td><td><kbd>:Ex</kbd></td><td>Show explorer</td></tr>
<tr><td><kbd>,l</kbd></td><td>n</td><td><kbd>&lt;C-^></kbd></td><td>Alternate buffer</td></tr>
<tr><td><kbd>,o</kbd></td><td>n</td><td><kbd>&lt;C-w>&lt;C-w></kbd></td><td>Other widow</td></tr>
<tr><td><kbd>,!<kbd></td><td>n</td><td><kbd>:10sp +te<kbd></td><td>Popup terminal</td></tr>
<tr><td><kbd>,.<kbd></td><td>n</td><td><kbd>:lcd %:p:h<kbd></td><td>Set local current directory</td></tr>
<tr><td><kbd>,E<kbd></td><td>n</td><td><kbd>:tabe &lt;C-R>=expand("%:p:h") . "/"<kbd></td><td>Open file in new tab from current directory</td></tr>
<tr><td><kbd>,e<kbd></td><td>n</td><td><kbd>:e &lt;C-R>=expand("%:p:h") . "/"<kbd></td><td>Open file from current directory</td></tr>
<tr><td><kbd>&lt;C-Left><kbd></td><td>n</td><td><kbd>:tabprev<kbd></td><td>Previous tab</td></tr>
<tr><td><kbd>&lt;C-Right><kbd></td><td>n</td><td><kbd>:tabnext<kbd></td><td>Next tab</td></tr>
<tr><td>&lt;Tab></td><td>n</td><td><kbd>:tabnext<kbd></td><td>Next tab</td></tr>
<tr><td>,&lt;Tab></td><td>n</td><td><kbd>:$tabnew<kbd></td><td>New tab</td></tr>
<tr><td>J</td><td>n</td><td><kbd>mzJ`z<kbd></td><td>Join lines (cursor stationary)</td></tr>
<tr><td><</td><td>v</td><td><kbd>&lt;gv<kbd></td><td>Fix block indentation (backward)</td></tr>
<tr><td>></td><td>v</td><td><kbd>>gv<kbd></td><td>Fix block indentation (forward)</td></tr>
<tr><td>&lt;C-q></td><td>n</td><td><kbd>quickfix_toggle()<kbd></td><td>Close quickfix window (custom)</td></tr>
<tr><td>[Q</td><td>n</td><td><kbd>:cfirst<kbd></td><td>Go to first quickfix item</td></tr>
<tr><td>]Q</td><td>n</td><td><kbd>:clast<kbd></td><td>Go to last quickfix item</td></tr>
<tr><td>&lt;C-h></td><td>n</td><td><kbd>:vertical resize -4<kbd></td><td>Resize split (left)</td></tr>
<tr><td>&lt;C-j></td><td>n</td><td><kbd>:resize -4<kbd></td><td>Resize split (down)</td></tr>
<tr><td>&lt;C-k></td><td>n</td><td><kbd>:resize +4<kbd></td><td>Resize split (up)</td></tr>
<tr><td>&lt;C-l></td><td>n</td><td><kbd>:vertical resize +4<kbd></td><td>Resize split (right)</td></tr>
<tr><td>W!!</td><td>c</td><td><kbd>:w !sudo tee % >/dev/null&lt;Cr>:e!&lt;Cr><kbd></td><td>Save as root</td></tr>
<tr><td>&lt;C-s></td><td>i</td><td><kbd>&lt;C-g>u&lt;Esc>[s1z=`]a&lt;C-g>u<kbd></td><td>Fix last spelling error (repeat.)</td></tr>
<tr><td>&lt;S-Tab></td><td>i</td><td><kbd>pumvisible() ? "\&lt;C-p>" : "\&lt;S-Tab>"<kbd></td><td>Previous omnicompletion item</td></tr>
<tr><td>&lt;Tab></td><td>i</td><td><kbd>pumvisible() ? "\&lt;C-n>" : "\&lt;S-Tab>"<kbd></td><td>Next omnicompletion item</td></tr>
<tr><td>,S</td><td>n</td><td><kbd>vip:sort iu<kbd></td><td>Sort in reverse lexicographic order</td></tr>
<tr><td>,S</td><td>v</td><td><kbd>:sort u<kbd></td><td>Sort in reverse lexicographic order</td></tr>
<tr><td>,s</td><td>n</td><td><kbd>vip:sort u<kbd></td><td>Sort in lexicographic order</td></tr>
<tr><td>,s</td><td>v</td><td><kbd>:sort u<kbd></td><td>Sort in lexicographic order</td></tr>
<tr><td>,"</td><td>n</td><td>:Neogen</td><td>Generate docstring</td></tr>
<tr><td>N</td><td>n</td><td>Nzz</td><td>Keep cursor centered on screen when looking behind</td></tr>
<tr><td>n</td><td>n</td><td>nzz</td><td>Keep cursor centered on screen when looking ahead</td></tr>
<tr><td>U</td><td>n</td><td>&lt;C-r></td><td>Redo</td></tr>
<tr><td>zs</td><td>n</td><td>1z=</td><td>Fix spelling using first suggestion</td></tr>
<tr><td>^</td><td>n</td><td>:set hls!&lt;Bar>set hls?</td><td>Toggle on/off search highlights</td></tr>
<tr><td>&lt;Backspace></td><td>n</td><td>:nohl</td><td>Clear search highlights</td></tr>
<tr><td>,df</td><td>n</td><td>:set spell&lt;Cr>:set spelllang=fr</td><td>Toggle spelling (French)</td></tr>
<tr><td>,de</td><td>n</td><td>:set spell&lt;Cr>:set spelllang=en</td><td>Toggle spelling (English)</td></tr>
<tr><td>&lt;C-s></td><td>n</td><td>:let @s='\&lt;'.expand('&lt;cword>').'\>'&lt;Cr>:%s/&lt;C-r>s//&lt;Left></td><td>Substitute current word</td></tr>
<tr><td>&lt;C-s></td><td>x</td><td>sy:%s/&lt;C-r>s//&lt;Left></td><td>Substitute current word</td></tr>
<tr><td>,p</td><td>n</td><td>:set invpaste&lt;Cr>:set paste?&lt;Cr></td><td>Toggle on/off paste mode</td></tr>
<tr><td>YY</td><td>n,v</td><td>"+y</td><td>Yank to clipboard</td></tr>
<tr><td>&lt;C-f></td><td>n</td><td>:Grep&lt;Space></td><td>Grep (custom)</td></tr>
<tr><td>&lt;C-p></td><td>n</td><td>:Telescope find_files</td><td>Fuzzy finder for files</td></tr>
<tr><td>,/</td><td>n</td><td>:Telescope current_buffer_fuzzy_find</td><td>Fuzzy search in buffer</td></tr>
<tr><td>,:</td><td>n</td><td>:Telescope command_history</td><td>Fuzzy finder for command history</td></tr>
<tr><td>,,</td><td>n</td><td>:Telescope buffers</td><td>Fuzzy finder for buffers</td></tr>
<tr><td>,f</td><td>n</td><td>:Telescope live_grep</td><td>Live grep in working directory</td></tr>
<tr><td>,*</td><td>n</td><td>:lua require('telescope.builtin').grep_string({search = vim.fn.expand("&lt;cword>")})</td><td>Fuzzy grep current word in working directory</td></tr>
<tr><td>,G</td><td>n</td><td>:Neogit</td><td>Neogit</td></tr>
<tr><td>,gg</td><td>n</td><td>:Telescope git_status</td><td>Git status</td></tr>
<tr><td>,gC</td><td>n</td><td>:Telescope git_commits</td><td>Git commit log</td></tr>
<tr><td>,gc</td><td>n</td><td>:Telescope git_bcommits</td><td>Git buffer commit log</td></tr>
<tr><td>,gb</td><td>n</td><td>:Telescope git_branches</td><td>Git branches</td></tr>
<tr><td>,gs</td><td>n</td><td>:Telescope git_stash</td><td>Git stash</td></tr>
<tr><td>,q</td><td>n</td><td>:Telescope quickfix</td><td>Telescope quickfix</td></tr>
<tr><td>,r</td><td>n</td><td>:Telescope oldfiles</td><td>Telescope old files</td></tr>
<tr><td>,w</td><td>n</td><td>:Telescope diagnostics</td><td>LSP diagnostics</td></tr>
<tr><td>,@</td><td>n</td><td>:Telescope bibtex</td><td>Telescope bibtex</td></tr>
<tr><td>s.</td><td>n</td><td>&lt;Plug>(iron-repeat-cmd)</td><td>Iron repeat action</td></tr>
<tr><td>ss</td><td>n</td><td>&lt;Plug>(iron-send-line)</td><td>Iron send current line</td></tr>
<tr><td>s</td><td>n</td><td>&lt;Plug>(iron-send-motion)</td><td>Iron send selection</td></tr>
<tr><td>s</td><td>v</td><td>&lt;Plug>(iron-visual-send)</td><td>Iron send selection</td></tr>
<tr><td>,T</td><td>n</td><td>:TestFile</td><td>Test file (vimtest)</td></tr>
<tr><td>,t</td><td>n</td><td>:TestNearest</td><td>Test nearest (vimtest)</td></tr>
<tr><td>,wq</td><td>n</td><td>vim.diagnostic.setqflist</td><td>Show diagnostics in quickfix (LSP)</td></tr>
<tr><td>[w</td><td>n</td><td>vim.diagnostic.goto_prev</td><td>Go to previous diagnostic (LSP)</td></tr>
<tr><td>]w</td><td>n</td><td>vim.diagnostic.goto_prev</td><td>Go to next diagnostic (LSP)</td></tr>
<tr><td>,wd</td><td>n</td><td>vim.diagnostic.open_float</td><td>Show diagnostic in a floating window (LSP)</td></tr>
<tr><td>g=</td><td>x</td><td>vim.lsp.buf.range_formatting</td><td>Format selection (LSP)</td></tr>
<tr><td>g=</td><td>n</td><td>vim.lsp.buf.formatting</td><td>Format selection (LSP)</td></tr>
<tr><td>z=</td><td>n,x</td><td>vim.lsp.buf.code_action</td><td>Code action (LSP)</td></tr>
<tr><td>g0</td><td>n</td><td>require("telescope.builtin").lsp_workspace_symbols</td><td>Show workspace symbols (LSP)</td></tr>
<tr><td>K</td><td>n</td><td>vim.lsp.buf.hover</td><td>Show help for current symbol (LSP)</td></tr>
<tr><td>&lt;C-h></td><td>i</td><td>vim.lsp.buf.signature_help</td><td>Show signature help (LSP)</td></tr>
<tr><td>gd</td><td>n</td><td>require("telescope.builtin").lsp_definitions</td><td>Show definition (LSP)</td></tr>
<tr><td>gr</td><td>n</td><td>require("telescope.builtin").lsp_references</td><td>Show references (LSP)</td></tr>
<tr><td>zr</td><td>n</td><td>vim.lsp.buf.rename</td><td>Rename symbol (LSP)</td></tr>
<tr><td>gi</td><td>n</td><td>vim.lsp.buf.implementation</td><td>Show implementation (LSP)</td></tr>
</tbody>
</table>
</small>

I also have kind of an universal mapping, <kbd>gs</kbd>, which depending on filetype may compile a $\LaTeX$ document or a C file and show its output, run a Python/Haskell/Lisp/Scheme script and show its output, etc. It is defined in relevant `after/ftplugin/*.vim` files.

[^1]: I recently switched to this leader key after having spent three years using the <kbd>Space</kbd> key as my leader, as a leftover of my Doom Emacs period.
