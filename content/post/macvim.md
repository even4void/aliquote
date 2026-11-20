---
title: "Macvim"
date: 2026-11-20T10:03:03+01:00
draft: false
tags: ["apple", "vim", "app"]
categories: ["2026"]
---

BBEdit was a fun journey but I missed too much flexibility from my Neovim setup

I remember the time when I tried MacVim instead of stock Vim, then VimR, some
years ago. This was long before Neovim came up, and I was still using a lot of
Desktop applications. Then I spent some years living in the dark ages of the
terminal. I'm still using Terminal.app all day, but sometimes I want to benefit
from macOS recent files, or open a text file with Vim rather than the default
TextEdit app. I tried Neovide but I was not really happy with it.

In the meantime I devised a [small config][1] for stock Vim 8, which works with
Vim 9 but also plays nicely on remote Linux servers I'm interacting with.
Maintaining my full Neovim setup on those machines has been a pain in the ass
lately, mostly because of OS-specific issues (path, LSPs, and Treesitter). For
my use cases, I figured out that Vim keybindings and motions were all what I
really need. The nice thing is that I got almost all my shortcuts working
without using Fzf-based plugins thanks to Romain Lafourcade's [mini][2] config.
Here are my main keybindings in a nutshell:

```vim
cnoremap <C-a> <home>
cnoremap <C-e> <end>
inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap jk <Esc>
nnoremap ' `
nnoremap - :Ex<CR>
nnoremap <C-p> :find *
nnoremap ,r :browse oldfiles<CR>
nnoremap ,; :buffer *
nnoremap ,, :buffer#<CR>
nnoremap <silent>,. :lcd %:p:h<CR>
nnoremap ,s vip:sort u<CR>
vnoremap ,s :sort u<CR>
nnoremap ,S vip:sort iu<CR>
vnoremap ,S :sort iu<CR>
nnoremap ,<tab> :$tabnew<CR>
nnoremap sx *``cgn
nnoremap sX :%s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap gb `[v`]
nnoremap J mzJ`z
nnoremap N Nzz
nnoremap / ms/
nnoremap U <C-r>
nnoremap <silent> <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <silent> <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap n nzz
nnoremap zs 1z=
nnoremap <C-l> :noh<CR>
```

Now, I can add whatever I want in my `gvimrc` and it will be used when running
MacVim, but not Vim from the terminal. This avoids testing in my `vimrc` whether
we are running in a GUI or not, but one caveat is that I can't use my old
`after`, `ftplugin` and `plugin` directories right out of the box. For the time
being, I'll put everything in `gvimrc` and we'll see how it goes.

{{< figure src="/img/2026-11-20-10-02-52.png" >}}

Yes, MacVim comes with menus too -- there's even one for LSP stuff, and most
default macOS keybindings are available, in insert and normal modes.

What's funny is that there’s just as much information available about MacVim as
there is about BBEdit nowadays, which means that I got stuck on several minor
issues that did simply not exist when using Vim from the terminal.[^1]

{{% music %}}Martina Topley-Bird • *Wanted*{{% /music %}}

[^1]: For instance, I got a full path to PDF file in my BibTeX file, starting
    with tilded `$HOME`, e.g., `~/Documents/papers/bla.pdf`. I could not open
    the file with `gx`, while it works fine in the terminal. It took me 15' to
    find a reliable solution, without resorting to arcane VimL: Just escape the
    filepath properly using the following alias in an autocommand:
    `au Filetype bib nnoremap gx :silent execute '!open ' . shellescape(expand(expand('<cfile>')), 1)<cr>`.
    The second `expand` allows to expand env variable like `~`.

[1]: /micro/2026-08-11-09-00-14/
[2]: https://github.com/romainl/minivimrc
