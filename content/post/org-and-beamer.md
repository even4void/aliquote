---
title: "Org and Beamer"
date: 2022-06-23T22:36:50+02:00
draft: false
tags: ["tex"]
categories: ["2022"]
---

A few days ago, I decided to rewrite a MArkdown template that I occasionally use for talks or courses. Part of this has already been discussed in an [another post]. Since I always found Org documents better than Markdown ones, I wanted an Org template much like I have a template for [short handouts]. I followed the same idea and I created a small shell script that I call from a terminal or from a Vim shortcut:

```shell
#!/usr/bin/env bash

FILE=$1
ELISP="/home/chl/Documents/notes/assets/org-beamer.el"

emacs --batch -l "$ELISP" --eval "(progn (find-file \"$FILE\") (org-beamer-export-to-pdf))"
```

The `org-beamer.el` file holds all the default settings I wish to use. I changed things a bit, especially the main fonts. I could use xelatex or lualatex as before, but after all Bitstream Vera is a nice sans serif font, and it comes with builtin math support thanks via the [arev] package. My Emacs Lisp setup file now basically reads: (I skipped basic settings and org-babel related stuff.)

```emacs-lisp
(eval-after-load "ox-latex"
  '(add-to-list 'org-latex-classes
                '("beamer"
                  "\\documentclass[presentation,9pt]{beamer}
	                 \\usepackage{arev}
                   \\usepackage[backend=bibtex,style=numeric-comp,citestyle=numeric-comp,autocite=plain]{biblatex}
                   \\addbibresource{/home/chl/Documents/notes/references.bib}
                   \\usecolortheme[named=black]{structure}
                   \\setbeamertemplate{navigation symbols}{}
                   \\makeatletter
                   \\setbeamertemplate{title page}[default][left,colsep=-4bp]
                   \\makeatother
                   \\usepackage{tcolorbox}
                   \\usepackage{textcomp}
                   \\usepackage{ragged2e}
		               \\usepackage{listings}
                   \\definecolor{SlateGrey}{HTML}{708090}
                   \\definecolor{CornflowerBlue}{HTML}{6495ed}
                   \\definecolor{SandyBrown}{HTML}{f4a460}
                   \\definecolor{White}{HTML}{ffffff}
                   \\usepackage[font={color=SlateGrey,small}]{caption}
                   \\setbeamercolor{frametitle}{bg=SlateGrey,fg=White}
                   \\setbeamercolor{alerted text}{fg=SlateGrey}
                   \\setbeamertemplate{itemize items}{\\scalebox{1.4}{\\raisebox{-.25ex}{\\text{\\textbullet}}}}
                   \\addtobeamertemplate{block begin}{}{\\justifying\\small\\sffamily}
                   \\captionsetup[figure]{labelformat=empty}
                   \\captionsetup[table]{labelformat=empty}
                   \\captionsetup[lstlisting]{labelformat=empty}
                   \\renewcommand{\\textbf}{\\alert}
                   \\definecolor{low}{named}{SandyBrown}
                   \\definecolor{high}{named}{CornflowerBlue}
                   \\newtcbox{\\texthigh}{nobeforeafter,colframe=high!15!white,colback=high!5!white,boxrule=0.5pt,arc=4pt,
                     boxsep=0pt,left=2pt,right=2pt,top=2pt,bottom=2pt,tcbox raise base}
                   \\newtcbox{\\textlow}{nobeforeafter,colframe=low!15!white,colback=low!5!white,boxrule=0.5pt,arc=4pt,
                     boxsep=0pt,left=2pt,right=2pt,top=2pt,bottom=2pt,tcbox raise base}
                   \\newcommand{\\mathhigh}[1]{\\textcolor{high}{#1}}
                   \\newcommand{\\mathlow}[1]{\\textcolor{low}{#1}}
                   \\newcommand{\\goto}[2]{\\quad\\hyperlink{#1}{\\beamerbutton{#2}}}
                   \\renewcommand{\\footnoterule}{%
                     \\kern -3pt
                     {\\color{SlateGrey}\\hrule width \\textwidth height .25pt}
                     \\kern 2.5pt
                   }
                   \\renewcommand{\\footnotesize}{\\scriptsize}
                   \\author{\\url{https://aliquote.org}\\\\ \\url{mailto:chl@aliquote.org}}
		               \\lstset{
                      basicstyle=\\small\\ttfamily,
                      commentstyle=\\color{SlateGrey}\\textit,
                      numbers=left,
                      stepnumber=1,
                      numbersep=8pt,
                      numberfirstline=true,
                      firstnumber=1,
                      numberstyle=\\color{SlateGrey}\\footnotesize{},
                      captionpos=t,
                      abovecaptionskip=3ex,
                      aboveskip=20pt,
		                  identifierstyle=\\ttfamily,
                      keywordstyle=\\ttfamily,
                      escapeinside={(*@}{@*)}
                   }
                   [NO-DEFAULT-PACKAGES]
                   [PACKAGES]
                   [EXTRA]"
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
```

Short preview below.

{{< fluid_imgs
  "pure-u-1-3|/img/2022-06-24-21-39-39.png"
  "pure-u-1-3|/img/2022-06-24-21-40-07.png"
  "pure-u-1-3|/img/2022-06-24-21-40-13.png" >}}

After having reviewed the new features of Context I do not exclude the idea of returning to pure tex slides soon, though. I still have some handouts to read.

{{< fluid_imgs
  "pure-u-1-3|/img/2022-06-24-21-44-30-1.png"
  "pure-u-1-3|/img/2022-06-24-21-44-43.png"
  "pure-u-1-3|/img/2022-06-24-21-45-15.png" >}}

{{% music %}}Meredith Brooks • _Bitch_{{% /music %}}

[another post]: /post/new-pandoc-template/
[short handouts]: /post/emacs-org-tufte-handout/
[arev]: https://www.ctan.org/pkg/arev
