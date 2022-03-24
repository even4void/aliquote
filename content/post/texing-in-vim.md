---
title: "Texing in Vim"
date: 2022-01-26T15:05:55+01:00
draft: false
tags: ["vim", "tex"]
categories: ["2022"]
---

I rarely have to write $\LaTeX$ these days. I usually let Pandoc do the harder stuff, and simply write my plain text documents using Org or Markdown markup language. I used to rely on $\LaTeX$ in the case of R+Sweave/knitr reports, but I rarely have to write any statistical report these days. However, I may happen to write [plain $\TeX$](/post/latex-beamer-21-century/) or edit $\LaTeX$ documents, in which case I appreciate a solid workflow to edit, compile and keep my text in sync with the PDF renderer.

Under Emacs I had everything I needed thanks to Auctex and Pandoc, but under Vim I always used the bare minimum so far, that is native syntax highlighting and Vim motion. I don't use snippets but I have a set of `iabbrev` that alleviates the need to write cumbersome and recurrent $\LaTeX$ expressions:

```vim
iabbrev <<@ <<LABEL>>=<CR>@<Esc>?LABEL<CR>cw
iabbrev chapter@ \begin{chapter}
iabbrev section@ \begin{section}
iabbrev subsection@ \begin{subsection}
iabbrev subsubsection@ \begin{subsubsection}
iabbrev paragraph@ \paragraph{TITLE}<Esc>?TITLE<CR>cw
iabbrev equation@ \begin{equation}<CR>
iabbrev align@ \begin{align}
iabbrev tabular@ \begin{tabular}{ALG}<CR><Esc>?ALG<CR>cw
iabbrev table@ \begin{table}[POS]<CR>\centering<CR>\caption{}<CR>\label{}<CR><Esc>?POS<CR>cw
" FIXME: Add figure environment
iabbrev texttt@ \texttt{DATA}<Esc>?DATA<CR>cw
iabbrev frac@ \frac{DATA}{}<Esc>?DATA<CR>cw
```

Enters [Vimtex](https://github.com/lervag/vimtex) which I discovered when I was reading [How I'm able to take notes in mathematics lectures using LaTeX and Vim](https://castel.dev/post/lecture-notes-1/) a while ago. Note that vimtex+[zathura](/post/nyxt-browser/) is the _winning combo_ here. Contrary to the author of the blog post, I don't use concealing, nor snippets (see above).

Things I like: `]]` will automagically close the current environment, Bibtex keys and labels can be autocompleted using builtin omnicomplete (`C-x C-o`), you can toggle on/off a table of contents in a dedicated sidebar, the `%` matching operator is redefined to highlight opening and closing $\LaTeX$ delimiters, you can compile and preview your file with pre-defined mappings, and there are specific motion operators (e.g., `ic`, `id`, `ie`, `i$`). And on top of that, you can use reverse (Ctrl+click from Zathura) and forward (`<localleader>lr` from Vim) search. And it just works! Zathura is configured as the defaut PDF viewer, and all you have to do is to ensure that `synctex` is active when compiling your $\LaTeX$ document. This is already defined in Vimtex default options. See also this review: [A Complete Guide on Writing LaTeX with Vimtex in Neovim](https://jdhao.github.io/2019/03/26/nvim_latex_write_preview/). (Note that you no longer need to spawn a server since Neovim 0.5+.)

To compile Knitr standalone documents, I use the following mapping:

```vim
map <localLeader>k :w<CR>:cd %:p:h <CR>:!Rscript -e 'library(knitr);knit("%:p")'<CR>:!latexmk -pdf -bibtex-cond -f %:r.tex <CR>:!xdg-open %:r.pdf <CR><CR>
```

This is basically what I have in my Makefile, except that I use `texi2pdf` instead of [`latexmk`](https://mg.readthedocs.io/latexmk.html). My `latexmk` settings are as follows (`$HOME/.latexmkrc`):

```
@default_files = ('main.tex');
$clean_ext = "bbl nav out snm";

$latex = 'latex -interaction=nonstopmode -shell-escape';
$pdflatex = 'pdflatex -shell-escape -interaction=nonstopmode -synctex=1 -file-line-error';
$pdf_previewer = 'zathura';
set_tex_cmds('-synctex=1 -interaction=nonstopmode -shell-escape %O %S');
```

Finally, I use the [Bibtex extension](https://github.com/nvim-telescope/telescope-bibtex.nvim) for Telescope, which provides a nice alternative to [Helm-bibtex](https://github.com/tmalsburg/helm-bibtex) to display a list of available references (globally or in the current directory). Inserting the reference by pressing the enter key will take care of formatting the bibliographic key depending on the filetype (Markdown, Latex or plain text).

![img](/img/2022-01-26-20-43-51.png)

{{% music %}}Sonic Youth • _The World Looks Red_{{% /music %}}
