---
title: "Little shell scripts are amazing"
date: 2021-01-25T20:04:05+01:00
draft: false
tags: ["unix", "vim"]
categories: ["2021"]
---

Writing handy Zsh aliases, shell scripts and Vim functions has been the main part of my nightly recess this month. It's fascinating to see how the combination of small command-line utilities leads to a tool that quickly becomes indispensable.

Let's take for example the case of the management of a bibliography in Bibtex format, in which each entry eventually has an associated PDF file. The name of my PDF files simply consists of the Bibtex key, and they are all saved in the same directory (`~/Documents/papers`). I already use [bibtex-ls](https://github.com/msprev/fzf-bibtex) to quickly search my reference list without having to open the Bibtex file. This is my little replacement for [ivy-bibtex](https://github.com/tmalsburg/helm-bibtex) since I no longer use Emacs. I even added some of the Vim functions proposed by the author to be able to insert citations in Markdown/Pandoc format (citation key or reference itself):

```vim
function! s:bibtex_markdown_sink(lines)
    let r=system('bibtex-markdown ', a:lines)
    execute ':normal! a' . r
endfunction

function! s:bibtex_cite_sink(lines)
    let r=system('bibtex-cite ', a:lines)
    execute ':normal! a' . r
    call feedkeys('a', 'n')
endfunction

nnoremap <silent> <leader>b :call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_markdown_sink'),
                        \ 'down': '20%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Bibtex (reference)> "'})<CR>

inoremap <silent> <C-b> <c-g>u<c-o>:call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_cite_sink'),
                        \ 'down': '20%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Bibtex (cite)> "'})<CR>
```

This is shameless copy-paste, I just changed the shortcuts.

A few days ago I thought it would be convenient to be able to directly open PDFs, when they exist, by searching for entries directly from a terminal using bibtex-ls. And it works! Here is what I finally came up with:

```bash
alias bibfind="bibtex-ls ~/org/references.bib \
  | fzf --multi --ansi \
  | rg -o --color never '[a-z0-9\-]+$' \
  | xargs -I % sh -c 'fdfind % ~/Documents/papers' \
  | xargs -I % sh -c 'xdg-open %'"
```

I wished I could simplify the last two instructions, but that's fine.

Now, what if I could also open the PDF file associated to a Bibtex entry directly while I'm browsing the Bibtex file itself? So, here's the very first Vim function that I wrote from scratch:

```vim
"" Open bibtex key at point
function! Open_bibtex_key()
  let s:uri = split(split(expand('<cWORD>'), '{')[1], ',')[0]
  if s:uri != ''
    silent exec "!xdg-open ~/Documents/papers/'".s:uri."'.pdf"
  else
    echo 'No match found.'
  endif
endfunction

map <silent> <leader>o :call Open_bibtex_key()<cr>
```

That's it!
