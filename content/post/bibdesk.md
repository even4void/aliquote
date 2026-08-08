---
title: "BibDesk and the zen of BibTeX on macOS"
date: 2026-08-07T21:30:02+02:00
draft: true
tags: ["apple", "tex"]
categories: ["2026"]
---

I've never been a big fan of BibDesk,[^1] nor Texshop, TBH. But they've always
been lying here on my HD since 20 years, and they save my ass more than one
time. For instance, Texshop was able to deetct the correct encoding for very old
$\TeX$ sources of mine.

I've been managing my BibTeX bibliography all years long using Emacs, then Vim,
and finally Neovim. Don't ask me why I never used other than plain text files, I
just simply can live with Zotero, Endnote & Co.[^2] But well, on my MacBook I
can simply poitn BibDeskto my main bibliography file, and it will keep it
updated following any edit made via Neovim. This is great, by the way.

There's someething magic with macOS, and it has always been as far as I
remember: if you select some text in an application, the OS will most of the
times have some useful action to offer to you. In the case of BibTeX cite key,
it will offer to open it in BibDesk. Here's an example with a wite key in
Notes.app:

![img](/img/2026-08-07-21-38-58.png)

Easy peasy. I can do the same in the terminal with bibtex-ls and this zsh
function, `bibfind`:

```shell
~/.local/lib
» type bibfind
bibfind is /Users/chl/.local/bin/bibfind

~/.local/lib
» cat ~/.local/bin/bibfind
#!/usr/bin/env bash

bibtex-ls /Users/chl/Documents/notes/references.bib |
    fzf --multi --ansi |
    rg -o --color never '[a-z0-9\-]+$' |
    xargs -I % sh -c 'fd % /Users/chl/Documents/papers' |
    xargs -I % sh -c 'open %'
```

![img](/img/2026-08-07-21-58-07.png)

And, of course, in Neovim I have a handy shortcut (`grb`) to browse my
bibliography and other keymaps to insert ref keys from a Markdown or $\TeX$
buffer or open the associated PDF, all that with [fzf-bibtex][1]. In my main
BibTeX file, `references.bib`, I can also browse the associated PDF or EPUB file
using `gf` (inline, via lesspipe) or `gF` (using Preview.app):

```vim
setlocal path=.,~/Documents/papers
setlocal suffixesadd=.pdf,.epub

function! s:open_bibtex_key() abort
  let s:uri = split(split(expand('<cWORD>'), '{')[1], ',')[0]
  if s:uri !=# ''
    silent exec "!open ~/Documents/papers/'".s:uri."'.* &"
  else
    echo 'No match found.'
  endif
endfunction

command! Bibopen call s:open_bibtex_key()
" NOTE: gf is used to open resource with lesspipe
nnoremap <buffer><silent> gF :Bibopen<cr>
```

Now, what if I could do the same from within BibDesk? The main motivation is
that I should I should be able to perform the exact same task from the command
line and from a macOS app. This is already the case for, e.g., reading news
(Newsboat vs. News Explorer), writing email (Neomutt vs. Mail.app), coding
(Neovim vs. BBEdit), chatting on IRC (Senpai vs. bIRC[^3]), and so on.

I would simply need to drag and drop the PDF file right there, or add an URI. No
sooner said than done, I quickly drafted a Vim regex that added a `local-url`
field to all my BibTeX entries (1763 in total). This could have been done with
BBEdit as well (no more fuzzing between escaping special symbols or dealing with
verymagic command in Vim, yeah), see below:

![img](/img/2026-08-08-08-15-03.png)

[1]: https://github.com/msprev/fzf-bibtex/
[2]: https://unsung.aresluna.org/tags/apple/
[3]: https://www.fredrikblank.com/blog/birc-irc-client-for-mac-macos/

[^1]: I should note that BibDesk (and LatexIt) is one of the few app that hasn't
    seen much changes from an UX perspective since I started using a Mac. For a
    more historical discusion of how the Mac design evolved over time, refer to
    some of Marcin Wichary's [blog posts][2].

[^2]: I was forced to used Endnote -- and I evne bought a license for v7, when I
    wrote some papers using Apple pages.

[^3]: I've stopped using Textual in favor of [bIRC][3] at the time of this
    writing since Textual has been sunset and does not support playback history
    other than with ZNC bouncers.

{{% music %}}Blue Sunshine • *Ghost Twin*{{% /music %}}
