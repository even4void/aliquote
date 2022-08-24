---
title: "Vim shortcuts"
date: 2022-08-15T00:00:00
url: "/articles/vim/"
---

Here are the current Neovim mappings I came to feel comfortable with over time. This is by no means a reference card, and yes I do use the arrow keys for navigating into my buffers. It depends on motion range, though. Another key idea is that I use Tmux everyday and I like to have an unified set of mappings, beside the leader/prefix key.

Note that I only have 15 plugins in my `start` and `opt` directories, in addition to part of [mini.nvim](https://github.com/echasnovski/mini.nvim) that I adapted to suit my needs better: (This may change in the future but usually I tend to remove plugins rather than add new ones.)

- [opt] `neogen`, `neogit`, `nvim-parinfer`, `vim-test`, `vimtex`;
- [start] `Comment.nvim`, `null-ls.nvim`, `nvim-lspconfig`, `nvim-treesitter`, ̀`packer.nvim`, `plenary.nvim`, `telescope-bibtex.nvim`, `telescope-fzf-native.nvim`, `telescope.nvim`

I could easily get rid of telescope-bibtex, Comment, packer, vim-test, and neogen.

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
<tr><td><kbd>,!</kbd></td><td>n</td><td><kbd>:10sp +te</kbd></td><td>Popup terminal</td></tr>
<tr><td><kbd>,§</kbd></td><td>n</td><td><kbd>:15Lex</kbd></td><td>Popup tree sidebar</td></tr>
<tr><td><kbd>,.</kbd></td><td>n</td><td><kbd>:lcd %:p:h</kbd></td><td>Set local current directory</td></tr>
<tr><td><kbd>,x</kbd></td><td>n</td><td><kbd>:bp &lt;Bar> bd! #</kbd></td><td>Kill current buffer</td></tr>
<tr><td><kbd>,X</kbd></td><td>n</td><td><kbd>Only()</kbd></td><td>Keep only current buffer (custom)</td></tr>
<tr><td><kbd>,E</kbd></td><td>n</td><td><kbd>:tabe &lt;C-R>=expand("%:p:h") . "/"</kbd></td><td>Open file in new tab from current directory</td></tr>
<tr><td><kbd>,e</kbd></td><td>n</td><td><kbd>:e &lt;C-R>=expand("%:p:h") . "/"</kbd></td><td>Open file from current directory</td></tr>
<tr><td><kbd>&lt;C-Left></kbd></td><td>n</td><td><kbd>:tabprev</kbd></td><td>Previous tab</td></tr>
<tr><td><kbd>&lt;C-Right></kbd></td><td>n</td><td><kbd>:tabnext</kbd></td><td>Next tab</td></tr>
<tr><td><kbd>&lt;Tab></kbd></td><td>n</td><td><kbd>:tabnext</kbd></td><td>Next tab</td></tr>
<tr><td><kbd>,&lt;Tab></kbd></td><td>n</td><td><kbd>:$tabnew</kbd></td><td>New tab</td></tr>
<tr><td><kbd>J</kbd></td><td>n</td><td><kbd>mzJ`z</kbd></td><td>Join lines (cursor stationary)</td></tr>
<tr><td><kbd><</kbd></td><td>v</td><td><kbd>&lt;gv</kbd></td><td>Fix block indentation (backward)</td></tr>
<tr><td><kbd>></kbd></td><td>v</td><td><kbd>>gv</kbd></td><td>Fix block indentation (forward)</td></tr>
<tr><td><kbd>&lt;C-q></kbd></td><td>n</td><td><kbd>quickfix_toggle()</kbd></td><td>Close quickfix window (custom)</td></tr>
<tr><td><kbd>[Q</kbd></td><td>n</td><td><kbd>:cfirst</kbd></td><td>Go to first quickfix item</td></tr>
<tr><td><kbd>]Q</kbd></td><td>n</td><td><kbd>:clast</kbd></td><td>Go to last quickfix item</td></tr>
<tr><td><kbd>&lt;C-h></kbd></td><td>n</td><td><kbd>:vertical resize -4</kbd></td><td>Resize split (left)</td></tr>
<tr><td><kbd>&lt;C-j></kbd></td><td>n</td><td><kbd>:resize -4</kbd></td><td>Resize split (down)</td></tr>
<tr><td><kbd>&lt;C-k></kbd></td><td>n</td><td><kbd>:resize +4</kbd></td><td>Resize split (up)</td></tr>
<tr><td><kbd>&lt;C-l></kbd></td><td>n</td><td><kbd>:vertical resize +4</kbd></td><td>Resize split (right)</td></tr>
<tr><td><kbd>W!!</kbd></td><td>c</td><td><kbd>:w !sudo tee % >/dev/null&lt;Cr>:e!&lt;Cr></kbd></td><td>Save as root</td></tr>
<tr><td><kbd>&lt;C-s></kbd></td><td>i</td><td><kbd>&lt;C-g>u&lt;Esc>[s1z=`]a&lt;C-g>u</kbd></td><td>Fix last spelling error (repeat.)</td></tr>
<tr><td><kbd>&lt;S-Tab></kbd></td><td>i</td><td><kbd>pumvisible() ? "\&lt;C-p>" : "\&lt;S-Tab>"</kbd></td><td>Previous omnicompletion item</td></tr>
<tr><td><kbd>&lt;Tab></kbd></td><td>i</td><td><kbd>pumvisible() ? "\&lt;C-n>" : "\&lt;S-Tab>"</kbd></td><td>Next omnicompletion item</td></tr>
<tr><td><kbd>,S</kbd></td><td>n</td><td><kbd>vip:sort iu</kbd></td><td>Sort in reverse lexicographic order</td></tr>
<tr><td><kbd>,S</kbd></td><td>v</td><td><kbd>:sort u</kbd></td><td>Sort in reverse lexicographic order</td></tr>
<tr><td><kbd>,s</kbd></td><td>n</td><td><kbd>vip:sort u</kbd></td><td>Sort in lexicographic order</td></tr>
<tr><td><kbd>,s</kbd></td><td>v</td><td><kbd>:sort u</kbd></td><td>Sort in lexicographic order</td></tr>
<tr><td><kbd>,"</kbd></td><td>n</td><td><kbd>:Neogen</kbd></td><td>Generate docstring</td></tr>
<tr><td><kbd>N</kbd></td><td>n</td><td><kbd>Nzz</kbd></td><td>Keep cursor centered on screen when looking behind</td></tr>
<tr><td><kbd>n</kbd></td><td>n</td><td><kbd>nzz</kbd></td><td>Keep cursor centered on screen when looking ahead</td></tr>
<tr><td><kbd>U</kbd></td><td>n</td><td><kbd>&lt;C-r></kbd></td><td>Redo</td></tr>
<tr><td><kbd>zs</kbd></td><td>n</td><td><kbd>1z=</kbd></td><td>Fix spelling using first suggestion</td></tr>
<tr><td><kbd>^</kbd></td><td>n</td><td><kbd>:set hls!&lt;Bar>set hls?</kbd></td><td>Toggle on/off search highlights</td></tr>
<tr><td><kbd>&lt;Backspace></kbd></td><td>n</td><td><kbd>:nohl</kbd></td><td>Clear search highlights</td></tr>
<tr><td><kbd>,df</kbd></td><td>n</td><td><kbd>:set spell&lt;Cr>:set spelllang=fr</kbd></td><td>Toggle spelling (French)</td></tr>
<tr><td><kbd>,de</kbd></td><td>n</td><td><kbd>:set spell&lt;Cr>:set spelllang=en</kbd></td><td>Toggle spelling (English)</td></tr>
<tr><td><kbd>&lt;C-s></kbd></td><td>n</td><td><kbd>:let @s='\&lt;'.expand('&lt;cword>').'\>'&lt;Cr>:%s/&lt;C-r>s//&lt;Left></kbd></td><td>Substitute current word</td></tr>
<tr><td><kbd>&lt;C-s></kbd></td><td>x</td><td><kbd>sy:%s/&lt;C-r>s//&lt;Left></kbd></td><td>Substitute current word</td></tr>
<tr><td><kbd>,p</kbd></td><td>n</td><td><kbd>:set invpaste&lt;Cr>:set paste?&lt;Cr></kbd></td><td>Toggle on/off paste mode</td></tr>
<tr><td><kbd>YY</kbd></td><td>n,v</td><td><kbd>"+y</kbd></td><td>Yank to clipboard</td></tr>
<tr><td><kbd>&lt;C-f></kbd></td><td>n</td><td><kbd>:Grep&lt;Space></kbd></td><td>Grep (custom)</td></tr>
<tr><td><kbd>&lt;C-p></kbd></td><td>n</td><td><kbd>:Telescope find_files</kbd></td><td>Fuzzy finder for files</td></tr>
<tr><td><kbd>,/</kbd></td><td>n</td><td><kbd>:Telescope current_buffer_fuzzy_find</kbd></td><td>Fuzzy search in buffer</td></tr>
<tr><td><kbd>,:</kbd></td><td>n</td><td><kbd>:Telescope command_history</kbd></td><td>Fuzzy finder for command history</td></tr>
<tr><td><kbd>,,</kbd></td><td>n</td><td><kbd>:Telescope buffers</kbd></td><td>Fuzzy finder for buffers</td></tr>
<tr><td><kbd>,f</kbd></td><td>n</td><td><kbd>:Telescope live_grep</kbd></td><td>Live grep in working directory</td></tr>
<tr><td><kbd>,*</kbd></td><td>n</td><td><kbd>:lua require('telescope.builtin').grep_string({search = vim.fn.expand("&lt;cword>")})</kbd></td><td>Fuzzy grep current word in working directory</td></tr>
<tr><td><kbd>,G</kbd></td><td>n</td><td><kbd>:Neogit</kbd></td><td>Neogit</td></tr>
<tr><td><kbd>,gg</kbd></td><td>n</td><td><kbd>:Telescope git_status</kbd></td><td>Git status</td></tr>
<tr><td><kbd>,gC</kbd></td><td>n</td><td><kbd>:Telescope git_commits</kbd></td><td>Git commit log</td></tr>
<tr><td><kbd>,gc</kbd></td><td>n</td><td><kbd>:Telescope git_bcommits</kbd></td><td>Git buffer commit log</td></tr>
<tr><td><kbd>,gb</kbd></td><td>n</td><td><kbd>:Telescope git_branches</kbd></td><td>Git branches</td></tr>
<tr><td><kbd>,gs</kbd></td><td>n</td><td><kbd>:Telescope git_stash</kbd></td><td>Git stash</td></tr>
<tr><td><kbd>,q</kbd></td><td>n</td><td><kbd>:Telescope quickfix</kbd></td><td>Telescope quickfix</td></tr>
<tr><td><kbd>,r</kbd></td><td>n</td><td><kbd>:Telescope oldfiles</kbd></td><td>Telescope old files</td></tr>
<tr><td><kbd>,w</kbd></td><td>n</td><td><kbd>:Telescope diagnostics</kbd></td><td>LSP diagnostics</td></tr>
<tr><td><kbd>,@</kbd></td><td>n</td><td><kbd>:Telescope bibtex</kbd></td><td>Telescope bibtex</td></tr>
<tr><td><kbd>,T</kbd></td><td>n</td><td><kbd>:TestFile</kbd></td><td>Test file (vimtest)</td></tr>
<tr><td><kbd>,t</kbd></td><td>n</td><td><kbd>:TestNearest</kbd></td><td>Test nearest (vimtest)</td></tr>
<tr><td><kbd>s</kbd></td><td>v,x</td><td><kbd>y&lt;C-w>wpa&lt;CR>&lt;CR>&lt;Esc></kbd></td><td>Send selection to nearest terminal</td></tr>
<tr><td><kbd>ss</kbd></td><td>n</td><td><kbd>Vy&lt;C-w>wpa&lt;CR>&lt;CR>&lt;Esc></kbd></td><td>Send line to nearest terminal</td></tr>
<tr><td><kbd>gK</kbd></td><td>n</td><td><kbd>:Dasht</kbd></td><td>Query documentation from Dash</td></tr>
<tr><td><kbd>,wq</kbd></td><td>n</td><td><kbd>vim.diagnostic.setqflist</kbd></td><td>Show diagnostics in quickfix (LSP)</td></tr>
<tr><td><kbd>[w</kbd></td><td>n</td><td><kbd>vim.diagnostic.goto_prev</kbd></td><td>Go to previous diagnostic (LSP)</td></tr>
<tr><td><kbd>]w</kbd></td><td>n</td><td><kbd>vim.diagnostic.goto_next</kbd></td><td>Go to next diagnostic (LSP)</td></tr>
<tr><td><kbd>,wd</kbd></td><td>n</td><td><kbd>vim.diagnostic.open_float</kbd></td><td>Show diagnostic in a floating window (LSP)</td></tr>
<tr><td><kbd>g=</kbd></td><td>x</td><td><kbd>vim.lsp.buf.range_formatting</kbd></td><td>Format selection (LSP)</td></tr>
<tr><td><kbd>g=</kbd></td><td>n</td><td><kbd>vim.lsp.buf.formatting</kbd></td><td>Format selection (LSP)</td></tr>
<tr><td><kbd>z=</kbd></td><td>n,x</td><td><kbd>vim.lsp.buf.code_action</kbd></td><td>Code action (LSP)</td></tr>
<tr><td><kbd>g0</kbd></td><td>n</td><td><kbd>require("telescope.builtin").lsp_workspace_symbols</kbd></td><td>Show workspace symbols (LSP)</td></tr>
<tr><td><kbd>K</kbd></td><td>n</td><td><kbd>vim.lsp.buf.hover</kbd></td><td>Show help for current symbol (LSP)</td></tr>
<tr><td><kbd>&lt;C-h></kbd></td><td>i</td><td><kbd>vim.lsp.buf.signature_help</kbd></td><td>Show signature help (LSP)</td></tr>
<tr><td><kbd>gd</kbd></td><td>n</td><td><kbd>require("telescope.builtin").lsp_definitions</kbd></td><td>Show definition (LSP)</td></tr>
<tr><td><kbd>gr</kbd></td><td>n</td><td><kbd>require("telescope.builtin").lsp_references</kbd></td><td>Show references (LSP)</td></tr>
<tr><td><kbd>zr</kbd></td><td>n</td><td><kbd>vim.lsp.buf.rename</kbd></td><td>Rename symbol (LSP)</td></tr>
<tr><td><kbd>gi</kbd></td><td>n</td><td><kbd>vim.lsp.buf.implementation</kbd></td><td>Show implementation (LSP)</td></tr>
</tbody>
</table>
</small>

I also have kind of an universal mapping, <kbd>gs</kbd>, which depending on filetype may compile a $\LaTeX$ document or a C file and show its output, run a Python/Haskell/Lisp/Scheme script and show its output, etc. It is defined in relevant `after/ftplugin/*.vim` files.

[^1]: I recently switched to this leader key after having spent three years using the <kbd>Space</kbd> key as my leader, as a leftover of my Doom Emacs period.
