---
title: "Emacs Org and Tufte handout"
date: 2020-08-08T17:43:34+02:00
draft: false
tags: ["emacs", "tex"]
categories: ["2020"]
---

I've been using Pandoc as my [main backend](/post/org-workflow/) for exporting Org documents to PDF, mainly because it was convenient way to manage bibliographic entries using Markdown markup. It is pretty nice and easy to setup. Moreover, it works with HTML output too using a template indicated either in the document header or using `org-pandoc-options-for-html5`. Problem is that it does not work with Babel, or at least I couldn't export the block results (mostly R, Lisp and Python code) at some point, and I switched back to the default HTML or PDF exporter. First off, unless you give it a proper CSS file, you won't get much from the HTML exporter. Same for the PDF output: the default Latex class is basically the "article" format. In both cases, without Pandoc it becomes harder to manage bibliographic entries and I'm looking for a lightweight solution whereby we do not have to use header options or inline Latex commands. I don't mind writing `\cite` commands, though.

I have used `org-ref` [in the past](/post/notes-taking-workflow/), but I wanted a simpler solution, which also does not involve [ox-bibtex](/post/org-and-bibtex/) which I found too limited. Furthermore, this time I was interested in using the Tufte handout template.

Here is what I finally ended up adding my init file:

```emacs-lisp
(eval-after-load "ox-latex"
  '(add-to-list 'org-latex-classes
                '("tufte-handout"
                  "\\documentclass[nobib]{tufte-handout}
                   \\usepackage[style=authoryear-comp,autocite=footnote]{biblatex}
                   \\addbibresource{/Users/chl/org/references.bib}
                   \\usepackage{nicefrac}
                   \\usepackage{units}
                   [NO-DEFAULT-PACKAGES]
                   [EXTRA]"
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
```

This defines a new template where we define the main document class and the packages we want to use. In this case, we do not want the default packages but we allow to define additional settings via a header option like `#+LATEX_EXTRA:`. Also, it is worth noting that the `nobib` option for the document class is recommended to avoid `biblatex` clashes with the `natbib` package. (I tried setting `natbib=true` in the options for the `biblatex` package, but it didn't work.)

Next, we just have to define this template as our default Latex class and indicate how to compile the file(s). We can use either `texi2pdf` or `latexmk`. I use both most of the times, and no longer bother with `pdflatex` or `lualatex`.

```emacs-lisp
(font-lock-add-keywords 'org-mode
                        '(("\\\\autocite{.+?}" . font-lock-keyword-face)))

(setq org-latex-default-class "tufte-handout"
      org-latex-pdf-process '("latexmk -pdf -bibtex-cond -f -outdir=%o %f"))
```

<small>The `bibtex-cond` option allows to skip the bib(la)tex step if no `bib` file is used.</small>

Note that a default config file for `latexmk` can be used if it is available in the `$HOME` directory. I have these settings in mine (`~/.latexmkrc`):

```bash
@default_files = ('main.tex');
$clean_ext = "bbl nav out snm";

$latex = 'latex -interaction=nonstopmode -shell-escape';
$pdflatex = 'pdflatex -shell-escape -interaction=nonstopmode';
$pdf_previewer = 'open -a Preview';
```

That's it. Here's the output for a simple memo I started writing for myself:

{{< fluid_imgs
"pure-u-1-2|/img/2020-08-08-18-29-26.png"
"pure-u-1-2|/img/2020-08-08-18-30-05.png" >}}
