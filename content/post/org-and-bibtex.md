---
title: "Org and Bibtex"
date: 2018-05-13T18:47:55+02:00
draft: false
tags: ["emacs"]
categories: ["2018"]
---

The `ox-bibtex` package from the org contrib packages provides a good alternative to [org-ref](https://github.com/jkitchin/org-ref) for managing a a Bibtex bibliography.

<!--more-->

![](/img/2018-05-13-18-47-27.png)

During the last few months, I became a huge fan of editing plain text document [using Org](/post/notes-taking-workflow/) instead of Markdown. Since I recently switched to [Doom Emacs](/post/doom-emacs/), I had to refactor some of my configuration files, and I decided to go without [org-ref](https://github.com/jkitchin/org-ref) as it adds an unnecessary package overload because of Helm. My default swiss army knife is now Ivy and Counsel. There are other options to manage Bibtex files in Emacs, including org-bibtex, but see this nice [screencast by Eric Schulte](https://vimeo.com/99167082). Of note, there is also an [interesting thread on Reddit](https://www.reddit.com/r/orgmode/comments/4z47ny/oxbibtex_vs_orgref/). The question is how to get the best of both worlds, namely HTML and PDF exports, with Org `cite:` only links.

**TL;DR** The key idea is to add these two lines anywhere in your configuration files (probably in an "after-load" statement):

```lisp
(require 'ox-bibtex)
(setq org-latex-pdf-process '("latexmk -pdf -outdir=%o %f"))
```

The first instruction obviously makes "ox-bibtex" available for us. The second line is more interesting since it allows to update the way we generate the $\LaTeX$ output, since by default it is just a triple pass through `pdflatex`. If you want to generate the bibliography keys, you also need to add Bibtex to this toolchain, but a prettier solution is to rely on [latexmk](http://personal.psu.edu/jcc8//software/latexmk-jcc/) or "texi2pdf". Both programs come with a default TeX distribution. Similar approaches were discussed elsewhere, in particular in one of [Kieran Healy's blog post](https://kieranhealy.org/blog/archives/2011/01/21/exporting-org-mode-to-pdf-via-xelatex/). In my case, I just selected the "pdflatex" option (it is easy enough to update the variable afterwards) but I added an output directory like it was originally defined in the variable `org-latex-pdf-process`. If you prefer "texi2pdf", you can just use `(setq org-latex-pdf-process '("texi2dvi -p -b -V %f"))`. This is probably the best way to go if you want to export all output files in a separate directory (e.g., a `build/` directory), and it works quite well with Doom Emacs which redirects exported files to a subfolder `.export/` in the directory dedicated to Org. However, for whatever reasons it didn't work with HTML output: [bibtex2html](https://www.lri.fr/~filliatr/bibtex2html/) has no way to use an output directory other than the current working directory and I don't want to manage multiple Bibtex files (e.g., one file per project). Either way, this is probably the result of some combination of Doom Emacs default settings with a central repository for exported documents (as defined in `/modules/lang/org/+export.el`) and a lack of configuration option for "bibtex2html". I decided to symlink my Bibtex file to the `.export/` folder, and this now works. You will also have to add `limit:t` in your Bibtex headline, otherwise "bibtex2html" will include all your bibliography entries ("bibtex" does exactly the reverse in a $\LaTeX$ document)!

```
#+BIBLIOGRAPHY: references plain limit:t
```

A final note: If you want other than the default $\LaTeX$ export options, you likely want to add some custom $\LaTeX$ classes in your `init.el` (this is controlled by the variable `org-latex-classes`).

Compared to "org-ref", this may appear as an edulcorated version as we don't have the interaction between PDF files and Emacs buffers, Helm to lookup references in our Bibtex file or live `cite:` links. However, things are not so bad: (1) we can use org `cite:` instead of `\cite{}` command and this work for HTML and PDF output, and (2) it is easy to insert citation via "org-reftex" (`C-c C-x [`) or from [Ivy-bibtex](https://github.com/tmalsburg/helm-bibtex).

{{% music %}}The Apartments • _No Song, No Spell, No Madrigal_{{% /music %}}
