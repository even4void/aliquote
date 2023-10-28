---
title: "Scheming with Vim"
date: 2022-07-27T20:50:59+02:00
draft: false
tags: ["vim", "scheme"]
categories: ["2022"]
---

As a matter of fact, I use Neovim to wrote all my Chicken Scheme and Racket code. It works quite great, even if I do not have as much facilities as I had under Emacs with [Geiser].

I followed the recommendations available on Chicken [website], as well as Evan Hanson's useful blog post, [Editing Scheme in Vim], especially for completion. I found that setting `keywordprg` to `chicken-doc scheme` instead of `chicken-doc` is most of the times what I really need.

My `after/ftplugin/scheme.vim` is short enough that I can post it right in this post:

```vim
let b:is_chicken=1

setl makeprg=csc\ %

setl complete+=,k~/.local/share/scheme/words

setl include=\^\(\\(use\\\|require-extension\\)\\s\\+
setl includeexpr=substitute(v:fname,'$','.scm','')
setl path+=/home/chl/.cache/chicken-install
setl suffixesadd=.scm

setl lispwords+=let-values,condition-case,with-input-from-string
setl lispwords+=with-output-to-string,handle-exceptions,call/cc,rec,receive
setl lispwords+=call-with-output-file

fun! Scheme_indent_top_sexp()
	let pos = getpos('.')
	silent! exec 'normal! 99[(=%'
	call setpos('.', pos)
endfun

nmap <buffer> <silent> == :call Scheme_indent_top_sexp()<cr>
nmap <buffer> gs :10 split term://csi -s %<cr>:startinsert<cr>

setlocal keywordprg=chicken-doc\ scheme
```

The file `~/.local/share/scheme/words` was generated as advertised by Evan Hanson. I just use a different directory to store Scheme keywords. I update the word list periodically, especially after I install new packages.

For the time being, I'm not interested in other Scheme flavor, so I decided to target Chicken scheme only. Together with Racket, it is a solid Scheme implementation that further comes with a package manager and a nice FFI.

{{% alert note %}}
<small>[2023-10-27]</small><br>
I highly recommend installing [vim-paredit](https://github.com/kovisoft/paredit) (still maintained despite being listed on [vim-scripts](https://github.com/vim-scripts)). For some time I use to rely on [nvim-parinfer](https://github.com/gpanders/nvim-parinfer), and now there's [nvim-paredit](https://github.com/julienvincent/nvim-paredit) (and [parpar](https://github.com/dundalek/parpar.nvim) if you prefer a combo). Tehre's also [vim-sexp](https://github.com/guns/vim-sexp), with awful mappings, and [vim-sexp-mappings-for-regular-people](https://github.com/tpope/vim-sexp-mappings-for-regular-people), with far better mappings but a longer nick). I've tried them all, noticed some issues with nvim-parinfer when deleting enclosed forms, which led me to rely on Vim `dib` and `dab` instead. Finally, there's [nvim-treesitter-sexp](https://github.com/PaterJason/nvim-treesitter-sexp), but it seems to be limited to "modern" Lisp languages (Clojure, Fennel and the like); I haven't tried it. With vim-paredit you get part of parinfer, i.e., when you delete a line or an s-expression inside a top-level form in Lisp you get the correct result, and many additional goodies like slurping and barfing the easy way (`<` and `>`), join/slice/wrap lists and sublists, in normal or visual mode. As a final remark, I should note that there's a [treesitter grammar](https://github.com/6cdh/tree-sitter-scheme) for Scheme (as well as Common Lisp, Racket, and Clojure), which means indentation and formating should be all right.
{{% /alert %}}

-----

A final word: The `gs` mapping is something that I implemented for most languages that offer some kind of a REPL or a quick compilation process. So far, I have it implemented for the folloing filetypes:

```shell
~/.../after/ftplugin % rg "<buffer> gs"
tex.vim
29:nmap <buffer> gs :VimtexCompile<CR>

r.vim
5:nmap <buffer> gs :10 split term://Rscript %<cr>:startinsert<cr>

org.vim
10:nmap <buffer> gs :10 split term://org-babel -pdf % && zathura %:r.pdf<cr>:startinsert<cr>

c.vim
12:nmap <buffer> gs :10 split term://zig cc % && ./a.out<cr>:startinsert<cr>

rmd.vim
1:nmap <buffer> gs :w<CR>:cd %:p:h <CR>:!Rscript -e 'library(knitr);knit("%:p")'<CR>:!latexmk -pdf -bibtex-cond -f %:r.tex <CR>:!xdg-open %:r.pdf <CR><C [... 0 more matches]

rnoweb.vim
10:nmap <buffer> gs :w<CR>:cd %:p:h <CR>:!Rscript -e 'library(knitr);knit("%:p")'<CR>:!latexmk -pdf -bibtex-cond -f %:r.tex <CR>:!xdg-open %:r.pdf <CR><C [... 0 more matches]

scheme.vim
23:nmap <buffer> gs :10 split term://csi -s %<cr>:startinsert<cr>

lisp.vim
1:nmap <buffer> gs :10 split term://ros -l %<cr>:startinsert<cr>

stata.vim
3:nmap <buffer> gs :10 split term://stata -q %<cr>:startinsert<cr>

markdown.vim
9:nmap <buffer> gs :10 split term://pandoc -s --pdf-engine=lualatex --filter pandoc-fignos --filter pandoc-citeproc --listings % -o %:r.pdf && zathura % [... 0 more matches]

racket.vim
80:nmap <buffer> gs :10 split term://racket %<cr>

python.vim
8:nmap <buffer> gs :10 split term://python3 %<cr>:startinsert<cr>

haskell.vim
6:nmap <buffer> gs :10 split term://chmod +x % && ./%<cr>:startinsert<cr>

rust.vim
3:nmap <buffer> gs :10 split term://cargo run<cr>:startinsert<cr>
```

Note that I also use [iron] to launch some REPL right into a running Neovim instance.[^1] It also works great with the interactive interpreter `csi`.

{{% alert note %}}
<small>[2023-10-27]</small><br>
No more plugin providing REPL-like features. If I were to install one, I would choose either [slimv](https://github.com/kovisoft/slimv) (almost surely) or [conjure](https://github.com/Olical/conjure). If this is just to send a line or a selection to a terminal running my favorite interpreter, I stand by my poor man mappings: `vim.keymap.set("n", "ss", [[ Vy<C-w>wpa<CR><C-\><C-n><C-w>pj ]])` (current line), `vim.keymap.set("x", "s", [[ y<C-w>wpa<CR><C-\><C-n><C-w>p ]])` (visual selection).
{{% /alert %}}

Happy scheming in (Neo)vim!

![img](/img/2022-07-27-21-11-59.png)

{{% music %}}Nick Cave & The Bad Seeds • _Rock of Gibraltar_{{% /music %}}

[^1]: I locked Neovim packer at commit `bc9c596d6a97955f0306d2abcc10d9c35bbe2f5b`, but that should not stop you trying it out.

[geiser]: https://www.nongnu.org/geiser/
[website]: https://wiki.call-cc.org/vim
[editing scheme in vim]: https://www.foldling.org/scheme.html#2013-01-18
[iron]: https://github.com/hkupty/iron.nvim
