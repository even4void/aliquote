---
title: "On creating Org documents using shell scripts"
date: 2020-12-28T20:28:18+01:00
draft: false
tags: ["emacs", "unix"]
categories: ["2020"]
---

I switched recently to Neovim as a full-time text editor. This means that I no longer have access to Emacs Org mode natively. Of course, I still have Emacs on my machine --- otherwise, I wouldn't be able to handle Org file without resorting to Pandoc (which doesn't handle Babel code chunks, unfortunately). This is just that I want to avoid opening Emacs just to export an Org file to a PDF or HTML document. Hopefully, it's quite easy to call Emacs from the command line and ask it to compile Org files on the go.

Over the past few months, I wrote some custom templates for PDF and HTML exports, namely the Tufte $\LaTeX$ handout and a hand crafted HTML template that I discussed in previous posts. I know I could write in Markdown and use Pandoc, but I don't want to forget all those Org files that I wrote in the last two years or so. Moreover, I still believe that the Org specs are better than the Markdown ones, especially because the latter are not really ones.

Here is a simple shell script that takes care of this:

```bash
#!/usr/bin/env sh

OPT=$1
FILE=$2

case $OPT in
        -pdf)
                emacs --batch -l /home/chl/org/org-babel.el --eval "(progn (find-file \"$FILE\") (org-latex-export-to-pdf))"
        ;;
        -html)
                rc="$(grep '#+BIBLIOGRAPHY' $FILE)"
                [ -z $rc ] && echo "\033[1mNo valid bibliography found.\033[0m"
                emacs --batch -l /home/chl/org/org-babel.el --eval "(progn (find-file \"$FILE\") (org-html-export-to-html))"
        ;;
        *)
        echo "Unknown export format."
        ;;
esac
```

Basically, it allows to compile an Org file and to produce either a PDF or HTML file, based on the flag passed when invoking the command. Of note, for HTML documents it relies on `ox-bibtex`, while PDFs are produced using the standard toolchain (biblatex with bibtex backend and pdflatex, but it is not difficult to use biber and lualatex instead). With that in place, I can now regenerate my previous documents without even opening Emacs, which is great after all. I know that the [vim-orgmode](https://github.com/jceb/vim-orgmode) plugin can take care of this as well, but as you see it is not very difficult to write your own backend for that purpose. I keep my custom settings in the file `org-babel.el`, which remains available on Github in my "org" repository, in case you're interested.
