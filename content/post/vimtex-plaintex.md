---
title: "Writing plain TeX using vimtex"
date: 2024-07-24T21:02:57+02:00
draft: true
tags: ["vim", "tex"]
categories: ["2024"]
---

I very much like [vimtex](https://github.com/lervag/vimtex), even if I'm not writing as much $\TeX$ stuff as I used to do in the past. It works very well with standard Latex documents that I still have on my HD. I get live compiling and forward/reverse search with the Zathura PDF viewer for free, and I can also toggle a pretty TOC along the way. I no longer use Context (maybe I should) but I know it is supposed to work similarly. As I said in a [previous post](/post/latex-beamer-21-century/), [luatex](https://www.luatex.org/) is great for it allows us to write "plain $\TeX$" (for whatever definition of plain we agree on) using custom fonts and forget about accented letters for non-US writers. Since this last post, I haven't write a single line of $\TeX$. However, since I was digging into my Neovim config for $\TeX$ stuff, I wanted to know how Vimtex handles the `plaintex` filetype.

And so, it all started with me trying to replicate the toy example mentioned above. It failed early. Okay, let's forget I missed to add a final `\bye` statement. Moving on, I soon realized that vimtex is way more friendly with Latex than plain old tex. Since I already have my own `$HOME/.latexmkrc`, I never bothered checking how vimtex proceeds in this case. It looks like it has its own setting for running [latexmk](https://ctan.org/tex-archive/support/latexmk). Fair enough, but I couldn't find my way to tell it to use an option like `-pdlatex=luatex`. Hence I tried to use a different compiler, namely [arara](https://islandoftex.gitlab.io/). It allows to define the compiler and its options directly in the tex file, which is fine since I would like to avoid adding `.latexmkrc` or `.nvimrc` local config files to a simple project like this one. I also needed to define a `Tex root` directive to please vimtex, otherwise it complains with a "failed mainfile detection" -- again because it [primarily targets Latex documents](https://github.com/lervag/vimtex/issues/2491).

So far, I have the following in my `after/ftplugin/plaintex.vim` file:

```vim
setlocal autoindent expandtab tabstop=2 shiftwidth=2
set spelllang=en_gb

let g:vimtex_format_enabled = 0
let g:vimtex_compiler_method = "arara"

nmap <buffer> gs :VimtexReload<cr> \| :VimtexCompile<cr>
nmap <buffer> g= :%!fmt -w80<cr>
nmap <buffer> <silent> go :VimtexTocToggle<cr>
nmap <buffer> <silent> gO :lua require("fzf-lua").btags()<cr>
nmap <buffer> <leader># :-1 read ~/.config/nvim/templates/plaintex<cr>
```

I encountered some problem when trying to refomat using Vim's `gq` but `gw` works fine, so that may just be a conflict somewhere in my config. Note that I overwrite global settings for vimtex, but I assume that I may rarely have to switch from plain $\TeX$ to $\LaTeX$ during the same writing session. Finally, I don't really why I need to reload vimtex in order to apply the compilation directive that are defined in the header, but since I may forget about this later I chose to reload systematically before recompiling. Here's the template I defined for my $\TeX$ documents:

```latex
% vim: set ft=plaintex:
% arara: luatex: {synctex: yes}
%! TeX root = test.tex
\ifdefined\directlua
  \input luaotfload.sty
\fi
\font\tenrm="Alegreya" at 10pt
\tenrm

\parindent 0pt

\bye
```

{{% music %}}Claire Welles • _Waiting In The Sun_{{% /music %}}
